

/******* PANELS - POSITION *******/

extern struct loc_flags lflags;  // все булевые флаги кучей

inline void osd_write(byte c){
    osd.write(c);
}

float NOINLINE cnvGroundSpeed() { // вынос инварианта

    return osd_groundspeed * pgm_read_float(&measure->converts);
}

float NOINLINE cnvAltError(){
    return alt_error * pgm_read_float(&measure->converth);
}

void NOINLINE printTime(int t){
    osd.printf_P(PSTR("%2i\x3a%02i"),((int)t/60)%60, (int)t%60);
}

void NOINLINE osd_printf_1(PGM_P fmt, float f){
    osd.printf_P(fmt, f);
}

void NOINLINE osd_printf_2(PGM_P fmt, float f, byte c){
    osd.printf_P(fmt, f, c);
}

void NOINLINE osd_printi_1(PGM_P fmt, int f){
    osd.printf_P(fmt, f);
}

void writePanels(){

    osd.detectMode(); // PAL/NTSC live
    
    long pt=millis(); // текущее время

#ifdef IS_PLANE
    if ((lflags.takeofftime == 1) && (osd_alt_to_home > 10 || osd_groundspeed > 1 || osd_throttle > 1 || osd_home_distance > 100)){
        landed = pt;
    }
#endif

    if(sets.n_screens>MAX_PANELS) sets.n_screens = MAX_PANELS;

  //Base panel selection
  //No mavlink data available panel
  if(pt > (lastMAVBeat + 2200)){

    if (currentAutoPanel != sets.n_screens){
        currentAutoPanel = sets.n_screens;
    }
    panWaitMAVBeats(); //Waiting for MAVBeats...
    return; // no warn
  }

  //Flight summary panel
  //Only show flight summary 10 seconds after landing and if throttle < 15
#ifdef IS_COPTER
  else if (!lflags.motor_armed && (((pt / 10000) % 2) == 0) && (tdistance > 50)){
    if (currentAutoPanel != 1){
//      osd.clear();
      currentAutoPanel = 1;


    }
#else
#ifdef IS_PLANE
    //Only show flight summary 7 seconds after landing
  else if ((pt - 7000) > landed){
#else
    if(0) {
#endif
#endif
    panFdata({1,1}); 
    return; // no warn
  }
  //Normal osd panel
  else{

//	OSD::setPanel(0,0);
//	osd.printf_P("p=%d t=%d",panelN, sets.ch_toggle);

    //Check for panel toggle
    if(sets.ch_toggle > 0) pan_toggle(); // This must be first so you can always toggle

    if(panelN < sets.n_screens){ // конфигурируемые юзером экраны
    	// must be first to other can overwrite free space
      if(is_on(panel.horizon)) panHorizon(panel.horizon); //14x5

      if(is_on(panel.pitch)) panPitch(panel.pitch); //5x1
      if(is_on(panel.roll))  panRoll(panel.roll); //5x1
      if(is_on(panel.batt_A)) panBatt_A(panel.batt_A); //7x1
      if(is_on(panel.batt_B)) panBatt_B(panel.batt_B); //7x1

      if(is_on(panel.GPS_sats)) panGPSats(panel.GPS_sats); //5x1
  //  if(is_on(panel.GPL)) panGPL(panel.GPL); //2x1
      if(is_on(panel.GPS)) panGPS(panel.GPS); //12x3
      if(is_on(panel.GPS2)) panGPS2(panel.GPS2); //25x1
      if(is_on(panel.batteryPercent)) panBatteryPercent(panel.batteryPercent); //
      if(is_on(panel.COG)) panCOG(panel.COG); //

      if(is_on(panel.rose)) panRose(panel.rose);        //13x3
      if(is_on(panel.heading)) panHeading(panel.heading); //13x3
  //  if(is_on(panel.mavBeat)) panMavBeat(panel.mavBeat); //13x3

      if(is_on(panel.Fdata)) panFdata(panel.Fdata); 

      if(osd_got_home == 1){
        if(is_on(panel.homeDist)) panHomeDis(panel.homeDist); //13x3
        if(is_on(panel.homeDir)) panHomeDir(panel.homeDir); //13x3
      }

      if(is_on(panel.time)) panTime(panel.time);
      
      //Only show wp panel.el if there is one
      if(wp_number > 0){
        if(is_on(panel.WP_dist)) panWPDis(panel.WP_dist); 
      }

      if(is_on(panel.alt)) panAlt(panel.alt); //
      if(is_on(panel.homeAlt)) panHomeAlt(panel.homeAlt); //
      if(is_on(panel.vel)) panVel(panel.vel); //
      if(is_on(panel.airSpeed)) panAirSpeed(panel.airSpeed); //
      if(is_on(panel.throttle)) panThr(panel.throttle); //
      if(is_on(panel.FMod)) panFlightMode(panel.FMod);  //
      
      if(is_on(panel.curr_A)) panCur_A(panel.curr_A);

      //For now we don't have windspeed in copter - really?
      if(is_on(panel.windSpeed)) panWindSpeed(panel.windSpeed);
  
      if(is_on(panel.climb)) panClimb(panel.climb);
      if(is_on(panel.tune)) panTune(panel.tune);
      if(is_on(panel.RSSI)) panRSSI(panel.RSSI); //??x??
      if(is_on(panel.eff)) panEff(panel.eff);

      if(is_on(panel.temp)) panTemp(panel.temp);
      if(is_on(panel.ch)) panCh(panel.ch);
      if(is_on(panel.distance)) panDistance(panel.distance);
      if(is_on(panel.callSign)) panCALLSIGN(panel.callSign); 
    } else {
	// last panel
	
	if(!lflags.motor_armed) {
	    panSetup();
	    return; // no warnings
	}
    }
  }
//  
    // show warnings even if screen is disabled
     /* if(is_on(panel.warn)) */ panWarn(panel.warn); // this must be here so warnings are always checked

}






/******* PANELS - DEFINITION *******/
/* **************************************************************** */

/* **************************************************************** */
// Panel  : COG Course Over Ground
// Needs  : X, Y locations
// Output : 
// Size   : 
// Staus  : done

void panCOG(point p){
    OSD::setPanel(p.x,p.y);
    
    int cog_100=(osd_cog + 50) / 100 - osd_heading;
    
    if (cog_100  > 180){
       off_course = cog_100 - 360;
    }else if (cog_100 < -180){
       off_course = cog_100 + 360;
    }else{
       off_course = cog_100;
    }
    
    showArrow(grad_to_sect(off_course),2); // use off_course as global
}

void printDist(float d){
      osd_printf_2(PSTR("%5.0f%c"), d, pgm_read_byte(&measure->high));
}

void printLongDist(float d){
      osd_printf_2(PSTR("%5.2f%c"), (d / pgm_read_word(&measure->distconv)), pgm_read_byte(&measure->distchar));
}

void printFullDist(float dd){
    dd *= pgm_read_float(&measure->converth);
    if (dd > 9999.0) {
        printLongDist(dd);
    }else{
        printDist(dd);
    }
}

// Panel  : ODO
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panDistance(point p){
    OSD::setPanel(p.x,p.y);

    if(has_sign(p))
	osd_write(0x8f);


    printFullDist(tdistance);
}

/* **************************************************************** */
// Panel  : panFdata
// Needs  : X, Y locations
// Output : 
// Size   : 
// Staus  : done
void panFdata(point p){ // итоги полета
//  OSD::setPanel(11, 4);
  OSD::setPanel(p.x,p.y);
  byte h=pgm_read_byte(&measure->high);

  osd_write(0x08);
  printTime(total_flight_time_milis / 1000);
  osd.printf_P(PSTR("|\x0B%5i%c|\x8F%5i%c|\x14%5i%c|\x12%5i%c|\x03%10.6f|\x04%10.6f"),
		      (int)((max_home_distance) * pgm_read_float(&measure->converth)), h,
		                 (int)(tdistance * pgm_read_float(&measure->converth)), h,
		                	(int)(max_osd_groundspeed * pgm_read_float(&measure->converts)),pgm_read_byte(&measure->spe),
		                		    (int)(max_osd_home_alt * pgm_read_float(&measure->converth)), h,
		                			      osd_lat, 
		                			    		osd_lon);
}

/* **************************************************************** */
// Panel  : pantemp
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panTemp(point p){
    OSD::setPanel(p.x,p.y);
    osd_printf_2(PSTR("%5.1f%c"), ((temperature / 10.0 * pgm_read_byte(&measure->tempconv) + pgm_read_word(&measure->tempconvAdd)) / 100), pgm_read_byte(&measure->temps));    
}

/* **************************************************************** */
// Panel  : efficiency
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done
void panEff(point p){
    OSD::setPanel(p.x,p.y);


    static float ddistance = 0;
    float        eff = 0; //Efficiency

    if(sets.model_type==0){ // plane
        if (osd_throttle >= 1){
          if (lflags.ma == 0) 
              lflags.ma = 1;
    
            if (osd_groundspeed != 0) 
        	eff = ((osd_curr_A * 10.0) / cnvGroundSpeed())* 0.1 + eff * 0.9;

    	    if(has_sign(p))
		osd_write(0x16);
            
            if (eff > 0 && eff <= 9999) {
                  osd_printf_1(PSTR("%4.0f\x01"), eff);
            }else{
                  osd.print_P(&strclear[7]);// osd.print_P(PSTR("\x20\x20\x20\x20\x20"));
            }

        }else{

            if ((osd_throttle < 1)){ // запоминаем высоту и путь при выключенном газе
                if (lflags.ma == 1) {
                  palt = osd_alt_to_home;
                  ddistance = tdistance;
                  lflags.ma = 0;
                }
            }
	    if(has_sign(p))
		osd_write(0x18);

            if (osd_climb < -0.05){
                float glide = ((osd_alt_to_home / (palt - osd_alt_to_home)) * (tdistance - ddistance)) * pgm_read_float(&measure->converth);
                if (glide > 9999) glide = 9999;
                if (glide > -0){
                    osd_printf_2(PSTR("%4.0f%c"), glide, pgm_read_byte(&measure->high)); // аэродинамическое качество
                }
            }else if (osd_climb >= -0.05 && osd_pitch < 0) {
                  osd.print_P(PSTR("\x20\x20\x90\x91\x20")); //термик
            }else{

                  osd.print_P(&strclear[7]);//      osd.print_P(PSTR("\x20\x20\x20\x20\x20"));
            }
        }
    } else { // copter
      //Check takeoff just to prevent initial false readings
      if (lflags.motor_armed) {
        if(osd_battery_remaining_A != last_battery_reading && !lflags.uavtalk_active) {
    	    // UAVtalk sends this itself
            remaining_estimated_flight_time_seconds = ((float)osd_battery_remaining_A * total_flight_time_milis / 
        					    (max_battery_reading - osd_battery_remaining_A)) / 1000;
            last_battery_reading = osd_battery_remaining_A;
	}
	if(has_sign(p))
	    osd_write(0x17);

	printTime(remaining_estimated_flight_time_seconds);
      }
  }
  

}

/* **************************************************************** */
// Panel  : panRSSI
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panRSSI(point p){
    OSD::setPanel(p.x,p.y);

    if(has_sign(p))
	osd_write(0x09);

    osd_printi_1(PSTR("%3i\x25"), rssi);
}

/* **************************************************************** */
// Panel  : panCALLSIGN
// Needs  : X, Y locations
// Output : Call sign identification
// Size   : 1 x 6Hea  (rows x chars)
// Staus  : done

void panCALLSIGN(point p){
    OSD::setPanel(p.x,p.y);


    if((seconds % 60) < 2){
      osd.print( (char *)sets.OSD_CALL_SIGN);
    }else{
      osd.print_P(&strclear[4]);
    }
}


/* **************************************************************** */
// Panel  : pan wind speed
// Needs  : X, Y locations
// Output : Wind direction symbol (arrow) and velocity
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panWindSpeed(point p){
    OSD::setPanel(p.x,p.y);

    int /*float*/ dir = osd_winddirection;

    if (dir < 0){
        dir+=360;
    }
    nor_osd_windspeed = osd_windspeed * 0.010 + nor_osd_windspeed * 0.990;    

    if(has_sign(p))
	osd_write(0x1d);

    showArrow(grad_to_sect(dir - osd_heading),1); //print data to OSD
}

/* **************************************************************** */
// Panel  : panCur_A
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panCur_A(point p){
    OSD::setPanel(p.x,p.y);

    if(has_sign(p))
	osd_write(0xbd);

    osd_printf_1(PSTR("%5.2f\x0e"), (float(osd_curr_A) * 0.01));
}

/* **************************************************************** */
// Panel  : panAlt
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panAlt(point p){
    OSD::setPanel(p.x,p.y);

    if(has_sign(p))
	osd_write(0x11);
	
    printDist(osd_alt_gps/1000.0 * pgm_read_float(&measure->converth));

}

/* **************************************************************** */
// Panel  : panClimb
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panClimb(point p){
    OSD::setPanel(p.x,p.y);

    if(has_sign(p))
	osd_write(0x15);

    osd_printf_2(PSTR("%4.0f%c"), int(vs) * 1.0, pgm_read_byte(&measure->climbchar));
}

/* **************************************************************** */
// Panel  : panHomeAlt
// Needs  : X, Y locations
// Output : Alt symbol and home altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panHomeAlt(point p){
    OSD::setPanel(p.x,p.y);

    if(has_sign(p))
	osd_write( 0x12);
	
    printDist(osd_alt_rel * pgm_read_float(&measure->converth));
}

void printSpeed(float s){
    osd_printf_2(PSTR("%3.0f%c"),s,pgm_read_byte(&measure->spe));

}

/* **************************************************************** */
// Panel  : panVel
// Needs  : X, Y locations
// Output : Velocity value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panVel(point p){
    OSD::setPanel(p.x,p.y);


    if(has_sign(p))
        osd_write(0x14);
        
    printSpeed(cnvGroundSpeed());
}

