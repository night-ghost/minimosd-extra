// Get the common arduino functions


#include "Arduino.h"
#include "compat.h"
#define DIGITALIO_NO_MIX_ANALOGWRITE
#include <fast_io.h>
#include "Spi.h"

//---------- constructor ----------------------------------------------------

SPI::SPI()
{
  // initialize the SPI pins
  pinModeFast(SCK_PIN, OUTPUT);
  pinModeFast(MOSI_PIN, OUTPUT);
  pinModeFast(MISO_PIN, INPUT);
  pinModeFast(SS_PIN, OUTPUT); 

  // enable SPI Master, MSB, SPI mode 0, FOSC/4
  mode(0);
}

//------------------ mode ---------------------------------------------------

void SPI::mode(byte config){

    // enable SPI master with configuration byte specified
    SPCR = 0;
    //      no interrupt      SPI enable master
    SPCR = (config & 0x7F) | (1<<SPE) | (1<<MSTR) /* | (1<<SPR0) */ ;
    SPSR |= 1;			// SPI2X: Double SPI Speed Bit
    byte tmp = SPSR;
    tmp = SPDR;
}

//------------------ transfer -----------------------------------------------

byte SPI::transfer(byte value, byte period){
  SPDR = value;
  if (period > 0) delayMicroseconds(period);
  while (!(SPSR & (1<<SPIF))) ;
  return SPDR;
}


//---------- preinstantiate SPI object --------------------------------------

SPI Spi = SPI();
