static uint32_t  last_time_ask_tuning_value;

/******* STARTUP PANEL *******/
void startPanels(){
  osd.clear();
  // Display our logo  
  panLogo(10,5);
}

/******* PANELS - POSITION *******/

void writePanels(){
    uint32_t  localtime = millis();

    /*if(ISa(Climb_BIT)) {
        climb_average.addValue(osd_alt);
    }*/

  if(localtime < (lastMAVBeat + 2000)){
    //DMD Flight time
    //uint32_t  localtime = millis();
    if( armed && osd_throttle > 10 ) { //Flight time when motor is armed and copter is about de move (there's some throttle)
        flight_time += (localtime - last_time);
    }
    last_time = localtime;
    
    /*
     Start Tuning configuration with :
     - Full CH7
     - Full Throttle
     - Full Pitch (Forward)
     - Motor not armed
     
     Close Tuning configuration when CH7 low
     
     //Sample Tuning screen display

      NONE      
      STABILIZE_KP<=
    =>RATE_KP   
      RATE_KI   
      RATE_KD   
      RATE_YAW_P
      ACRO_P    
    
      VALUE > 4.50     
    */
    checkOSD_Tuning();  
    checkOSD_Logging();
    
    if( osd_state_screen & MASK_OSD_TUNING_MODE ) {
        writeTuningPanels();
    } else if ( osd_state_screen & MASK_OSD_LOGGING_MODE ) {
        writeLoggingPanels();
    } else { //if( osd_state_screen & MASK_OSD_NORMAL_MODE ) {
      //Ask for current value of the CH6 tuning parameter, 2 times per second
      if ( (osd_state_screen & MASK_OSD_DISPLAY_CH6_VALUE) && tuning_item_selected > 0 && (localtime - last_time_ask_tuning_value) > 500) {
        last_time_ask_tuning_value = localtime;
        //Ask for current value of the new item
        mavlink_msg_param_request_read_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNING_PARAM_NAME_1[tuning_item_selected], -1);
      }
    
    
    //If no OSD tuning, then normal OSD display
    //if( !osd_tuning_activated ) {
        //osd.clear();
        //Testing bits from 8 bit register A 
        //if(ISa(Cen_BIT)) panCenter(panCenter_XY[0], panCenter_XY[1]);   //4x2
        if(ISa(Pit_BIT)) panPitch(panPitch_XY[0], panPitch_XY[1]); //5x1
        if(ISa(Rol_BIT)) panRoll(panRoll_XY[0], panRoll_XY[1]); //5x1
        if(ISa(BatA_BIT)) panBatt_A(panBatt_A_XY[0], panBatt_A_XY[1]); //7x1
        
        
    //  if(ISa(BatB_BIT)) panBatt_B(panBatt_B_XY[0], panBatt_B_XY[1]); //7x1
    	/*if(ISa(Climb_BIT)) {
    	    if(localtime - local_climb_time > 1000 ) {
                panClimb(panClimb_XY[0], panClimb_XY[1], localtime - local_climb_time); //7x1 //DMD
                local_climb_time = localtime;
            }
        }*/
        
        if(ISa(GPSats_BIT)) panGPSats(panGPSats_XY[0], panGPSats_XY[1]); //5x1
        if(ISa(GPL_BIT)) panGPL(panGPL_XY[0], panGPL_XY[1]); //2x1
        if(ISa(GPS_BIT)) panGPS(panGPS_XY[0], panGPS_XY[1]); //12x3
      
        //Testing bits from 8 bit register B
        if(ISb(Rose_BIT)) panRose(panRose_XY[0], panRose_XY[1]);        //13x3
        if(ISb(Head_BIT)) panHeading(panHeading_XY[0], panHeading_XY[1]); //13x3
        if(ISb(MavB_BIT)) panMavBeat(panMavBeat_XY[0], panMavBeat_XY[1]); //13x3
    
        if(osd_got_home == 1){
          if(ISb(HDis_BIT)) panHomeDis(panHomeDis_XY[0], panHomeDis_XY[1]); //13x3
          if(ISb(HDir_BIT)) panHomeDir(panHomeDir_XY[0], panHomeDir_XY[1]); //13x3
        }
        //DMD pour afficher la conso. en Ampere
        if(ISb(WDir_BIT)) panCurrentAmpere(panWPDir_XY[0], panWPDir_XY[1]); //??x??
        //DMD pour afficher la valeur courante du parametre en cours d'optimisatino via CH6
        if(ISb(WDis_BIT) && (osd_state_screen & MASK_OSD_DISPLAY_CH6_VALUE)) panTuningValue(panWPDis_XY[0], panWPDis_XY[1]); //??x??
        //DMD Rssi
        if(ISb(RSSI_BIT)) panRSSI(panRSSI_XY[0], panRSSI_XY[1]); //??x??
    
        //Testing bits from 8 bit register C 
        //if(osd_got_home == 1){
          if(ISc(Alt_BIT)) panAlt(panAlt_XY[0], panAlt_XY[1]); //
          if(ISc(Vel_BIT)) panVel(panVel_XY[0], panVel_XY[1]); //
        //}
        if(ISc(Thr_BIT)) panThr(panThr_XY[0], panThr_XY[1]); //
        if(ISc(FMod_BIT)) panFlightMode(panFMod_XY[0], panFMod_XY[1]);  //
        //if(ISc(Hor_BIT)) panHorizon(panHorizon_XY[0], panHorizon_XY[1]); //14x5
        
        //DMD Temp
        if(ISc(Temp_BIT)) panTemp(panTemp_XY[0], panTemp_XY[1]); //
        
        //DMD Current Bat A
        if(ISc(CurA_BIT)) panCurrentBatA(panCur_A_XY[0], panCur_A_XY[1]); //
    }
  } else{
    osd.clear();
    waitingMAVBeats = 1;
    // Display our logo and wait... 
    panWaitMAVBeats(5,10); //Waiting for MAVBeats...
  }
