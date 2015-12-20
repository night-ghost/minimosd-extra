//
// gSoftSerial
// Nov/Dec 2014 - jb
//
// A soft serial library for the Arduino Uno, intended for use with GPS
// devices receiving NMEA strings.
//
// Constructor:  gSoftSerial ss(RX_PIN, TX_PIN);
//
// Any of the pins (0-19) on the Uno may be used.
//
// The received data must be of the form where the most significant bit
// is always a zero, as in the ASCII characters of an NMEA string. The
// sent data does not have this restriction.
//
// This code uses a pin change interrupt on the selected RX pin.
// Transmission on the TX line is done in a loop with interrupts disabled.
// Both RX and TX read timer0 for determining elapsed time. Timer0 itself is
// not reprogrammed; it is assumed to be running with a 4 microsecond step.
//
// Supported baud rates are 9600 (default), 19200 and 38400.
// The baud rate is selectable at run time.
//
// The size of the RX buffer may be changed by editing the accompanying .h file.
// For optimal performance of the interrupt service routines, the buffer size
// should be chosen to be a power of 2 (i.e., 2, 4, 8, 16, 32, 64,...).
//
// Jun 2015 -- Added support for 8 MHz system clock. Timer 2 had to be used since the timer 0
// prescaler was inadequate for this. The supported baud rates for 8 MHz are 9600 and 19200.
//
// -----------------------------------------------------------------------------------------------
// Methods
// -------
//
// begin(baudRate) - initialization, optionally set baudrate, and then enable RX
// listen() - enables RX interrupts, allowing data to enter the RX buffer
// ignore() - disables RX interrupts
// setBaudRate(baudRate) - selects the baud rate (9600, 19200, 38400) - any other value is ignored
// available() - returns the number of characters in the RX buffer
// read() - returns a single character from the buffer
// write(s) - transmits a string
//
// print() is supported
// ===============================================================================================

#include <Arduino.h>
#include <gSoftSerial.h>

volatile uint8_t txBitWidth = TIMER_TICKS_BIT_WIDTH_9600;
volatile uint8_t rxHalfBitWidth = TIMER_HALF_BIT_WIDTH_9600;
volatile uint8_t rxFastDivideShift = FAST_DIVIDE_SHIFT_9600;

volatile uint8_t rxState;       // 0xFF: waiting for start bit; 0: got start bit; >0: bits rcvd
volatile uint8_t prev_t0;       // previous RX transition: timer0 time stamp (4us)
volatile uint8_t rxMask;        // bit mask for building received character
volatile uint8_t rxValue;       // character being built
volatile uint8_t rxBuffer[RX_BUFFER_SIZE];      // receive buffer
volatile uint8_t rxHead;	// buffer pointer input
volatile uint8_t rxTail;        // buffer pointer output

uint8_t rxBitMask, txBitMask;	// port bit masks
volatile uint8_t *rxPort, *txPort;	// port registers

// ------------------------------------------------------------------------------
// Initialize, set the baudrate and enable RX
// ------------------------------------------------------------------------------
void gSoftSerial::begin(uint16_t baudRate)
{
  pinMode(rxPin, INPUT_PULLUP);
  pinMode(txPin, OUTPUT);

  *txPort |= txBitMask;		// high = idle
  delay(1);             	// need some idle time
  
  rxBitMask = digitalPinToBitMask(rxPin);
  rxPort = portInputRegister(digitalPinToPort(rxPin));
  txBitMask = digitalPinToBitMask(txPin);
  txPort = portOutputRegister(digitalPinToPort(txPin));
 
#if F_CPU == 8000000L
  // Have to use timer 2 for an 8 MHz system.
  TCCR2A = 0x00;
  TCCR2B = 0x03;	// divide by 32
#endif
 
  setBaudRate(baudRate);
  listen();
}

void gSoftSerial::end(){
    ignore();

    *txPort |= txBitMask;		// high = idle
}


// ------------------------------------------------------------------------------
// Enable soft serial RX.
// ------------------------------------------------------------------------------
inline void gSoftSerial::listen()
{
  rxState = 0xFF;		// no start bit detected yet
  rxHead = rxTail = 0;		// no characters in buffer

  uint8_t prevSREG = SREG;
  cli();
  *digitalPinToPCMSK(rxPin) |= _BV(digitalPinToPCMSKbit(rxPin));
  *digitalPinToPCICR(rxPin) |= _BV(digitalPinToPCICRbit(rxPin));
  SREG = prevSREG;
}

// ------------------------------------------------------------------------------
// Shut down RX interrupts.
// ------------------------------------------------------------------------------
void gSoftSerial::ignore()
{
  *digitalPinToPCMSK(rxPin) &= ~_BV(digitalPinToPCMSKbit(rxPin));
}

// ------------------------------------------------------------------------------
// Change the baud rate (9600, 19200, 38400).
// Unrecognized baud rates are ignored.
// ------------------------------------------------------------------------------
inline void gSoftSerial::setBaudRate(uint16_t baudRate)
{
  uint8_t width, shift;

  width = TIMER_TICKS_BIT_WIDTH_9600;
  shift = FAST_DIVIDE_SHIFT_9600;

  if (baudRate == 19200) {
    width = width >> 1;
    shift--;
#if F_CPU == 16000000L
  } else if (baudRate == 38400) {
    width = width >> 2;
    shift -= 2;
#endif
  } else if (baudRate != 9600) {
    return;
  }

  txBitWidth = width;
  rxHalfBitWidth = width >> 1;
  rxFastDivideShift = shift;
}

