/******* STARTUP PANEL *******/

void startPanels(){
    osd.clear();
    panLogo(5,5); // Display our logo  
    do_converts(); // load the unit conversion preferences
}

/******* PANELS - POSITION *******/

void writePanels(){ 
    //  if (osd_off == 1){
    //  if (osd_set != 2){
    //    osd.clear();}
    //  }



    if(millis() < (lastMAVBeat + 2000)){
      if(ISd(0,Off_BIT)) panOff(); // This must be first so you can always toggle
      if (osd_set == 0) { // setup panel is called in the else at the end
        if(ISd(panel,Warn_BIT)) panWarn(panWarn_XY[0], panWarn_XY[1]); // this must be here so warnings are always checked
        if (osd_on > 0)
        {
          //Testing bits from 8 bit register A 
          if(ISa(panel,Cen_BIT)) panCenter(panCenter_XY[0][panel], panCenter_XY[1][panel]);   //4x2
          if(ISa(panel,Pit_BIT)) panPitch(panPitch_XY[0][panel], panPitch_XY[1][panel]); //5x1
          if(ISa(panel,Rol_BIT)) panRoll(panRoll_XY[0][panel], panRoll_XY[1][panel]); //5x1
          if(ISa(panel,BatA_BIT)) panBatt_A(panBatt_A_XY[0][panel], panBatt_A_XY[1][panel]); //7x1
          //  if(ISa(panel,BatB_BIT)) panBatt_B(panBatt_B_XY[0], panBatt_B_XY[1][panel]); //7x1
          if(ISa(panel,GPSats_BIT)) panGPSats(panGPSats_XY[0][panel], panGPSats_XY[1][panel]); //5x1
          if(ISa(panel,GPL_BIT)) panGPL(panGPL_XY[0][panel], panGPL_XY[1][panel]); //2x1
          if(ISa(panel,GPS_BIT)) panGPS(panGPS_XY[0][panel], panGPS_XY[1][panel]); //12x3
          if(ISa(panel,Bp_BIT)) panBatteryPercent(panBatteryPercent_XY[0][panel], panBatteryPercent_XY[1][panel]); //
  
          //Testing bits from 8 bit register B
          if(ISb(panel,Rose_BIT)) panRose(panRose_XY[0][panel], panRose_XY[1][panel]);        //13x3
          if(ISb(panel,Head_BIT)) panHeading(panHeading_XY[0][panel], panHeading_XY[1][panel]); //13x3
          if(ISb(panel,MavB_BIT)) panMavBeat(panMavBeat_XY[0][panel], panMavBeat_XY[1][panel]); //13x3
  
          if(osd_got_home == 1){
              if(ISb(panel,HDis_BIT)) panHomeDis(panHomeDis_XY[0][panel], panHomeDis_XY[1][panel]); //13x3
              if(ISb(panel,HDir_BIT)) panHomeDir(panHomeDir_XY[0][panel], panHomeDir_XY[1][panel]); //13x3
          }
          
         if(ISb(panel,Time_BIT)) panTime(panTime_XY[0][panel], panTime_XY[1][panel]);
          //  if(ISb(WDir_BIT)) panWayPDir(panWayPDir_XY[0], panWayPDir_XY[1]); //??x??
          //  if(ISb(WDis_BIT)) panWayPDis(panWayPDis_XY[0], panWayPDis_XY[1]); //??x??
          
  
          //Testing bits from 8 bit register C 
          //if(osd_got_home == 1){
          if(ISc(panel,Alt_BIT)) panAlt(panAlt_XY[0][panel], panAlt_XY[1][panel]); //
          if(ISc(panel,Halt_BIT)) panHomeAlt(panHomeAlt_XY[0][panel], panHomeAlt_XY[1][panel]); //
          if(ISc(panel,Vel_BIT)) panVel(panVel_XY[0][panel], panVel_XY[1][panel]); //
          if(ISc(panel,As_BIT)) panAirSpeed(panAirSpeed_XY[0][panel], panAirSpeed_XY[1][panel]); //
  
          //}
          if(ISc(panel,Thr_BIT)) panThr(panThr_XY[0][panel], panThr_XY[1][panel]); //
          if(ISc(panel,FMod_BIT)) panFlightMode(panFMod_XY[0][panel], panFMod_XY[1][panel]);  //
          if(ISc(panel,Hor_BIT)) panHorizon(panHorizon_XY[0][panel], panHorizon_XY[1][panel]); //14x5
          if(ISc(panel,CurA_BIT)) panCur_A(panCur_A_XY[0][panel], panCur_A_XY[1][panel]);
  
          //Testing bits from 8 bit register D 
          //if(ISd(Off_BIT)) panOff(panOff_XY[0], panOff_XY[1]);
          if(ISd(panel,WindS_BIT)) panWindSpeed(panWindSpeed_XY[0][panel], panWindSpeed_XY[1][panel]);
          if(ISd(panel,Climb_BIT)) panClimb(panClimb_XY[0][panel], panClimb_XY[1][panel]);
          //    if(ISd(Tune_BIT)) panTune(panTune_XY[0][panel], panTune_XY[1][panel]);
          if(ISd(panel,RSSI_BIT)) panRSSI(panRSSI_XY[0][panel], panRSSI_XY[1][panel]); //??x??
        }
      } else { // if (osd_set == 1)
        panSetup();
      }
    } else { // if no mavlink update for 2 secs
    
    // this could be replaced with a No Mavlink warning so the last seen values still show
    
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
// Panel  : panRSSI
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done


void panRSSI(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  //rssical = EEPROM.read(OSD_HIGH_ADDR);
  //rssipersent = EEPROM.read(OSD_LOW_ADDR);
  osd_rssi = rssi;
  if (osd_rssi > rssical){
    osd_rssi = rssical;
  }
  if (osd_rssi < rssipersent){
    osd_rssi = rssipersent;
  }
  osd_rssi = osd_rssi - (rssical - rssipersent);
  osd_rssi = (osd_rssi * 100)/(rssical - rssipersent);
  if(osd_rssi >100){
    osd_rssi = 100;
  }
  osd.printf("%c%3i%c", 0xE1, osd_rssi, 0x25); 
  osd.closePanel();
}

/* **************************************************************** */
// Panel  : panSetup
// Needs  : Nothing, uses whole screen
// Output : The settings menu
// Size   : 3 x ?? (rows x chars)
// Staus  : done

void panSetup(){
  
  if (millis() > text_timer){
    text_timer = millis() + 500;

    osd.clear();
    osd.setPanel(5, 7);
    osd.openPanel();

    if (chan1_raw_middle == 0 && chan2_raw_middle == 0){
        chan1_raw_middle = chan1_raw;
        chan2_raw_middle = chan2_raw;
    }
    
    if ((chan2_raw - 100) > chan2_raw_middle ) setup_menu = setup_menu + 1;
    if ((chan2_raw + 100) < chan2_raw_middle ) setup_menu = setup_menu - 1;
    if (setup_menu < 0) setup_menu = 0;
    if (setup_menu > 3) setup_menu = 3;

    switch (setup_menu){
    case 0:
      {
        osd.printf_P(PSTR("    Overspeed    "));
        osd.printf("%3.0i%c", overspeed, spe);
        overspeed = change_val(overspeed, overspeed_ADDR);
        break;
      }
    case 1:
      {
        osd.printf_P(PSTR("   Stall Speed   "));
        osd.printf("%3.0i%c", stall , spe);
        //overwritedisplay();
        stall = change_val(stall, stall_ADDR);
        break;
      }
    case 2:
      {
        osd.printf_P(PSTR("Battery warning "));
        osd.printf("%3.1f%c", float(battv)/10.0 , 0x76, 0x20);
        battv = change_val(battv, battv_ADDR);
        break;
      }
        //      case 4:
        //        osd.printf_P(PSTR("Battery warning "));
        //        osd.printf("%3.0i%c", battp , 0x25);
        //        if ((chan1_raw - 100) > chan1_raw_middle ){
        //        battp = battp - 1;}
        //        if ((chan1_raw + 100) < chan1_raw_middle ){
        //        battp = battp + 1;} 
        //        EEPROM.write(208, battp);
        //        break;
   }
 }
 osd.closePanel();
}

int change_val(int value, int address)
{
  uint8_t value_old = value;
  if (chan1_raw > chan1_raw_middle + 100) value = value - 1;
  if (chan1_raw  < chan1_raw_middle - 100) value = value + 1;
  //if (chan1_raw > chan1_raw_middle + 200) value = value - 4;
  //if (chan1_raw < chan1_raw_middle - 200) value = value + 4;
  if(value != value_old && setup_menu ) EEPROM.write(address, value);
  return value;
}

/* **************************************************************** */
// Panel  : pan wind speed
// Needs  : X, Y locations
// Output : Wind direction symbol (arrow) and velocity
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panWindSpeed(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();

    osd_wind_arrow_rotate_int = round((osd_winddirection - osd_heading)/360.0 * 16.0); //Convert to int 0-16 
    if(osd_wind_arrow_rotate_int < 0 ) osd_wind_arrow_rotate_int += 16; //normalize
    showWindOSD(); //print data to OSD

    osd.closePanel();
}

/* **************************************************************** */
// Panel  : panOff
// Needs  : X, Y locations
// Output : OSD off
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

//void panOff(int first_col, int first_line){
void panOff(){
    //osd.setPanel(first_col, first_line);
    //osd.openPanel();

    if (ch_off == 5){
        if (((apm_mav_type == 1) && ((osd_mode != 11) && (osd_mode != 1))) || ((apm_mav_type == 2) && ((osd_mode != 6) && (osd_mode != 7)))){
            if (osd_off_switch != osd_mode){ 
                osd_off_switch = osd_mode;
                osd_switch_time = millis();

                if (osd_off_switch == osd_switch_last){
                    if (osd_on == 0){
                        osd_on = 1;
                        panel = 0;
                        osd_set = 0;
                        osd.clear();

                    }
                    else if (osd_on == 1){
                        osd_on = 2;
                        panel = 1;
                        osd.clear(); 
                    }

                    else if (osd_on == 2){
                        osd_on = 0;
                        osd.clear();
                        if (millis() <= 60000){
                            osd_set = 1; 
                        }
                    }
                }
            }
            if ((millis() - osd_switch_time) > 2000){
                osd_switch_last = osd_mode;
            }
        }
    }
    else {

        switch (ch_off){
        case 6:
            {
                ch_raw = osd_chan6_raw;
                break;
            }
        case 7:
            {
                ch_raw = osd_chan7_raw;
                break;
            }
        case 8:
            {
                ch_raw = osd_chan8_raw;
                break;
            }

        }

        if (ch_raw > 1500) {
            if (millis() <= 60000){
                osd_on = 0;
                osd_set = 1;
            }
            else if (osd_set != 1 && warning != 1){
                osd_on = 0;
                osd.clear();
            }
        }
        if (ch_raw < 1500 && setup_menu != 6 && osd_on != 1) {
            osd_on = 1;
            osd_set = 0;
            osd.clear();
        }    
    }
    //osd.closePanel();
}

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
    osd.printf("%c%5.2f%c", 0xE4, (float(osd_curr_A) * .01), 0x8F);
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
// Panel  : panWarn
// Needs  : X, Y locations
// Output : Airspeed value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panWarn(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();

      if (millis() > text_timer){ // if the text has been shown for a while
        if (warning_type != 0) {
          last_warning = warning_type; // save the warning type for cycling
          warning_type = 0; // blank the text
          if ((millis() - 3000) > text_timer) warning = 0;
        } else {
          warning = 1;
          int x = last_warning; // start the warning checks where we left it last time
          while (warning_type == 0) { // cycle through the warning checks
            x++;
            if (x > 6) x = 1; // change the 6 if you add more warning types
            switch(x) {
              case 1:
                if ((osd_fix_type) < 2) warning_type = 1; // No GPS Fix
                break;
              case 2:
                if (osd_airspeed * converts < stall && osd_airspeed > 1.12) warning_type = 2;
                break;
              case 3:
                if ((osd_airspeed * converts) > overspeed) warning_type = 3;
                break;
              case 4:
                if (osd_vbat_A < float(battv)/10.0) warning_type = 4;
                break;
              case 5:
                if (osd_battery_remaining_A < 10) warning_type = 4;
                break;
            }
     
            if (x == last_warning) break; // if we've done a full cycle then there mustn't be any warnings
          }
	}

        text_timer = millis() + 1000; // blink every 1 secs
        if (warning_type > 0) osd_on = 1; // turn OSD on if there is a warning
         
        switch(warning_type){
          case 0:
            osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20"));
            break;   
          case 1:  
            osd.printf_P(PSTR("\x20\x4E\x6F\x20\x47\x50\x53\x20\x66\x69\x78\x21"));
            break;
          case 2:
            osd.printf_P(PSTR("\x20\x20\x20\x53\x74\x61\x6c\x6c\x21\x20\x20\x20"));
            break;
          case 3:
            osd.printf_P(PSTR("\x20\x4f\x76\x65\x72\x53\x70\x65\x65\x64\x21\x20"));
            break;
          case 4:
            osd.printf_P(PSTR("\x42\x61\x74\x74\x65\x72\x79\x20\x4c\x6f\x77\x21"));
            break;
          }
       }
   
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
    osd.printf("%c%2i%c%02i", 0xB3,((int)start_Time/60)%60,0x3A,(int)start_Time%60);
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
    if(osd_battery_remaining_A > 100){
        osd.printf(" %c%5.2f%c", 0xE2, (double)osd_vbat_A, 0x8E);
    else osd.printf("%c%5.2f%c%c", 0xE2, (double)osd_vbat_A, 0x8E, osd_battery_pic_A);
    */
    osd.printf("%c%5.2f%c", 0xE2, (double)osd_vbat_A, 0x8E);
    osd.closePanel();
}

//------------------ Panel: Startup ArduCam OSD LOGO -------------------------------

void panLogo(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();
    osd.printf_P(PSTR("\x20\x20\x20\x20\x20\xba\xbb\xbc\xbd\xbe|\x20\x20\x20\x20\x20\xca\xcb\xcc\xcd\xce|MinimOSD Extra|1.29.3 Pre-Release|r86"));
    osd.closePanel();
}

//------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

void panWaitMAVBeats(int first_col, int first_line){
    panLogo(5,5);
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
        osd.printf_P(PSTR("\x10\x20"));
        break;
    case 1: 
        osd.printf_P(PSTR("\x10\x20"));
        break;
    case 2: 
        osd.printf_P(PSTR("\x11\x20"));//If not APM, x01 would show 2D fix
        break;
    case 3: 
        osd.printf_P(PSTR("\x11\x20"));//If not APM, x02 would show 3D fix
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

// Show 2 char arrows
void showWindOSD() // Arrow direction pointing WIND (0-16 to CW loop) 
{        
    char wind_arrow_set1;
    char wind_arrow_set2;   
    switch(osd_wind_arrow_rotate_int) {
    case 0: 
        wind_arrow_set1 = 0x90;
        wind_arrow_set2 = 0x91;
        break;
    case 1: 
        wind_arrow_set1 = 0x92;
        wind_arrow_set2 = 0x93;
        break;
    case 2: 
        wind_arrow_set1 = 0x94;
        wind_arrow_set2 = 0x95;
        break;
    case 3: 
        wind_arrow_set1 = 0x96;
        wind_arrow_set2 = 0x97;
        break;
    case 4: 
        wind_arrow_set1 = 0x98;
        wind_arrow_set2 = 0x99;
        break;
    case 5: 
        wind_arrow_set1 = 0x9A;
        wind_arrow_set2 = 0x9B;
        break;
    case 6: 
        wind_arrow_set1 = 0x9C;
        wind_arrow_set2 = 0x9D;
        break;
    case 7: 
        wind_arrow_set1 = 0x9E;
        wind_arrow_set2 = 0x9F;
        break;
    case 8: 
        wind_arrow_set1 = 0xA0;
        wind_arrow_set2 = 0xA1;
        break;
    case 9: 
        wind_arrow_set1 = 0xA2;
        wind_arrow_set2 = 0xA3;
        break;
    case 10: 
        wind_arrow_set1 = 0xA4;
        wind_arrow_set2 = 0xA5;
        break;
    case 11: 
        wind_arrow_set1 = 0xA6;
        wind_arrow_set2 = 0xA7;
        break;
    case 12: 
        wind_arrow_set1 = 0xA8;
        wind_arrow_set2 = 0xA9;
        break;
    case 13: 
        wind_arrow_set1 = 0xAA;
        wind_arrow_set2 = 0xAB;
        break;
    case 14: 
        wind_arrow_set1 = 0xAC;
        wind_arrow_set2 = 0xAd;
        break;
    case 15: 
        wind_arrow_set1 = 0xAE;
        wind_arrow_set2 = 0xAF;
        break;
    case 16:
        wind_arrow_set1 = 0x90;
        wind_arrow_set2 = 0x91;
        break;
    }  
    if (wind == 1){
        osd.printf("%c%3.0f%c|%c%c",0xFC,(double)(osd_windspeed * converts),spe, wind_arrow_set1, wind_arrow_set2);
    }
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

void do_converts()
{
  if (EEPROM.read(measure_ADDR) == 0) {
    converts = 3.6;
    converth = 1;
    spe = 0x81;
    high = 0x8D;
  } else {
    converts = 2.23;
    converth = 3.28;
    spe = 0xfb;
    high = 0x66;
  }
}


