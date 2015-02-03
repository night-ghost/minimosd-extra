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
#define SS_PIN    10  // <------- !!! (Remember! This pin will select USB host chip Max3421)

class SPI
{
  public:
    SPI(void);
    void mode(byte);
    byte transfer(byte);
    byte transfer(byte, byte);
};

extern SPI Spi;

#endif
