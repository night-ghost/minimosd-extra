
//------------------ Heading and Compass ----------------------------------------

static char buf_show[12];
const char buf_Rule[36] = {0xc2,0xc0,0xc0,0xc1,0xc0,0xc0,0xc1,0xc0,0xc0,
                           0xc4,0xc0,0xc0,0xc1,0xc0,0xc0,0xc1,0xc0,0xc0,
                           0xc3,0xc0,0xc0,0xc1,0xc0,0xc0,0xc1,0xc0,0xc0,
                           0xc5,0xc0,0xc0,0xc1,0xc0,0xc0,0xc1,0xc0,0xc0};
void setHeadingPatern()
{
  int start;
  start = round((osd_heading * 36)/360);
  start -= 5;
  if(start < 0) start += 36;
  for(int x=0; x <= 10; x++){
    buf_show[x] = buf_Rule[start];
    if(++start > 35) start = 0;
  }
  buf_show[11] = '\0';
}

//------------------ Battery Remaining Picture ----------------------------------

char setBatteryPic(uint16_t bat_level)
{
  if(bat_level <= 100){
    return 0xb4;
  }
  else if(bat_level <= 300){
    return 0xb5;
  }
  else if(bat_level <= 400){
    return 0xb6;
  }
  else if(bat_level <= 500){
    return 0xb7;
  }
  else if(bat_level <= 800){
    return 0xb8;
  }
  else return 0xb9;
}

//------------------ Home Distance and Direction Calculation ----------------------------------

void setHomeVars(OSD &osd)
{
  float dstlon, dstlat;
  long bearing;
  
  if(osd_got_home == 0 && osd_fix_type > 1){
    osd_home_lat = osd_lat;
    osd_home_lon = osd_lon;
    //osd_home_alt = osd_alt;
    osd_got_home = 1;
  }
  else if(osd_got_home == 1){
    // JRChange: osd_home_alt: check for stable osd_alt (must be stable for 25*120ms = 3s)
    if(osd_alt_cnt < 25){
      if(fabs(osd_alt_prev - osd_alt) > 0.5){
        osd_alt_cnt = 0;
        osd_alt_prev = osd_alt;
      }
      else
      {
        if(++osd_alt_cnt >= 25){
          osd_home_alt = osd_alt;  // take this stable osd_alt as osd_home_alt
        }
      }
    }
    // shrinking factor for longitude going to poles direction
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
    osd_home_direction = round((float)(bearing/360.0f) * 16.0f) + 1;//array of arrows =)
    if(osd_home_direction > 16) osd_home_direction = 0;

  }

}

