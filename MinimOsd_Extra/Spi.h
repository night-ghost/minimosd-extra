#ifndef Spi_h
#define Spi_h

#include "Arduino.h"

#include "Config.h"


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
