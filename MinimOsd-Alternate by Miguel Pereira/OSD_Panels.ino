/******* STARTUP PANEL *******/

void startPanels(){
//    osd.clear();
    //osd_clear = 3;
    panLogo(); // Display our logo  
    do_converts(); // load the unit conversion preferences
}

//------------------ Panel: Startup ArduCam OSD LOGO -------------------------------

void panLogo(){
    osd.setPanel(5, 5);
    osd.openPanel();
    osd.printf_P(PSTR("\xba\xbb\xbc\xbd\xbe|\xca\xcb\xcc\xcd\xce|MinimOSD Extra Copter|Pre-Release 2.1.5 r491"));
    osd.closePanel();
}


/******* PANELS - POSITION *******/

void writePanels(){ 

  if(millis() < (lastMAVBeat + 2200)){
if(ISd(panel,Warn_BIT)) panWarn(panWarn_XY[0][panel], panWarn_XY[1][panel]); // this must be here so warnings are always checked
   if ((osd_alt - osd_home_alt) <= 10 && osd_groundspeed <= 1 && osd_throttle <= 1 && takeofftime == 1 && osd_home_distance <= 100){ 
       if (osd_clear == 0){
         osd.clear(); 
         osd_clear = 1;          
       }
      panFdata(); 
        }else{ 
          if (osd_clear == 1){
         osd.clear(); 
         osd_clear = 0;          
       }
      if(ch_toggle > 3) panOff(); // This must be first so you can always toggle
            if(panel != npanels)
            {
                
                //Testing bits from 8 bit register A 
 //               if(ISa(panel,Cen_BIT)) panCenter(panCenter_XY[0][panel], panCenter_XY[1][panel]);   //4x2
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
 //               if(ISb(panel,MavB_BIT)) panMavBeat(panMavBeat_XY[0][panel], panMavBeat_XY[1][panel]); //13x3

                if(osd_got_home == 1){
                    if(ISb(panel,HDis_BIT)) panHomeDis(panHomeDis_XY[0][panel], panHomeDis_XY[1][panel]); //13x3
                    if(ISb(panel,HDir_BIT)) panHomeDir(panHomeDir_XY[0][panel], panHomeDir_XY[1][panel]); //13x3
                }

                if(ISb(panel,Time_BIT)) panTime(panTime_XY[0][panel], panTime_XY[1][panel]);
 //               if(ISb(panel,WDir_BIT)) panWPDir(panWPDir_XY[0][panel], panWPDir_XY[1][panel]); //??x??
                if(ISb(panel,WDis_BIT)) panWPDis(panWPDis_XY[0][panel], panWPDis_XY[1][panel]); //??x??

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
                //For now we don't have windspeed in copter
                //if(ISd(panel,WindS_BIT)) panWindSpeed(panWindSpeed_XY[0][panel], panWindSpeed_XY[1][panel]);
                if(ISd(panel,Climb_BIT)) panClimb(panClimb_XY[0][panel], panClimb_XY[1][panel]);
//                if(ISd(panel,Tune_BIT)) panTune(panTune_XY[0][panel], panTune_XY[1][panel]);
                if(ISd(panel,RSSI_BIT)) panRSSI(panRSSI_XY[0][panel], panRSSI_XY[1][panel]); //??x??
                if(ISd(panel,Eff_BIT)) panEff(panEff_XY[0][panel], panEff_XY[1][panel]);
                if(ISd(panel,CALLSIGN_BIT)) panCALLSIGN(panCALLSIGN_XY[0][panel], panCALLSIGN_XY[1][panel]);
                if(ISe(panel,TEMP_BIT)) panTemp(panTemp_XY[0][panel], panTemp_XY[1][panel]);
//                if(ISe(panel,Ch_BIT)) panCh(panCh_XY[0][panel], panCh_XY[1][panel]);
                if(ISe(panel,DIST_BIT)) panDistance(panDistance_XY[0][panel], panDistance_XY[1][panel]);
            } else { //panel == npanels
//                if(ISd(0,Warn_BIT)) panWarn(panWarn_XY[0][0], panWarn_XY[1][0]); // this must be here so warnings are always checked
                if(ISd(0,CALLSIGN_BIT)) panCALLSIGN(panCALLSIGN_XY[0][panel], panCALLSIGN_XY[1][panel]); //call sign even in off panel
            }
 //       } else { // if (osd_on > 0)
 //           panSetup();
 //       }
        }
    } else { // if no mavlink update for 2 secs
    
        // this could be replaced with a No Mavlink warning so the last seen values still show

        osd.clear();
        waitingMAVBeats = 1;
        // Display our logo and wait... 
    //    panWaitMAVBeats(5,10); //Waiting for MAVBeats...
    panLogo();
    
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
// Panel  : ODO
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panDistance(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();
    do_converts();
    if ((tdistance * converth) > 1000.0) {
    osd.printf("%c%5.2f%c", 0xFE, ((tdistance * converth) / distconv), distchar);
    }else{
    osd.printf("%c%5.0f%c", 0xFE, (tdistance * converth), high);
    }
    osd.closePanel();
}

/* **************************************************************** */
// Panel  : panFdata
// Needs  : X, Y locations
// Output : 
// Size   : 
// Staus  : done
void panFdata(){
     osd.setPanel(11, 4);
    osd.openPanel();                          
//    osd.printf("%c%3i%c%02i|%c%5.0f%c|%c%5.0f%c|%c%5.0f%c|%c%5.0f%c|%c%5.0f%c|%c%5.0f%c", 0xB3,((int)start_Time/60)%60,0x3A,(int)start_Time%60, 0x1f, ((max_home_distance) * converth), high, 0xFD, ((tdistance) * converth), high, 0xE8,(max_osd_airspeed * converts), spe,0xE9,(max_osd_groundspeed * converts),spe,0xE7, (max_osd_home_alt * converth), high,0xFC,(max_osd_windspeed * converts),spe);
    osd.printf("%c%3i%c%02i|%c%5i%c|%c%5i%c|%c%5i%c|%c%5i%c|%c%5i%c|%c%5i%c|%c%10.6f|%c%10.6f", 0xB3,((int)start_Time/60)%60,0x3A,(int)start_Time%60, 0x1f, (int)((max_home_distance) * converth), high, 0xFE, (int)((tdistance) * converth), high, 0xE8,(int)(max_osd_airspeed * converts), spe,0xE9,(int)(max_osd_groundspeed * converts),spe,0xE7, (int)(max_osd_home_alt * converth), high,0xFC,(int)(max_osd_windspeed * converts),spe, 0x83, (double)osd_lat, 0x84, (double)osd_lon);
    osd.closePanel();
}

/* **************************************************************** */
// Panel  : pantemp
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panTemp(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();
    do_converts();
    osd.printf("%c%4.2f%c", 0x1C, (float(tempconv) / 100), temps);
    osd.closePanel();
}

/* **************************************************************** */
// Panel  : efficiency
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panEff(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();
    //Check takeoff just to prevent inicial false readings
    if (takeofftime){
        ////If in loiter should estimated remaining flight time
        //if ((osd_climb > -0.05) && (osd_climb < 0.05) && (osd_groundspeed * converts < 2)){ 
          if(osd_battery_remaining_A != last_battery_reading){
            remaining_Time = osd_battery_remaining_A * ((millis()/1000) - FTime) / (start_battery_reading - osd_battery_remaining_A);
            last_battery_reading = osd_battery_remaining_A;
          }
          osd.printf("%c%2i%c%02i", 0x17,((int)remaining_Time/60)%60,0x3A,(int)remaining_Time%60);
        //}
        //If in movement show mAh needed to fly a Km or a mile (depending on selected unit
//        else{
//          eff = (float(osd_curr_A * 10) / (osd_groundspeed * converts))* 0.5 + eff * 0.5;
//        eff = eff * 0.2 + eff * 0.8;
//          if (eff > 0 && eff <= 9999) {
//            osd.printf("%c%4.0f%c", 0x17, (double)eff, 0x82);
//          }else{
//          osd.printf_P(PSTR("\x17\x20\x20\x20\x20\x20")); 
//          }
        //}
    }
    osd.closePanel();
}

/* **************************************************************** */
// Panel  : panCh
// Needs  : X, Y locations
// Output : Scaled channel values from MAVLink
// Size   
// Staus  : done

//void panCh(int first_col, int first_line){
//    osd.setPanel(first_col, first_line);
//    osd.openPanel();
    
//    osd.printf("%c%c%5i|%c%c%5i|%c%c%5i|%c%c%5i|%c%c%5i|%c%c%5i", 0x43, 0x31, chan1_raw, 0x43, 0x32, chan2_raw, 0x43, 0x33, chan3_raw, 0x43, 0x34, chan4_raw, 0x43, 0x35, chan5_raw, 0x43, 0x36, chan6_raw); 
//    osd.closePanel();
//}

/* **************************************************************** */
// Panel  : panRSSI
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panRSSI(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();
    rssi = (int16_t)osd_rssi;
    //if (rssi > rssical) rssi = rssical;
    //else if (rssi < rssipersent) rssi = rssipersent;

    if(!rssiraw_on) rssi = (int16_t)((float)(rssi - rssipersent)/(float)(rssical-rssipersent)*100.0f);
//    if (rssi < -99) rssi = -99;
    osd.printf("%c%3i%c", 0xE1, rssi, 0x25);
//    osd.printf("%c%3i%c", 0xE1, osd_clear, 0x25); 
    osd.closePanel();
}

/* **************************************************************** */
// Panel  : panCALLSIGN
// Needs  : X, Y locations
// Output : Call sign identification
// Size   : 1 x 6Hea  (rows x chars)
// Staus  : done

void panCALLSIGN(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();
    //osd.printf("%c%c%c%c%c%c", char_call[0], char_call[1], char_call[2], char_call[3], char_call[4], char_call[5]); 
    if ((millis() - 60000) > CallSignBlink){
      if (millis() - 61000 > CallSignBlink){
        CallSignBlink = (millis() - 1000);
          }
    osd.printf("%s", char_call); 
    }else{
//    osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20"));
    osd.printf("%s",strclear);
    }
    osd.closePanel();
}

/* **************************************************************** */
// Panel  : panSetup
// Needs  : Nothing, uses whole screen
// Output : The settings menu
// Size   : 3 x ?? (rows x chars)
// Staus  : done

//void panSetup(){

//    if (millis() > text_timer){
//        text_timer = millis() + 500;

//        osd.clear();
//        osd.setPanel(5, 7);
//        osd.openPanel();

//        if (chan1_raw_middle == 0 && chan2_raw_middle == 0){
//            chan1_raw_middle = chan1_raw;
//            chan2_raw_middle = chan2_raw;
//        }

//        if ((chan2_raw - 100) > chan2_raw_middle ) setup_menu++;  //= setup_menu + 1;
//        else if ((chan2_raw + 100) < chan2_raw_middle ) setup_menu--;  //= setup_menu - 1;
//        if (setup_menu < 0) setup_menu = 0;
//        else if (setup_menu > 2) setup_menu = 2;


//        switch (setup_menu){
//        case 0:
//            {
//                osd.printf_P(PSTR("    Overspeed    "));
//                osd.printf("%3.0i%c", overspeed, spe);
//                overspeed = change_val(overspeed, overspeed_ADDR);
//                break;
//            }
//        case 1:
//            {
//                osd.printf_P(PSTR("   Stall Speed   "));
//                osd.printf("%3.0i%c", stall , spe);
//                //overwritedisplay();
//                stall = change_val(stall, stall_ADDR);
//                break;
//            }
//        case 2:
//            {
//                osd.printf_P(PSTR("Battery warning "));
//                osd.printf("%3.1f%c", float(battv)/10.0 , 0x76, 0x20);
//                battv = change_val(battv, battv_ADDR);
//                break;
//            }
            //      case 4:
            //        osd.printf_P(PSTR("Battery warning "));
            //        osd.printf("%3.0i%c", battp , 0x25);
            //        if ((chan1_raw - 100) > chan1_raw_middle ){
            //        battp = battp - 1;}
            //        if ((chan1_raw + 100) < chan1_raw_middle ){
            //        battp = battp + 1;} 
            //        EEPROM.write(208, battp);
            //        break;
//        }
//}
//    osd.closePanel();
//}

//int change_val(int value, int address)
//{
//    uint8_t value_old = value;
//    if (chan1_raw > chan1_raw_middle + 100) value--;
//    if (chan1_raw  < chan1_raw_middle - 100) value++;

//    if(value != value_old && setup_menu ) EEPROM.write(address, value);
//    return value;
//}

/* **************************************************************** */
// Panel  : pan wind speed
// Needs  : X, Y locations
// Output : Wind direction symbol (arrow) and velocity
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panWindSpeed(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();

    osd_wind_arrow_rotate_int = round((osd_winddirection - osd_heading)/360.0 * 16.0) + 1; //Convert to int 1-16 
    if(osd_wind_arrow_rotate_int < 0 ) osd_wind_arrow_rotate_int += 16; //normalize
    showArrow((uint8_t)osd_wind_arrow_rotate_int,1); //print data to OSD

    osd.closePanel();
}

/* **************************************************************** */
// Panel  : panOff
// Needs  : X, Y locations
// Output : OSD off
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panOff(){
    if (ch_toggle == 4){
        if ((osd_mode != 6) && (osd_mode != 7)){
            if (osd_off_switch != osd_mode){ 
                osd_off_switch = osd_mode;
                osd_switch_time = millis();

                if (osd_off_switch == osd_switch_last){
                    switch(panel){
                    case 0:
                        {
                            panel = 1;                                                        
//                            if (millis() <= 60000){
//                                osd_set = 1;
//                            }else{
//                                osd_set = 0;
//                            }                            
                            break;
                        }
                    case 1:
                        {
                            panel = npanels;
//                            osd_set = 0;                            
                            break;
                        }
                    case npanels:
                        {
                            panel = 0;
                            break;
                        }
                    }
                    osd.clear();
                }
            }
            if ((millis() - osd_switch_time) > 2000){
                osd_switch_last = osd_mode;
            }
        }
    }
    else {
        if(ch_toggle == 5) ch_raw = chan5_raw;
        else if(ch_toggle == 6) ch_raw = chan6_raw;
        else if(ch_toggle == 7) ch_raw = chan7_raw;
        else if(ch_toggle == 8) ch_raw = chan8_raw;

        if (switch_mode == 0){
            if (ch_raw > 1800 && warning != 1) {
//                if (millis() <= 60000){
//                    osd_set = 1;
//                }
//                else if (osd_set != 1 && warning != 1){
//              if (warning != 1){
                osd.clear();
//                }
                panel = npanels; //off panel
            }
            else if (ch_raw < 1200 && panel != 0) { //first panel
 //               osd_set = 0;
                osd.clear();
                panel = 0;
            }    

 // else if (ch_raw >= 1200 && ch_raw <= 1800 && setup_menu != 6 && panel != 1 && warning != 1) { //second panel
    else if (ch_raw >= 1200 && ch_raw <= 1800 && panel != 1 && warning != 1) { //second panel
 //               osd_set = 0;
                osd.clear();
                panel = 1;
            }        
        } else {

            if (ch_raw > 1200)
 //               if (millis() <= 60000 && osd_set != 1){
 //                   if (osd_switch_time + 1000 < millis()){
 //                       osd_set = 1;
 //                       osd_switch_time = millis();
 //                   }
 //               } else {
                    if (osd_switch_time + 1000 < millis()){
 //                       osd_set = 0;
                        osd.clear();
                        if (panel == npanels) {
                            panel = 0;
                        } else {
                            panel++;
                        }
                        if (panel > 1) panel = npanels;
                        osd_switch_time = millis();
                    }
  //              }
        }    
    }
}
//* **************************************************************** */
// Panel  : panTune
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done
    
//  void panTune(int first_col, int first_line){
//  osd.setPanel(first_col, first_line);
//  osd.openPanel();

//  osd.printf("%c%c%2.0f%c|%c%c%2.0f%c|%c%c%4.0i%c|%c%c%4.0i%c|%c%c%3.0f%c|%c%c%3.0f%c|%c%c%3.0f%c", 0x4E, 0x52, (nav_roll), 0xB0, 0x4E, 0x50, (nav_pitch), 0xB0, 0x4E, 0x48, (nav_bearing), 0xB0, 0x54, 0x42, (wp_target_bearing), 0xB0, 0x41, 0x45, (alt_error * converth), high, 0x58, 0x45, (xtrack_error), 0x6D, 0x41, 0x45, ((aspd_error / 100.0) * converts), spe);

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
    osd.printf("%c%3.0f%c",0x16, (osd_climb * converth), climbchar);
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
            warning = 1;
//            warning_timer = millis();            
        } else {
//            if ((millis() - 10000) > warning_timer ) warning = 0;

            int x = last_warning; // start the warning checks where we left it last time
            while (warning_type == 0) { // cycle through the warning checks
                //If armed/disarmed -> jump to that warning
                if (armed_switch){
                    if(motor_armed){
                        warning_type = 6;
                    }
                    else{
                        warning_type = 7;
                    }
                    last_armed = motor_armed;
                    break;
                }
                x++;
                if (x > 5) x = 1; // change the 6 if you add more warning types
                if(x == 1){
                    if ((osd_fix_type) < 2) warning_type = 1; // No GPS Fix
                }
                else if(x == 2){
                    if (osd_airspeed * converts < stall && osd_airspeed > 1.12) warning_type = 2;
                }
                else if(x == 3){
                    if ((osd_airspeed * converts) > (float)overspeed) warning_type = 3;
                }
                else if(x == 4){
                    if (osd_vbat_A < float(battv)/10.0 || (osd_battery_remaining_A < batt_warn_level && batt_warn_level != 0)) warning_type = 4;
                }
                else if(x == 5){
                    if (rssi < rssi_warn_level && rssi != -99 && !rssiraw_on) warning_type = 5;
                }
                if (x == last_warning) break; // if we've done a full cycle then there mustn't be any warnings
            }
        }

        text_timer = millis() + 1000; // blink every 1 secs
        if (warning == 1){ 
            if (panel == 1) osd.clear();
            panel = 0; // turn OSD on if there is a warning                  
        }
        char* warning_string;
        //Show arm / disarm switch 
        if(warning_type == 0){ 
            warning_string = "\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20";
        }
        else if(warning_type == 1){ 
            warning_string = "\x20\x4E\x6F\x20\x47\x50\x53\x20\x66\x69\x78\x21";
        }
        else if(warning_type == 2){ 
            warning_string = "\x20\x20\x20\x53\x74\x61\x6c\x6c\x21\x20\x20\x20";
        }
        else if(warning_type == 3){ 
            warning_string = "\x20\x4f\x76\x65\x72\x53\x70\x65\x65\x64\x21\x20";
        }
        else if(warning_type == 4){ 
            warning_string = "\x42\x61\x74\x74\x65\x72\x79\x20\x4c\x6f\x77\x21";
        }
        else if(warning_type == 5){ 
            warning_string = "\x20\x20\x4c\x6f\x77\x20\x52\x73\x73\x69\x20\x20";
        }
        else if(warning_type == 6){ 
            warning_string = "\x20\x20\x20\x20\x41\x52\x4d\x45\x44\x20\x20\x20";      
        }
        else if(warning_type == 7){ 
            warning_string = "\x20\x20\x44\x49\x53\x41\x52\x4d\x45\x44\x20\x20";      
        }
        //else if(warning_type == 6){ 
            //            warning_string = "\x20\x20\x44\x49\x53\x41\x52\x4d\x45\x44\x20\x20";
        //}
        osd.printf("%s",warning_string);
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
    //osd.printf("%c%5.0f%c|%c%5.0i%c", 0x70, (1 - (float)osd_battery_remaining_A / 100) * batt_capacity * 100, 0x82, 0x69, osd_curr_consumed, 0x82);
    if((int)start_Time % 6 < 3)
      osd.printf("%c%c%c%3.0i%c", 0xB9, 0x20, 0x20, osd_battery_remaining_A, 0x25);
    else
      osd.printf("%c%5.0i%c", 0xB9, osd_curr_consumed, 0x82);
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
    
    start_Time = (millis()/1000) - FTime;
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

//void panCenter(int first_col, int first_line){
//    osd.setPanel(first_col, first_line);
//    osd.openPanel();
//    osd.printf_P(PSTR("\x05\x03\x04\x05|\x15\x13\x14\x15"));
//    osd.closePanel();
//}

/* **************************************************************** */
// Panel  : panHorizon
// Needs  : X, Y locations
// Output : 12 x 4 Horizon line surrounded by 2 cols (left/right rules)
// Size   : 14 x 4  (rows x chars)
// Staus  : done

void panHorizon(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();
  
     
    osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|"));
    osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|"));
    osd.printf_P(PSTR("\xd8\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xd9|"));
    osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|"));
    osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20"));

    osd.closePanel();
    showHorizon((first_col + 1), first_line);
    //Show ground level on  HUD
    showHudVerticalLandingAid(first_col + 6, first_line);
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

//------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

//void panWaitMAVBeats(int first_col, int first_line){
//    panLogo();
//    osd.setPanel(first_col, first_line);
//    osd.openPanel();
//    osd.printf_P(PSTR("Waiting for|MAVLink heartbeats..."));
//    osd.closePanel();
//}

/* **************************************************************** */
// Panel  : panGPL
// Needs  : X, Y locations
// Output : 1 static symbol with changing FIX symbol
// Size   : 1 x 2  (rows x chars)
// Staus  : done

void panGPL(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();
    char* gps_str;
    if(osd_fix_type == 0 || osd_fix_type == 1) gps_str = "\x10\x20"; 
        //osd.printf_P(PSTR("\x10\x20"));
    else if(osd_fix_type == 2 || osd_fix_type == 3) gps_str = "\x11\x20";
        //osd.printf_P(PSTR("\x11\x20"));
    osd.printf("%s",gps_str);

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
    osd.printf("%c%10.6f|%c%10.6f", 0x83, (double)osd_lat, 0x84, (double)osd_lon);
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
    //osd.printf("%s|%c%s%c", "\x20\xc0\xc0\xc0\xc0\xc0\xc7\xc0\xc0\xc0\xc0\xc0\x20", 0xd0, buf_show, 0xd1);
    osd.printf("%c%s%c", 0xd0, buf_show, 0xd1);
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

//void panMavBeat(int first_col, int first_line){
//    osd.setPanel(first_col, first_line);
//    osd.openPanel();
//    if(mavbeat == 1){
//        osd.printf_P(PSTR("\xEA\xEC"));
//        mavbeat = 0;
//    }
//    else{
//        osd.printf_P(PSTR("\xEA\xEB"));
//    }
//    osd.closePanel();
//}


/* **************************************************************** */
// Panel  : panWPDir
// Needs  : X, Y locations
// Output : 2 symbols that are combined as one arrow, shows direction to next waypoint
// Size   : 1 x 2  (rows x chars)
// Staus  : not ready

//void panWPDir(int first_col, int first_line){
//    osd.setPanel(first_col, first_line);
//    osd.openPanel();
   
//    wp_target_bearing_rotate_int = round(((float)wp_target_bearing - osd_heading)/360.0 * 16.0) + 1; //Convert to int 0-16 
//    if(wp_target_bearing_rotate_int < 0 ) wp_target_bearing_rotate_int += 16; //normalize  

//    showArrow((uint8_t)wp_target_bearing_rotate_int,0);
//    osd.closePanel();
//}

/* **************************************************************** */
// Panel  : panWPDis
// Needs  : X, Y locations
// Output : W then distance in Km - Distance to next waypoint
// Size   : 1 x 2  (rows x chars)
// Staus  : not ready TODO - CHANGE the Waypoint symbol - Now only a W!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

void panWPDis(int first_col, int first_line){
    osd.setPanel(first_col, first_line);
    osd.openPanel();
    
    wp_target_bearing_rotate_int = round(((float)wp_target_bearing - osd_heading)/360.0 * 16.0) + 1; //Convert to int 0-16 
    if(wp_target_bearing_rotate_int < 0 ) wp_target_bearing_rotate_int += 16; //normalize
    
//      if (xtrack_error > 999) xtrack_error = 999;
//      if (xtrack_error < -999) xtrack_error = -999;

      osd.printf("%c%c%2i%c%4.0f%c|",0x57, 0x70, wp_number,0x0,(double)((float)(wp_dist) * converth),high);
      showArrow((uint8_t)wp_target_bearing_rotate_int,0);
      osd.printf("%c%c%c%4.0f%c", 0x20, 0x58, 0x65, (xtrack_error* converth), high);
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
    showArrow((uint8_t)osd_home_direction,0);
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
    //char c1 = 0xE0 ;//"; char c2; char c3; char c4; char c5; 
    char* mode_str="";
        if (osd_mode == 0) mode_str = "stab"; //Stabilize
        else if (osd_mode == 1) mode_str = "acro"; //Acrobatic
        else if (osd_mode == 2) mode_str = "alth"; //Alt Hold
        else if (osd_mode == 3) mode_str = "auto"; //Auto
        else if (osd_mode == 4) mode_str = "guid"; //Guided
        else if (osd_mode == 5) mode_str = "loit"; //Loiter
        else if (osd_mode == 6) mode_str = "retl"; //Return to Launch
        else if (osd_mode == 7) mode_str = "circ"; //Circle
        else if (osd_mode == 8) mode_str = "posi"; //Position
        else if (osd_mode == 9) mode_str = "land"; //Land
        else if (osd_mode == 10) mode_str = "oflo"; //OF_Loiter
    osd.printf("%c%s", 0xE0, mode_str);
    osd.closePanel();
}


// ---------------- EXTRA FUNCTIONS ----------------------
// Show those fancy 2 char arrows
void showArrow(uint8_t rotate_arrow,uint8_t method) {  
    int arrow_set1 = 0x90;
    //We trust that we receive rotate_arrow [1, 16] so 
    //it's no needed (rotate_arrow <= 16) in the if clause
    if(rotate_arrow > 1){
      arrow_set1 += rotate_arrow * 2 - 2;
    }
//    if(method == 1) osd.printf("%c%3.0f%c|%c%c%2.0f%c",0xFC,(double)(osd_windspeed * converts),spe, (byte)arrow_set1, (byte)(arrow_set1 + 1),(double)(osd_windspeedz * converts),spe);
    if(method == 1) osd.printf("%c%3.0f%c|%c%c%2.0f%c",0xFC,(double)(osd_windspeed * converts),spe, (byte)arrow_set1, (byte)(arrow_set1 + 1),(double)(max_osd_windspeed * converts),spe);
  
    else osd.printf("%c%c", (byte)arrow_set1, (byte)(arrow_set1 + 1));
}

// Calculate and shows Artificial Horizon
void showHorizon(int start_col, int start_row) { 
    int x, nose, row, minval, hit, subval = 0;
    const int cols = 12;
    const int rows = 5;
    float  pitch, roll;

    pitch = osd_pitch * -0.017453293;
    roll = osd_roll * 0.017453293;

    //Calculate nose angle at center
    nose = round(tan(pitch) * (rows*9));
    for(int col=0;col < cols; col++){
        x = (col * 12) - (cols * 6) + 6;//center X point at middle of each col
        hit = (tan(roll) * x) + nose + (rows*9) - 1;//calculating hit point on Y plus offset to eliminate negative values
        if(hit > 0 && hit < (rows * 18)){
            row = rows - ((hit-1)/18);
            minval = rows*18 - row*18 + 1;
            subval = hit - minval;
            subval = round((subval*9)/18);
            if(subval == 0) subval = 1;
            subval += 5; //horizon starts at 0X06 memmory position
            osd.openSingle(start_col + col, start_row + row - 1);
            osd.printf("%c", ((byte)subval));
        }
    }
}

// Calculate and shows verical speed aid
void showHudVerticalLandingAid(int start_col, int start_row) { 
    //Show line on panel center because horizon line can be
    //high or low depending on pitch attitude
    int subval_char = 0x0E;

    //shift alt interval from [-5, 5] to [0, 10] interval, so we
    //can work with remainders.
    //We are using a 0.2 altitude units as resolution (1 decimal place)
    //so convert we convert it to times 10 to work 
    //only with integers and save some bytes
    int alt = ((osd_alt - osd_home_alt) * converth + 5) * 10;
    
    if((alt < 100) && (alt > 0)){
        //We have 10 possible chars
        //(alt * 5) -> 5 represents 1/5 which is our resolution. Every single
        //line (char) change represents 0,2 altitude units
        //% 10 -> Represents our 10 possible characters
        //9 - -> Inverts our selected char because when we gain altitude
        //the selected char has a lower position in memory
        //+ 5 -> Is the memory displacement od the first altitude charecter 
        //in memory (it starts at 0x05
        subval_char = (99 - ((alt * 5) % 100)) / 10 + 5;
        //Each row represents 2 altitude units
        start_row += (alt / 20);
    }
    else if(alt >= 100){
        //Copter is too high. Ground is way too low to show on panel, 
        //so show down arrow at the bottom
        subval_char = 0x05; 
        start_row += 4;
    }

    //Enough calculations. Let's show the result
    osd.openSingle(start_col, start_row);
    osd.printf("%c", subval_char);
    osd.openSingle(start_col + 1, start_row);
    osd.printf("%c", subval_char);
}

void do_converts()
{
    if (EEPROM.read(measure_ADDR) == 0) {
        converts = 3.6;
        converth = 1.0;
        spe = 0x81;
        high = 0x8D;
        temps = 0xC8;
        tempconv = temperature;
        distchar = 0xFD;
        distconv = 1000;
        climbchar = 0x88;
    } else {
        converts = 2.23;
        converth = 3.28;
        spe = 0xfb;
        high = 0x66;
        temps = 0xC9;
        tempconv = (1.8 *(float(temperature)  / 10) + 32) * 10;
        distchar = 0xFA;
        distconv = 5280;
        climbchar = 0xEB;
    }
}