// OSD debug for development (Shown on top-middle panels) 
#ifdef membug
     osd.setPanel(13,4);
     osd.openPanel();
     osd.printf("%i",freeMem()); 
     osd.closePanel();
#endif
}

/******* PANELS - DEFINITION *******/


/* **************************************************************** */
// Panel  : panAlt
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panAlt(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf("%c%5.0f%c",0x85, (double)(osd_alt - osd_home_alt), 0x8D);
  //osd.printf("%c%5.0f%c",0x85, (double)(osd_alt), 0x8D);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panVel
// Needs  : X, Y locations
// Output : Velocity in km/h value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panVel(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  //osd.printf("%c%3.0f%c",0x86,(double)osd_groundspeed,0x88); //Modif DMD
  osd.printf("%c%3.0f%c",0x86,(double)(osd_groundspeed * 3.6),0x81);
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

//DMD Rssi
/* **************************************************************** */
// Panel  : panRSSI
// Needs  : X, Y locations
// Output : RADIO_RSSI value from MAVlink with symbols
// Size   : 1 x 5  (rows x chars)
// Staus  : Test of RSSI by George

void panRSSI(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  if( !rssi_signal_from_apm ) {
    osd_rssi = rssiFilter.getPercentCurvedSignal();
  }
  osd.printf("%c%3i%c",0xE1,osd_rssi,0x25);
  osd.closePanel();
  
  //Display RSSI signal bar
  
  osd.setPanel(first_col -1, first_line + 1);
  osd.openPanel();
  int rssi = osd_rssi + 4; //For math computing, just divide by 20, if 
  rssi = min(rssi, 104); //From 100->96 is full, 95 to 91, 
  
  osd.printf("%c",0xED); //Left corner
  for(int i=0; i<5; i++) {
    osd.printf("%c", getSignalImage(rssi, (i*4)));
  }
  osd.printf("%c",0xF3); //Right corner   
        

 /*       
 osd.printf("%c%c%c%c%c%c%c",0xED,
        getSignalImage(rssi, 0), 
        getSignalImage(rssi, 4),
        getSignalImage(rssi, 8),
        getSignalImage(rssi, 12),
        getSignalImage(rssi, 16),0xF3);
  */      
        
  osd.closePanel();
}
//Fin RSSI

//Compute image from RSSI signal value
char getSignalImage(int rssi, int scope) {
  int base = rssi / 5 - scope;
  
  //Result should be between 0 and 4
  base = max(base, 0);
  base = min(base, 4);
  
  //Full bar image is 0xEE
  //Empty bar image is 0xF2 
  //Image should be 0xEE (Full), 0xEF (full minus 3 pos), 0xF0 (full minus 6 pos), 0xF1 (full minus 9 pos) and 0xF2 (Empty)
  char image = 0xEE + abs(base - 4);
  return image;
}

//DMD
/* **************************************************************** */
// Panel  : panClimb
// Needs  : X, Y locations
// Output : Climb value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

/*
void panClimb(int first_col, int first_line, uint32_t elapsed_time)
{
    osd.setPanel(first_col, first_line);
    osd.openPanel();
   
    climb_average.readAverage(elapsed_time); //Compute data
    osd.printf("%c%3.0f%c%c", 0x85, (double)climb_average.readClimbSpeed(), 0x81, climb_average.readOrientation());
    
    /*if( climb_rate < 0 ) {
      osd.printf("%c%3.0f%c%c", 0x85, (double)climb_rate, 0x81, 0xCF);
    } else {
      osd.printf("%c%3.0f%c%c", 0x85, (double)climb_rate, 0x81, 0xBF);
    } */
    //osd.closePanel();
//}

//DMD
/* **************************************************************** */
// Panel  : panTemp
// Needs  : X, Y locations
// Output : Temperature value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panTemp(int first_col, int first_line)
{
    osd.setPanel(first_col, first_line);
    osd.openPanel();
    osd.printf("%2.1f%c%c", ((float)temp) / 100, 0xB0, 0x63);
    osd.closePanel();
}

//DMD
/* **************************************************************** */
// Panel  : panTuningValue
// Needs  : X, Y locations
// Output : Current tuning value 
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panTuningValue(int first_col, int first_line)
{
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  
  osd.printf("%c%c%1.3f%c ",0xE0, 0x5B, current_tuning_value, 0x5D); //Tuning value
  osd.closePanel();
}

//DMD
/* **************************************************************** */
// Panel  : panCurrentAmpere
// Needs  : X, Y locations
// Output : Current value and remaining value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panCurrentAmpere(int first_col, int first_line)
{
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  
  osd.printf("%4.1f%c", (float(osd_curr_A) * .01), 0x8F);
  osd.closePanel();
}


//DMD
/* **************************************************************** */
// Panel  : panCurrentBatA
// Needs  : X, Y locations
// Output : Current value and remaining value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panCurrentBatA(int first_col, int first_line)
{
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  
  osd.printf("%c%3i%c", osd_battery_pic_A, (int)osd_battery_remaining_A , 0x25);
  //osd.printf("%4i%c%c", (int)osd_curr_A , 0x82, osd_battery_pic_A);
  //osd.printf("%4i%c%c", (int)(osd_curr_A * 0.02778f) , 0x82, osd_battery_pic_A);
  //osd.printf("%4i%c%c", (int)(osd_curr_A * 0.01 * 0.02778) , 0x82, osd_battery_pic_A);
  //osd.printf("%3i%c%c", osd_battery_remaining_A, 0x25, osd_battery_pic_A);
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
  osd.printf("%c%5.0f%c", 0x1F, (double)osd_home_distance, 0x8D);
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panCenter
// Needs  : X, Y locations
// Output : 2 row croshair symbol created by 2 x 4 chars
// Size   : 2 x 4  (rows x chars)
// Staus  : done
/*
void panCenter(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf_P(PSTR("\x05\x03\x04\x05|\x15\x13\x14\x15"));
  osd.closePanel();
}
*/

/* **************************************************************** */
// Panel  : panHorizon
// Needs  : X, Y locations
// Output : 12 x 4 Horizon line surrounded by 2 cols (left/right rules)
// Size   : 14 x 4  (rows x chars)
// Staus  : done
/*
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
*/

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
  //osd.printf(" %c%5.2f%c", 0xE2, (double)osd_vbat_A, 0x8E); //DMD
  //osd.printf(" %c%5.2f%c%c", 0xE2, (double)osd_vbat_A, 0x8E, osd_battery_pic_A); //DMD ajout Battery
  
  // Ajout DMD
  osd.printf("%5.2f%c|", (double)osd_vbat_A, 0x8E); 
  uint16_t seconds = (uint16_t)(flight_time / 1000) % 60;
  uint16_t minutes = (uint16_t)(flight_time / 1000 - seconds) / 60; 

  //osd.printf(" ");
  if( minutes < 10 ) {
      osd.printf("0%i", minutes);
  } else {
      osd.printf("%i", minutes);
  }
  if( seconds < 10 ) {
      osd.printf(":0%i", seconds);
  } else {
      osd.printf(":%i", seconds);
  }
  osd.printf("%c",0xfb);
  // Fin DMD
  
  osd.closePanel();
}

//------------------ Panel: Startup ArduCam OSD LOGO -------------------------------

void panLogo(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  osd.printf_P(PSTR("\x20\x20\x20\x20\xba\xbb\xbc\xbd\xbe|\x20\x20\x20\x20\xca\xcb\xcc\xcd\xce|ArduCam OSD"));
  osd.closePanel();
}

//------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

void panWaitMAVBeats(int first_col, int first_line){
  panLogo(10,5);
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
      osd.printf_P(PSTR("\x10")); //\x20
      break;
    case 1: 
      osd.printf_P(PSTR("\x10")); //\x20
      break;
    case 2: 
      osd.printf_P(PSTR("\x11"));//If not APM, x01 would show 2D fix //\x20
      break;
    case 3: 
      osd.printf_P(PSTR("\x11"));//If not APM, x02 would show 3D fix //\x20
      break;
  }
    
  //DMD
  if( osd_fix_type > 2 && osd_alt_cnt >= 25 ) {
    osd.printf_P(PSTR("\x02"));
  } else {
    osd.printf_P(PSTR("\x20"));
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
    //DMD Hdop
  osd.printf("|%c%5i", 0x12, osd_eph);
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
  //osd_heading  = osd_yaw;
  //if(osd_yaw < 0) osd_heading = 360 + osd_yaw;
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
  osd.printf_P(PSTR("Booting up...")); 
  //osd.printf_P(PSTR("Booting up:\xed\xf2\xf2\xf2\xf2\xf2\xf2\xf2\xf3")); 
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
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  showArrow();
  osd.closePanel();
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
  showArrow();
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
  //DMD ajout motorstatus
  uint8_t motorstatus = (armed) ? 0x17 : 0x16;
#ifndef MAVLINK10
  //if(apm_mav_type == 2){//MAV_TYPE_QUADROTOR ArduCopter MultiRotor or ArduCopter Heli
    if(osd_mode == 100) osd.printf_P(PSTR("\xE0""stab%c"),motorstatus);//Stabilize
    if(osd_mode == 101) osd.printf_P(PSTR("\xE0""acro%c"),motorstatus);//Acrobatic
    if(osd_mode == 102) osd.printf_P(PSTR("\xE0""alth%c"),motorstatus);//Alt Hold
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_WAYPOINT) osd.printf_P(PSTR("\xE0""auto%c"),motorstatus);//Auto
    if(osd_mode == MAV_MODE_GUIDED && osd_nav_mode == MAV_NAV_WAYPOINT) osd.printf_P(PSTR("\xE0""guid%c"),motorstatus);//Guided
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_HOLD) osd.printf_P(PSTR("\xE0""loit%c"),motorstatus);//Loiter
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_RETURNING) osd.printf_P(PSTR("\xE0""retl%c"),motorstatus);//Return to Launch
    if(osd_mode == 107) osd.printf_P(PSTR("\xE0""circ%c"),motorstatus); // Circle
    if(osd_mode == 108) osd.printf_P(PSTR("\xE0""posi%c"),motorstatus); // Position
    if(osd_mode == 109) osd.printf_P(PSTR("\xE0""land%c"),motorstatus); // Land
    if(osd_mode == 110) osd.printf_P(PSTR("\xE0""oflo%c"),motorstatus); // OF_Loiter
  /*}
  else if(apm_mav_type == 1){//MAV_TYPE_FIXED_WING ArduPlane
    if(osd_mode == MAV_MODE_TEST1 && osd_nav_mode == MAV_NAV_VECTOR) osd.printf_P(PSTR("\xE0""stab%c"),motorstatus);//Stabilize
    if(osd_mode == MAV_MODE_MANUAL && osd_nav_mode == MAV_NAV_VECTOR) osd.printf_P(PSTR("\xE0""manu%c"),motorstatus);//Manual
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_LOITER) osd.printf_P(PSTR("\xE0""loit%c"),motorstatus);//Loiter
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_RETURNING) osd.printf_P(PSTR("\xE0""retl%c"),motorstatus);//Return to Launch
    if(osd_mode == MAV_MODE_TEST2 && osd_nav_mode == 1) osd.printf_P(PSTR("\xE0""fbwa%c"),motorstatus);//FLY_BY_WIRE_A
    if(osd_mode == MAV_MODE_TEST2 && osd_nav_mode == 2) osd.printf_P(PSTR("\xE0""fbwb%c"),motorstatus);//FLY_BY_WIRE_B
    if(osd_mode == MAV_MODE_GUIDED) osd.printf_P(PSTR("\xE0""guid%c"),motorstatus);//GUIDED
    if(osd_mode == MAV_MODE_AUTO && osd_nav_mode == MAV_NAV_WAYPOINT) osd.printf_P(PSTR("\xE0""auto%c"),motorstatus);//AUTO
    if(osd_mode == MAV_MODE_TEST3) osd.printf_P(PSTR("\xE0""circ%c"),motorstatus);//CIRCLE
  }*/
