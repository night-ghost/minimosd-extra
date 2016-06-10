// Get the common arduino functions
#if defined(ARDUINO) && ARDUINO >= 100
	#include "Arduino.h"
#else
	#include "wiring.h"
#endif

#include "compat.h"

#include "Spi.h"

//---------- constructor ----------------------------------------------------

SPI::SPI()
{
  // initialize the SPI pins
  pinMode(SCK_PIN, OUTPUT);
  pinMode(MOSI_PIN, OUTPUT);
  pinMode(MISO_PIN, INPUT);
  pinMode(SS_PIN, OUTPUT); // <------- !!! (Remember! This pin will select USB host chip Max3421)

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
  volatile byte tmp = SPSR;
  tmp = SPDR;
}

//------------------ transfer -----------------------------------------------

byte SPI::transfer(byte value){
  SPDR = value;
  while (!(SPSR & (1<<SPIF))) ;
  return SPDR;
}

byte SPI::transfer(byte value, byte period){
  SPDR = value;
  if (period > 0) delayMicroseconds(period);
  while (!(SPSR & (1<<SPIF))) ;
  return SPDR;
}


//---------- preinstantiate SPI object --------------------------------------

SPI Spi = SPI();