// ------------------------------------------------------------------------------
// Return number of characters available.
// ------------------------------------------------------------------------------
uint8_t gSoftSerial::available()
{
  return((rxHead - rxTail + RX_BUFFER_SIZE) % RX_BUFFER_SIZE);
}

// ------------------------------------------------------------------------------
// Returns received character.
// ------------------------------------------------------------------------------
char gSoftSerial::read()
{
  uint8_t prevSREG = SREG;
  if (rxHead == rxTail) return 0;
  char c = rxBuffer[rxTail];
  rxTail = (rxTail + 1) % RX_BUFFER_SIZE;
  return c;
}

// ------------------------------------------------------------------------------
// Invoked upon RX line level transition.
// ------------------------------------------------------------------------------
void rxISR()
{
  uint8_t t0, d, rxBits, index;

  t0 = TCNTX;			// time of data transition (plus ISR latency)
  d = *rxPort & rxBitMask;	// read RX data level
  
  if (rxState == 0xFF) {	// if a start bit hasn't been detected yet

    // If it looks like a start bit then initialize; otherwise ignore the rising edge and exit.

    if (d != 0) return;		// it's high so not a start bit, exit
    rxState = 0;		// got a start bit
    rxMask = 0x01;		// bit mask, lsb first
    rxValue = 0x00;		// RX character to be, a blank slate

  } else {	// data bit or stop bit (probably) received

    // Determine how many bit periods have elapsed since the last transition.
    // Multiply & shift is ~10x faster than rxBits /= TIMER_TICKS_BIT_WIDTH.

    rxBits = (t0 - prev_t0 + rxHalfBitWidth);  // add 1/2 bit to round result
    rxBits = uint16_t(rxBits * FAST_DIVIDE_MULTIPLIER) >> rxFastDivideShift;
    rxState = rxBits + rxState;    // total bit periods since start


    // If the data is 0 then back fill previous bits with 1's.
    // If the data is 1 then previous bits were 0's so only this bit is a 1.
 
    if (d == 0) {                              // if RX level is low
      for (uint8_t i=0; i<rxBits; i++) {       // for all previous bits
       rxValue |= rxMask;                      // set them to 1
       rxMask = rxMask << 1;                   // shift to next bit
      }
      rxMask = rxMask << 1;                    // shift to current bit
    } else { 	// d==1)                       // else: RX level is high
      rxMask = rxMask << rxBits-1;             // shift to current bit
      rxValue |= rxMask;                       // and set it to 1
    }

  // If 8th bit or stop bit then the character is complete.
  // If it's the 8th bit the stop bit transition interrupt will be ignored (above).

    if (rxState > 7) {	// if 8th bit or stop bit the character is complete
      rxState = 0xFF;		// begin looking for a start bit
      index = (rxHead+1) % RX_BUFFER_SIZE;
      if (index != rxTail) {
        rxBuffer[rxHead] = rxValue;
        rxHead = index;
      }
    }
  }	// endif start bit or data/stop bit
  
    prev_t0 = t0;               // remember time stamp
}

// ------------------------------------------------------------
// Must define all of the vectors even though only one is used.

#if defined(PCINT0_vect)
  ISR(PCINT0_vect) {rxISR();}
#endif
#if defined(PCINT1_vect)
  ISR(PCINT1_vect) {rxISR();}
#endif
#if defined(PCINT2_vect)
  ISR(PCINT2_vect) {rxISR();}
#endif
#if defined(PCINT3_vect)
  ISR(PCINT3_vect) {rxISR();}
#endif

// ===============================================================================================

// ------------------------------------------------------------------------------
// Transmit a character.
//
// For GPS the expected usage is to send commands only for initialization or very
// infrequently thereafter. So instead of using a TX buffer and interrupt service,
// the transmit function is a simple timer0 based delay loop.
// Interrupts are disabled while the character is being transmitted and reenabled
// after each character.
// ------------------------------------------------------------------------------
size_t gSoftSerial::write(uint8_t txChar)
{
  uint8_t txBit, b, t0, width;

  txBit = 0;                    // first bit is start bit
  b = 0;			// start bit is low
  cli();			// send the character with interrupts disabled
  t0 = TCNTX;			// start time

  while (txBit++ < 9) {		// repeat for start bit + 8 data bits
    if (b)			// if bit is set
      *txPort |= txBitMask;     //   set TX line high
    else
      *txPort &= ~txBitMask;    //   else set TX line low
    width = txBitWidth;
#if F_CPU == 16000000L
    if (width == TIMER_TICKS_BIT_WIDTH_9600/4) // If 38400 baud the width is 6.5 ticks,
      if (txBit & 0x01) width++;	//    so add a "leap" timer tick every other bit
#endif
    while (uint8_t(TCNTX - t0) < width) {}  // delay 1 bit width
    t0 += width;			// advance start time
    b = txChar & 0x01;                  // get next bit in the character to send
    txChar = txChar >> 1;               // shift character to expose the following bit
  }

  *txPort |= txBitMask;		        // stop bit is high
  sei();				// interrupts on for stop bit since it can be longer
  while (uint8_t(TCNTX - t0) < width) {}	// delay (at least) 1 bit width
  return 1;				// 1 character sent
}

// ===============================================================================================