#else 
  //if(apm_mav_type == 2){//ArduCopter MultiRotor or ArduCopter Heli
    if(osd_mode == 0) osd.printf_P(PSTR("\xE0""stab%c"),motorstatus);//Stabilize
    if(osd_mode == 1) osd.printf_P(PSTR("\xE0""acro%c"),motorstatus);//Acrobatic
    if(osd_mode == 2) osd.printf_P(PSTR("\xE0""alth%c"),motorstatus);//Alt Hold
    if(osd_mode == 3) osd.printf_P(PSTR("\xE0""auto%c"),motorstatus);//Auto
    if(osd_mode == 4) osd.printf_P(PSTR("\xE0""guid%c"),motorstatus);//Guided
    if(osd_mode == 5) osd.printf_P(PSTR("\xE0""loit%c"),motorstatus);//Loiter
    if(osd_mode == 6) osd.printf_P(PSTR("\xE0""retl%c"),motorstatus);//Return to Launch
    if(osd_mode == 7) osd.printf_P(PSTR("\xE0""circ%c"),motorstatus); // Circle
    if(osd_mode == 8) osd.printf_P(PSTR("\xE0""posi%c"),motorstatus); // Position
    if(osd_mode == 9) osd.printf_P(PSTR("\xE0""land%c"),motorstatus); // Land
    if(osd_mode == 10) osd.printf_P(PSTR("\xE0""oflo%c"),motorstatus); // OF_Loiter
  /*}
  else if(apm_mav_type == 1){//ArduPlane
    if(osd_mode == 2 ) osd.printf_P(PSTR("\xE0""stab%c"),motorstatus);//Stabilize
    if(osd_mode == 0) osd.printf_P(PSTR("\xE0""manu%c"),motorstatus);//Manual
    if(osd_mode == 12) osd.printf_P(PSTR("\xE0""loit%c"),motorstatus);//Loiter
    if(osd_mode == 11 ) osd.printf_P(PSTR("\xE0""retl%c"),motorstatus);//Return to Launch
    if(osd_mode == 5 ) osd.printf_P(PSTR("\xE0""fbwa%c"),motorstatus);//FLY_BY_WIRE_A
    if(osd_mode == 6 ) osd.printf_P(PSTR("\xE0""fbwb%c"),motorstatus);//FLY_BY_WIRE_B
    if(osd_mode == 15) osd.printf_P(PSTR("\xE0""guid%c"),motorstatus);//GUIDED
    if(osd_mode == 10 ) osd.printf_P(PSTR("\xE0""auto%c"),motorstatus);//AUTO
    if(osd_mode == 1) osd.printf_P(PSTR("\xE0""circ%c"),motorstatus);//CIRCLE
  }*/
