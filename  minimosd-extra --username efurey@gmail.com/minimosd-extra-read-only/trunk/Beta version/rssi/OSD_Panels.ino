/******* STARTUP PANEL *******/

void startPanels(){
  osd.clear();
  // Display our logo  
  panLogo(8,5);
}


/******* PANELS - DEFINITION *******/

/* **************************************************************** */
// Panel  : panTune
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

//void panTune(int first_col, int first_line){
//  osd.setPanel(first_col, first_line);
//  osd.openPanel();
//  if (osd_off == 0){
//  osd.printf("%c%c%3.0f%c|%c%c%3.0f%c|%c%c%3.0i%c|%c%c%3.0i%c|%c%c%3.0i%c|%c%c%3.0f%c|%c%c%3.0f%c|%c%c%3.0f%c", 0x4E, 0x52, (nav_roll), 0xB0, 0x4E, 0x50, (nav_pitch), 0xB0, 0x4E, 0x48, (nav_bearing), 0xB0, 0x54, 0x42, (target_bearing), 0xB0, 0x57, 0x44, (wp_dist), 0x6D, 0x41, 0x45, (alt_error), 0x6D, 0x58, 0x45, (xtrack_error), 0x6D, 0x41, 0x45, (aspd_error * 3.6), 0x81);
//  }
 
//  osd.closePanel();
//}

