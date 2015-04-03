// EEPROM reader/writers
// Utilities for writing and reading from the EEPROM
inline byte readEEPROM(uint16_t address) {

    return EEPROM.read(address);
}

inline void writeEEPROM(byte value, uint16_t address) {
    EEPROM.write(address, value);
}

inline boolean getBit(byte Reg, byte whichBit) {
    return  Reg & (1 << whichBit);
}


//------------------ Battery Remaining Picture ----------------------------------

char setBatteryPic(uint16_t bat_level)
{

  if(bat_level <= 25){
    return 0x20;
  }
  else if(bat_level <= 60){
    return 0x8d;
  }
  else if(bat_level <= 100){
    return 0x8c;
  }
  else if(bat_level <= 145){
    return 0x8b;
  }
  else if(bat_level <= 205){
    return 0x8a;
  }
  else return 0x89;

}

//------------------ Home Distance and Direction Calculation ----------------------------------

void setHomeVars(OSD &osd)
{
  float dstlon, dstlat;
  long bearing;

  //osd_alt_to_home = (osd_alt - osd_home_alt);

#ifdef IS_COPTER
  //Check disarm to arm switching.
  if (motor_armed && !last_armed_status){
    //If motors armed, reset home in Arducopter version
    osd_got_home = 0;
  }

  last_armed_status = motor_armed;

  if(osd_got_home == 0 && osd_fix_type > 1 ){
#else
#ifdef IS_PLANE
  if(osd_throttle > 3 && takeoff_heading == -400)
    takeoff_heading = osd_heading;

  osd_alt_to_home = (osd_alt - osd_home_alt);
  
  if(osd_got_home == 0 && osd_fix_type == 3 ){
#else
  if(1){
#endif
#endif

    osd_home_lat = osd_lat;
    osd_home_lon = osd_lon;
    //osd_alt_cnt = 0;
    //osd_home_alt = osd_alt;
    osd_got_home = 1;
  } else if(osd_got_home == 1){
    float rads = fabs(osd_home_lat) * 0.0174532925;
    double scaleLongDown = cos(rads);
    double scaleLongUp   = 1.0f/cos(rads);

    //DST to Home
    dstlat = fabs(osd_home_lat - osd_lat) * 111319.5;
    dstlon = fabs(osd_home_lon - osd_lon) * 111319.5 * scaleLongDown;
    osd_home_distance = sqrt(sq(dstlat) + sq(dstlon));

    //DIR to Home
    dstlon = (osd_home_lon - osd_lon); //OffSet_X
    dstlat = (osd_home_lat - osd_lat) * scaleLongUp; //OffSet Y
    bearing = 90 + (atan2(dstlat, -dstlon) * 57.295775); //absolut home direction
    if(bearing < 0) bearing += 360;//normalization
    bearing = bearing - 180;//absolut return direction
    if(bearing < 0) bearing += 360;//normalization
    bearing = bearing - osd_heading;//relative home direction
    if(bearing < 0) bearing += 360; //normalization
    osd_home_direction = ((int)round((float)(bearing/360.0f) * 16.0f) % 16) + 1;//array of arrows =)
    //if(osd_home_direction > 16) osd_home_direction = 1;
  }
}


// накопление статистики и рекордов
void setFdataVars()
{
  //Moved from panel because warnings also need this var and panClimb could be off
  vs = (osd_climb * converth * 60) * 0.1 + vs * 0.9;

  if(max_battery_reading < osd_battery_remaining_A)
    max_battery_reading = osd_battery_remaining_A;

  unsigned long time_lapse = millis() - runt;
  runt = millis();


  if (takeofftime == 0 && osd_alt_to_home > 5 && osd_throttle > 10){
    takeofftime = 1;
    tdistance = 0;
    FTime = (time_lapse/1000);
  }


  if (osd_groundspeed > 1.0) tdistance += (osd_groundspeed * (time_lapse) / 1000.0);
 
  mah_used += (osd_curr_A * 10.0 * (time_lapse) / 3600000.0);

  //Set max data
#ifdef IS_COPTER
  if (motor_armed)  {
#else
#ifdef IS_PLANE
  if (takeofftime == 1){
#else
    if(0){
#endif
#endif

    total_flight_time_milis += time_lapse;
    total_flight_time_seconds = total_flight_time_milis / 1000;
    if (osd_home_distance > max_home_distance) max_home_distance = osd_home_distance;
    if (osd_airspeed > max_osd_airspeed) max_osd_airspeed = osd_airspeed;
    if (osd_groundspeed > max_osd_groundspeed) max_osd_groundspeed = osd_groundspeed;
    if (osd_alt_rel > max_osd_home_alt) max_osd_home_alt = osd_alt_rel;
    if (osd_windspeed > max_osd_windspeed) max_osd_windspeed = osd_windspeed;
  }
}

