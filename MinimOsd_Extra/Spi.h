#ifndef Spi_h
#define Spi_h

// Get the common arduino functions
#if defined(ARDUINO) && ARDUINO >= 100
	#include "Arduino.h"
#else
	#include "wiring.h"
#endif

#define SCK_PIN   13
#define MISO_PIN  12
#define MOSI_PIN  11
#define SS_PIN    10  // <------- !!! (Remember! without this pin OSD not works)

class SPI
{
  public:
    SPI(void);
    static void mode(byte);
//    static byte transfer(byte);
    static byte transfer(byte, byte);
    static INLINE byte transfer(byte value){
      SPDR = value;
      while (!(SPSR & (1<<SPIF))) ;
      return SPDR;
    }
};

extern SPI Spi;

#endif
