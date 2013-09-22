#include <inttypes.h>

#if defined(ARDUINO) && ARDUINO >= 100
	#include "Arduino.h"
#else
	#include "WProgram.h"
#endif

#ifndef _DMD_SOMME_AVERAGE_H
#define _DMD_SOMME_AVERAGE_H

class DMD_SommeAverage 
{
public:
    DMD_SommeAverage();
        
    void     addValue(float val);

    int16_t  readAverage(uint32_t elapse_time);
    //float readAverage(uint32_t current_time);
    
    int8_t   readOrientation(void);
    
    int16_t    readClimbSpeed(void);

private:
    int16_t saReadcount;
    float saSommevalue;
    float lastValue;
    int8_t orientation;
    int16_t climb_speed; 
};

#endif // _DMD_SOMME_AVERAGE_H