/* **************************************************************** */
// Panel  : panAirSpeed
// Needs  : X, Y locations
// Output : Airspeed value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panAirSpeed(point p){
    OSD::setPanel(p.x,p.y);

    if(has_sign(p))
        osd_write(0x13);
    
    printSpeed(osd_airspeed * pgm_read_float(&measure->converts));
}

/* **************************************************************** */

#define WARNINGS 6

uint8_t warning;

void check_warn()
{
    uint8_t wmask = 0;
    uint8_t bit, prev_warn;


 if (!lflags.one_sec_timer_switch) return;
    lflags.one_sec_timer_switch=0;

//1
 if ((osd_fix_type) < 2) 
    wmask |= 1;

//2    
 if (sets.model_type==0 && osd_airspeed * pgm_read_float(&measure->converts) < sets.stall && lflags.takeofftime == 1) // plane
    wmask |= 2;

//3    
 if (sets.overspeed && (osd_airspeed * pgm_read_float(&measure->converts)) > (float)sets.overspeed) 
    wmask |= 4;

//4
 if (sets.batt_warn_level != 0 && osd_vbat_A/1000.0 < (float)sets.battv/10.0 || (osd_battery_remaining_A < sets.batt_warn_level))
    wmask |= 8;

//5
    // не сырое значение  
 if (!(sets.RSSI_raw%2) && rssi < sets.rssi_warn_level )
    wmask |= 16;

//6
 if (sets.model_type==1 && sets.stall >0 && abs(vs) > sets.stall * 10 ) // copter - vertical speed
    wmask |= 32;
    
 if(wmask == 0) 
    warning = 0;
 else {
    prev_warn = warning;
    if(warning == 0) warning = 1;
    else             warning = prev_warn+1;

    bit = 1 << (warning-1);

    while(1) {
        if(warning >= WARNINGS+1) {
	    warning = 1;
	    bit = 1;
        }
        if(wmask&bit) break;
        warning++;
        bit <<= 1;
    }
    /* stay blank for one cycle for single warning */
    if(warning == prev_warn) warning = 0;
 }

    if (wmask && sets.auto_screen_switch < 3)
	lflags.canswitch = 0;
    else 
	lflags.canswitch = 1;
}

