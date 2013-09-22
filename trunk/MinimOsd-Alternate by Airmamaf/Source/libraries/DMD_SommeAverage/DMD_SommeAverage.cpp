#include "DMD_SommeAverage.h"

DMD_SommeAverage::DMD_SommeAverage() {
    saReadcount = 0;
    saSommevalue = 0;
    climb_speed = 0;
    orientation = 0xb1;
}

void DMD_SommeAverage::addValue(float val) {
    saSommevalue = saSommevalue + val;
    saReadcount++;
}

int16_t DMD_SommeAverage::readAverage(uint32_t elapse_time) {
    float avg = saSommevalue / saReadcount;
    
    if( elapse_time > 0 ) {
        if( lastValue > avg ) {
            climb_speed = ((float)(lastValue - avg)) * 3600 / elapse_time + 0.5f; //Rounded value => add 0.5f
            orientation = 0xcf; //Symbol DOWN
        } else {
            climb_speed = ((float)(avg - lastValue)) * 3600 / elapse_time + 0.5f; //Rounded value => add 0.5f
            orientation = 0xbf; //Symbol UP
        }

        if( climb_speed == 0 ) {
            orientation = 0xb1; //Symbol LEVEL
        }
    
        lastValue = avg; //Last average as start point
        saReadcount = 0;
        saSommevalue = avg; //Last average as start point
    }
    return (avg + 0.5f);
}

int8_t DMD_SommeAverage::readOrientation(void) {
    return orientation;   
}
  
int16_t DMD_SommeAverage::readClimbSpeed(void) {
    return climb_speed;
}
