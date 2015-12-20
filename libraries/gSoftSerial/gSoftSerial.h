//
// gSoftSerial
//
#ifndef gSoftSerial_h
#define gSoftSerial_h
#include "Arduino.h"
#include <inttypes.h>

// The RX_BUFFER_SIZE should be a power of 2 for optimal speed in the ISR.

#define RX_BUFFER_SIZE		64

// Default baud rate is 9600
#define TIMER_TICKS_BIT_WIDTH_9600	26	// 9600 baud bit width in units of 4us
#define TIMER_HALF_BIT_WIDTH_9600	(TIMER_TICKS_BIT_WIDTH_9600 / 2)
#define FAST_DIVIDE_SHIFT_9600		11	// 9600 baud bit shift count for fast divide
#define FAST_DIVIDE_MULTIPLIER		79	// multiplier for fast divide


#if F_CPU == 16000000L
  #define TCNTX TCNT0
#elif F_CPU == 8000000L
  #define TCNTX TCNT2
#endif

// ------------------------------------------------------------------------------

class gSoftSerial : public Print 
{
public:
    gSoftSerial(uint8_t receivePin, uint8_t transmitPin) {
	rxPin = receivePin; txPin = transmitPin;
    }

  void begin(uint16_t baudRate=9600);	// initialize, set baudrate, listen
  void listen();			// enable RX interrupts
  void ignore();			// disable RX interrupts
  void setBaudRate(uint16_t baudRate);	// set baud rate (9600 [default], 19200, 38400)
  uint8_t available();			// returns number of characters in buffer
  char read();				// get one character from buffer
  size_t write(uint8_t txChar);		// transmit a character
  void end();
private:
  uint8_t rxPin, txPin;		// RX and TX digital pin numbers (0-19)
};
#endif