// Panel  : panWarn
// Needs  : X, Y locations
// Output : Airspeed value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done


void panWarn(point p){
    OSD::setPanel(p.x,p.y);

    PGM_P w;

    check_warn();

    switch(warning) {
    case 1:
        w=PSTR("\x20\x4E\x6F\x20\x47\x50\x53\x20\x66\x69\x78\x21"); //No GPS fix!
        break;
    case 2:
        w=PSTR("\x20\x20\x20\x53\x74\x61\x6c\x6c\x21\x20\x20\x20"); // Stall!
        break;
    case 3:
        w=PSTR("\x20\x4f\x76\x65\x72\x53\x70\x65\x65\x64\x21\x20"); //Over Speed!
        break;
    case 4:
        w=PSTR("\x42\x61\x74\x74\x65\x72\x79\x20\x4c\x6f\x77\x21"); //Battery Low!
        break;
    case 5:
        w=PSTR("\x20\x20\x4c\x6f\x77\x20\x52\x73\x73\x69\x20\x20"); //Low Rssi
        break;
    case 6:
        w=PSTR("\x48\x69\x67\x68\x20\x56\x53\x70\x65\x65\x64\x21"); //Hi VSpeed!
        break;
    default:
        w=strclear;// PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20"); //Blank line
    }
    
    osd.print_P(w);
}



/* **************************************************************** */
// Panel  : panThr
// Needs  : X, Y locations
// Output : Throttle value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panThr(point p){
    OSD::setPanel(p.x,p.y);

    osd_printi_1(PSTR("%3.0i\x25"),osd_throttle);
}

/* **************************************************************** */
// Panel  : panBatteryPercent
// Needs  : X, Y locations
// Output : Battery state from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panBatteryPercent(point p){
    OSD::setPanel(p.x,p.y);

//    if(has_sign(p))
    osd_write(0x88); // донышко батарейки не зависит от

    if (flags.OSD_BATT_SHOW_PERCENT){
//        osd.printf_P(PSTR("\x17%3.0i\x25"), 0x17, osd_battery_remaining_A, 0x25);
      osd.printf_P(PSTR("%c%c\x8e%i%%"), osd_battery_pic_A[0], osd_battery_pic_A[1], osd_battery_remaining_A/255*100);

    }else{
//        osd.printf_P(PSTR("%c%4.0f%c"), 0x17, mah_used, 0x01);
        osd.printf_P(PSTR("%c%c\x8e%4.0f\x01"), osd_battery_pic_A[0], osd_battery_pic_A[1], mah_used);
    }


}

/* **************************************************************** */
// Panel  : panTime
// Needs  : X, Y locations
// Output : Time from start with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panTime(point p){
    OSD::setPanel(p.x,p.y);

    printTime(total_flight_time_milis / 1000);
}

/* **************************************************************** */
// Panel  : panHomeDis
// Needs  : X, Y locations
// Output : Home Symbol with distance to home in meters
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panHomeDis(point p){
    OSD::setPanel(p.x,p.y);

    if(has_sign(p))
	osd_write(0x0b);

    printFullDist(osd_home_distance);
}


/* **************************************************************** */
// Panel  : panHorizon
// Needs  : X, Y locations
// Output : 5 x 12 Horizon line surrounded by 2 cols (left/right rules)
// Size   : 5 x 14  (rows x chars)
// Staus  : done

const char str_hud[] PROGMEM  = "\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3|";

void panHorizon(point p){
    OSD::setPanel(p.x,p.y);

  
  // сначала очистим и нарисуем стрелочки.
//    const char p=

    if(flags.flgHUD) {
        osd.print_P(str_hud);
        osd.print_P(str_hud);
        osd.print_P(PSTR("\xC6\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xC5|"));
        osd.print_P(str_hud);
        osd.print_P(str_hud);
    } else {

	for(byte j=5; j!=0; j--) {
	    for(byte i=14; i!=0; i--)
		osd.write(' ');
	    osd.write('|');
	}

    }
                      
    showHorizon(p.x + 1, p.y);

    //Show ground level on  HUD
    if(flags.ils_on)
	showILS(p.x, p.y);

    if(flags.radar_on)
	showRADAR(p.x+6, p.y+2);


    if(has_sign(p)) {
	// Птичка по центру
	OSD::setPanel(p.x+6, p.y+2);
	osd.print_P(PSTR("\xb8\xb9"));
    }
}

/* **************************************************************** */
// Panel  : panPitch
// Needs  : X, Y locations
// Output : -+ value of current Pitch from vehicle with degree symbols and pitch symbol
// Size   : 1 x 6  (rows x chars)
// Staus  : done

void panPitch(point p){
    OSD::setPanel(p.x,p.y);

//Serial.printf_P(PSTR("pitch=%f\n"), (float)osd_pitch ); Serial.wait();

    osd_printi_1(PSTR("%4i\x05\x07"),osd_pitch);
}

/* **************************************************************** */
// Panel  : panRoll
// Needs  : X, Y locations
// Output : -+ value of current Roll from vehicle with degree symbols and roll symbol
// Size   : 1 x 6  (rows x chars)
// Staus  : done

void panRoll(point p){
    OSD::setPanel(p.x,p.y);

    osd_printi_1(PSTR("%4i\x05\x06"),osd_roll);
}

/* **************************************************************** */
// Panel  : panBattery A (Voltage 1)
// Needs  : X, Y locations
// Output : Voltage value as in XX.X and symbol of over all battery status
// Size   : 1 x 8  (rows x chars)
// Staus  : done


void printVolt(uint16_t v) {
    osd_printf_1(PSTR("%5.2f\x0D"), v/1000.0);
}

void panBatt_A(point p){
    OSD::setPanel(p.x,p.y);


/*************** This commented code is for the next ArduPlane Version
    if(osd_battery_remaining_A > 100){
        osd.printf(" %c%5.2f%c", 0xbc, (double)osd_vbat_A/1000.0, 0x0d);
    else osd.printf("%c%5.2f%c%c", 0xbc, (double)osd_vbat_A/1000.0, 0x0d, osd_battery_pic_A);
    */

//    osd.printf_P(PSTR("\xBC%5.2f\x0D"), (double)osd_vbat_A/1000.0);
    if(has_sign(p))
	osd_write(0xBC);

    printVolt(osd_vbat_A);
}


/* **************************************************************** */
// Panel  : panBattery B (Voltage 2)
// Needs  : X, Y locations
// Output : Voltage value as in XX.X and symbol of over all battery status
// Size   : 1 x 8  (rows x chars)
// Staus  : done

void panBatt_B(point p){
    OSD::setPanel(p.x,p.y);


/*************** This commented code is for the next ArduPlane Version
    if(osd_battery_remaining_B > 100){
        osd.printf(" %c%5.2f%c", 0xbc, (double)osd_vbat_B/1000.0, 0x0d);
    else osd.printf("%c%5.2f%c%c", 0xbc, (double)osd_vbat_B/1000.0, 0x0d, osd_battery_pic_B);
    */
    if(has_sign(p))
	osd_write(0x26);

    printVolt(osd_vbat_B);
}




//------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

void panWaitMAVBeats(){


//    OSD::setPanel(11,7);
//    osd.print(seconds);

    OSD::setPanel(5,9);
    osd.print_P(PSTR("No input data! "));

#ifdef DEBUG
    extern int packet_drops;
    extern long bytes_comes;
    osd.printf_P(PSTR("||drops=%d bytes=%ld"),packet_drops, bytes_comes);
#endif
}


/* **************************************************************** */
// Panel  : panGPSats
// Needs  : X, Y locations
// Output : 1 symbol and number of locked satellites
// Size   : 1 x 5  (rows x chars)
// Staus  : done

