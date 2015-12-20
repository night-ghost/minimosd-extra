// Test code for "sss" software serial

//=====================================

#define SSS_RX_TIMER_INCR  52    // 9600 baud
#define SSS_TX_TIMER_INCR  49    // 9600 baud

const byte sssBufSize = 64;
const unsigned long sssIdleTimeoutMillis = 10;

const byte sssRxPin = 8;
const byte sssTxPin = 7;

byte sssBufTail = 0;
volatile byte sssBufHead = 0;
volatile byte sssBuffer[sssBufSize]; // use same buffer for send and receive

volatile byte sssBitCount = 0; // counts bits as they are received
volatile byte sssRecvByte = 0; // holder for received byte

volatile boolean sssIsListening = false;
boolean sssReady = false;

volatile byte sssNumBytesToSend = 0;
volatile byte sssBufferPos = 0; // keeps track of byte to send within the buffer
volatile byte sssNextByteToSend;
volatile byte sssNextBit;
volatile byte sssBitPos = 0; // position of bit within byte being sent

void (*sssTimerFunctionP)(void); // function pointer for use with ISR(TIMER2_COMPA_vect)

//=====================================

//===========
char sssBegin() {
  sssStopAll();
  
  //  prepare Rx and Tx pins
  pinMode(sssRxPin, INPUT_PULLUP);
  pinMode(sssTxPin, OUTPUT);
  digitalWrite(sssTxPin, HIGH); // high = idle

  // prepare Timer2
  TCCR2A = B00000000; // set normal mode
  TCCR2B = B00000011;  // set the prescaler to 32 - this gives counts at 2usec intervals
  
  sssPrepareToListen();
  sssReady = true;
}
//============
void sssEnd() {
  sssStopAll();
  sssReady = false;
}
//============
int sssAvailable() {

  if (!sssReady) return 0;
  if (sssNumBytesToSend > 0) return 0;

  if (!sssIsListening) {
    if (!sssPrepareToListen()) return 0;
  }

  char sssByteCount = sssBufHead - sssBufTail;
  if (sssByteCount < 0) sssByteCount += sssBufSize;

  return sssByteCount;
}
//============
int sssRead() {

  if (! sssReady) return -1;
  if (sssNumBytesToSend > 0) return -1;
  
  if (!sssIsListening) {
    if (!sssPrepareToListen()) return 0;
  }
  
  if (sssBufTail == sssBufHead) {
    return -1;
  }
  else {
    sssBufTail = (sssBufTail + 1) % sssBufSize;
    return sssBuffer[sssBufTail];
  }
}
//============
void sssWriteln(const char *s) {
  
  if (!sssReady) return;
  while (sssNumBytesToSend > 0) {};    // wait forever for the output buffer to empty

  sssPrepareToTalk();

  uint8_t n = strlen(s);
  for (uint8_t i=0; i<n; i++)
    sssBuffer[i] = s[i];

  sssBuffer[n] = 13; 
  sssBuffer[n+1] = 10;
  sssBufferPos = 0;
  sssNumBytesToSend = n+2;
}
//============================
//     Internal Functions
//============
void sssStopAll() {
  TIMSK2 &= B11111100;  // Disable Timer2 Compare Match A Interrupt
  PCMSK0 &= ~bit (PCINT0);  // disable pin change interrupt for pin 8
  PCICR  &= ~bit (PCIE0);   // disable pin change interrupts for D8 to D13
  sssIsListening = false;
}
//============
char sssPrepareToListen() {

  sssStopAll();
  
// check for idle period
  unsigned long sssStartMillis = millis();
  byte sssIdleCount = 0;
  byte sssMinIdleCount = 44; // 20 bits checked at half the bit interval plus a little extra
   
  while (millis() - sssStartMillis < sssIdleTimeoutMillis) {
    sssIdleCount ++;
    if ( ! (PINB & B00000001) ) {
     sssIdleCount = 0; // start counting again
    }
    if (sssIdleCount >= sssMinIdleCount) {  //  if a valid idle period, reset buffer
      sssBufHead = 0;
      sssBufTail = 0;
      PCMSK0 |= bit (PCINT0);  // pin 8
      PCIFR  |= bit (PCIF0);   // clear any outstanding interrupts
      PCICR  |= bit (PCIE0);   // enable pin change interrupts for D8 to D13
      sssTimerFunctionP = &sssTimerGetBitsISR;
      sssIsListening = true;
    }
  }
  return sssIsListening;
}

