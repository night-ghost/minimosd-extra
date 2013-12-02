#ifndef RSSIFilter_h
#define RSSIFilter_h
// 
//    FILE: RSSIFilter.h
//  AUTHOR: Airmamaf
// PURPOSE: RC Filter to decode PWM RSSI signal
//
// Released to the public domain
//

#define RSSIFilter_LIB_VERSION "0.0.01"

class RSSIFilter 
{
        public:
        RSSIFilter(float);  //Constructor : RC Filter  (rssi_max at 135, scale min at -1, scale max at 1)
        RSSIFilter(float, int);  //Constructor : RC Filter, rssi_max  (scale min at -1, scale max at 1)
        RSSIFilter(float, int, float, float);  //Constructor : RC Filter, rssi_max, scale min, scale max
        void clear();
        void computeSignal(int); //Signal value in micro second
        float getSignal();
        int getPercentSignal();
        int getPercentCurvedSignal();

protected:
        int _rssi_max; //Value in micro second
        //char _rssi_max_fixed;
        float _scale_min;
        float _scale_max;
        float _upper_scale;
        float _lower_scale;
        float _max_quality_signal;
        float _signal_quality;
        float _rc_filter; //RC Filter  : Resistor in Ohm, capacity in micro Farad (not in farad)
};

#endif
// END OF FILE