void panGPSats(point p){
    OSD::setPanel(p.x,p.y);

    byte gps_str = 0x2a;

    if (osd_fix_type == 2) gps_str = 0x1f;
    if (osd_fix_type == 3) gps_str = 0x0f;

    if ((eph >= 200) && lflags.blinker)
       gps_str = 0x20;

    if(has_sign(p))
	osd_write(gps_str);

    osd_printi_1(PSTR("%2i"), osd_satellites_visible);
}

/* **************************************************************** */
// Panel  : panGPS
// Needs  : X, Y locations
// Output : two row numeric value of current GPS location with LAT/LON symbols as on first char
// Size   : 2 x 12  (rows x chars)
// Staus  : done

void NOINLINE print_GPS(PGM_P f){
    if(osd_lon && osd_lat) // не выводим координат если нету
	osd.printf_P(f, (double)osd_lat, (double)osd_lon);
}

void panGPS(point p){
    OSD::setPanel(p.x,p.y);

    PGM_P f;

    if(has_sign(p))
	f=PSTR("\x03%10.6f|\x04%10.6f");
    else 
	f=PSTR("%10.6f|%10.6f");

    //osd.printf_P(f, (double)osd_lat, (double)osd_lon);
    print_GPS(f);
}

/* **************************************************************** */
// Panel  : panGPS2
// Needs  : X, Y locations
// Output : one row numeric value of current GPS location with LAT/LON symbols as on first char
// Size   : 1 x 25  (rows x chars)
// Staus  : done

void panGPS2(point p){
    OSD::setPanel(p.x,p.y);

    PGM_P f;

    if(has_sign(p))
	f=PSTR("\x03%10.6f \x04%10.6f");
    else
    	f=PSTR("%10.6f %10.6f");

//    osd.printf_P(f, (double)osd_lat, (double)osd_lon);
    print_GPS(f);

}

/* **************************************************************** */
// Panel  : panHeading
// Needs  : X, Y locations
// Output : Symbols with numeric compass heading value
// Size   : 1 x 5  (rows x chars)
// Staus  : not ready

void panHeading(point p){
    OSD::setPanel(p.x,p.y);

    osd_printi_1(PSTR("%4i\x05"), (int)osd_heading);
}

/* **************************************************************** */
// Panel  : panRose
// Needs  : X, Y locations
// Output : a dynamic compass rose that changes along the heading information
// Size   : 2 x 13  (rows x chars)
// Staus  : done

void panRose(point p){
 // generate the heading patern
    char buf_show[14];

    const char buf_Rule[] PROGMEM = {
      0x82,0x80,0x81,0x80,0x81,0x80,
      0x84,0x80,0x81,0x80,0x81,0x80,
      0x83,0x80,0x81,0x80,0x81,0x80,
      0x85,0x80,0x81,0x80,0x81,0x80
     };

    int start = (osd_heading * 24+12)/360 - 4;
 
// Serial.printf_P(PSTR("Rose start=%d\n"), start);
 
    if(start < 0) start += 24;

// Serial.printf_P(PSTR("Rose 2 start=%d\n"), start);
  
    char *c=buf_show;
    uint8_t x;
//  *c++=0xc3;
    for(x=9; x != 0; x--){
        *c++ = buf_Rule[start];
        if(++start >= 24) start = 0;
    }
//  *c++ = 0x87;
    *c++ = '\0';

// Serial.printf_P(PSTR("Rose buf=%s\n"), buf_show);

    OSD::setPanel(p.x,p.y);

    if(has_sign(p))
	osd.print_P(PSTR( "\x20\xc7\xc7\xc7\xc7\x2e\xc7\xc7\xc7\xc7\x20|"));
    osd.printf_P(PSTR("\xc3%s\x87"), buf_show);
//    osd.printf(buf_show);
//    osd.print(buf_show);

}


int getTargetBearing(){
    if (wp_target_bearing < 0)
	wp_target_bearing+=360;
    return grad_to_sect((float)wp_target_bearing - osd_heading); //Convert to int 1-16 
}

/* **************************************************************** */
// Panel  : panWPDir
// Needs  : X, Y locations
// Output : 2 symbols that are combined as one arrow, shows direction to next waypoint
// Size   : 1 x 2  (rows x chars)
// Staus  : not ready

void panWPDir(point p){
    OSD::setPanel(p.x,p.y);

   
//    int wp_target_bearing_rotate = round(((float)wp_target_bearing - osd_heading)/360 * 16) + 1; //Convert to int 1-16 

    showArrow(getTargetBearing(),0);
}

/* **************************************************************** */
// Panel  : panWPDis
// Needs  : X, Y locations
// Output : W then distance in Km - Distance to next waypoint
// Size   : 1 x 2  (rows x chars)
// Staus  : OK

void panWPDis(point p){
    OSD::setPanel(p.x,p.y);

    if (xtrack_error > 999)  xtrack_error = 999;
    if (xtrack_error < -999) xtrack_error = -999;

    if(has_sign(p))
	osd_write(0x5c);

    byte h=pgm_read_byte(&measure->high);

    osd.printf_P(PSTR("%2i %4.0f%c|"), wp_number,((float)wp_dist * pgm_read_float(&measure->converth)), h);
    showArrow(getTargetBearing(), 0);

    if (osd_mode == 10){ // auto
        osd_printf_2(PSTR("\x20\x58\x65%4.0f%c"), (xtrack_error * pgm_read_float(&measure->converth)), h);
    }else{
        osd.print_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20"));
    }
}

/* **************************************************************** */
// Panel  : panHomeDir
// Needs  : X, Y locations
// Output : 2 symbols that are combined as one arrow, shows direction to home
// Size   : 1 x 2  (rows x chars)
// Status : not tested

void panHomeDir(point p){
    OSD::setPanel(p.x,p.y);

    showArrow((int)osd_home_direction,0);
}

/* **************************************************************** */
// Panel  : panFlightMode 
// Needs  : X, Y locations
// Output : 2 symbols, one static name symbol and another that changes by flight modes
// Size   : 1 x 2  (rows x chars)
// Status : done


const char PROGMEM u_mode00[] = "manu";    // MANUAL
const char PROGMEM u_mode01[] = "stb1";    // STABILIZED1
const char PROGMEM u_mode02[] = "stb2";    // STABILIZED2
const char PROGMEM u_mode03[] = "stb3";    // STABILIZED3
const char PROGMEM u_mode04[] = "stb4";    // STABILIZED4
const char PROGMEM u_mode05[] = "stb5";    // STABILIZED5
const char PROGMEM u_mode06[] = "stb6";    // STABILIZED6
const char PROGMEM u_mode07[] = "posh";    // POSITIONHOLD
const char PROGMEM u_mode08[] = "cl  ";    // COURSELOCK
const char PROGMEM u_mode09[] = "posr";    // POSITIONROAM
const char PROGMEM u_mode10[] = "hl  ";    // HOMELEASH
const char PROGMEM u_mode11[] = "pa  ";    // ABSOLUTEPOSITION
const char PROGMEM u_mode12[] = "rtl ";    // RETURNTOBASE
const char PROGMEM u_mode13[] = "land";    // LAND
const char PROGMEM u_mode14[] = "pp  ";    // PATHPLANNER
const char PROGMEM u_mode15[] = "poi ";    // POI
const char PROGMEM u_mode16[] = "ac  ";    // AUTOCRUISE
const char PROGMEM u_mode17[] = "atof";    // AUTOTAKEOFF

char const * const mode_u_strings[] PROGMEM ={ 
    u_mode00, u_mode01, u_mode02, u_mode03, u_mode04, 
    u_mode05, u_mode06, u_mode07, u_mode08, u_mode09, 
    u_mode10, u_mode11, u_mode12, u_mode13, u_mode14,
    u_mode15, u_mode16, u_mode17
};

