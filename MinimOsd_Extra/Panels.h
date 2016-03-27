/******* PANELS - POSITION *******/


extern struct loc_flags lflags;  // все булевые флаги кучей


typedef void (*fptr)();
typedef void (*fPan_ptr)(Point p);

struct Panels_list {
    //Point *p;
    byte n;
    fPan_ptr f;
};


//table - 546 bytes of flash economy

const Panels_list PROGMEM panels_list[] = {
    { ID_of(horizon),	panHorizon },
    { ID_of(pitch),	panPitch },
    { ID_of(roll),	panRoll },
    { ID_of(batt_A),	panBatt_A },
    { ID_of(batt_B),	panBatt_B },
    { ID_of(GPS_sats),	panGPSats},
    { ID_of(GPS),	panGPS },
    { ID_of(GPS2),	panGPS2 },
    { ID_of(batteryPercent),panBatteryPercent},
    { ID_of(COG),	panCOG},
    { ID_of(rose),	panRose},
    { ID_of(heading),	panHeading},
    { ID_of(Fdata),	panFdata},
    { ID_of(homeDist),	panHomeDis},
    { ID_of(homeDir), 	panHomeDir},
    { ID_of(time),	panTime},
      
    { ID_of(WP_dist),	panWPDis},
    { ID_of(alt),	panAlt},
    { ID_of(homeAlt),	panHomeAlt},
    { ID_of(vel),	panVel},
    { ID_of(airSpeed),	panAirSpeed},
    { ID_of(throttle),	panThr},
    { ID_of(FMod),	panFlightMode},
    { ID_of(curr_A),	panCur_A},
    { ID_of(windSpeed),	panWindSpeed},
    { ID_of(climb),	panClimb},
    { ID_of(tune),	panTune},
    { ID_of(RSSI),	panRSSI},
    { ID_of(eff),	panEff},
    { ID_of(temp),	panTemp},
    { ID_of(ch),	panCh},
    { ID_of(distance),	panDistance},
    { ID_of(RadarScale),panRadarScale },
    { ID_of(callSign),	panCALLSIGN},
    {0, 0}
};


void NOINLINE osd_setPanel(Point p){
    OSD::setPanel(p.x,p.y);
}


void print_all_panels() {
    const Panels_list *pl= panels_list;

    for(;;){
	//Point *pp = (Point *)pgm_read_word(&pl->p);
	byte n = pgm_read_byte(&pl->n);
	fPan_ptr f = (fPan_ptr)pgm_read_word(&pl->f);
	if(f==0) break;
	
	//Point p = *pp;
	Point p=((Point *)&panel)[n];
	
	if(is_on(p)){
	    osd_setPanel(p);
	    f(p);
	}
	pl++;
    }
}