#endif

  osd.closePanel();
}


// ---------------- EXTRA FUNCTIONS ----------------------
// Show those fancy 2 char arrows
void showArrow() {  
   switch(osd_home_direction) {
    case 0: 
      osd.printf_P(PSTR("\x90\x91"));
      break;
    case 1: 
      osd.printf_P(PSTR("\x90\x91"));
      break;
    case 2: 
      osd.printf_P(PSTR("\x92\x93"));
      break;
    case 3: 
      osd.printf_P(PSTR("\x94\x95"));
      break;
    case 4: 
      osd.printf_P(PSTR("\x96\x97"));
      break;
    case 5: 
      osd.printf_P(PSTR("\x98\x99"));
      break;
    case 6: 
      osd.printf_P(PSTR("\x9A\x9B"));
      break;
    case 7: 
      osd.printf_P(PSTR("\x9C\x9D"));
      break;
    case 8: 
      osd.printf_P(PSTR("\x9E\x9F"));
      break;
    case 9: 
      osd.printf_P(PSTR("\xA0\xA1"));
      break;
    case 10: 
      osd.printf_P(PSTR("\xA2\xA3"));
      break;
    case 11: 
      osd.printf_P(PSTR("\xA4\xA5"));
      break;
    case 12: 
      osd.printf_P(PSTR("\xA6\xA7"));
      break;
    case 13: 
      osd.printf_P(PSTR("\xA8\xA9"));
      break;
    case 14: 
      osd.printf_P(PSTR("\xAA\xAB"));
      break;
    case 15: 
      osd.printf_P(PSTR("\xAC\xAD"));
      break;
    case 16: 
      osd.printf_P(PSTR("\xAE\xAF"));
      break;
  }  
}

// Calculate and shows Artificial Horizon
/*void showHorizon(int start_col, int start_row) { 

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
}*/