#ifdef IS_COPTER
const char PROGMEM s_mode00[] = "stab"; //Stabilize	0
const char PROGMEM s_mode01[] = "acro"; //Acrobatic	1
const char PROGMEM s_mode02[] = "alth"; //Alt Hold	2
const char PROGMEM s_mode03[] = "auto"; //Auto		3
const char PROGMEM s_mode04[] = "guid"; //Guided		4
const char PROGMEM s_mode05[] = "loit"; //Loiter		5
const char PROGMEM s_mode06[] = "rtl "; //Return to Launch 6
const char PROGMEM s_mode07[] = "circ"; //Circle		7
const char PROGMEM s_mode08[] = "posh"; //Position Hold (Old) 8
const char PROGMEM s_mode09[] = "land"; //Land		9
const char PROGMEM s_mode10[] = "oflo"; //OF_Loiter 	10
const char PROGMEM s_mode11[] = "drif"; //Drift		11
const char PROGMEM s_mode12[] = "m 12"; //              12
const char PROGMEM s_mode13[] = "sprt"; //Sport		13
const char PROGMEM s_mode14[] = "flip"; //Flip		14
const char PROGMEM s_mode15[] = "tune"; //Tune		15
const char PROGMEM s_mode16[] = "hold"; //Position Hold (Earlier called Hybrid) 16

char const * const mode_c_strings[] PROGMEM ={ 
    s_mode00, s_mode01, s_mode02, s_mode03, s_mode04, 
    s_mode05, s_mode06, s_mode07, s_mode08, s_mode09, 
    s_mode10, s_mode11, s_mode12, s_mode13, s_mode14,
    s_mode15, s_mode16
};
#endif

#ifdef IS_PLANE
const char PROGMEM p_mode01[] = "manu"; //Manual
const char PROGMEM p_mode02[] = "circ"; //CIRCLE
const char PROGMEM p_mode03[] = "stab"; //Stabilize
const char PROGMEM p_mode04[] = "trai"; //Training
const char PROGMEM p_mode05[] = "acro"; //ACRO
const char PROGMEM p_mode06[] = "fbwa"; //FLY_BY_WIRE_A
const char PROGMEM p_mode07[] = "fbwb"; //FLY_BY_WIRE_B
const char PROGMEM p_mode08[] = "cruz"; //Cruise
const char PROGMEM p_mode09[] = "atun"; //autotune
const char PROGMEM p_mode10[] = "auto"; //AUTO
const char PROGMEM p_mode11[] = "rtl "; //Return to Launch
const char PROGMEM p_mode12[] = "loit"; //Loiter
const char PROGMEM p_mode13[] = "m_13"; 
const char PROGMEM p_mode14[] = "m_14"; 
const char PROGMEM p_mode15[] = "guid"; //GUIDED
const char PROGMEM p_mode16[] = "init"; //initializing


const char * const mode_p_strings[] PROGMEM ={ 
    p_mode01, p_mode02, p_mode03, p_mode04, p_mode05, 
    p_mode06, p_mode07, p_mode08, p_mode09, p_mode10, 
    p_mode11, p_mode12, p_mode13, p_mode14, p_mode15, p_mode16
};

#endif

void panFlightMode(point p){
    OSD::setPanel(p.x,p.y);


    if(has_sign(p))
        osd_write( 0x7F);

    PGM_P mode_str;

    if(lflags.uavtalk_active) {
	mode_str = (PGM_P)pgm_read_word(&mode_u_strings[osd_mode]);
    } else {
#ifdef IS_COPTER
 #ifdef IS_PLANE
    if(sets.model_type==0) {
	mode_str = (PGM_P)pgm_read_word(&mode_p_strings[osd_mode]);
    } else {
	mode_str = (PGM_P)pgm_read_word(&mode_c_strings[osd_mode]);
    }

 #else
	mode_str = (PGM_P)pgm_read_word(&mode_c_strings[osd_mode]);
 #endif    
#else
 #ifdef IS_PLANE
	mode_str = (PGM_P)pgm_read_word(&mode_p_strings[osd_mode]);
 #endif    
#endif
    }
    
    osd.print_P(mode_str);
    osd_write( lflags.motor_armed ? 0x86:' ');
}


// ---------------- EXTRA FUNCTIONS ----------------------
// Show those fancy 2 char arrows
void showArrow(uint8_t rotate_arrow,uint8_t method){
    char arrow_set1 = 0x90;


    while(rotate_arrow>16) rotate_arrow -= 16;
    while(rotate_arrow<1)  rotate_arrow += 16;
    
//    rotate_arrow &= 0x0f;

    arrow_set1 += rotate_arrow * 2 - 2;

    if(method == 1) {     
	printSpeed(osd_windspeed * pgm_read_float(&measure->converts));
	osd.printf_P(PSTR("|%c%c%2.0f%c"), arrow_set1, arrow_set1 + 1, (double)(nor_osd_windspeed * pgm_read_float(&measure->converts)),pgm_read_byte(&measure->spe));
    }else if(method == 2) osd.printf_P(PSTR("%c%c%4i\x05"), arrow_set1, arrow_set1 + 1, off_course);
    else 		  osd.printf_P(PSTR("%c%c"),        arrow_set1, arrow_set1 + 1);
}

// Calculate and shows Artificial Horizon
// Smooth horizon by Jörg Rothfuchs
							// with different factors we can adapt do different cam optics
#define AH_PITCH_FACTOR0	0.010471976		// conversion factor for pitch
#define AH_ROLL_FACTOR0		0.017453293		// conversion factor for roll
#define AH_COLS			12			// number of artificial horizon columns
#define AH_ROWS			5			// number of artificial horizon rows
#define CHAR_COLS		12			// number of MAX7456 char columns
#define CHAR_ROWS		18			// number of MAX7456 char rows
#define CHAR_SPECIAL		9			// number of MAX7456 special chars for the artificial horizon
#define AH_TOTAL_LINES		AH_ROWS * CHAR_ROWS	// helper define


#define LINE_SET_STRAIGHT__	(0xC7 - 1)		// code of the first MAX7456 straight char -1
#define LINE_SET_STRAIGHT_O	(0xD0 - 3)		// code of the first MAX7456 straight overflow char -3
#define LINE_SET_P___STAG_1	(0xD1 - 1)		// code of the first MAX7456 positive staggered set 1 char -1
#define LINE_SET_P___STAG_2	(0xDA - 1)		// code of the first MAX7456 positive staggered set 2 char -1
#define LINE_SET_N___STAG_1	(0xE3 - 1)		// code of the first MAX7456 negative staggered set 1 char -1
#define LINE_SET_N___STAG_2	(0xEC - 1)		// code of the first MAX7456 negative staggered set 2 char -1
#define LINE_SET_P_O_STAG_1	(0xF5 - 2)		// code of the first MAX7456 positive overflow staggered set 1 char -2
#define LINE_SET_P_O_STAG_2	(0xF9 - 1)		// code of the first MAX7456 positive overflow staggered set 2 char -1
#define LINE_SET_N_O_STAG_1	(0xF7 - 2)		// code of the first MAX7456 negative overflow staggered set 1 char -2
#define LINE_SET_N_O_STAG_2	(0xFC - 1)		// code of the first MAX7456 negative overflow staggered set 2 char -1


#define OVERFLOW_CHAR_OFFSET	6			// offset for the overflow subvals


#define ANGLE_1			9			// angle above we switch to line set 1
#define ANGLE_2			25			// angle above we switch to line set 2