//============
void sssPrepareToTalk() {

  sssStopAll();
    
  digitalWrite(sssTxPin, HIGH); // high = idle
  
  sssTimerFunctionP = &sssSendNextByteISR;
  
   // start the bitInterval timer
  noInterrupts();
    OCR2A = TCNT2 + SSS_TX_TIMER_INCR;
    TIMSK2 &= B11111100; // Disable compareMatchA and Overflow                                     
    TIFR2  |= B00000010;  // Clear  Timer2 Compare Match A Flag - not sure this is essential
    TIMSK2 |= B00000010;  // Enable Timer2 Compare Match A Interrupt
  interrupts();
}
//=====================================
//       Interrupt Routines
//===========
ISR(PCINT0_vect) {

  // this is called when a start bit is detected
  if (PINB & 0x01) return;  // if RX is high it isn't a start bit
  
  // turn off the startBit interrupt
  PCMSK0 &= ~bit (PCINT0);  // disable pin change interrupt for pin 8
  PCICR  &= ~bit (PCIE0);   // disable pin change interrupts for D8 to D13
  
  // start the bitInterval timer
  OCR2A = TCNT2 + SSS_RX_TIMER_INCR;
  TIMSK2 &= B11111100; // Disable compareMatchA and Overflow                                     
  TIFR2  |= B00000010;  // Clear  Timer2 Compare Match A Flag - not sure this is essential
  TIMSK2 |= B00000010;  // Enable Timer2 Compare Match A Interrupt
    
  // set counters and buffer index
  sssBitCount = 0;
  sssRecvByte = 0;
}
//=============
ISR(TIMER2_COMPA_vect) {
  // this is called by the bitInterval timer
  sssTimerFunctionP(); // this is a function pointer and will call different functions
                       // Points to one of sssTimerGetBitsISR()
                       //                  sssSendNextByteISR()
                       //                  sssSendBitsISR()
}
//=============
void sssTimerGetBitsISR() {
  // read the bit value first
  byte sssNewBit = PINB & B00000001; // Arduino Pin 8
//  byte sssNewBit = *portInputRegister(digitalPinToPort(sssRxPin)) & digitalPinToBitMask(sssRxPin);  // 30 bytes larger; slower too?
  
  // update the counter for the next bit interval
  OCR2A = TCNT2 + SSS_RX_TIMER_INCR;
  
  if (sssBitCount == 8) {   // this is the stop bit
     // stop the bitIntervalTimer
     TIMSK2 &= B11111100;  // Disable Timer2 Compare Match A  and overflow Interrupts
     // enable Interrupt 0
     PCMSK0 |= bit (PCINT0);  // pin 8
     PCIFR  |= bit (PCIF0);   // clear any outstanding interrupts
     PCICR  |= bit (PCIE0);   // enable pin change interrupts for D8 to D13
  }

  sssNewBit = sssNewBit << sssBitCount; // moves it to the correct place
  sssRecvByte += sssNewBit;

  if (sssBitCount == 7) {
     // update the bufHead index
     // but prevent overwriting the tail of the buffer
     byte sssTestHead = (sssBufHead + 1) % sssBufSize;
     if (sssTestHead != sssBufTail) { // otherwise sssBufHead is unchanged
       sssBufHead = sssTestHead;
     }
     // and save the byte
     sssBuffer[sssBufHead] = sssRecvByte;
  }
  sssBitCount ++;
}
//============
void sssSendNextByteISR() {
    // this all happens while the line is idle
    OCR2A = TCNT2 + SSS_TX_TIMER_INCR;

    if (sssNumBytesToSend > 0) {
      sssNextByteToSend = sssBuffer[sssBufferPos];
      sssBitPos = 0;
      sssTimerFunctionP = &sssSendBitsISR; // switch interrupt to the sendBits function
    }
    // otherwise let interrupt keep checking if there are bytes to send
}
//===========
void sssSendBitsISR() {
 
     OCR2A = TCNT2 + SSS_TX_TIMER_INCR;
    
     if (sssBitPos == 9) {     // this is the  stop bit
       PORTD |= B10000000;
       sssTimerFunctionP = &sssSendNextByteISR;   // switch interrupt to the sendNextByte function
       sssBufferPos ++;   // update the byte index
       sssNumBytesToSend --;
      }
     else if (sssBitPos > 0) {
         sssNextBit = sssNextByteToSend & B00000001;
         if (sssNextBit)
           PORTD |= B10000000;
         else
           PORTD &= B01111111;
         sssNextByteToSend = sssNextByteToSend >> 1;
         sssBitPos ++;
     }
     else {   // this is the start bit
        PORTD &= B01111111;
        sssBitPos ++;
     }
}
//========END=============

//-------------------------------------------------------------------------------------------
#include <inttypes.h>

#define _SS_MAX_RX_BUFF 64 // RX buffer size

  uint8_t _receiveBitMask;
  volatile uint8_t *_receivePortRegister;
  uint8_t _transmitBitMask;
  volatile uint8_t *_transmitPortRegister;

  uint16_t _rx_delay_centering;
  uint16_t _rx_delay_intrabit;
  uint16_t _rx_delay_stopbit;
  uint16_t _tx_delay;

  bool ss_isListening = false;

  void ss_recv();
  uint8_t ss_rx_pin_read();
  void ss_tx_pin_write(uint8_t pin_state);

//=========================================================================================== 
 
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <Arduino.h>

#define PMTK_SET_NMEA_OUTPUT_RMCONLY "$PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29"
#define PMTK_SET_NMEA_UPDATE_1HZ  "$PMTK220,1000*1F"
#define PMTK_SET_NMEA_OUTPUT_RMCGGA "$PMTK314,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*28"
#define PMTK_SET_NMEA_OUTPUT_ALLDATA "$PMTK314,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0*28"
#define PMTK_SET_NMEA_OUTPUT_OFF "$PMTK314,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*28"

void setup()  
{
  Serial.begin(115200);
  Serial.println("Software Serial development test sketch.");

  sssBegin();
  // My GPS seems to need about 10ms to warm up
  delay(10);
  
  sssWriteln(PMTK_SET_NMEA_OUTPUT_RMCONLY);	// RMC output only
  sssWriteln(PMTK_SET_NMEA_UPDATE_1HZ);   	// 1 Hz update rate  


}
//--------------------------------------------------------------
void loop()
{
  char c;

  if (sssAvailable()) {
    c = sssRead();
    //UDR0 = c;			// fast echo to UART
    Serial.write(c);
  }
}
//--------------------------------------------------------------