/* **************************************************************** */
// Panel  : panCur_A
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panCur_A(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%5.2f%c", 0xE4, (osd_curr_A * .01), 0x8F);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panAlt
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panAlt(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  //osd.printf("%c%5.0f%c",0x85, (double)(osd_alt - osd_home_alt), 0x8D);
  osd.printf("%c%5.0f%c",0xE6, (double)(osd_alt * converth), high);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panClimb
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panClimb(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%3.0f%c",0x16, (double)(osd_climb), 0x88);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panHomeAlt
// Needs  : X, Y locations
// Output : Alt symbol and home altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panHomeAlt(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  //osd.printf("%c%5.0f%c",0x85, (double)(osd_alt - osd_home_alt), 0x8D);
  osd.printf("%c%5.0f%c",0xE7, (double)((osd_alt - osd_home_alt) * converth), high);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panVel
// Needs  : X, Y locations
// Output : Velocity value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panVel(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%3.0f%c",0xE9,(double)(osd_groundspeed * converts),spe);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panAirSpeed
// Needs  : X, Y locations
// Output : Airspeed value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

  void panAirSpeed(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%3.0f%c", 0xE8, (double)(osd_airspeed * converts), spe);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panThr
// Needs  : X, Y locations
// Output : Throttle value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panThr(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%3.0i%c",0x87,osd_throttle,0x25);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panBatteryPercent
// Needs  : X, Y locations
// Output : Battery state from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panBatteryPercent(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%3.0i%c", 0xB9, (osd_battery_remaining_A), 0x25);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panTime
// Needs  : X, Y locations
// Output : Time from start with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panTime(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  start_Time = millis()/1000;
  osd.printf("%c%2i%c%02i", 0xB3,(start_Time/60)%60,0x3A,start_Time%60);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panHomeDis
// Needs  : X, Y locations
// Output : Home Symbol with distance to home in meters
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panHomeDis(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%5.0f%c", 0x1F, (double)((osd_home_distance) * converth), high);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panCenter
// Needs  : X, Y locations
// Output : 2 row croshair symbol created by 2 x 4 chars
// Size   : 2 x 4  (rows x chars)
// Staus  : done

void panCenter(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf_P(PSTR("\x05\x03\x04\x05|\x15\x13\x14\x15"));
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panHorizon
// Needs  : X, Y locations
// Output : 12 x 4 Horizon line surrounded by 2 cols (left/right rules)
// Size   : 14 x 4  (rows x chars)
// Staus  : done

void panHorizon(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf_P(PSTR("\xc8\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xc9|"));
  osd.printf_P(PSTR("\xc8\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xc9|"));
  osd.printf_P(PSTR("\xd8\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xd9|"));
  osd.printf_P(PSTR("\xc8\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xc9|"));
  osd.printf_P(PSTR("\xc8\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xc9"));
  osd.closePanel();
  showHorizon((first_col + 1), first_line);
}

/* **************************************************************** */
// Panel  : panPitch
// Needs  : X, Y locations
// Output : -+ value of current Pitch from vehicle with degree symbols and pitch symbol
// Size   : 1 x 6  (rows x chars)
// Staus  : done

void panPitch(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%4i%c%c",osd_pitch,0xb0,0xb1);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panRoll
// Needs  : X, Y locations
// Output : -+ value of current Roll from vehicle with degree symbols and roll symbol
// Size   : 1 x 6  (rows x chars)
// Staus  : done

void panRoll(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%4i%c%c",osd_roll,0xb0,0xb2);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panBattery A (Voltage 1)
// Needs  : X, Y locations
// Output : Voltage value as in XX.X and symbol of over all battery status
// Size   : 1 x 8  (rows x chars)
// Staus  : done

void panBatt_A(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
/*************** This commented code is for the next ArduPlane Version
#ifdef MAVLINK10
  if(osd_battery_remaining_A > 100){
    osd.printf(" %c%5.2f%c", 0xE2, (double)osd_vbat_A, 0x8E);
  }
#else
  if(osd_battery_remaining_A > 1000){
    osd.printf(" %c%5.2f%c", 0xE2, (double)osd_vbat_A, 0x8E);
  }
#endif //MAVLINK10
  else osd.printf("%c%5.2f%c%c", 0xE2, (double)osd_vbat_A, 0x8E, osd_battery_pic_A);
*/
  osd.printf("%c%5.2f%c", 0xE2, (double)osd_vbat_A, 0x8E);
  osd.closePanel();
}

//------------------ Panel: Startup ArduCam OSD LOGO -------------------------------

void panLogo(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
//  overspeed = EEPROM.read(202);
//  stall = EEPROM.read(204);
//  battv = EEPROM.read(206);
// battp = EEPROM.read(208);
//  EEPROM.write(194, 1);
//  EEPROM.write(196, 5);
//  EEPROM.write(198, 7);
  osd.printf_P(PSTR("\x20\x20\x20\x20\x20\xba\xbb\xbc\xbd\xbe|\x20\x20\x20\x20\x20\xca\xcb\xcc\xcd\xce|MinimOSD Extra|    beta"));
  osd.closePanel();
}

//------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

void panWaitMAVBeats(int first_col, int first_line){
  panLogo(8,5);
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf_P(PSTR("Waiting for|MAVLink heartbeats..."));
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panGPL
// Needs  : X, Y locations
// Output : 1 static symbol with changing FIX symbol
// Size   : 1 x 2  (rows x chars)
// Staus  : done

void panGPL(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  switch(osd_fix_type) {
    case 0: 
      osd.printf_P(PSTR("\x10"));
      break;
    case 1: 
      osd.printf_P(PSTR("\x10"));
      break;
    case 2: 
      osd.printf_P(PSTR("\x11"));//If not APM, x01 would show 2D fix
      break;
    case 3: 
      osd.printf_P(PSTR("\x11"));//If not APM, x02 would show 3D fix
      break;
  }
    /*  if(osd_fix_type <= 1) {
    osd.printf_P(PSTR("\x10"));
  } else {
    osd.printf_P(PSTR("\x11"));
  }  */
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panGPSats
// Needs  : X, Y locations
// Output : 1 symbol and number of locked satellites
// Size   : 1 x 5  (rows x chars)
// Staus  : done

void panGPSats(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%2i", 0x0f,osd_satellites_visible);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panGPS
// Needs  : X, Y locations
// Output : two row numeric value of current GPS location with LAT/LON symbols as on first char
// Size   : 2 x 12  (rows x chars)
// Staus  : done

void panGPS(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%11.6f|%c%11.6f", 0x83, (double)osd_lat, 0x84, (double)osd_lon);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panHeading
// Needs  : X, Y locations
// Output : Symbols with numeric compass heading value
// Size   : 1 x 5  (rows x chars)
// Staus  : not ready

void panHeading(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%4.0f%c", (double)osd_heading, 0xb0);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panRose
// Needs  : X, Y locations
// Output : a dynamic compass rose that changes along the heading information
// Size   : 2 x 13  (rows x chars)
// Staus  : done

void panRose(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%s|%c%s%c", "\x20\xc0\xc0\xc0\xc0\xc0\xc7\xc0\xc0\xc0\xc0\xc0\x20", 0xd0, buf_show, 0xd1);
  osd.closePanel();
}


/* **************************************************************** */
// Panel  : panBoot
// Needs  : X, Y locations
// Output : Booting up text and empty bar after that
// Size   : 1 x 21  (rows x chars)
// Staus  : done

void panBoot(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf_P(PSTR("Booting up:\xed\xf2\xf2\xf2\xf2\xf2\xf2\xf2\xf3")); 
  osd.closePanel();

}

/* **************************************************************** */
// Panel  : panMavBeat
// Needs  : X, Y locations
// Output : 2 symbols, one static and one that blinks on every 50th received 
//          mavlink packet.
// Size   : 1 x 2  (rows x chars)
// Staus  : done

void panMavBeat(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
    if(mavbeat == 1){
      osd.printf_P(PSTR("\xEA\xEC"));
      mavbeat = 0;
    }
    else{
      osd.printf_P(PSTR("\xEA\xEB"));
    }
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panWPDir
// Needs  : X, Y locations
// Output : 2 symbols that are combined as one arrow, shows direction to next waypoint
// Size   : 1 x 2  (rows x chars)
// Staus  : not ready

void panWPDir(int first_col, int first_line){
  //osd.setPanel(first_col, first_line);
  //osd.openPanel();
  //if (osd_off == 0){
  //	showArrow(osd_home_direction);
  //  }
  //	osd.closePanel();
}

/* **************************************************************** */
// Panel  : panHomeDir
// Needs  : X, Y locations
// Output : 2 symbols that are combined as one arrow, shows direction to home
// Size   : 1 x 2  (rows x chars)
// Status : not tested

void panHomeDir(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  showArrow(osd_home_direction);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panFlightMode 
// Needs  : X, Y locations
// Output : 2 symbols, one static name symbol and another that changes by flight modes
// Size   : 1 x 2  (rows x chars)
// Status : done

void panFlightMode(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
#ifndef MAVLINK10
  if(apm_mav_type == 2){//ArduCopter MultiRotor or ArduCopter Heli
    if(osd_mode == 100) osd.printf_P(PSTR("\xE0""stab"));//Stabilize
    if(osd_mode == 101) osd.printf_P(PSTR("\xE0""acro"));//Acrobatic
    if(osd_mode == 102) osd.printf_P(PSTR("\xE0""alth"));//Alt Hold
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_WAYPOINT) osd.printf_P(PSTR("\xE0""auto"));//Auto
    if(osd_mode == MAV_MODE_GUIDED && osd_nav_mode == MAV_NAV_WAYPOINT) osd.printf_P(PSTR("\xE0""guid"));//Guided
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_HOLD) osd.printf_P(PSTR("\xE0""loit"));//Loiter
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_RETURNING) osd.printf_P(PSTR("\xE0""retl"));//Return to Launch
    if(osd_mode == 107) osd.printf_P(PSTR("\xE0""circ")); // Circle
    if(osd_mode == 108) osd.printf_P(PSTR("\xE0""posi")); // Position
    if(osd_mode == 109) osd.printf_P(PSTR("\xE0""land")); // Land
    if(osd_mode == 110) osd.printf_P(PSTR("\xE0""oflo")); // OF_Loiter
  }
  else if(apm_mav_type == 1){//ArduPlane
    if(osd_mode == MAV_MODE_TEST1 && osd_nav_mode == MAV_NAV_VECTOR) osd.printf_P(PSTR("\xE0""stab"));//Stabilize
    if(osd_mode == MAV_MODE_MANUAL && osd_nav_mode == MAV_NAV_VECTOR) osd.printf_P(PSTR("\xE0""manu"));//Manual
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_LOITER) osd.printf_P(PSTR("\xE0""loit"));//Loiter
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_RETURNING) osd.printf_P(PSTR("\xE0""retl10"));//Return to Launch
    if(osd_mode == MAV_MODE_TEST2 && osd_nav_mode == 1) osd.printf_P(PSTR("\xE0""fbwa"));//FLY_BY_WIRE_A
    if(osd_mode == MAV_MODE_TEST2 && osd_nav_mode == 2) osd.printf_P(PSTR("\xE0""fbwb"));//FLY_BY_WIRE_B
    if(osd_mode == MAV_MODE_GUIDED) osd.printf_P(PSTR("\xE0""guid"));//GUIDED
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_WAYPOINT) osd.printf_P(PSTR("\xE0""auto"));//AUTO
    if(osd_mode == MAV_MODE_TEST3) osd.printf_P(PSTR("\xE0""circ"));//CIRCLE
  }

#else 
  if(apm_mav_type == 2){//ArduCopter MultiRotor or ArduCopter Heli
    if(osd_mode == 0) osd.printf_P(PSTR("\xE0""stab"));//Stabilize
    if(osd_mode == 1) osd.printf_P(PSTR("\xE0""acro"));//Acrobatic
    if(osd_mode == 2) osd.printf_P(PSTR("\xE0""alth"));//Alt Hold
    if(osd_mode == 3) osd.printf_P(PSTR("\xE0""auto"));//Auto
    if(osd_mode == 4) osd.printf_P(PSTR("\xE0""guid"));//Guided
    if(osd_mode == 5) osd.printf_P(PSTR("\xE0""loit"));//Loiter
    if(osd_mode == 6) osd.printf_P(PSTR("\xE0""retl"));//Return to Launch
    if(osd_mode == 7) osd.printf_P(PSTR("\xE0""circ")); // Circle
    if(osd_mode == 8) osd.printf_P(PSTR("\xE0""posi")); // Position
    if(osd_mode == 9) osd.printf_P(PSTR("\xE0""land")); // Land
    if(osd_mode == 10) osd.printf_P(PSTR("\xE0""oflo")); // OF_Loiter
  }
  else if(apm_mav_type == 1){//ArduPlane
    if(osd_mode == 2 ) osd.printf_P(PSTR("\xE0""stab"));//Stabilize
    if(osd_mode == 0) osd.printf_P(PSTR("\xE0""manu"));//Manual
    if(osd_mode == 12) osd.printf_P(PSTR("\xE0""loit"));//Loiter
    if(osd_mode == 11 ) osd.printf_P(PSTR("\xE0""retl"));//Return to Launch
    if(osd_mode == 5 ) osd.printf_P(PSTR("\xE0""fbwa"));//FLY_BY_WIRE_A
    if(osd_mode == 6 ) osd.printf_P(PSTR("\xE0""fbwb"));//FLY_BY_WIRE_B
    if(osd_mode == 15) osd.printf_P(PSTR("\xE0""guid"));//GUIDED
    if(osd_mode == 10 ) osd.printf_P(PSTR("\xE0""auto"));//AUTO
    if(osd_mode == 1) osd.printf_P(PSTR("\xE0""circ"));//CIRCLE
  }
#endif
  osd.closePanel();

}

// Calculate and shows Artificial Horizon
void showHorizon(int start_col, int start_row) { 

  int x, nose, row, minval, hit, subval = 0;
  int cols = 12;
  int rows = 5;
  int col_hit[cols];
  float  pitch, roll;
   
  (abs(osd_pitch) == 90)?pitch = 89.99 * (90/osd_pitch) * -0.017453293:pitch = osd_pitch * -0.017453293;
  (abs(osd_roll) == 90)?roll = 89.99 * (90/osd_roll) * 0.017453293:roll = osd_roll * 0.017453293;

  nose = round(tan(pitch) * (rows*9));
  for(int col=1;col <= cols;col++){
    x = (col * 12) - (cols * 6) - 6;//center X point at middle of each col
    col_hit[col-1] = (tan(roll) * x) + nose + (rows*9) - 1;//calculating hit point on Y plus offset to eliminate negative values
    //col_hit[(col-1)] = nose + (rows * 9);
  }

  for(int col=0;col < cols; col++){
    hit = col_hit[col];
    if(hit > 0 && hit < (rows * 18)){
      row = rows - ((hit-1)/18);
      minval = rows*18 - row*18 + 1;
      subval = hit - minval;
      subval = round((subval*9)/18);
      if(subval == 0) subval = 1;
      printHit(start_col + col, start_row + row - 1, subval);
    }
  }
}

void printHit(byte col, byte row, byte subval){
  osd.openSingle(col, row);
    switch (subval){
      case 1:
        osd.printf_P(PSTR("\x06"));
        break;
      case 2:
        osd.printf_P(PSTR("\x07"));
        break;
      case 3:
        osd.printf_P(PSTR("\x08"));
        break;
      case 4:
        osd.printf_P(PSTR("\x09"));
        break;
      case 5:
        osd.printf_P(PSTR("\x0a"));
        break;
      case 6:
        osd.printf_P(PSTR("\x0b"));
        break;
      case 7:
        osd.printf_P(PSTR("\x0c"));
        break;
      case 8:
        osd.printf_P(PSTR("\x0d"));
        break;
      case 9:
        osd.printf_P(PSTR("\x0e"));
        break;
    }
}

