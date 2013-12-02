// 
//    FILE: RSSIFilter.cpp
//  AUTHOR: Airmamaf
// PURPOSE: RC Filter to decode PWM RSSI signal
//
// Released to the public domain
//

#if defined(ARDUINO) && ARDUINO >= 100
	#include "Arduino.h"
#else
	#include "WProgram.h"
#endif

#include "RSSIFilter.h"
#include <math.h> 


RSSIFilter::RSSIFilter(float rc_filter)
{
    RSSIFilter(rc_filter, 135);
}

RSSIFilter::RSSIFilter(float rc_filter, int rssi_max)
{
    RSSIFilter(rc_filter, rssi_max, -1, 1);
}

RSSIFilter::RSSIFilter(float rc_filter, int rssi_max, float scale_min, float scale_max)
{
	_rssi_max = rssi_max;
    _max_quality_signal = 0.01;
	_rc_filter = rc_filter;
	_scale_min = scale_min;
	_scale_max = scale_max;
	_lower_scale = 1/(1+exp(-scale_min));
	_upper_scale = 1/(1+exp(-scale_max));
	
	clear();
}

void RSSIFilter::clear() 
{ 
	_signal_quality = 0;
}

// adds a new value to the data-set
void RSSIFilter::computeSignal(int rssi_value)
{
  //if(!_rssi_max_fixed) _rssi_max = max(_rssi_max, rssi_value);
  int rssi_on = min(rssi_value, _rssi_max);
  int rssi_off = _rssi_max - rssi_on;
  
  float alpha_on = rssi_on / ( rssi_on + _rc_filter);
  float alpha_off = rssi_off / ( rssi_off + _rc_filter );
  
  _signal_quality = alpha_on + (1 - alpha_on) * _signal_quality;
  _signal_quality = (1 - alpha_off) * _signal_quality;

  _max_quality_signal = max(_max_quality_signal, _signal_quality);
}

float RSSIFilter::getSignal()
{
    if( _signal_quality <= 0.01 ) {
        return 0;   
    } else {
        return _signal_quality;
    }
}

int RSSIFilter::getPercentCurvedSignal()
{
    float rawcurved = (getSignal() / _max_quality_signal) * (_upper_scale - _lower_scale) + _lower_scale;

    if(rawcurved < 0.01) return 0;
    if(rawcurved > 0.99) return 100;     
    return (int)((-log((1-rawcurved)/rawcurved) - _scale_min) * 100 / (_scale_max - _scale_min) + 0.5);
}

int RSSIFilter::getPercentSignal()
{
    return (int) (getSignal() * 100 /_max_quality_signal + 0.5);
}
// END OF FILE