

#ifndef TimerSerial_h
#define TimerSerial_h

#include <inttypes.h>

#include "../SingleSerial/BetterStream.h"

/******************************************************************************
* Definitions
******************************************************************************/

#ifndef GCC_VERSION
#define GCC_VERSION (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)
#endif

class TimerSerial : public BetterStream
{
private:

  static byte prescaler; 


public:
    static volatile uint8_t _transmitBitMask; // public for ISR
    static volatile uint8_t _transmitInvMask;
    static volatile uint8_t *_transmitPortRegister;
    static volatile byte fInt, bit;
    static byte _TXpin;


    static volatile uint16_t _tx_delay; // public for debug

  // public methods
  TimerSerial(uint8_t receivePin, uint8_t transmitPin);

  static void begin(long speed);

  uint8_t peek(); //virtual
  static void write_S(uint8_t byte);

  virtual size_t write(uint8_t byte);
  virtual uint8_t read();
  virtual uint8_t available();
  virtual void flush();
  
  static void wait() {}; // do nothing
  using BetterStream::write;

};

// Arduino 0012 workaround
#undef int
#undef char
#undef long
#undef byte
#undef float
#undef abs
#undef round

#endif