// Calculate and show artificial horizon
// used formula: y = m * x + n <=> y = tan(a) * x + n
void showHorizon(byte start_col, byte start_row) {
    byte col, row;
    int pitch_line, middle, hit, subval;
    int roll;
    int line_set = LINE_SET_STRAIGHT__;
    int line_set_overflow = LINE_SET_STRAIGHT_O;
    int subval_overflow = 9;



    float AH_PITCH_FACTOR, // conversion factor for pitch
	  AH_ROLL_FACTOR ; // conversion factor for roll
    
    // NTSC: osd.getMode() == 0
    if(osd.getMode() == 0) { // ntsc
	AH_PITCH_FACTOR = sets.horiz_kRoll_a  * AH_PITCH_FACTOR0;
	AH_ROLL_FACTOR  = sets.horiz_kPitch_a * AH_ROLL_FACTOR0;
    } else {
	AH_PITCH_FACTOR = sets.horiz_kRoll    * AH_PITCH_FACTOR0;
	AH_ROLL_FACTOR  = sets.horiz_kPitch   * AH_ROLL_FACTOR0;
    }


    // preset the line char attributes
    roll = osd_roll;
    if ((roll >= 0 && roll < 90) || (roll >= -179 && roll < -90)) {	// positive angle line chars
	roll = roll < 0 ? roll + 179 : roll;
        if (abs(roll) > ANGLE_2) {
	    line_set = LINE_SET_P___STAG_2;
	    line_set_overflow = LINE_SET_P_O_STAG_2;
            subval_overflow = 7;
	} else if (abs(roll) > ANGLE_1) {
	    line_set = LINE_SET_P___STAG_1;
	    line_set_overflow = LINE_SET_P_O_STAG_1;
            subval_overflow = 8;
	}
    } else {								// negative angle line chars
	roll = roll > 90 ? roll - 179 : roll;
        if (abs(roll) > ANGLE_2) {
	    line_set = LINE_SET_N___STAG_2;
	    line_set_overflow = LINE_SET_N_O_STAG_2;
            subval_overflow = 7;
	} else if (abs(roll) > ANGLE_1) {
	    line_set = LINE_SET_N___STAG_1;
	    line_set_overflow = LINE_SET_N_O_STAG_1;
            subval_overflow = 8;
	}
    }
    
    pitch_line = round(tan(-AH_PITCH_FACTOR * osd_pitch) * AH_TOTAL_LINES) + AH_TOTAL_LINES/2;	// 90 total lines
    for (col=1; col<=AH_COLS; col++) {
        middle = col * CHAR_COLS - (AH_COLS/2 * CHAR_COLS) - CHAR_COLS/2;	  // -66 to +66	center X point at middle of each column
        hit = tan(AH_ROLL_FACTOR * osd_roll) * middle + pitch_line;	          // 1 to 90	calculating hit point on Y plus offset
        if (hit >= 1 && hit <= AH_TOTAL_LINES) {
	    row = (hit-1) / CHAR_ROWS;						  // 0 to 4 bottom-up
	    subval = (hit - (row * CHAR_ROWS) + 1) / (CHAR_ROWS / CHAR_SPECIAL);  // 1 to 9
	    
	    // print the line char
            OSD::write_xy(start_col + col - 1, start_row + AH_ROWS - row - 1, line_set + subval);
	    
	    // check if we have to print an overflow line char
	    if (subval >= subval_overflow && row < 4) {	// only if it is a char which needs overflow and if it is not the upper most row
                OSD::write_xy(start_col + col - 1, start_row + AH_ROWS - row - 2, line_set_overflow + subval - OVERFLOW_CHAR_OFFSET);
	    }
        }
    }
}


void showILS(byte start_col, byte start_row) {
//    OSD::setPanel(start_col, start_row);


    // Calculate and shows ILS
    
    //now ILS in dimensions of Horizon
    
    if(sets.model_type==0) { // plane

/*	OSD::setPanel(start_col + AH_COLS + 2, start_row);
	osd.printf_P(PSTR("\x20|"
			  "\x20|"
			  "\x20|"
			  "\x20|"
			  "\x20"));

	OSD::setPanel(start_col, start_row + AH_ROWS + 1);
        osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20"));
*/

      //Vertical calculation
        int currentAngleDisplacement = atan2(osd_alt_to_home, osd_home_distance) * 57.2957795 - 10;
        //Calc current char position.
        //int numberOfPixels = CHAR_ROWS * AH_ROWS;
        int totalNumberOfLines = 9 * AH_ROWS; //9 chars in chartset for vertical line
        int linePosition = totalNumberOfLines * currentAngleDisplacement / 10 + (totalNumberOfLines / 2); //+-5 degrees
        int charPosition = linePosition / 9;
        int selectedChar = 9 - (linePosition % 9) + 0xC7;
        if(charPosition >= 0 && charPosition <= CHAR_ROWS) {
          OSD::write_xy(start_col + AH_COLS, start_row + charPosition, selectedChar); // в первой и последней колонке
          OSD::write_xy(start_col + 1,       start_row + charPosition, selectedChar);
        }

      //Horizontal calculation
        currentAngleDisplacement = osd_home_direction - takeoff_heading;
        //Horizontal calculation
        totalNumberOfLines = 6 * AH_COLS; //6 chars in chartset for vertical line
        linePosition = totalNumberOfLines * currentAngleDisplacement / 10 + (totalNumberOfLines / 2); //+-5 degrees
        charPosition = linePosition / 6;
        selectedChar = (linePosition % 6) + 0xBF;
        if(charPosition >= 0 && charPosition <= CHAR_COLS)  {
          OSD::write_xy(start_col + charPosition, start_row + AH_ROWS-1, selectedChar ); // в первой и последней строке
          OSD::write_xy(start_col + charPosition, start_row + 1, selectedChar );
        }
    } else { // copter
    
        //Show line on panel center because horizon line can be
        //high or low depending on pitch attitude

	// cls
/*	osd.print_P(PSTR("\x20|"
			 "\x20|"
			 "\x20|"
			 "\x20|"
			 "\x20"));
*/

        char subval_char = 0xCF;

        char alt = (osd_alt_rel * pgm_read_float(&measure->converth) + 5) * 4.4; //44 possible position 5 rows times 9 chars

        if((alt < 44) && (alt > 0)){
            //We have 9 possible chars
            //% 9 -> Represents our 9 possible characters
            // 8 - -> Inverts our selected char because when we gain altitude
            //the selected char has a lower position in memory
            //+ C7 -> Is the memory displacement od the first altitude charecter 

            subval_char = (8 - (alt  % 9)) + 0xC7; // 9 уровней C7-CF
            //Each row represents 9 altitude units
            start_row += (alt / 9);
        }
        else if(alt >= 44){
            //Copter is too high. Ground is way too low to show on panel, 
            //so show down arrow at the bottom
            subval_char =0x2E; // 0xC8; C8 сейчас это совсем не стрелка
            start_row += 4;
        }

	start_col += AH_COLS / 2; // middle of horizon

        //Enough calculations. Let's show the result
        OSD::write_xy(start_col + AH_COLS / 2, start_row, subval_char);
    }

}

/******************************************************************/
// Panel  : panUAVPosition
// Needs  : X, Y locations of center
// Needs  : globals: osd_home_lat, osd_lat, osd_home_lon, osd_lon
// Output : shows the UAV position in a radar like style
// Status : do flight test
/******************************************************************/

#define	STEP_WIDTH	250			// every STEP_WIDTH in [m] it is down-scaled
#define	SCALE_X		(7.0 / STEP_WIDTH)	// SCALE_X * 2 chars grid in which the uav is drawed
#define	SCALE_Y		(4.5 / STEP_WIDTH)	// SCALE_Y * 2 chars grid in which the uav is drawed

