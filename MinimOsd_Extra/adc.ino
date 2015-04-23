// Define various ADC prescaler
#define  PS_16  (1 << ADPS2)
#define  PS_32  (1 << ADPS2) | (1 << ADPS0)
#define  PS_64  (1 << ADPS2) | (1 << ADPS1)
#define  PS_128  (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0)

#include "adc.h"


//measure *adcList;


// see http://www.microsmart.co.za/technical/2014/03/01/advanced-arduino-adc/

void adc_setup(){

// set up the ADC
  ADCSRA &= ~PS_128;  // remove bits set by Arduino library

  // you can choose a prescaler from above.
  // PS_16, PS_32, PS_64 or PS_128
  ADCSRA |= PS_64;    // set our own prescaler to 64 

}