void writePanels(){

    osd.detectMode(); // PAL/NTSC live
    
    //long pt=millis(); // текущее время
    unsigned long pt;
    pt=millis();

#ifdef IS_PLANE
    if ((lflags.takeofftime == 1) && (osd_alt_to_home > 10 || osd_groundspeed > 1 || osd_throttle > 1 || osd_home_distance > 100)){
        landed = pt; // пока летаем постоянно обновляем это время
    }
#endif

    if(sets.n_screens>MAX_PANELS) sets.n_screens = MAX_PANELS;

  //Base panel selection
  //No mavlink data available panel
    if(pt > (lastMAVBeat + 2200)){
        panWaitMAVBeats(); //Waiting for MAVBeats...
        return; // no warn
    }
#ifdef IS_COPTER
 //Only show flight summary 10 seconds after landing and if throttle < 15
//  else if (!lflags.motor_armed && (((pt / 10000) % 2) == 0) && (tdistance > 50)){
  else if (!lflags.motor_armed && (((seconds / 10) % 2) == 0) && (tdistance > 50)){

#else
#ifdef IS_PLANE
    //Only show flight summary 7 seconds after landing
  else if ((pt - 7000) > landed){
#else
    else if(0) {
#endif
#endif
    panFdata({1,1});    //Flight summary panel

    return; // no warn

  } else{  //Normal osd panel

//	OSD::setPanel(0,0);
//	osd.printf_P("p=%d t=%d",panelN, sets.ch_toggle);

    //Check for panel toggle
//    if(sets.ch_toggle > 0) pan_toggle(); // This must be first so you can always toggle

    if(panelN < sets.n_screens){ // конфигурируемые юзером экраны
	print_all_panels();
    } else { 			// last panel

	if(!lflags.motor_armed) { 
	    panSetup();			// Setup when not armed
	    return; // no warnings
	} // else clear screen
    }
  }

// show warnings even if screen is disabled
    /* if(is_on(panel.warn)) */ panWarn(panel.warn); // this must be here so warnings are always checked

}


void osd_write(byte c){
    OSD::writeb(c);
}


void NOINLINE osd_setPanelSign(Point p, char c){
    osd_setPanel(p);
    if(has_sign(p)) osd_write(c);
}

static const PROGMEM char fmt_xtrack[]="\x20\x58\x65%4.0f%c";
//static const PROGMEM char f4_0fc[]="%4.0f%c";
#define f4_0fc (&fmt_xtrack[3])

float NOINLINE cnvGroundSpeed() { // вынос инварианта

    return osd_groundspeed * pgm_read_float(&measure->converts);
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





/******* PANELS - DEFINITION *******/
/* **************************************************************** */

/* **************************************************************** */
// Panel  : COG Course Over Ground
// Needs  : X, Y locations
// Output : 
// Size   : 
// Staus  : done

void panCOG(point p){

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


void printFullDist(float dd){
    dd *= pgm_read_float(&measure->converth);
    if (dd > 9999.0) {
         osd_printf_2(PSTR("%5.2f%c"), (dd / pgm_read_word(&measure->distconv)), pgm_read_byte(&measure->distchar));
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

struct Formats {
    PGM_P fmt;
    char t;
    void *v;
    const float * k;
    const byte *c;
};


void print_list(const Formats *f){
    PGM_P fmt;
    byte t;
    float *v;
    const float *kp;
    const byte *c;
    
    float val;
    
    for(;;){
	fmt=(const char *)pgm_read_word(&f->fmt);
	if(fmt==0) break;

	t  = pgm_read_byte(&f->t);
	v  = (float *)pgm_read_word(&f->v);
	kp = (const float *)pgm_read_word(&f->k);
	c  = (byte *)pgm_read_word(&f->c);
	
	switch(t){
	case 'f':
	    val = * (float *)v;
	    break;
	case 'i':
	    val = * (int *)v;
	    break;
	}
	
	char h = ' ';

	if(kp!=0) val *= pgm_read_float(kp);
	if(c!=0)  h = pgm_read_byte(c);
	
	osd_printf_2(fmt,val,h);
	
	osd_write('|');
	f++;
    }
}

void panFdata(point p){ // итоги полета

    static const char PROGMEM fmt0[]="|\x0B%5f%c";
    static const char PROGMEM fmt1[]="\x8F%5f%c";
    static const char PROGMEM fmt2[]="\x14%5f%c";
    static const char PROGMEM fmt3[]="\x12%5f%c";
    static const char PROGMEM fmt4[]="\x03%10.6f";
    static const char PROGMEM fmt5[]="\x04%10.6f";

    static const PROGMEM Formats fd[] = {
	{fmt0, 'f',  &max_home_distance,  &measure->converth, &measure->high },
	{fmt1, 'f',  &tdistance,          &measure->converth, &measure->high },
	{fmt2, 'f',  &max_osd_groundspeed,&measure->converts, &measure->spe  },
	{fmt3, 'f',  &max_osd_home_alt,   &measure->converth, &measure->high },
	{fmt4, 'f',  &osd_pos.lat,        0, 0 },
	{fmt5, 'f',  &osd_pos.lon,        0, 0 },
	{0}
    };

  osd_write(0x08);
  printTime(total_flight_time_milis / 1000);

/*
  byte h=pgm_read_byte(&measure->high);

  osd.printf_P(PSTR("|\x0B%5i%c|\x8F%5i%c|\x14%5i%c|\x12%5i%c|\x03%10.6f|\x04%10.6f"),
		      (int)((max_home_distance) * pgm_read_float(&measure->converth)), h,
		                 (int)(tdistance * pgm_read_float(&measure->converth)), h,
		                	(int)(max_osd_groundspeed * pgm_read_float(&measure->converts)),pgm_read_byte(&measure->spe),
		                		    (int)(max_osd_home_alt * pgm_read_float(&measure->converth)), h,
		                			      osd_pos.lat, 
		                			    		osd_pos.lon);
//*/

    print_list(fd);

}


//* **************************************************************** */
// Panel  : panTune
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done
    
void panTune(point p){

#ifdef IS_COPTER
    static const PROGMEM char fmt0[]="\x4E\x52%3.0f\x05";
    static const PROGMEM char fmt1[]="\x4E\x50%3.0f\x05";
    static const PROGMEM char fmt2[]="\x4E\x48%4.0f\x05";
    static const PROGMEM char fmt3[]="\x54\x42%6.1f\x05";
    static const PROGMEM char fmt4[]="\x41\x45%5.1f%c";
    static const PROGMEM char fmt5[]="\x58\x45%4.0f\x6D";
    static const PROGMEM char fmt6[]="\x41\x45%5.1f%c";

    static const PROGMEM Formats fd[] = {
	{ fmt0, 'i', &nav_roll,          0, 0 },
	{ fmt1, 'i', &nav_pitch,         0, 0 },
	{ fmt2, 'i', &nav_bearing,       0, 0 },
	{ fmt3, 'i', &wp_target_bearing, 0, 0 },
	{ fmt4, 'f', &alt_error,         &measure->converth, &measure->high },
	{ fmt5, 'i', &xtrack_error,      0, 0 },
	{ fmt6, 'f', &aspd_error,        &measure->converts, &measure->spe },
	{ 0 }
    };
    
    print_list(fd);

/*
        osd.printf_P(PSTR("\x4E\x52%2.0i\x05|\x4E\x50%2.0i\x05|\x4E\x48%4.0i\x05|\x54\x42%4.0i\x05|\x41\x45%3.0f%c|\x58\x45%3.0f\x6D|\x41\x45%3.0f%c"), 
        			(nav_roll), 
			    			(nav_pitch), 
			    					     (nav_bearing),  
			    								(wp_target_bearing), 
			    							    			cnvAltError(), pgm_read_byte(&measure->high), 
			    							    		    			((float)xtrack_error), 
			    							    		    					((aspd_error / 100.0) * pgm_read_float(&measure->converts)), pgm_read_byte(&measure->spe));
*/
#else

    PGM_P f;
 #ifdef IS_PLANE
    if(has_sign(p)) 
        f=PSTR("\x11%3.0f%c|\x15");
    else
	f=PSTR("%3.0f%c|");

    float err = alt_error * pgm_read_float(&measure->converth);

    osd_printf_2(f, -err, pgm_read_byte(&measure->high));
    printSpeed(aspd_error / 100.0);
 #endif
#endif
}



/* **************************************************************** */
// Panel  : pantemp
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panTemp(point p){
    osd_printf_2(PSTR("%5.1f%c"), ((temperature / 10.0 * pgm_read_byte(&measure->tempconv) + pgm_read_word(&measure->tempconvAdd)) / 100), pgm_read_byte(&measure->temps));    
}

/* **************************************************************** */
// Panel  : efficiency
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done
void panEff(point p){

    static float ddistance = 0;
    float        eff = 0; //Efficiency

    if(sets.model_type==0){ // plane
#ifdef IS_PLANE
        if (osd_throttle >= 1){
          if (!lflags.throttle_on) 
              lflags.throttle_on = 1;
    
            if (osd_groundspeed != 0) {
        	//eff = (((float)osd_curr_A * 10.0 ) / cnvGroundSpeed())*0.1  + eff * 0.9;
        	eff = (((float)osd_curr_A ) / cnvGroundSpeed())* (10.0 * 0.1) + eff * 0.9; // комплиментарный фильтр 1/10
        	//filter(eff, (((float)osd_curr_A ) / cnvGroundSpeed())*10.0, 0.1);
	    }
	    
    	    if(has_sign(p))
		osd_write(0x16);
            
            int iEff=eff;
            if (iEff > 0 && iEff <= 9999) { 
                  osd_printf_1(PSTR("%4.0f\x01"), eff);
            }else{
                // we don't needs to clear!  osd.print_P(&strclear[7]);// osd.print_P(PSTR("\x20\x20\x20\x20\x20"));
        	// thus saves 78 bytes
            }

        }else{

            if ((osd_throttle < 1)){ // запоминаем высоту и путь при выключенном газе
                if (lflags.throttle_on) {
                  palt = osd_alt_to_home;
                  ddistance = tdistance;
                  lflags.throttle_on = 0;
                }
            }
	    if(has_sign(p))
		osd_write(0x18);

            if (osd_climb < -0.05){
                float glide = ((osd_alt_to_home / (palt - osd_alt_to_home)) * (tdistance - ddistance)) * pgm_read_float(&measure->converth);
                int iGlide=glide;
                if (iGlide > 9999) glide = 9999.0;
                if (iGlide > 0){
                    osd_printf_2(f4_0fc, glide, pgm_read_byte(&measure->high)); // аэродинамическое качество
                }
            }else if (osd_climb >= -0.05 && osd_att.pitch < 0) {
                  osd.print_P(PSTR("\x20\x20\x90\x91")); //термик
            }else{
                //we don't needs to clear!  osd.print_P(&strclear[7]);//      osd.print_P(PSTR("\x20\x20\x20\x20\x20"));
            }
        }
#endif
    } else { // copter
#ifdef IS_COPTER
      //Check takeoff just to prevent initial false readings
      if (lflags.motor_armed) {
        if(osd_battery_remaining_A != last_battery_reading && !lflags.uavtalk_active) {    // UAVtalk sends this itself
            remaining_estimated_flight_time_seconds = ((float)osd_battery_remaining_A * total_flight_time_milis / 
        					    (max_battery_reading - osd_battery_remaining_A)) / 1000;
            last_battery_reading = osd_battery_remaining_A;
	}
	if(has_sign(p))
	    osd_write(0x17);

	printTime(remaining_estimated_flight_time_seconds);
      }
#endif
  }
}

/* **************************************************************** */
// Panel  : panRSSI
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panRSSI(point p){

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
    if((seconds % 64) < 2){
      osd.print( (char *)sets.OSD_CALL_SIGN);
    }else{
// we don't needs to clear!    osd.print_P(&strclear[4]);
    }
}


/* **************************************************************** */
// Panel  : pan wind speed
// Needs  : X, Y locations
// Output : Wind direction symbol (arrow) and velocity
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panWindSpeed(point p){

    if(has_sign(p))
	osd_write(0x1d);

    int /*float*/ dir = osd_winddirection;

    if (dir < 0)  dir+=360;

    nor_osd_windspeed = osd_windspeed * 0.010 + nor_osd_windspeed * 0.990; // комплиментарный фильтр 1/100 
    //filter(nor_osd_windspeed,  osd_windspeed, 0.01 ); // комплиментарный фильтр 1/100 


    showArrow(grad_to_sect(dir - osd_heading),1); //print data to OSD
}

/* **************************************************************** */
// Panel  : panCur_A
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panCur_A(point p){

    if(has_sign(p))
	osd_write(0xbd);

    osd_printf_1(PSTR("%5.2f\x0e"), (float(osd_curr_A) * 0.01)); // in amps
}

/* **************************************************************** */
// Panel  : panAlt
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panAlt(point p){

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

    if(has_sign(p))
	osd_write(0x15);

    osd_printf_2(f4_0fc, vertical_speed, pgm_read_byte(&measure->climbchar));
}

/* **************************************************************** */
// Panel  : panHomeAlt
// Needs  : X, Y locations
// Output : Alt symbol and home altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

void panHomeAlt(point p){

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


    int iAirspeed = osd_airspeed * pgm_read_float(&measure->converts);
    int iVolt = osd_vbat_A/100.0; // in 0.1v as sets.battv is

//1
 if ((osd_fix_type) < 2) 
    wmask |= 1;

//2    
 if (sets.model_type==0 && iAirspeed < sets.stall && lflags.takeofftime == 1) // plane
    wmask |= 2;

//3    
 if (sets.overspeed && iAirspeed > sets.overspeed) 
    wmask |= 4;

//4    voltage limit set and less                   capacity limit set and less
 if (sets.battv !=0 && (iVolt < sets.battv) || sets.batt_warn_level != 0 &&  (osd_battery_remaining_A < sets.batt_warn_level))
    wmask |= 8;

//5
    // не сырое значение  
 if (!(sets.RSSI_raw%2) && rssi < sets.rssi_warn_level )
    wmask |= 16;

    int iVs = abs(vertical_speed) /10.0;

//6
 if (sets.model_type==1 && sets.stall >0 && iVs > sets.stall ) // copter - vertical speed
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

// 10 BYTES OF FLASH!
const char PROGMEM w1[]="\x20\x4E\x6F\x20\x47\x50\x53\x20\x66\x69\x78\x21"; //No GPS fix!
const char PROGMEM w2[]="\x20\x20\x20\x53\x74\x61\x6c\x6c\x21";             // Stall!
const char PROGMEM w3[]="\x20\x4f\x76\x65\x72\x53\x70\x65\x65\x64\x21";     //Over Speed!
const char PROGMEM w4[]="\x42\x61\x74\x74\x65\x72\x79\x20\x4c\x6f\x77\x21"; //Battery Low!
const char PROGMEM w5[]="\x20\x20\x4c\x6f\x77\x20\x52\x73\x73\x69";         //Low Rssi
const char PROGMEM w6[]="\x48\x69\x67\x68\x20\x56\x53\x70\x65\x65\x64\x21"; //Hi VSpeed!

const char * const warn_str[] = {
    0, // 0
    w1,
    w2,
    w3,
    w4,
    w5,
    w6,
};

void panWarn(point p){
    osd_setPanel(p); // warn differs!

    check_warn();

    PGM_P w;
    w=warn_str[warning];
    if(w)
	osd.print_P(w);
}



/* **************************************************************** */
// Panel  : panThr
// Needs  : X, Y locations
// Output : Throttle value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panThr(point p){
    osd_printi_1(PSTR("%3.0i\x25"),osd_throttle);
}

/* **************************************************************** */
// Panel  : panBatteryPercent
// Needs  : X, Y locations
// Output : Battery state from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void osd_print_bat(PGM_P fmt, float f){
    osd.printf_P(fmt, osd_battery_pic_A[0], osd_battery_pic_A[1], f);
}

void panBatteryPercent(point p){

    PGM_P fmt1;
    PGM_P fmt2;

//    if(has_sign(p))
    if(has_sign(p)) {
	osd_write(0x88); // донышко батарейки не зависит от

	fmt1=PSTR("%c%c\x8e%2.0f%%");
        fmt2=PSTR("%c%c\x8e%4.0f\x01");
    } else {
	fmt1=PSTR("%2.0f%%");
	fmt2=PSTR("%4.0f\x01");
    }


	if (flags.OSD_BATT_SHOW_PERCENT)
	    osd_printf_1(fmt1,  (float)osd_battery_remaining_A/256*100);
	else
	    osd_printf_1(fmt2, mah_used);


}

/* **************************************************************** */
// Panel  : panTime
// Needs  : X, Y locations
// Output : Time from start with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panTime(point p){

    printTime(total_flight_time_milis / 1000);
}

/* **************************************************************** */
// Panel  : panHomeDis
// Needs  : X, Y locations
// Output : Home Symbol with distance to home in meters
// Size   : 1 x 7  (rows x chars)
// Staus  : done

void panHomeDis(point p){

    if(!lflags.osd_got_home) return;

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
  
  // сначала нарисуем стрелочки.

    if(flags.flgHUD) {
        osd.print_P(str_hud);
        osd.print_P(str_hud);
        osd.print_P(PSTR("\xC6\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xC5|"));
        osd.print_P(str_hud);
        osd.print_P(str_hud);
    } else {
/* we don't need to clear screen!
	for(byte j=5; j!=0; j--) {
	    for(byte i=14; i!=0; i--)
		osd.write(' ');
	    osd.write('|');
	}
*/
    }
                      
    showHorizon(p.x + 1, p.y);


    if(flags.radar_on)
	showRADAR(p.x+6, p.y+2);


    if(has_sign(p)) { // Птичка по центру
	OSD::setPanel(p.x+6, p.y+2);
	osd.print_P(PSTR("\xb8\xb9"));
    }

    //Show ground level on  HUD
    if(flags.ils_on)
	showILS(p.x, p.y);

}

/* **************************************************************** */
// Panel  : panPitch
// Needs  : X, Y locations
// Output : -+ value of current Pitch from vehicle with degree symbols and pitch symbol
// Size   : 1 x 6  (rows x chars)
// Staus  : done

void panPitch(point p){
//Serial.printf_P(PSTR("pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();

    osd_printi_1(PSTR("%4i\x05\x07"),osd_att.pitch);
}

/* **************************************************************** */
// Panel  : panRoll
// Needs  : X, Y locations
// Output : -+ value of current Roll from vehicle with degree symbols and roll symbol
// Size   : 1 x 6  (rows x chars)
// Staus  : done

void panRoll(point p){
    osd_printi_1(PSTR("%4i\x05\x06"),osd_att.roll);
}

/* **************************************************************** */
// Panel  : panBattery A (Voltage 1)
// Needs  : X, Y locations
// Output : Voltage value as in XX.X and symbol of over all battery status
// Size   : 1 x 8  (rows x chars)
// Staus  : done


void NOINLINE printVolt(uint16_t v) {
    osd_printf_1(PSTR("%5.2f\x0D"), v/1000.0);
}

void panBatt_A(point p){

    if(has_sign(p))
	osd_write(0xBC);

/*************** This commented code is for the next ArduPlane Version
    if(osd_battery_remaining_A > 100){
        osd.printf(" %5.2f%c",   (double)osd_vbat_A/1000.0, 0x0d);
    else osd.printf("%5.2f%c%c", (double)osd_vbat_A/1000.0, 0x0d, osd_battery_pic_A);
    */

//    osd.printf_P(PSTR("\xBC%5.2f\x0D"), (double)osd_vbat_A/1000.0);

    printVolt(osd_vbat_A);
}


/* **************************************************************** */
// Panel  : panBattery B (Voltage 2)
// Needs  : X, Y locations
// Output : Voltage value as in XX.X and symbol of over all battery status
// Size   : 1 x 8  (rows x chars)
// Staus  : done

void panBatt_B(point p){

    if(has_sign(p))
	osd_write(0x26);

    printVolt(osd_vbat_B);
}




//------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

void panWaitMAVBeats(){

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
    if(osd_pos.lon || osd_pos.lat) // не выводим координат если нету
	osd.printf_P(f, (double)osd_pos.lat, (double)osd_pos.lon);
}

void panGPS(point p){

    PGM_P f;

    if(has_sign(p))
	f=PSTR("\x03%10.6f|\x04%10.6f");
    else 
	f=PSTR("%10.6f|%10.6f");

    //osd.printf_P(f, (double)osd_pos.lat, (double)osd_pos.lon);
    print_GPS(f);
}

/* **************************************************************** */
// Panel  : panGPS2
// Needs  : X, Y locations
// Output : one row numeric value of current GPS location with LAT/LON symbols as on first char
// Size   : 1 x 25  (rows x chars)
// Staus  : done

void panGPS2(point p){

    PGM_P f;

    if(has_sign(p))
	f=PSTR("\x03%10.6f \x04%10.6f");
    else
    	f=PSTR("%10.6f %10.6f");

//    osd.printf_P(f, (double)osd_pos.lat, (double)osd_pos.lon);
    print_GPS(f);

}

/* **************************************************************** */
// Panel  : panHeading
// Needs  : X, Y locations
// Output : Symbols with numeric compass heading value
// Size   : 1 x 5  (rows x chars)
// Staus  : not ready

void panHeading(point p){

    osd_printi_1(PSTR("%4i\x05"), osd_heading);
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

    const unsigned char buf_Rule[] PROGMEM = {
      0x82,0x80,0x81,0x80,0x81,0x80,
      0x84,0x80,0x81,0x80,0x81,0x80,
      0x83,0x80,0x81,0x80,0x81,0x80,
      0x85,0x80,0x81,0x80,0x81,0x80
     };

    int start = (osd_heading * 24+12)/360 - 4;
 
    if(start < 0) start += 24;
  
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

    if(has_sign(p))
	osd.print_P(PSTR( "\x20\xc7\xc7\xc7\xc7\x2e\xc7\xc7\xc7\xc7\x20|"));
    osd.printf_P(PSTR("\xc3%s\x87"), buf_show);

}


int getTargetBearing(){
    if (wp_target_bearing < 0) 	wp_target_bearing+=360;
	
    return grad_to_sect(wp_target_bearing - osd_heading); //Convert to int 1-16 
}

/* **************************************************************** */
// Panel  : panWPDir
// Needs  : X, Y locations
// Output : 2 symbols that are combined as one arrow, shows direction to next waypoint
// Size   : 1 x 2  (rows x chars)
// Staus  : not ready

void panWPDir(point p){
    if(wp_number > 0 ){
   
//    int wp_target_bearing_rotate = round(((float)wp_target_bearing - osd_heading)/360 * 16) + 1; //Convert to int 1-16 

	showArrow(getTargetBearing(),0);
    }
}

/* **************************************************************** */
// Panel  : panWPDis
// Needs  : X, Y locations
// Output : W then distance in Km - Distance to next waypoint
// Size   : 1 x 2  (rows x chars)
// Staus  : OK

void panWPDis(point p){

    if(has_sign(p))
	osd_write(0x5c);

    if (xtrack_error > 999)  xtrack_error = 999;
    if (xtrack_error < -999) xtrack_error = -999;


    byte h=pgm_read_byte(&measure->high);

    osd.printf_P(PSTR("%2i %4.0f%c|"), wp_number,((float)wp_dist * pgm_read_float(&measure->converth)), h);
    showArrow(getTargetBearing(), 0);

    if (osd_mode == 10){ // auto
        osd_printf_2(PSTR("\x20\x58\x65%4.0f%c"), (xtrack_error * pgm_read_float(&measure->converth)), h);
    }else{
    // we don't needs to clear!    osd.print_P(&strclear[4]);
    }
}

/* **************************************************************** */
// Panel  : panHomeDir
// Needs  : X, Y locations
// Output : 2 symbols that are combined as one arrow, shows direction to home
// Size   : 1 x 2  (rows x chars)
// Status : not tested

void panHomeDir(point p){
    if(!lflags.osd_got_home) return;

    showArrow(osd_home_direction,0);
}

/* **************************************************************** */
// Panel  : panFlightMode 
// Needs  : X, Y locations
// Output : 2 symbols, one static name symbol and another that changes by flight modes
// Size   : 1 x 2  (rows x chars)
// Status : done

//#ifdef IS_COPTER
const char PROGMEM s_mode00[] = "stab"; //Stabilize	0
const char PROGMEM s_mode01[] = "acro"; //Acrobatic	1
const char PROGMEM s_mode02[] = "alth"; //Alt Hold	2
const char PROGMEM s_mode03[] = "auto"; //Auto		3
const char PROGMEM s_mode04[] = "guid"; //Guided		4
const char PROGMEM s_mode05[] = "loit"; //Loiter		5
const char PROGMEM s_mode06[] = "rtl"; //Return to Launch 6
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

#ifdef IS_COPTER
char const * const mode_c_strings[] PROGMEM ={ 
    s_mode00, s_mode01, s_mode02, s_mode03, s_mode04, 
    s_mode05, s_mode06, s_mode07, s_mode08, s_mode09, 
    s_mode10, s_mode11, s_mode12, s_mode13, s_mode14,
    s_mode15, s_mode16
};
#endif

//#ifdef IS_PLANE
const char PROGMEM p_mode01[] = "manu"; //Manual
const char PROGMEM p_mode02[] = "circ"; //CIRCLE
const char PROGMEM p_mode03[] = "stab"; //Stabilize
const char PROGMEM p_mode04[] = "trai"; //Training
//const char PROGMEM p_mode05[] = "acro"; //ACRO
const char PROGMEM p_mode06[] = "fbwa"; //FLY_BY_WIRE_A
const char PROGMEM p_mode07[] = "fbwb"; //FLY_BY_WIRE_B
const char PROGMEM p_mode08[] = "cruz"; //Cruise
const char PROGMEM p_mode09[] = "atun"; //autotune
//const char PROGMEM p_mode10[] = "auto"; //AUTO
//const char PROGMEM p_mode11[] = "rtl "; //Return to Launch
//const char PROGMEM p_mode12[] = "loit"; //Loiter
const char PROGMEM p_mode13[] = "m_13"; 
const char PROGMEM p_mode14[] = "m_14"; 
//const char PROGMEM p_mode15[] = "guid"; //GUIDED
const char PROGMEM p_mode16[] = "init"; //initializing
const char PROGMEM p_mode17[] = "qstb"; //quad-stabilize
const char PROGMEM p_mode18[] = "qhov"; //quad-hover (alt-hold)
const char PROGMEM p_mode19[] = "qloi"; //quad-loiter

#ifdef IS_PLANE
const char * const mode_p_strings[] PROGMEM ={ 
    p_mode01, p_mode02, p_mode03, p_mode04, s_mode01, 
    p_mode06, p_mode07, p_mode08, p_mode09, s_mode03, 
    s_mode06, s_mode05, p_mode13, p_mode14, s_mode04, 
    p_mode16, p_mode17, p_mode18, p_mode19
};

#endif

#if defined(USE_UAVTALK)
//const char PROGMEM u_mode00[] = "manu";    // MANUAL
const char PROGMEM u_mode01[] = "stb1";    // STABILIZED1
const char PROGMEM u_mode02[] = "stb2";    // STABILIZED2
const char PROGMEM u_mode03[] = "stb3";    // STABILIZED3
const char PROGMEM u_mode04[] = "stb4";    // STABILIZED4
const char PROGMEM u_mode05[] = "stb5";    // STABILIZED5
const char PROGMEM u_mode06[] = "stb6";    // STABILIZED6
//const char PROGMEM u_mode07[] = "posh";    // POSITIONHOLD
const char PROGMEM u_mode08[] = "cl";    // COURSELOCK
const char PROGMEM u_mode09[] = "posr";    // POSITIONROAM
const char PROGMEM u_mode10[] = "hl";    // HOMELEASH
const char PROGMEM u_mode11[] = "pa";    // ABSOLUTEPOSITION
//const char PROGMEM u_mode12[] = "rtl ";    // RETURNTOBASE
//const char PROGMEM u_mode13[] = "land";    // LAND
const char PROGMEM u_mode14[] = "pp";    // PATHPLANNER
const char PROGMEM u_mode15[] = "poi";    // POI
//const char PROGMEM u_mode16[] = "ac  ";    // AUTOCRUISE
const char PROGMEM u_mode17[] = "atof";    // AUTOTAKEOFF

char const * const mode_u_strings[] PROGMEM ={ 
    p_mode01, u_mode01, u_mode02, u_mode03, u_mode04, 
    u_mode05, u_mode06, s_mode08, u_mode08, u_mode09, 
    u_mode10, u_mode11, s_mode06, s_mode09, u_mode14,
    u_mode15, p_mode08, u_mode17
};
#endif

const char PROGMEM aq_mode0[] = "arm";
//const char PROGMEM aq_mode1[] = "manu";
//const char PROGMEM aq_mode2[] = "alth";
//const char PROGMEM aq_mode3[] = "posh";
const char PROGMEM aq_mode4[] = "m_04";
const char PROGMEM aq_mode5[] = "miss";
const char PROGMEM aq_mode6[] = "m_06";
const char PROGMEM aq_mode7[] = "m_07";
const char PROGMEM aq_mode8[] = "init";

char const * const mode_aq_strings[] PROGMEM ={ 
    aq_mode0, p_mode01, s_mode02, s_mode08,
    aq_mode4, aq_mode5, aq_mode6, aq_mode7,
    aq_mode8, 
};

#if defined(USE_MWII)
/*
    { 0, 1,  &msg.mwii.mode.armed},  0
    { 1, 2, &msg.mwii.mode.stable},  1
    { 2, 3, &msg.mwii.mode.horizon}, 2
    { 3, 4, &msg.mwii.mode.baro},    3
    { 5, 0, &msg.mwii.mode.mag},    
    { 10,6, &msg.mwii.mode.gpshome}, 4 
    { 11,7, &msg.mwii.mode.gpshold}, 5
    { 19,0, &msg.mwii.mode.osd_switch}, 
*/

const char PROGMEM mw_mode1[] = "angl";
const char PROGMEM mw_mode2[] = "hori";

char const * const mode_mw_strings[] PROGMEM ={ 
    s_mode01, // acro
    mw_mode1, 
    mw_mode2, 
    s_mode02, // alth
    s_mode06, // rtl
    s_mode08, // posh
};


#endif

void panFlightMode(point p){

    if(has_sign(p))
        osd_write( 0x7F);

    //PGM_P mode_str;
    const void *ptr;
    
#if defined(USE_UAVTALK)
    if(lflags.uavtalk_active) {
	ptr = &mode_u_strings[osd_mode];
    } else 
#endif

#if defined(USE_MWII)
    if(lflags.mwii_active) {
	ptr = &mode_mw_strings[osd_mode];
    } else 
#endif


    {

        if(osd_autopilot == 14) { // autoquad
	    int8_t bc;
	    for(bc=7;bc>=0;) {
		if(osd_mode & (1<<bc) ) break;
		--bc;
	    }
	    if(bc<0) bc=8;

	    ptr = &mode_aq_strings[bc];
	} else {

#ifdef IS_COPTER
 #ifdef IS_PLANE
            if(sets.model_type==0) {
                ptr = &mode_p_strings[osd_mode];
            } else {
                ptr = &mode_c_strings[osd_mode];
            }

 #else
            ptr = &mode_c_strings[osd_mode];
 #endif    
#else
 #ifdef IS_PLANE
            ptr = &mode_p_strings[osd_mode];
 #endif    
#endif
        }
    }
    
    osd.print_P((PGM_P)pgm_read_word(ptr));

    if(lflags.motor_armed)
        osd_write(0x86);
}


/*void  printArrow(byte c){
    osd_write(c); osd_write(c+1);
}*/

// ---------------- EXTRA FUNCTIONS ----------------------
// Show those fancy 2 char arrows
void showArrow(uint8_t rotate_arrow,uint8_t method){
    char arrow_set1 = 0x90;


    while(rotate_arrow>16) rotate_arrow -= 16;
    while(rotate_arrow<1)  rotate_arrow += 16;
    
//    rotate_arrow &= 0x0f;

    arrow_set1 += rotate_arrow * 2 - 2;

    switch(method) {  
    case 1:
	printSpeed(osd_windspeed * pgm_read_float(&measure->converts));
	osd.printf_P(PSTR("|%c%c%2.0f%c"), arrow_set1, arrow_set1 + 1, (nor_osd_windspeed * pgm_read_float(&measure->converts)), pgm_read_byte(&measure->spe));
	break;
    
    case 2:
	osd.printf_P(PSTR("%c%c%4i\x05"), arrow_set1, arrow_set1 + 1, off_course);
	break;

    default:
	/* osd.printf_P(PSTR("%c%c"),        arrow_set1, arrow_set1 + 1); */ 
	//printArrow( arrow_set1); 
	osd_write(arrow_set1); osd_write(arrow_set1+1);
	break;
    }
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
    byte pitch_line;
    int middle;
    int8_t hit;
    int subval;
    int roll;
    int line_set = LINE_SET_STRAIGHT__;
    int line_set_overflow = LINE_SET_STRAIGHT_O;
    int8_t subval_overflow = 9;



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
    roll = osd_att.roll;
    if ((roll >= 0 && roll < 90) || (roll >= -179 && roll < -90)) {	// positive angle line chars
	roll = roll < 0 ? roll + 179 : roll;
	uint16_t a_roll=abs(roll);
        if (a_roll > ANGLE_2) {
	    line_set = LINE_SET_P___STAG_2;
	    line_set_overflow = LINE_SET_P_O_STAG_2;
            subval_overflow = 7;
	} else if (a_roll > ANGLE_1) {
	    line_set = LINE_SET_P___STAG_1;
	    line_set_overflow = LINE_SET_P_O_STAG_1;
            subval_overflow = 8;
	}
    } else {								// negative angle line chars
	roll = roll > 90 ? roll - 179 : roll;
	uint16_t a_roll=abs(roll);
        if (a_roll > ANGLE_2) {
	    line_set = LINE_SET_N___STAG_2;
	    line_set_overflow = LINE_SET_N_O_STAG_2;
            subval_overflow = 7;
	} else if (a_roll > ANGLE_1) {
	    line_set = LINE_SET_N___STAG_1;
	    line_set_overflow = LINE_SET_N_O_STAG_1;
            subval_overflow = 8;
	}
    }
    
    pitch_line = (int)round(tan(-AH_PITCH_FACTOR * osd_att.pitch) * AH_TOTAL_LINES) + AH_TOTAL_LINES/2;	// 90 total lines
    for (col=1; col<=AH_COLS; col++) {
        middle = col * CHAR_COLS - (AH_COLS/2 * CHAR_COLS) - CHAR_COLS/2;	  // -66 to +66	center X point at middle of each column
        hit = (int)(tan(AH_ROLL_FACTOR * osd_att.roll) * middle) + pitch_line;	          // 1 to 90	calculating hit point on Y plus offset
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

      //Vertical calculation
        int currentAngleDisplacement = (int)(atan2(osd_alt_to_home, osd_home_distance) * 57.2957795) - 10;
        //Calc current char position.
        //int numberOfPixels = CHAR_ROWS * AH_ROWS;
        int8_t totalNumberOfLines = 9 * AH_ROWS; //9 chars in chartset for vertical line
        int linePosition = totalNumberOfLines * currentAngleDisplacement / 10 + (totalNumberOfLines / 2); //+-5 degrees
        int8_t charPosition = linePosition / 9;
        uint8_t selectedChar = 9 - (linePosition % 9) + 0xC7;
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
            subval_char =0x2E; 
            start_row += 4;
        }

//	start_col += AH_COLS / 2; // middle of horizon

        //Enough calculations. Let's show the result
        OSD::write_xy(start_col + AH_COLS / 2, start_row, subval_char);
    }

}

/******************************************************************/
// Panel  : panUAVPosition
// Needs  : X, Y locations of center
// Needs  : globals: osd_home.lat, osd_pos.lat, osd_home.lon, osd_pos.lon
// Output : shows the UAV position in a radar like style
// Status : do flight test
/******************************************************************/

#define	STEP_WIDTH	250			// every STEP_WIDTH in [m] it is down-scaled
#define	SCALE_X		(7.0 / STEP_WIDTH)	// SCALE_X * 2 chars grid in which the uav is drawed
#define	SCALE_Y		(4.5 / STEP_WIDTH)	// SCALE_Y * 2 chars grid in which the uav is drawed

#define RADAR_CHAR	0x1F			// code of the radar symbol

static int radar_zoom;

void showRADAR(byte center_col, byte center_line) {

// символы квадрика с ориентацией
    byte arr[] PROGMEM = {0xb0, 0xb1, 0xb4, 0xb5, 0xb6, 0xb7, 0x7b, 0x7d };

    
    int index = (int)((osd_heading + 22.5) / 45.0);
    index = index > 7 ? 0 : index;


    // calculate distances from home in lat (y) and lon (x) direction in [m]
//    int dst_y = (int)(-111319.5 * (osd_home.lat - osd_pos.lat));
//    int dst_x = (int)(-111319.5 * (osd_home.lon - osd_pos.lon) * cos(fabs(osd_home.lat) * 0.0174532925));
    
    // calculate display offset in y and x direction
    radar_zoom = max((int)(abs(dst_y) / STEP_WIDTH), (int)(abs(dst_x) / STEP_WIDTH)) + 1;
    

    byte y = (int)(dst_y / (radar_zoom / SCALE_Y));
    byte x = (int)(dst_x / (radar_zoom / SCALE_X) + 0.5);	// for even grid correction

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


void panRadarScale(Point p){
    if(has_sign(p))
	osd_write(RADAR_CHAR);

    float dd= radar_zoom * STEP_WIDTH * pgm_read_float(&measure->converth);
    
    if(radar_zoom >=40) // 10 000 
        osd_printf_2(PSTR("%4.2f%c"), dd/1000.0, pgm_read_byte(&measure->distchar));
    else
        osd_printf_2(PSTR("%4.0f%c"), dd, pgm_read_byte(&measure->high));
}





/* **************************************************************** */
// Panel  : panCh
// Needs  : X, Y locations
// Output : Scaled channel values from MAVLink
// Size   
// Staus  : done

void panCh(point p){
    for(byte i=0; i<8;i++)
	osd.printf_P(PSTR("C%d%5i|"), i+1, chan_raw[i] );
}


/* **************************************************************** */
// Panel  : panSetup
// Needs  : Nothing, uses whole screen
// Output : The settings menu
// Size   : 3 x ?? (rows x chars)
// Staus  : done


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
static const PROGMEM char n_sets[]        = "      OSD setup";
static const PROGMEM char n_batt[]        = "Battery warning";
static const PROGMEM char n_battB[]       = "Batt 2 warning";
static const PROGMEM char n_stall[]       = "Stall warning";
static const PROGMEM char n_oversp[]      = "Overspeed warning";
static const PROGMEM char n_charge[]      = "Batt charge warn";
static const PROGMEM char n_rssi[]        = "RSSI warning";

static const PROGMEM char n_screen[]      = "  Screen params";
static const PROGMEM char n_scr[]         = "Screens Count";
static const PROGMEM char n_contr[]       = "Contrast";
static const PROGMEM char n_horiz[]       = "Horizontal offs";
static const PROGMEM char n_vert[]        = "Vertical offs";

static const PROGMEM char n_horizon[]     = "  Horizon angles";
static const PROGMEM char n_k_PitchPAL[]  = "Pitch in PAL";
static const PROGMEM char n_k_RollPAL[]   = "Roll  in PAL";
static const PROGMEM char n_k_PitchNTSC[] = "Pitch in NTSC";
static const PROGMEM char n_k_RollNTSC[]  = "Roll  in NTSC";

static const PROGMEM char f_float[]= "%.3f";
static const PROGMEM char f_batt[] = "%3.1f\x76";
static const PROGMEM char f_int[]  = "%.0f";


// первый экран настроек
static const PROGMEM Params params1[] = { 
	{n_sets,    0,   0,  0,           0, 0},        // header
	{n_batt,   'b', 10, &sets.battv , 0, f_batt, 0, 255 },
	{n_battB,  'b', 10, &sets.battBv, 0, f_batt, 0, 255 },

	{n_stall,  'b', 1, &sets.stall,            0, f_int, 0, 255 },
	{n_oversp, 'b', 1, &sets.overspeed,        0, f_int, 0, 255 },
	{n_charge, 'b', 1, &sets.batt_warn_level,  0, f_int, 0, 255 },
	{n_rssi,   'b', 1, &sets.rssi_warn_level , 0, f_int, 0, 255 },


	
	{n_screen,  0,  0,   0,                    0,     0}, // header
	{n_scr,    'b', 1,   &sets.n_screens,      0,     f_int, 1, 4},
	{n_contr,  'b', 1,   &sets.OSD_BRIGHTNESS, renew, f_int, 0, 3},
	{n_horiz,  'c', 1,   &sets.horiz_offs,     renew, f_int, -31, 31 },
	{n_vert,   'c', 1,   &sets.vert_offs,      renew, f_int, -15, 15 },
};

// второй экран - горизонт
static const PROGMEM Params params2[] = { 
	{n_horizon,     'h', 0,   0,                 0, 0}, // header with pal/ntsc string
	{n_k_RollPAL,   'f', 1,   &sets.horiz_kRoll, 0, f_float, -4, 4},
	{n_k_PitchPAL,  'f', 1,   &sets.horiz_kPitch, 0, f_float, -4, 4},
	{n_k_RollNTSC,  'f', 1,   &sets.horiz_kRoll_a, 0, f_float, -4, 4},
	{n_k_PitchNTSC, 'f', 1,   &sets.horiz_kPitch_a, 0, f_float, -4, 4},
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
static uint16_t /*chan3_raw_middle,*/ chan4_raw_middle; // запомненные при входе значения каналов 3 и 4
const Params *params; // указатель на текущий набор параметров



void move_menu(char dir){

    const Setup_screen *pscreen;

    pscreen = &screens[setup_screen];

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

    float c_val;

    const Setup_screen *pscreen;

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
	    osd_write('>');
	    col=OSD::col;
	} else {
	    osd_write(' ');
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

	if(i == setup_menu) c_val = v; 


	osd_printf_1((PGM_P)pgm_read_word((void *)&p->fmt), v);
    }

    fptr tail = (fptr) pgm_read_word((void *)&pscreen->tail);

    if(tail) tail();

    if (millis() > text_timer) {
        //text_timer = millis() + 500; // 2 раз в секунду
        millis_plus(&text_timer,  500); // 2 раз в секунду
    } else return;

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


    v=c_val;
    
    switch (type){
	case 'c':
    	    { 
//    	        int l=*((char *)pval);
//		v = l / (float)(k);
	    }
	    goto as_byte;

        case 'b': // byte param
    	    { 
//    	        int l=*((byte *)pval);
//		v = l / (float)(k);
	    }
as_byte:
    	    size= 1;
	    if(     diff>300)	inc=10/(float)k;
	    else if(diff>150)	inc=1 /(float)k;
	    break;

        case 'f': // float param
//	    v=*((float *)pval);
	    size=4;
	
	    if(     diff>400) inc=1;
	    else if(diff>300) inc=0.1;
	    else if(diff>200) inc=0.01;
	    else if(diff>100) inc=0.001;

	    break;
    }


//    float value_old = v;
    bool press=false;
        
    
    if(diff>100){
//if(diff) Serial.printf_P(PSTR("diff=%d inc=%f\n"), diff,inc); Serial.wait();
	if(chan_raw[0] < chan1_raw_middle) v -= inc;
	if(chan_raw[0] > chan1_raw_middle) v += inc;

        if(v<min) v=min;
        if(v>max) v=max;

    } 


    if(v != c_val) {
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

	if(cb) cb(); // show tail
    }

}