void showRADAR(byte center_col, byte center_line) {

// символы квадрика с ориентацией
    byte arr[] PROGMEM = {0xb0, 0xb1, 0xb4, 0xb5, 0xb6, 0xb7, 0x7b, 0x7d };

#define RADAR_CHAR	0x1F			// code of the radar symbol
    
    int index = (int)((osd_heading + 22.5) / 45.0);
    index = index > 7 ? 0 : index;


    // calculate distances from home in lat (y) and lon (x) direction in [m]
//    int dst_y = (int)(-111319.5 * (osd_home_lat - osd_lat));
//    int dst_x = (int)(-111319.5 * (osd_home_lon - osd_lon) * cos(fabs(osd_home_lat) * 0.0174532925));
    
    // calculate display offset in y and x direction
    int zoom = max((int)(abs(dst_y) / STEP_WIDTH), (int)(abs(dst_x) / STEP_WIDTH)) + 1;
    
    if(is_on(panel.RadarScale)) { // да, можно независимо отключить!
        OSD::setPanel(panel.RadarScale.x, panel.RadarScale.y);

	if(has_sign(panel.RadarScale))
	    osd_write(RADAR_CHAR);
	
	float dd=zoom * STEP_WIDTH * pgm_read_float(&measure->converth);
	if(zoom>=40){ // 10 000 
	    osd_printf_2(PSTR("%4.2f%c"), (float)(dd/1000.0), pgm_read_byte(&measure->distchar));
	} else
            osd.printf_P(PSTR("%4i%c"), (int)(dd), pgm_read_byte(&measure->high));
    }

    byte y = (int)(dst_y / (zoom / SCALE_Y));
    byte x = (int)(dst_x / (zoom / SCALE_X) + 0.5);	// for even grid correction

    // show UAV
    OSD::write_xy(center_col + x, center_line - y, arr[index]);


    if(flags.flgTrack){
	static Point trk[4];
	if(trk[0].x !=x || trk[0].y !=y){	// положение изменилось
	    for(byte i=4; i!=1;){
		i--;
		trk[i] = trk[i-1]; // move points to end

		OSD::write_xy(center_col + x, center_line - y, arr[index]);
	    }
	    trk[0].x =x;
	    trk[0].y =y;
	}
	for(byte i=3; i!=0;i--){
	    OSD::write_xy(center_col + trk[i].x, center_line - trk[i].y, 0x24);
	}
    }


    // show home
//    OSD::setPanel(center_col, center_line);
//    osd.printf_P(PSTR("\xF5\xF6"));
}





//* **************************************************************** */
// Panel  : panTune
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done
    
void panTune(point p){
    OSD::setPanel(p.x,p.y);


#ifdef IS_COPTER
                osd.printf_P(PSTR("\x4E\x52%2.0f\x05|\x4E\x50%2.0f\x05|\x4E\x48%4.0i\x05|\x54\x42%4.0i\x05|\x41\x45%3.0f%c|\x58\x45%3.0f\x6D|\x41\x45%3.0f%c"), 
            				(nav_roll), 
				    			(nav_pitch), 
				    					     (nav_bearing),  
				    								(wp_target_bearing), 
				    							    			cnvAltError(), pgm_read_byte(&measure->high), 
				    							    		    			(xtrack_error), 
				    							    		    					((aspd_error / 100.0) * pgm_read_float(&measure->converts)), pgm_read_byte(&measure->spe));
#else

    PGM_P f;
 #ifdef IS_PLANE
    if(has_sign(p)) 
        f=PSTR("\x11%3.0f%c|\x15");
    else
	f=PSTR("%3.0f%c|");

    osd_printf_2(f, -cnvAltError(), pgm_read_byte(&measure->high));
    printSpeed(aspd_error / 100.0);
 #endif
#endif
}




/* **************************************************************** */
// Panel  : panCh
// Needs  : X, Y locations
// Output : Scaled channel values from MAVLink
// Size   
// Staus  : done

void panCh(point p){
    OSD::setPanel(p.x,p.y);

    for(byte i=0; i<8;i++)
	osd.printf_P(PSTR("C%d%5i|"), i+1, chan_raw[i] );
}


/* **************************************************************** */
// Panel  : panSetup
// Needs  : Nothing, uses whole screen
// Output : The settings menu
// Size   : 3 x ?? (rows x chars)
// Staus  : done

/* параметры для руления

    switch_mode    режим переключения экранов
    OSD_BRIGHTNESS контраст надписей

    float horiz_kRoll; // коэффициенты горизонта
    float horiz_kPitch;

    float horiz_kRoll_a; // коэффициенты горизонта для NTSC
    float horiz_kPitch_a;

    byte battBv; // мин значение батареи B

    byte vert_offs; // сдвиг экрана по вертикали и горизонтали
    byte horiz_offs;
    
*/

typedef void (*fptr)();

struct Params {
    PGM_P name; 	// наименование
    char type;	// тип (f-float, b - byte etc)
    byte k;		// коэффициент сдвига запятой
    void *value;	// адрес самой переменной
    fptr cb;	// callback для применения параметра
    PGM_P fmt;	// формат печати параметра
    int min;		// диапазон изменения параметра
    int max;
};

struct Setup_screen {
    const Params * const ptr;	// описатель экрана
    byte size;		// его размер
    fptr tail;	// функция отображения остального
};


void renew(){
//Serial.printf_P(PSTR("renew!\n")); Serial.wait();

    OSD::adjust();
}


void setup_horiz(){
//Serial.printf_P(PSTR("horiz!\n")); Serial.wait();
    showHorizon(8 + 1, 6);
}

// в нашем распоряжении 16 строк
static const PROGMEM char n_sets[]        = "      OSD setup ";
static const PROGMEM char n_batt[]        = "Battery warning ";
static const PROGMEM char n_battB[]       = "Batt 2 warning  ";

static const PROGMEM char n_screen[]      = "  Screen params ";
static const PROGMEM char n_scr[]         = "Screens Count   ";
static const PROGMEM char n_contr[]       = "Contrast        ";
static const PROGMEM char n_horiz[]       = "Horizontal offs ";
static const PROGMEM char n_vert[]        = "Vertical offs   ";

static const PROGMEM char n_horizon[]     = "  Horizon angles";
static const PROGMEM char n_k_PitchPAL[]  = "Pitch in PAL    ";
static const PROGMEM char n_k_RollPAL[]   = "Roll  in PAL    ";
static const PROGMEM char n_k_PitchNTSC[] = "Pitch in NTSC   ";
static const PROGMEM char n_k_RollNTSC[]  = "Roll  in NTSC   ";

static const PROGMEM char f_float[]= "%.3f";
static const PROGMEM char f_batt[] = "%3.1f\x76";
static const PROGMEM char f_int[]  = "%.0f";


// первый экран настроек
static const PROGMEM Params params1[] = { 
	{n_sets,    0,   0,  0,           0, 0},        // header
	{n_batt,   'b', 10, &sets.battv , 0, f_batt, 0, 255 },
	{n_battB,  'b', 10, &sets.battBv, 0, f_batt, 0, 255 },
	
	{n_screen,  0,  0,   0,                    0,     0}, // header
	{n_scr,    'b', 1,   &sets.n_screens,      0,     f_int, 1, 4},
	{n_contr,  'b', 1,   &sets.OSD_BRIGHTNESS, renew, f_int, 0, 3},
	{n_horiz,  'c', 1,   &sets.horiz_offs,     renew, f_int, -31, 31 },
	{n_vert,   'c', 1,   &sets.vert_offs,      renew, f_int, -15, 15 },
};

// второй экран - горизонт
static const PROGMEM Params params2[] = { 
	{n_horizon,     'h', 0,   0,                 0, 0}, // header with pal/ntsc string
	{n_k_RollPAL,   'f', 1,   &sets.horiz_kRoll, 0, f_float, 0, 4},
	{n_k_PitchPAL,  'f', 1,   &sets.horiz_kPitch, 0, f_float, 0, 4},
	{n_k_RollNTSC,  'f', 1,   &sets.horiz_kRoll_a, 0, f_float, 0, 4},
	{n_k_PitchNTSC, 'f', 1,   &sets.horiz_kPitch_a, 0, f_float, 0, 4},
};


static const PROGMEM Setup_screen screens[] = {
    {params1, (sizeof(params1)/sizeof(Params)), 0 },
    {params2, (sizeof(params2)/sizeof(Params)), setup_horiz },
    {0,0} // end marker
};

#define SETUP_N_SCREENS (sizeof(screens)/sizeof(Setup_screen) - 1)

static byte setup_menu=1; // номер строки меню
static byte setup_screen=0; // номер экрана меню
static uint32_t text_timer; // время прошлого входа в меню
static uint16_t chan1_raw_middle, chan2_raw_middle; // запомненные при входе значения каналов 1 и 2
static uint16_t chan3_raw_middle, chan4_raw_middle; // запомненные при входе значения каналов 3 и 4
const Params *params; // указатель на текущий набор параметров

