/*

*/

// When set, _DEBUG co-opts pins 11 and 13 for debugging with an
// oscilloscope or logic analyzer.  Beware: it also slightly modifies
// the bit times, so don't rely on it too much at high baud rates
#define _DEBUG 0
#define _DEBUG_PIN1 11
#define _DEBUG_PIN2 13
// 
// Includes
// 
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <Arduino.h>
#include <TimerSerial.h>
#include <util/delay_basic.h>

//
// Statics
//


volatile uint8_t TimerSerial::_transmitBitMask;
volatile uint8_t TimerSerial::_transmitInvMask;

volatile uint8_t * TimerSerial::_transmitPortRegister;
volatile uint16_t TimerSerial::_tx_delay;

volatile uint8_t TimerSerial::fInt;
volatile uint8_t TimerSerial::bit;

byte  TimerSerial::prescaler;


//
// Constructor
//
TimerSerial::TimerSerial(uint8_t rxPin, uint8_t txPin) {

  // First write, then set output. If we do this the other way around,
  // the pin would be output low for a short while before switching to
  // output high. Now, it is input with pullup for a short while, which
  // is fine. With inverse logic, either order is fine.
  digitalWrite(txPin, HIGH);
  pinMode(txPin, OUTPUT);

  _transmitBitMask = digitalPinToBitMask(txPin);
  _transmitInvMask = ~_transmitBitMask;
  uint8_t port = digitalPinToPort(txPin);
  _transmitPortRegister = portOutputRegister(port);
}



//
// Public methods
//

void TimerSerial::begin(long speed){
    byte div=1;

    switch(speed) {
    case 115200:
	prescaler= (1<<CS10); // prescaler = 8, 2MHz, T=0.5
	div=1;
	break; // ~138
    
    case 57600:
	prescaler= (1<<CS10); // prescaler = 8, 2MHz, T=0.5
	div=1;
	break; // 278

    case 38400:
	div=1;
	prescaler= (1<<CS10); // prescaler = 8, 2MHz, T=0.5
	_tx_delay = 419; // 416 calced
	return;
    
	
    case 19200:
    case 9600:
	prescaler= (1<<CS21); // prescaler = 32, 0.5MHz, T=2
	div=8;
	break;
    
    default:
	prescaler= (1<<CS20); // prescaler = 8, 2MHz, T=0.5
	div=1;
	break;
    }

    // Precalculate the various delays, in number of 4-cycle delays
    _tx_delay = (F_CPU / speed) / div;
}


uint8_t TimerSerial::peek() { return 0; }
uint8_t TimerSerial::available() {return false; }
uint8_t TimerSerial::read() { return 0; }




ISR(TIMER1_COMPA_vect) {
// таймер в режиме CTC - сам сбросится
//    OCR2A = TCNT2 + TimerSerial::_tx_delay; // отложим следующее прерывание

    if (TimerSerial::bit) // choose bit
      *TimerSerial::_transmitPortRegister |= TimerSerial::_transmitBitMask; // send 1
    else
      *TimerSerial::_transmitPortRegister &= TimerSerial::_transmitInvMask; // send 0

    TimerSerial::fInt = 1; // было прерывание
}

void TimerSerial::write_S(uint8_t b){
    if (_tx_delay == 0) {
//        setWriteError();
        return;
    }

    uint16_t delay = _tx_delay;

  // Write the start bit
    bit=0; // Write the start bit

    TCNT1 = delay-40;
    OCR1A = delay; // отложим на немного

    TCCR1A = 0;                    // CTC mode (4)
    TCCR1B = prescaler | (1<<WGM12);

    TIFR1  |= (1<<OCF1A);   // clear flag
    TIMSK1 |= (1<<OCIE1A);  // разрешим compare interrupt - все время передачи байта пусть тикает

    fInt=0; while(!fInt); // wait for interrupt - begin of start bit

    // Write each of the 8 bits
    for (uint8_t i = 8; i > 0; --i) {
        bit =  (b & 1); // choose bit
        b >>= 1;
        fInt=0; while(!fInt); // wait for interrupt
    }

    // restore pin to natural state - stop bit
    bit = 1;
    fInt=0; while(!fInt); // wait for interrupt - finish of last bit

    fInt=0; while(!fInt); // wait for interrupt - finish of stop bit

    TIMSK1 = 0; // выключить таймер
    TCCR1B = 0;
}

size_t TimerSerial::write(uint8_t b){
    write_S(b);
    return 1;

}

void TimerSerial::flush(){
  // There is no tx buffering, simply return
}