const Setup_screen *pscreen;


void move_menu(char dir){


    byte n= pgm_read_byte((void *)&pscreen->size) -1;

again:
    
    if(      dir < 0 && setup_menu == 0) setup_menu = n;	// цикл по параметрам,
    else if( dir > 0 && setup_menu == n) setup_menu = 0;
    else setup_menu +=dir;

    if(!pgm_read_word((void *)&params[setup_menu].value) ) goto again; // если нет связанной переменной то еще шаг - пропускаем заголовок

    lflags.got_data=1; // renew screen
}

void move_screen(char dir){

    setup_menu=1;

    byte n=SETUP_N_SCREENS - 1;


    if(     dir < 0 && setup_screen == 0)  setup_screen = n;	// цикл по экранам,
    else if(dir > 0 && setup_screen == n)  setup_screen = 0;
    else setup_screen +=dir;

    lflags.got_data=1; // renew screen
}

#define SETUP_START_ROW 1


// TODO задействовать второй джойстик для переключения экранов
void panSetup(){

    const Params *p;
    float v;
    byte size;
    byte type;
    float inc = 0;
    byte col;
    char *nm;
    int min, max;
    byte k;


    pscreen = &screens[setup_screen];

    params = (const Params *)pgm_read_word((void *)&pscreen->ptr);
    size = pgm_read_byte((void *)&pscreen->size);

    if (chan1_raw_middle == 0 && chan2_raw_middle == 0 && chan4_raw_middle == 0){
        chan1_raw_middle = chan_raw[0];	// запомнить начальные значения  - центр джойстика - лево/право
        chan2_raw_middle = chan_raw[1]; //                                                   верх-низ

        chan4_raw_middle = chan_raw[3];// запомнить начальные значения  - центр ВТОРОГО джойстика
    }



    for(byte i=0; i < size; i++) {
	OSD::setPanel(1, SETUP_START_ROW + i);

	p = &params[i];
	nm=(char *)pgm_read_word((void *)&p->name);

        osd.print_P(nm);

	if(i == setup_menu) {
	    osd.write('>');
	    col=OSD::col;
	} else {
	    osd.write(' ');
	}

	type=pgm_read_byte((void *)&p->type);
	k=pgm_read_byte((void *)&p->k);

        switch (type){
        
        case 'h':
    	    if(OSD::getMode()) 
		osd.print_P(PSTR(" (PAL)"));
	    else
		osd.print_P(PSTR(" (NTSC)"));
	    // no break!
	case 0:
	    continue;
        
        case 'b': // byte param
	    { 
		int l = *((byte *)(pgm_read_word((void *)&p->value) ) ) ;
		v = l / (float)k;
	    }
	    break;

        case 'c': // signed byte param
	    { 
		int l = *((char *)(pgm_read_word((void *)&p->value) ) ) ;
		v = l / (float)k;
	    }
	    break;
	    
        case 'f': // byte param
	    v=*((float *)(pgm_read_word((void *)&p->value) ));
	    break;
	}

//	osd.printf_P(p.fmt, v);
	osd_printf_1((PGM_P)pgm_read_word((void *)&p->fmt), v);
    }

    fptr tail = (fptr) pgm_read_word((void *)&pscreen->tail);

    if(tail) tail();

    if (millis() > text_timer)
        text_timer = millis() + 500; // 2 раз в секунду
    else return;

    lflags.got_data=1;   // renew screen



    if (     (chan_raw[1] - 100) > chan2_raw_middle ){  move_menu(1);  return; } // переходы по строкам по верх-низ
    else if ((chan_raw[1] + 100) < chan2_raw_middle ){  move_menu(-1); return; }

    if (     (chan_raw[3] - 100) > chan4_raw_middle ){  move_screen(1);  return; } // переходы по экранам - левый дж лево-право
    else if ((chan_raw[3] + 100) < chan4_raw_middle ){  move_screen(-1); return; }


    OSD::setPanel(col, SETUP_START_ROW + setup_menu); // в строку с выбранным параметром

    p = &params[setup_menu];

    int diff = ( chan1_raw_middle - chan_raw[0] );
    if(diff<0) diff = -diff;

    void *pval=(void *)pgm_read_word((void *)&p->value);

    min =(int)pgm_read_word((void *)&p->min);
    max =(int)pgm_read_word((void *)&p->max);
    


    type=pgm_read_byte((void *)&p->type);
    k=pgm_read_byte((void *)&p->k);

    switch (type){
	case 'c':
    	    { 
    	        int l=*((char *)pval);
		v = l / (float)(k);
	    }
	    goto as_byte;
        case 'b': // byte param
    	    { 
    	        int l=*((byte *)pval);
		v = l / (float)(k);
	    }
as_byte:
    	    size= 1;
	    if(     diff>300)	inc=10/(float)k;
	    else if(diff>150)	inc=1 /(float)k;
	    break;

        case 'f': // float param
	    v=*((float *)pval);
	    size=4;
	
	    if(     diff>400) inc=1;
	    else if(diff>300) inc=0.1;
	    else if(diff>200) inc=0.01;
	    else if(diff>100) inc=0.001;

	    break;
    }


    float value_old = v;
    bool press=false;
        
    
    if(diff>100){
//if(diff) Serial.printf_P(PSTR("diff=%d inc=%f\n"), diff,inc); Serial.wait();
	if(chan_raw[0] < chan1_raw_middle) v -= inc;
	if(chan_raw[0] > chan1_raw_middle) v += inc;

        if(v<min) v=min;
        if(v>max) v=max;

    } 


    if(v != value_old) {
//Serial.printf_P(PSTR("write new=%f old=%f\n"), v, value_old);;

        switch (type){
    	    case 'c':
    		*((char *)pval) = (char)(v * k);
    		break;
            case 'b': // byte param
	        *((byte *)pval) = (byte)(v * k);
	        break;
	    
            case 'f': // float param
	        *((float *)pval) = v;
	        break;
	}


	eeprom_write_len( (byte *)pval,  EEPROM_offs(sets) + ((byte *)pval - (byte *)&sets),  size );
//	osd_printf_1((PGM_P)pgm_read_word((void *)&p->fmt), v); // updated value
	
	fptr cb = (fptr) pgm_read_word((void *)&p->cb);


//Serial.printf_P(PSTR("cb=%x\n"), (int)cb); Serial.wait();

//Serial.printf_P(PSTR("sets.horiz_offs=%d\n"), sets.horiz_offs); 

	if(cb) cb();
    }




}

#if 0 // unused

/* **************************************************************** */
// Panel  : panGPL
// Needs  : X, Y locations
// Output : 1 static symbol with changing FIX symbol
// Size   : 1 x 2  (rows x chars)
// Staus  : done

void panGPL(point p){
    OSD::setPanel(p.x,p.y);

    if(osd_fix_type == 0 || osd_fix_type == 1)
        osd.print_P(PSTR("\x10\x20"));
    else if(osd_fix_type == 2 || osd_fix_type == 3)
        osd.print_P(PSTR("\x11\x20"));

}

/* **************************************************************** */
// Panel  : panMavBeat
// Needs  : X, Y locations
// Output : 2 symbols, one static and one that blinks on every 50th received 
//          mavlink packet.
// Size   : 1 x 2  (rows x chars)
// Staus  : done

void panMavBeat(point p){
    OSD::setPanel(p.x, p.y);

    if(lflags.mavbeat == 1){
        osd.print_P(PSTR("\xEA\xEC"));
        lflags.mavbeat = 0;
    } else{
        osd.print_P(PSTR("\xEA\xEB"));
    }
}



/* **************************************************************** */
// Panel  : panCenter
// Needs  : X, Y locations
// Output : 2 row croshair symbol created by 2 x 4 chars
// Size   : 2 x 4  (rows x chars)
// Staus  : done

void panCenter(point p){
    OSD::setPanel(p.x,p.y);

    osd.print_P(PSTR("\x05\x03\x04\x05|\x15\x13\x14\x15"));
}



#endif
