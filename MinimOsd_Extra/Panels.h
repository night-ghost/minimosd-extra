/******* PANELS - POSITION *******/


extern struct loc_flags lflags;  // все булевые флаги кучей


static void NOINLINE osd_setPanel(Point p){
    OSD::setPanel(p.x,p.y);
}
/*
static void NOINLINE osd_relPanel(Point p){
    OSD::relPanel(p.x,p.y);
}
*/

static void NOINLINE osd_nl(){
    OSD::write_S('\xff');
}

static void NOINLINE osd_blank(){
    OSD::write_S(' ');
}

static void NOINLINE osd_percent(){
    osd.write_S('%');
}


static /*NOINLINE*/ byte get_mhigh(){
    return pgm_read_byte(&measure->high);
}

static float /* NOINLINE */ cnvGroundSpeed() { // вынос инварианта

    return  mul_converts(osd_groundspeed);
}


/*static void NOINLINE osd_printi_xy(Point p, PGM_P fmt, int f){
    osd_setPanel(p);
    osd_printi_1(fmt, f);
}*/

static const PROGMEM char f3_0f[]="%3.0f";
static const PROGMEM char f_4i[]=".%4i";
static const PROGMEM char f3i[]="%3i";
static const PROGMEM char f2i[]="%2i";

static void NOINLINE printTime(uint16_t t, byte blink, byte sec=0){
    static const PROGMEM char f_02in[]="%02i\xff";

    osd_printi_1(f3i,((uint16_t)t/60));

    if(sec){
        osd_printi_1(PSTR(":%02i:"), (uint16_t)t%60);
        osd_printi_1(f_02in, (sec&0x7f));
    } else {
        osd.write_S( (blink && lflags.blinker)?0x20:0x3a);
        osd_printi_1(f_02in, (uint16_t)t%60);
    }
}

static void NOINLINE printTime(int t){
    printTime(t, 0);
}

static void NOINLINE printTimeCnv(uint32_t *t, byte blink){
    printTime(*t/1000, blink);
}


static void /* NOINLINE */  printSpeed(PGM_P fmt, float s, byte alt){
    byte c;
    
    if(alt){
	s = s /3.6;
	c=0x18;
    } else {
	c=pgm_read_byte(&measure->spe);
    }
    osd_printf_2(fmt,s,c);

}

static void NOINLINE printSpeedCnv(PGM_P fmt, float *s, byte alt){
    printSpeed(fmt, mul_converts(*s), alt);
}
static  NOINLINE  void printSpeedCnv(float *s, byte alt){
    printSpeedCnv(f3_0f, s, alt);
}


// ---------------- EXTRA FUNCTIONS ----------------------
// Show those fancy 2 char arrows
static void NOINLINE showArrow(int16_t grad){
    char arrow_set1 = 0x90;

    uint8_t rotate_arrow;

    rotate_arrow = grad_to_sect(grad);

    while(rotate_arrow>16) rotate_arrow -= 16;
    while(rotate_arrow<1)  rotate_arrow += 16;

    arrow_set1 += rotate_arrow * 2 - 2;

    OSD::write_S(arrow_set1); OSD::write_S(arrow_set1+1);
}



/*void  printArrow(byte c){
    OSD::write_S(c); OSD::write_S(c+1);
}*/

// Calculate and shows Artificial Horizon
// Smooth horizon by Jörg Rothfuchs
							// with different factors we can adapt do different cam optics
#define AH_PITCH_FACTOR		0.010471976		// conversion factor for pitch
#define AH_ROLL_FACTOR		0.017453293		// conversion factor for roll
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
#define ANGLE_DOT               70 // 50                      // angle above we switch to dots
#define ANGLE_VERT              70                      // angle above we switch to vertical lines

// Calculate and show artificial horizon
// used formula: y = m * x + n <=> y = tan(a) * x + n
static void showHorizon() {
    byte col, row;

    byte line_set = LINE_SET_STRAIGHT__;
    byte line_set_overflow = LINE_SET_STRAIGHT_O;
    int8_t subval_overflow = 9;



    float k_pitch, // conversion factor for pitch
	  k_roll ; // conversion factor for roll
    
    // NTSC: osd.getMode() == 0
    {
        byte fPAL=osd.getMode();
        k_pitch = (fPAL ? sets.horiz_kPitch:sets.horiz_kPitch_a);
        k_roll  = (fPAL ? sets.horiz_kRoll :sets.horiz_kRoll_a);
     }


    // preset the line char attributes
    float  roll = osd_att.roll * k_roll;
    if(screen_flags & scrFlg_russianHUD) roll = -roll;

    int iroll  = roll;

    if ((iroll >= 0 && iroll < 90) || (iroll >= -179 && iroll < -90)) {	// positive angle line chars
	iroll = iroll < 0 ? iroll + 179 : iroll;
	uint16_t a_roll=abs(iroll);
	if(       a_roll > ANGLE_VERT) {
	    line_set =          0xc1;
	    subval_overflow = 0;
	} else if( a_roll > ANGLE_DOT) {
	    line_set =          0x24;
	    subval_overflow = 0;
	} else if( a_roll > ANGLE_2) {
	    line_set =          LINE_SET_P___STAG_2;
	    line_set_overflow = LINE_SET_P_O_STAG_2;
            subval_overflow = 7;
	} else if( a_roll > ANGLE_1) {
	    line_set =          LINE_SET_P___STAG_1;
	    line_set_overflow = LINE_SET_P_O_STAG_1;
            subval_overflow = 8;
	}
    } else {								// negative angle line chars
	iroll = iroll > 90 ? iroll - 179 : iroll;
	uint16_t a_roll=abs(iroll);
	if(        a_roll > ANGLE_VERT) {
	    line_set =          0xc1;
	    subval_overflow = 0;
	} else if( a_roll > ANGLE_DOT) {
	    line_set =          0x24;
	    subval_overflow = 0;
        } else if( a_roll > ANGLE_2) {
	    line_set =          LINE_SET_N___STAG_2;
	    line_set_overflow = LINE_SET_N_O_STAG_2;
            subval_overflow = 7;
	} else if( a_roll > ANGLE_1) {
	    line_set =          LINE_SET_N___STAG_1;
	    line_set_overflow = LINE_SET_N_O_STAG_1;
            subval_overflow = 8;
	}
    }
    
    byte shf=0;
    int8_t shift_angle=0;
again:
    if(shf>6) return; // not forever

    int pitch_line = (int)(round(tan(-AH_PITCH_FACTOR * (osd_att.pitch + shift_angle )* k_pitch) * AH_TOTAL_LINES)) + AH_TOTAL_LINES/2;	// 90 total lines - вычислили Y центра
// -45 .. +45


    // по уму при угле большем угла диагонали надо переходить с расчета по столбцам на расчет по строкам
    for (col=1+shf; col<=AH_COLS-shf; col++) {
       // получим координаты средней субколонки каждой колонки
    //               = (col - AH_COLS/2 - 1/2) * CHAR_COLS;
        int8_t middle = col * CHAR_COLS - (AH_COLS/2 * CHAR_COLS) - CHAR_COLS/2;	  // -66 to +66	center X point at middle of each column
        
        // tg(72 gr) ==3 so byte overflows

        int16_t hit = (int)(tan(AH_ROLL_FACTOR * roll) * middle) + pitch_line;    // 1 to 90	calculating hit point on Y plus offset
        
        if (hit >= 1 && hit <= AH_TOTAL_LINES) {
	    row = (hit-1) / CHAR_ROWS;						  // 0 to 4 bottom-up

	    byte subval;
	    if(subval_overflow) // adjusted lines
	        subval = (hit - (row * CHAR_ROWS) + 1) / (CHAR_ROWS / CHAR_SPECIAL);  // 1 to 9
	    else
		subval = 0; // raw chars
	    
	    OSD::relPanel(col - 1, AH_ROWS - row - 1);
	    if(shift_angle!=0 && col==(AH_COLS-1)/2){ // time to draw scale
		osd.print(abs(shift_angle));
		col++; // skip next
	    } else {   // print the line char
                OSD::write_S(line_set + subval);
            }
	    
	    // check if we have to print an overflow line char
	    if ( subval && subval >= subval_overflow && row < 4) {  // only if it is a char which needs overflow and if it is not the upper most row
                OSD::write_xy(col - 1, AH_ROWS - row - 2, line_set_overflow + subval - OVERFLOW_CHAR_OFFSET);
	    }
        }
    }

 // если линия по питчу ушла с экрана то надо ее заузить на пару символов и сместить обратно
// уйти-то она может и ушла, но при кренах появляется в углах, поэтому надо отрисовывать И ту, И другую

// но вобшем-то лучше отнимать не строки, а угол, и возвращаться на шаг выше. Бонусом это даст возможность печатать посередине цифры угла

    if(pitch_line<0){
//       pitch_line += AH_TOTAL_LINES-2;
	shift_angle +=30;
        shf+=4;
        goto again;
    }
    if(pitch_line>AH_TOTAL_LINES){
//       pitch_line -= AH_TOTAL_LINES-2;
	shift_angle -=30;
        shf+=4;
        goto again;
    }


}


#define totalNumberOfLines  (9 * AH_ROWS)   //9 chars in chartset for horizontal line
#define totalNumberVertLines  (6 * AH_COLS) //6 chars in chartset for vertical line


static void showILS() {
    // Calculate and shows ILS
    
    //now ILS in dimensions of Horizon
    
    if(sets.model_type==0) { // plane

       { //Vertical calculation
        int currentAngleDisplacement = (int)(atan2(osd_alt_to_home, osd_home_distance) * 57.2957795 * 2) - 10;
        //Calc current char position.
        //int numberOfPixels = CHAR_ROWS * AH_ROWS;

        int linePosition = (totalNumberOfLines * currentAngleDisplacement / 10 + totalNumberOfLines) / 2; //+-5 degrees
        int8_t charPosition = linePosition / 9;
        uint8_t selectedChar = 8 - (linePosition % 9) + 0xC7;
        if(charPosition >= 0 && charPosition < AH_ROWS) {
          OSD::write_xy(AH_COLS, charPosition, selectedChar); // в первой и последней колонке
          OSD::write_xy(1,       charPosition, selectedChar);
        }
      }
      { //Horizontal calculation
	    int currentAngleDisplacement = normalize_angle(osd_home_direction - takeoff_heading);
    
            if(currentAngleDisplacement > 180) currentAngleDisplacement = 360 - currentAngleDisplacement; // we can to come to runway from opposite side
    
            currentAngleDisplacement-=180; // range -90..90
       
            int linePosition = totalNumberVertLines * currentAngleDisplacement / 10 + (totalNumberVertLines / 2); //+-5 degrees
            int8_t charPosition = linePosition / 6;
            uint8_t selectedChar = (linePosition % 6) + 0xBF;
            byte cl;
        
            if(charPosition < 0){
                cl=1; // в первой и последней строке
                selectedChar='<';
            } else if(charPosition > AH_COLS)  {
                cl = AH_COLS; // в первой и последней строке
                selectedChar='>';
            } else {
                cl=charPosition+1;
            }
            OSD::write_xy(cl, AH_ROWS-1, selectedChar );
            OSD::write_xy(cl, 0,         selectedChar );
      }
    } else { // copter
    
        //Show line on panel center because horizon line can be
        //high or low depending on pitch attitude

        char subval_char = 0xCF;

        char alt = ( mul_converth(osd_alt_mav) + 5) * 4.4; //44 possible position 5 rows times 9 chars
        byte row=0;

        if((alt < 44) && (alt > 0)){
            //We have 9 possible chars
            //% 9 -> Represents our 9 possible characters
            // 8 - -> Inverts our selected char because when we gain altitude
            //the selected char has a lower position in memory
            //+ C7 -> Is the memory displacement od the first altitude charecter 

            subval_char = (8 - (alt  % 9)) + 0xC7; // 9 уровней C7-CF
            //Each row represents 9 altitude units
            row += (alt / 9);
        }
        else if(alt >= 44){
            //Copter is too high. Ground is way too low to show on panel, 
            //so show down arrow at the bottom
            subval_char =0x2E; 
            row += 4;
        }

//	start_col += AH_COLS / 2; // middle of horizon

        //Enough calculations. Let's show the result
        OSD::write_xy(AH_COLS / 2, row, subval_char);
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

byte NOINLINE radar_char(){
// символы квадрика с ориентацией
    static const byte arr[] PROGMEM = {0xb0, 0xb1, 0xb4, 0xb5, 0xb6, 0xb7, 0x7b, 0x7d };


    int index;

    point p = readPanel(ID_of(RadarScale));
    if(is_alt(p)) {
        index = normalize_angle(osd_home_direction+180);
    } else {
        index = osd_heading;
    }
    index = (2 * index + 45) / 90;
    while(index<0)  index+=8;
    while(index>=8) index-=8;
    
    return pgm_read_byte(&arr[index]);
}

static void showRADAR(byte center_col, byte center_line, byte fTrack) {


    // calculate distances from home in lat (y) and lon (x) direction in [m]
//    int dst_y = (int)(-111319.5 * (osd_home.lat - osd_pos.lat));
//    int dst_x = (int)(-111319.5 * (osd_home.lon - osd_pos.lon) * cos(fabs(osd_home.lat) * 0.0174532925));
    
    // calculate display offset in y and x direction
    radar_zoom = max((int)(abs(dst_y) / STEP_WIDTH), (int)(abs(dst_x) / STEP_WIDTH)) + 1;
    

    byte y = (int)(dst_y / (radar_zoom / SCALE_Y));
    byte x = (int)(dst_x / (radar_zoom / SCALE_X) + 0.5);	// for even grid correction


    if(fTrack){
	if(trk[0].x !=x || trk[0].y !=y){	// положение изменилось
	    for(byte i=4; i!=1;){
		i--;
		trk[i] = trk[i-1]; // move points to end

	    }
	    trk[0].x =x;
	    trk[0].y =y;
	}
	
	for(byte i=3; i!=0;i--){
	    OSD::write_xy(center_col + trk[i].x, center_line - trk[i].y, 0x24);
	}
    }

    // show UAV
    OSD::write_xy(center_col + x, center_line - y, radar_char());

}





/******* PANELS - DEFINITION *******/
/* **************************************************************** */


/* **************************************************************** */
// Panel  : panHorizon
// Needs  : X, Y locations
// Output : 5 x 12 Horizon line surrounded by 2 cols (left/right rules)
// Size   : 5 x 14  (rows x chars)
// Staus  : done


static void inline spaces(byte n){
    while(n-- >0) osd_blank();
}

static void panHorizon(point p){
  
  // сначала нарисуем стрелочки.

    if(is_alt(p)) {
	byte i;
	for(i=5;i!=0; i--){ // 30 bytes of flash
            osd.write_S(i==3 ? '\xc6' : '\xb2');
            spaces(12);
            osd.write_S(i==3 ? '\xc5' : '\xb3');
            osd_nl();
	}
    }

    osd.setPanel(p.x + 1, p.y);
    
    if(!(screen_flags & scrFlg_hideHorizon))
        showHorizon();

    if(is_alt3(p))
       showRADAR(5, 2, is_alt4(p));

    if(has_sign(p)) { // Птичка по центру
	OSD::relPanel(5, 2);
	osd_print_S(PSTR("\xb8\xb9"));
/*        char c=0xb8;
	OSD::write_S(c);
	OSD::write_S(++c);
*/

    }

    //Show ground level on  HUD
    if(is_alt2(p) && lflags.motor_armed)
	showILS();

}





/* **************************************************************** */
// Panel  : COG Course Over Ground
// Needs  : X, Y locations
// Output : 
// Size   : 
// Staus  : done

static void panCOG(point p){

    int cog_100=(osd_cog + 50) / 100 - osd_heading;

    off_course = normalize_angle(cog_100)-180;   // -180..180

    showArrow(off_course+180); 
    osd_printi_1(PSTR("%4i\x05"), off_course);

}

static const PROGMEM char f5_2f[]="%5.2f";
static const PROGMEM char f4_2f[]="%4.2f";
static const PROGMEM char f4_1f[]="%4.1f";
static const PROGMEM char f4_0f[]="%4.0f";

static NOINLINE void printFullDist(float dd){

    float f =  mul_converth(dd);
    if (f <= 9999) { // in meters
	osd_printf_2(f4_0f, f, get_mhigh());

    }else{ // in kilometers
	f = f / pgm_read_word(&measure->distconv);
	PGM_P fmt;
	if((int)f<=9)
	    fmt = f4_2f;
	else if((int)f<=99)
	    fmt = f4_1f;
        else
            fmt = f4_0f;

        osd_printf_2(fmt, f, pgm_read_byte(&measure->distchar));
    }
}


// Panel  : ODO
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panDistance(point p){
    printFullDist(trip_distance);
}


/* **************************************************************** */
// Panel  : pantemp
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panTemp(point p){
    float f=((temperature / 10.0 * pgm_read_byte(&measure->tempconv) + pgm_read_word(&measure->tempconvAdd)) / 100);
    osd_printf_2(PSTR("%5.1f"),f, pgm_read_byte(&measure->temps));    
}

/* **************************************************************** */
// Panel  : efficiency
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done


static float        eff = 0; //Efficiency

static void calc_energy(){
#define EFF_FILTER 0.01
            filter(eff, (((float)osd_curr_A ) / cnvGroundSpeed())*10.0, 1/EFF_FILTER); // ток в 10ма, поэтому умножаем на 10
}

static void print_energy(point p){
    int iEff=eff;
    if (iEff > 0 && iEff <= 9999) {
        if(has_sign(p))
            OSD::write_S(0x16);
            
        osd_printf_2(f4_0f, eff, 0x01);
    }
}


static void panEff(point p){

    static float ddistance = 0;

    if(!lflags.motor_armed) return;

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wfloat-equal" // yes I know
    
    bool is_0 = (osd_groundspeed == 0); // no efficiency at 0 speed
#pragma GCC diagnostic pop

    
    if(is_alt(p)){

        calc_energy();
        print_energy(p);
	return;
    }

    if(sets.model_type==0){ // plane
#ifdef IS_PLANE
        if (!is_0) { // no efficiency at 0 speed

	    calc_energy();

            if (osd_throttle > 2){		// motor is working
                if (!lflags.throttle_on) 
                    lflags.throttle_on = 1;
    
		print_energy(p);

            }else{	// free fly
                if (lflags.throttle_on) {
                    palt = osd_alt_to_home;
                    ddistance = trip_distance;
                    lflags.throttle_on = 0;
                }

                if (osd_climb < -0.05){
                    float glide = ((osd_alt_to_home / (palt - osd_alt_to_home)) * (trip_distance - ddistance));
                    glide = mul_converth(glide);
                    int iGlide=glide;
                    if (iGlide > 9999) glide = 9999.0;
                    if (iGlide > 0){
                        if(has_sign(p))
                            OSD::write_S(0xee);
                        osd_printf_2(f4_0f, glide, get_mhigh()); // аэродинамическое качество
                    }
                }else if (/*osd_climb >= -0.05 &&*/ osd_att.pitch < 0) {
                    PGM_P f = PSTR("\x20\x90\x91");
                    if(lflags.blinker) f++;
                    osd_print_S(f); //термик
                }
            }
        }


#endif
    } else { // copter
#ifdef IS_COPTER
      
      // show estimated flight time
      
      if (lflags.motor_armed) { //Check takeoff just to prevent initial false readings
#if !defined(USE_UAVTALK)
        if(osd_battery_remaining_A != last_battery_reading) {    // UAVtalk sends this itself
            remaining_estimated_flight_time_seconds = f_div1000((float)osd_battery_remaining_A * total_flight_time_milis / 
        					    (max_battery_reading - osd_battery_remaining_A));
            last_battery_reading = osd_battery_remaining_A;
	}
#endif
	if(has_sign(p))
	    OSD::write_S(0x17);

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

static void panRSSI(point p){
    static float rssi=0;

    filter(rssi,  rssi_norm, get_alt_filter(p) ); // комплиментарный фильтр 1/n.

    osd_printi_1(f3i, (int)rssi);
    if(!(sets.RSSI_raw%2) && is_alt3(p))
	osd_percent();
}

/* **************************************************************** */
// Panel  : panCALLSIGN
// Needs  : X, Y locations
// Output : Call sign identification
// Size   : 1 x 6Hea  (rows x chars)
// Staus  : done

static void panCALLSIGN(point p){
    if((seconds % 64) < 2 || is_alt(p)){
      osd.print( (char *)sets.OSD_CALL_SIGN);
    }
}


/* **************************************************************** */
// Panel  : pan wind speed
// Needs  : X, Y locations
// Output : Wind direction symbol (arrow) and velocity
// Size   : 1 x 7  (rows x chars)
// Staus  : done

static void panWindSpeed(point p){

    int dir=normalize_angle(osd_winddirection);

    filter(nor_osd_windspeed,  osd_windspeed, 100 ); // комплиментарный фильтр 1/100 

    bool alt=is_alt(p);

    printSpeedCnv(&osd_windspeed, alt);
    osd_nl();

    showArrow(dir - osd_heading + (is_alt2(p)?180:0) ); //print data to OSD
    printSpeedCnv(PSTR("%2.0f"), &nor_osd_windspeed, alt);

}


/* **************************************************************** */
// Panel  : panAlt
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panAlt(point p){

    if(is_alt2(p)){
        float f=osd_alt_mav;
        if(is_alt(p)) f -= home_alt_mav;
        printFullDist(f);
    }else {
        long v=osd_pos.alt;
        if(is_alt(p)) v-=osd_home.alt;
        printFullDist(f_div1000(v));
    }
}


/* **************************************************************** */
// Panel  : panHomeAlt
// Needs  : X, Y locations
// Output : Alt symbol and home altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panHomeAlt(point p){

    float v=osd_alt_to_home;
    
    if(is_alt(p) || (*(long *)&v)==0) v = osd_alt_mav;
    //printDistCnv(v);
    printFullDist(v);
}



/* **************************************************************** */
// Panel  : panClimb
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panClimb(point p){

    climb_filter = get_alt_filter(p);
    
    static const PROGMEM char f_4_0f[]="% 4.0f";

    if(is_on(p)){

        if(is_alt3(p)) { 	// in m/s
            lflags.vs_ms=1;
            PGM_P fmt;
            float v= vertical_speed; // filtered in func.h
            int as = abs(v);
	
            if(as<10 && !is_alt4(p))
                fmt=PSTR("% 4.2f");
            else if(as < 100)
                fmt=PSTR("% 4.1f");
            else
                fmt=f_4_0f;
            osd_printf_2(fmt, v, 0x18);
        } else {
            lflags.vs_ms=0;
            float f = vertical_speed*60;
            osd_printf_2(f_4_0f, f, pgm_read_byte(&measure->climbchar));
        }
    }
}

/* **************************************************************** */
// Panel  : panVel
// Needs  : X, Y locations
// Output : Velocity value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

static void panVel(point p){

    printSpeedCnv(&osd_groundspeed,is_alt(p));
}

/* **************************************************************** */
// Panel  : panAirSpeed
// Needs  : X, Y locations
// Output : Airspeed value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

static void panAirSpeed(point p){

    printSpeedCnv(&osd_airspeed, is_alt(p));
}

/* **************************************************************** */

#define WARNINGS 11

uint8_t warning;

static inline void check_warn(point p)
{
    uint16_t wmask = 0;
    uint16_t bit;
    uint8_t prev_warn;


    if (!lflags.one_sec_timer_switch) return;
    lflags.one_sec_timer_switch=0;


    int iAirspeed =  mul_converts(osd_airspeed);
    int iVolt = batt_a_volt_filtered/100; // in 0.1v as sets.battv is


//1
    if (lflags.gps_active && osd_fix_type < 2) // GPS был но сейчас плохой
        wmask |= 1; //0
 
//2    
    if (sets.model_type==0 && iAirspeed < sets.stall && lflags.in_air ) // plane
        wmask |= (1<<1);

//3    
    if (sets.overspeed && iAirspeed > sets.overspeed) 
        wmask |= (1<<2);


    int vbat = (osd_battery_remaining_A * 100  + max_battery_reading/2)/ max_battery_reading; // normalize to 100
    
//4    voltage limit set and less                   capacity limit set and less
    if ( (sets.battv !=0 && iVolt!=0 && (iVolt < sets.battv)) || (sets.batt_warn_level != 0 &&  (vbat < sets.batt_warn_level)) )
        wmask |= (1<<3);

//5
    // не сырое значение  
    if (!(sets.RSSI_raw%2) && rssi_norm < sets.rssi_warn_level )
        wmask |= (1<<4);

    int iVs = (int)abs(vertical_speed*60)/10;

//6
    if (sets.model_type==1 && sets.stall >0 && iVs > sets.stall ) // copter - vertical speed
        wmask |= (1<<5);

    iVolt = batt_b_volt_filtered/100; // in 0.1v as sets.battBv is

//7    voltage limit set and less                   capacity limit set and less
    if (sets.battBv !=0 && iVolt!=0 && (iVolt < sets.battBv) )
        wmask |= (1<<6);

#if defined(USE_MAVLINK)  || defined(USE_MAVLINKPX4)
  if(is_alt(p)) {
//8
    if(mav_fence_status == FENCE_BREACH_MINALT)
        wmask |= (1<<7);

//9
    if(mav_fence_status == FENCE_BREACH_MAXALT)
        wmask |= (1<<8);

//10
    if(mav_fence_status == FENCE_BREACH_BOUNDARY)
        wmask |= (1<<9);
  }
#endif

    if(sets.halfThrottleCurrent && osd_throttle >70 && (uint8_t)filteredCurrent < sets.halfThrottleCurrent){
        wmask |= (1<<10);
    }

    if(wmask == 0) {
        warning = 0;
    }else {
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

}

// Panel  : panWarn
// Needs  : X, Y locations
// Output : Airspeed value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done


const char PROGMEM w1[]="\x4E\x6F\x20\x47\x50\x53\x20\x66\x69\x78"; // No GPS fix
const char PROGMEM w2[]="\x20\x20\x53\x74\x61\x6c\x6c";             //   Stall
const char PROGMEM w3[]="\x4f\x76\x65\x72\x53\x70\x65\x65\x64";     // Over Speed
const char PROGMEM w4[]="\x42\x61\x74\x74\x65\x72\x79\x20\x4c\x6f\x77"; //Battery Low
const char PROGMEM w5[]="\x20\x4c\x6f\x77\x20\x52\x73\x73\x69";        // Low Rssi!
const char PROGMEM w6[]="\x48\x69\x67\x68\x20\x56\x53\x70\x65\x65\x64"; //Hi VSpeed
const char PROGMEM w7[]="Batt B low"; 
const char PROGMEM w8[]="Fence Low";
const char PROGMEM w9[]="Fence High";
const char PROGMEM w10[]="Fence Far";
const char PROGMEM w11[]="Motor dead";
const char * const PROGMEM warn_str[] = {
    w1,
    w2,
    w3,
    w4,
    w5,
    w6,
    w7,
    w8,
    w9,
    w10,
    w11,
};

static void panWarn(point p){
//    osd_setPanel(p); // warn differs!

    check_warn(p);

    if(warning) {
        osd_print_S((char *)pgm_read_word(&warn_str[warning-1]) );
        OSD::write_S('!');
    }

}



/* **************************************************************** */
// Panel  : panThr
// Needs  : X, Y locations
// Output : Throttle value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

static void panThr(point p){
    osd_printi_1(f3i, osd_throttle);
    osd_percent();
}

/* **************************************************************** */
// Panel  : panBatteryPercent
// Needs  : X, Y locations
// Output : Battery state from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done


static /*NOINLINE */ byte guessMaxVolt(){
    if(max_battery_reading >=95 && max_battery_reading <=100) 
        return 100;

    return 255;
}

static void panBatteryPercent(point p){

    uint16_t val;

    byte maxv = guessMaxVolt();

    if(maxv==100)
        val = osd_battery_remaining_A;
    else
        val = (osd_battery_remaining_A*100)/maxv;


    setBatteryPic((val*256)/100, osd_battery_pic_A);    // battery A remaning picture
//    setBatteryPic(osd_battery_remaining_B, osd_battery_pic_B);     // battery B remaning picture

    if(has_sign(p)) {
        OSD::write_S(0x88); // донышко батарейки не зависит от
        OSD::write_S(osd_battery_pic_A[0]);
        OSD::write_S(osd_battery_pic_A[1]);
        OSD::write_S(0x8e);
    }

    if (is_alt(p)) {
	osd_printi_1(f2i,val);        
        osd_percent();
    } else {
	osd_printi_1(f_4i+1,mah_used);
        osd.write_S(0x01);
    }

}

/* **************************************************************** */
// Panel  : panTime
// Needs  : X, Y locations
// Output : Time from start with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

static void panTime(point p){

    printTimeCnv(&total_flight_time_milis, is_alt(p)); // blink
}


/* **************************************************************** */
// Panel  : panHomeDis
// Needs  : X, Y locations
// Output : Home Symbol with distance to home in meters
// Size   : 1 x 7  (rows x chars)
// Staus  : done

static void panHomeDis(point p){

    lflags.resetHome = is_alt(p);

    if(!lflags.osd_got_home || !is_on(p)) return;

    printFullDist(osd_home_distance);
}


/* **************************************************************** */
// Panel  : panPitch
// Needs  : X, Y locations
// Output : -+ value of current Pitch from vehicle with degree symbols and pitch symbol
// Size   : 1 x 6  (rows x chars)
// Staus  : done

static void panPitch(point p){
    osd_printi_1(PSTR("%4i\x05\x07"),osd_att.pitch);
}

/* **************************************************************** */
// Panel  : panRoll
// Needs  : X, Y locations
// Output : -+ value of current Roll from vehicle with degree symbols and roll symbol
// Size   : 1 x 6  (rows x chars)
// Staus  : done

static void panRoll(point p){
    osd_printi_1(PSTR("%4i\x05\x06"),osd_att.roll);
}

/* **************************************************************** */
// Panel  : panCur_A
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7  (rows x chars)
// Staus  : done

static void panCur_A(point p){
// filtered current for warning and panel
    filter(filteredCurrent,  osd_curr_A, get_alt_filter(p) ); // комплиментарный фильтр 1/n.

    if(!is_on(p)) return;

    PGM_P fmt;    

    if(is_alt3(p))
        fmt=f4_1f;
    else
        fmt=f5_2f;

    float f = filteredCurrent * 0.01;
    osd_printf_2(fmt, f, 0x0E); // in amps
}

/* **************************************************************** */
// Panel  : panBattery A (Voltage 1)
// Needs  : X, Y locations
// Output : Voltage value as in XX.X and symbol of over all battery status
// Size   : 1 x 8  (rows x chars)
// Staus  : done


static void NOINLINE printVolt(uint16_t v,byte f) {
    PGM_P fmt;
    if(f)
        fmt=f4_1f;
    else
        fmt=f5_2f;
    
    float d = f_div1000(v);

    osd_printf_2(fmt,d, 0x0D);
}

static void panBatt_A(point p){

    // should be here to use panel's settings
    filter(batt_a_volt_filtered,  osd_vbat_A, get_alt_filter(p) ); // комплиментарный фильтр 1/n.
    
    if(is_on(p)) {
        printVolt(batt_a_volt_filtered, is_alt3(p));
    }
}


/* **************************************************************** */
// Panel  : panBattery B (Voltage 2)
// Needs  : X, Y locations
// Output : Voltage value as in XX.X and symbol of over all battery status
// Size   : 1 x 8  (rows x chars)
// Staus  : done

static void panBatt_B(point p){
    // should be here to use panel's settings
    filter(batt_b_volt_filtered,  osd_vbat_B, get_alt_filter(p) ); // комплиментарный фильтр 1/n.

    if(is_on(p)) {
	lflags.battB_is_on=1; // отобразить состояние панели во ФЛАГЕ

    
        printVolt(batt_b_volt_filtered, is_alt3(p));
    } else
        lflags.battB_is_on = ( sets.battBv!=0 ); // включено если есть надобность контроля
}


static void panPower(point p){
	    // calced in func.h
    osd_printf_1(f3_0f, power);
}



/* **************************************************************** */
// Panel  : panGPSats
// Needs  : X, Y locations
// Output : 1 symbol and number of locked satellites
// Size   : 1 x 5  (rows x chars)
// Staus  : done

static void panGPSats(point p){

    byte gps_str = 0x2a;

    if (osd_fix_type == 2) gps_str = 0x1f;
    if (osd_fix_type >= 3) gps_str = 0x0f;

    if ((eph >= 200) && lflags.blinker)
       gps_str = 0x20;

    if(has_sign(p) && !is_alt(p))
	OSD::write_S(gps_str);

    osd_printi_1(f2i, osd_satellites_visible);
    
    if(has_sign(p) && is_alt(p))
	OSD::write_S(gps_str);

}

/* **************************************************************** */
// Panel  : panGPS
// Needs  : X, Y locations
// Output : two row numeric value of current GPS location with LAT/LON symbols as on first char
// Size   : 2 x 12  (rows x chars)
// Staus  : done


static uint32_t NOINLINE coord_frac(float &f, byte fLow){
    float v=abs(f);
    
    return (v-(int)v) * (fLow?100000.0:1000000.0);
}


static const PROGMEM char gps_f0[]="%06ld";
static const PROGMEM char gps_f1[]="%05ld";

static const PROGMEM char gps_f4[]="%10.6f";
static const PROGMEM char gps_f5[]="%9.5f";

static const PROGMEM char * const gps_fmt[]= {
    gps_f0, gps_f1
};

static const PROGMEM char * const gps_fmtF[]= {
    gps_f4, gps_f5
};



static void NOINLINE  print_coord(point p, float *v) {
    PGM_P f;

    byte idx = is_alt(p)?1:0;      // low precision

    if(is_alt2(p)){ // fractional
	f=(const char *)pgm_read_word(&gps_fmt[idx]);
        osd.printf_P(f, coord_frac(*v, idx) );
	return;
    } 

    f=(const char *)pgm_read_word(&gps_fmtF[idx]);
    osd_printf_1(f, *v);
}



static void panGPS(point p){
    
    if(!(*((long *)&osd_pos.lon) || *((long *)&osd_pos.lat))) return; // не выводим координат если нету

    byte div = is_alt3(p)?' ':'\xff'; // row or column


    if(lflags.blinker) {
        PGM_P str=PSTR("Stream");
	if(lflags.mav_data_frozen>=MAX_FROZEN_COUNT){
	    osd_print_S(str);
	    OSD::write_S(div);
	    osd_print_S(PSTR("frozen"));
	    return;
	}
	if(lflags.mav_stream_overload>=MAX_OVERLOAD_COUNT){
	    osd_print_S(str);
	    OSD::write_S(div);
	    osd_print_S(PSTR("overload"));
	    return;
	}
    }

    if(has_sign(p)) OSD::write_S(3);
    print_coord(p, &osd_pos.lat);
    OSD::write_S(div);
    if(has_sign(p)) OSD::write_S(4);
    print_coord(p, &osd_pos.lon);
}


static void panGPS_lat(point p){
    print_coord(p, &osd_pos.lat);
}

static void panGPS_lon(point p){
    print_coord(p, &osd_pos.lon);
}

/* **************************************************************** */
// Panel  : panFdata
// Needs  : X, Y locations
// Output : 
// Size   : 
// Staus  : done

struct Formats {
    PGM_P fmt;
    char c;
    char t;
    void *v;
    char m;
};


static NOINLINE void print_list(const Formats *f, byte cnt){
    PGM_P fmt;
    byte t;
    float *v;
    float k;
    char h;
    
    float val=0;

    for(;;){
	fmt=(const char *)pgm_read_word(&f->fmt);
	if(fmt==0) {
	    return;
	}

	char c  = pgm_read_byte(&f->c);
	if(c) OSD::write_S(c);
	
	t  = pgm_read_byte(&f->t);
	v  = (float *)pgm_read_word(&f->v);

	h=' ';

	switch(t){
	case 'i':
	    val = * (int *)v;
	    break;

	case 'h':
	    h=get_mhigh();
	    k=get_converth();
	    goto as_f;

	case 's':
	    h=pgm_read_byte(&measure->spe);
	    k=get_converts();
	    goto as_f;

	case 'a': // current
	    k=1/100.0;
	    h='A';
	    goto as_f;

	case 'v': // vertical speed
	    k=get_converth();
	    if(lflags.vs_ms) {
	        h = 0x18;
	    } else {
	        h=pgm_read_byte(&measure->climbchar);
	        k*=60;
	    }
	    goto as_f;

	case 'f':
	default:
	    k=1;
as_f:
	    val = ( * (float *)v ) * k;
	    break;
	}

	osd_printf_2(fmt,val,h);

	osd_nl();
	f++;
	cnt--;
	if(cnt==0) break;
    }


}

static void panFdata(point p){ // итоги полета

    static const char PROGMEM fmt0[]="%7.2f";
    static const char PROGMEM fmt1[]="%6.1f";
    static const char PROGMEM fmt6[]="\x91%7.2f";
    static const char PROGMEM fmt7[]="\xA1%7.2f";

    static const PROGMEM Formats fd[] = {
	{fmt0, '\x0B', 'h',  &max_home_distance   },
	{fmt1, '\x8F', 'h',  &trip_distance       },
	{fmt1, '\x14', 's',  &max_osd_groundspeed },
	{fmt1, '\x1d', 's',  &max_osd_windspeed   },
	{fmt1, '\x12', 'h',  &max_osd_home_alt    },
	{fmt6, '\x90', 'v',  &max_osd_climb       },
	{fmt7, '\xA0', 'v',  &min_osd_climb       },
	{fmt1, '\xBD', 'a',  &max_osd_curr_A      },
	{fmt1, 'W',    'w',  &max_osd_power       },
	{fmt1, '\x01', 'f',  &mah_used            },
    };


    osd_setPanel(p);
    osd.write_S(0x08); // this is absolutely needed!

    printTimeCnv(&total_flight_time_milis, 0);


/*
  byte h=pgm_read_byte(&measure->high);

  osd.printf_P(PSTR("|\x0B%5i%c|\x8F%5i%c|\x14%5i%c|\x12%5i%c|\x03%10.6f|\x04%10.6f"),
		      (int)((max_home_distance) * pgm_read_float(&measure->converth)), h,
		                 (int)(trip_distance * pgm_read_float(&measure->converth)), h,
		                	(int)(max_osd_groundspeed * pgm_read_float(&measure->converts)),pgm_read_byte(&measure->spe),
		                		    (int)(max_osd_home_alt * pgm_read_float(&measure->converth)), h,
		                			      osd_pos.lat, 
		                			    		osd_pos.lon);
//*/


    print_list(fd, sizeof(fd)/sizeof(Formats));

    if(is_alt(p)) {
        OSD::setPanel(p.x + 10,p.y);
    }

    //print_gps(gps_f6,0xff);
    OSD::write_S(3);
    print_coord({0,0}, &osd_pos.lat);
    osd_nl();
    OSD::write_S(4);
    print_coord({0,0}, &osd_pos.lon);
    
}


//* **************************************************************** */
// Panel  : panTune
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done
    
static void panTune(point p){
/*
    copter's panel has much more usefull info so plane should be wiped out

*/

#ifdef IS_COPTER
    static const PROGMEM char fmt0[]="R%3.0f\x05"; // separate format & header loses 30 bytes
    static const PROGMEM char fmt1[]="P%3.0f\x05";
    static const PROGMEM char fmt2[]="H%3.0f\x05";
    static const PROGMEM char fmt3[]="B%5.1f\x05";
    static const PROGMEM char fmt4[]="E%5.1f";
    static const PROGMEM char fmt5[]="E%4.0f\x6D";
    static const PROGMEM char fmt6[]="sE%5.1f";

    static const PROGMEM Formats fd[] = {
	{ fmt0, 'n', 'i', &nav_roll          },
	{ fmt1, 'n', 'i', &nav_pitch         },
	{ fmt2, 'n', 'i', &nav_bearing       },
	{ fmt3, 'T', 'i', &wp_target_bearing },
	{ fmt4, 'A', 'h', &alt_error         },
	{ fmt5, 'X', 'i', &xtrack_error      },
	{ fmt6, 'A', 's', &aspd_error        },
    };


    print_list(fd,sizeof(fd)/sizeof(Formats));

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
	OSD::write_S(0x11);
    
    float err = -mul_converth(alt_error);

    osd_printf_2(f3_0f, err, get_mhigh());
    
    osd_nl();
    if(has_sign(p)) 
        OSD::write_S(0x13);
    printSpeed(aspd_error/100.0);
 #endif
#endif
}


//------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

static void panWaitMAVBeats(){

#if 0 // testintg things
    OSD::setPanel(0,0);
#endif
    osd_groundspeed=0; // to not move with last speed when "no data"

    OSD::setPanel(5,2);
    osd_printi_1(PSTR("No input data! %u\xff"),seconds - lastMavSeconds);

#if defined(AUTOBAUD)
    if(serial_speed)
        osd.print(serial_speed); // detected port speed
#endif

#if defined(DEBUG)
    extern uint16_t packet_drops;
    extern long bytes_comes;
    extern volatile uint16_t lost_bytes;
    extern uint16_t packets_skip;
    extern uint16_t packets_got;

    OSD::setPanel(1,5);
    osd.printf_P(PSTR("loop time=%dms crc drops=%u\xff bytes=%ld lost=%u"),max_dly, packet_drops, bytes_comes,  lost_bytes);
    osd.printf_P(PSTR("\xffpackets got=%u skip=%u"), packets_got, packets_skip);
    osd.printf_P(PSTR("\xffstack bottom = %x"),stack_bottom);
//    osd.printf_P(PSTR("\xffwait=%u %u \xff%lu \xff%lu"), time_since(&lastMAVBeat), millis() - lastMAVBeat ,  lastMAVBeat, millis() );
//    osd.printf_P(PSTR("\xffmav max=%lu sum= %lu \xffcnt=%u\xff"), mavlink_dt, mavlink_time, mavlink_cnt );
    
    lflags.input_active=0;
#else
    panFdata(do_alt({3,4}));
#endif
}


/* **************************************************************** */
// Panel  : panHeading
// Needs  : X, Y locations
// Output : Symbols with numeric compass heading value
// Size   : 1 x 5  (rows x chars)
// Staus  : not ready

static void panHeading(point p){
    if(has_sign(p)){
	OSD::write_S(radar_char());
    }

    osd_printi_1(f3i, osd_heading);
    OSD::write_S(0x05);
}

/* **************************************************************** */
// Panel  : panRose
// Needs  : X, Y locations
// Output : a dynamic compass rose that changes along the heading information
// Size   : 2 x 13  (rows x chars)
// Staus  : done

static void panRose(point p){
 // generate the heading patern

    static const unsigned char buf_Rule[] PROGMEM = {
      0x82,0x80,0x81,0x80,0x81,0x80,
      0x84,0x80,0x81,0x80,0x81,0x80,
      0x83,0x80,0x81,0x80,0x81,0x80,
      0x85,0x80,0x81,0x80,0x81,0x80
     };


    PGM_P s;

    if(has_sign(p) && !is_alt(p)){
        if (is_alt2(p))
            s=PSTR("\x20\x20\x20\x24\xcb\xb8\xb9\xcb\x24\x20\x20\x20\xff");
        else
            s=PSTR("\x20\xc8\xc8\xc8\xc8\x7e\xc8\xc8\xc8\xc8\x20\xff");
            
        osd_print_S(s);
    }

    osd.write_S('\xc3');

    int pos = (osd_heading * 24+12)/360 - 4;
    byte start=pos;
    if(pos < 0) start += 24;
  
    uint8_t x;
    for(x=(is_alt2(p)?10:9); x != 0; x--){
        osd.write_S( pgm_read_byte(&buf_Rule[start]) );
        if(++start >= 24) start = 0;
    }

    osd.write_S('\x87');
    
    if(has_sign(p) && is_alt(p)){
        if (is_alt2(p)) {
            s=PSTR("\xff\x20\x20\x20\x24\xcb\x7c\x40\xcb\x24" /* \x20\x20\x20| */ );
        } else
            s=PSTR("\xff\x20\xce\xce\xce\xce\x60\xce\xce\xce\xce" /* \x20 */);
        
        osd_print_S(s);
    }
}


static int getTargetBearing(){
    int a=normalize_angle(wp_target_bearing);

    return a - osd_heading; 
}

/* **************************************************************** */
// Panel  : panWPDis
// Needs  : X, Y locations
// Output : W then distance in Km - Distance to next waypoint
// Size   : 1 x 2  (rows x chars)
// Staus  : OK

static void panWPDis(point p){
//    if (osd_mode == 10){ // auto

	int err=xtrack_error;
        if (err > 999)  err = 999;
        if (err < -999) err = -999;

        byte h=get_mhigh();

        osd_printi_1(f2i, wp_number);
        osd_blank();
        float f = (float)wp_dist;
        f=mul_converth(f);
        osd_printf_2(f4_0f, f, h);
        osd_nl();
    
        showArrow(getTargetBearing());
        osd_print_S(PSTR("\x20\x58\x65")); //Xe
        f=err;
        f = mul_converth(f);
        osd_printf_2(f4_0f, f, h);
//    }
}

/* **************************************************************** */
// Panel  : panHomeDir
// Needs  : X, Y locations
// Output : 2 symbols that are combined as one arrow, shows direction to home
// Size   : 1 x 2  (rows x chars)
// Status : not tested

static void panHomeDir(point p){
    if(!lflags.osd_got_home) return;

    showArrow(osd_home_direction);
    
    if(is_alt(p)) osd_printi_1(f3i, osd_home_direction);
}

static void panMessage(point p){

#define MAX_MSG_SIZE 26

    if(mav_message[0] && mav_msg_ttl != seconds) { // вызывается не реже 2 раз в секунду поэтому точное сравнение будет работать
	char sign=0;

#if defined(USE_MAVLINK)  || defined(USE_MAVLINKPX4)
        if(has_sign(p) && mav_msg_severity <= MAV_SEVERITY_CRITICAL) sign='!';
#endif


	int8_t diff = MAX_MSG_SIZE - mav_msg_len; // can it fit to screen?
	if( diff >= 0) { 		// yes! message less than screen
	    //OSD::setPanel(p.x + ((byte)diff)/2,p.y); // show it centered
	    OSD::relPanel(((byte)diff)/2,0); // show it centered
	    if(sign) OSD::write_S(sign);
	    osd.print((char *)mav_message);

	} else {				// message don't fit
	    int pos;
	    
	    if(sign) OSD::write_S(sign);
	    if(is_alt(p)){
		pos = 0;  // show only first chars
	    } else {  /// else - animate
	    
	        byte shf = count02s - mav_msg_shift; // count of 0.2s from message arrival
	        byte tail = -diff;			 // number of off-screen chars
	        pos = shf % (tail*2); // pos moves in range -tail ... +tail (shifted up on tail)
	    
	        int8_t bpos=pos;	// byte size pos
	    
	        if(bpos>tail) bpos=tail*2 - bpos; // upper half - we move pos back
	
	        if(!skip_inc && (pos==0 || pos==tail-1)) skip_inc++; // on ends we stop moving for some time

	    }
	    {// let's print needed part of message
	        char *cp = (char *)&mav_message[pos];
	    
	        for(byte i=MAX_MSG_SIZE; i!=0; i--){
		    byte c = *cp++;
		    if(c==0) break;
		    OSD::write_S(c);
		}
		osd_blank();
	    }
	}
    } else {
	mav_message[0]=0; // no message
    }
}




/* **************************************************************** */
// Panel  : panFlightMode 
// Needs  : X, Y locations
// Output : 2 symbols, one static name symbol and another that changes by flight modes
// Size   : 1 x 2  (rows x chars)
// Status : done

//#ifdef IS_COPTER
const char PROGMEM s_m_stab[] = "stab"; //Stabilize	0
const char PROGMEM s_m_acro[] = "acro"; //Acrobatic	1
const char PROGMEM s_m_alth[] = "alth"; //Alt Hold	2
const char PROGMEM s_m_auto[] = "auto"; //Auto		3
const char PROGMEM s_m_guid[] = "guid"; //Guided	4
const char PROGMEM s_m_loit[] = "loit"; //Loiter	5
const char PROGMEM s_m__rtl[] = "rtl";  //Return to Launch 6
const char PROGMEM s_m_circ[] = "circ"; //Circle	7
const char PROGMEM s_m_posh[] = "posh"; //Position Hold (Old) 8
const char PROGMEM s_m_land[] = "land"; //Land		9
const char PROGMEM s_m_oflo[] = "oflo"; //OF_Loiter 	10
const char PROGMEM s_m_drif[] = "drif"; //Drift		11
const char PROGMEM s_mode_n[] = "m_%d"; //              12
const char PROGMEM s_m_sprt[] = "sprt"; //Sport		13
const char PROGMEM s_m_flip[] = "flip"; //Flip		14
const char PROGMEM s_m_tune[] = "tune"; //Tune		15
const char PROGMEM s_m_hold[] = "hold"; //Position Hold (Earlier called Hybrid) 16
const char PROGMEM s_m__brk[] = "brk";  //brake 17
const char PROGMEM s_m_thrw[] = "thrw"; //throw 18
const char PROGMEM s_m_adsb[] = "adsb"; //19:Avoid_ADSB
const char PROGMEM s_m_ngps[] = "nGPS"; //20:Guided_NoGPS
const char PROGMEM s_m_srtl[] = "srtl"; //21:Smart_RTL
const char PROGMEM s_m_flow[] = "flow"; //22:flow hold
const char PROGMEM s_m_foll[] = "foll"; //23:Follow

const char PROGMEM p_m_manu[] = "manu"; //Manual
const char PROGMEM p_mode03[] = "trai"; //Training
const char PROGMEM p_mode05[] = "fbwa"; //FLY_BY_WIRE_A
const char PROGMEM p_mode06[] = "fbwb"; //FLY_BY_WIRE_B
const char PROGMEM p_mode07[] = "cruz"; //Cruise
const char PROGMEM p_mode08[] = "atun"; //autotune
//const char PROGMEM p_mode10[] = "auto"; //AUTO
//const char PROGMEM p_mode11[] = "rtl "; //Return to Launch
//const char PROGMEM p_mode12[] = "loit"; //Loiter
//const char PROGMEM p_mode13[] = "m_13"; 
//const char PROGMEM p_mode14[] = "m_14"; 
//const char PROGMEM p_mode15[] = "guid"; //GUIDED
const char PROGMEM p_mode16[] = "init"; //initializing
const char PROGMEM p_mode17[] = "qstb"; //quad-stabilize
const char PROGMEM p_mode18[] = "qhov"; //quad-hover (alt-hold)
const char PROGMEM p_mode19[] = "qloi"; //quad-loiter


#if defined(USE_MAVLINKPX4)
/*
    
    enum PX4_CUSTOM_MAIN_MODE {
        PX4_CUSTOM_MAIN_MODE_MANUAL = 1,
        PX4_CUSTOM_MAIN_MODE_ALTCTL,
        PX4_CUSTOM_MAIN_MODE_POSCTL,
        PX4_CUSTOM_MAIN_MODE_AUTO,
        PX4_CUSTOM_MAIN_MODE_ACRO,
        PX4_CUSTOM_MAIN_MODE_OFFBOARD,
        PX4_CUSTOM_MAIN_MODE_STABILIZED
    };

    enum PX4_CUSTOM_SUB_MODE_AUTO {
        PX4_CUSTOM_SUB_MODE_AUTO_READY = 1,
        PX4_CUSTOM_SUB_MODE_AUTO_TAKEOFF,
        PX4_CUSTOM_SUB_MODE_AUTO_LOITER,
        PX4_CUSTOM_SUB_MODE_AUTO_MISSION,
        PX4_CUSTOM_SUB_MODE_AUTO_RTL,
        PX4_CUSTOM_SUB_MODE_AUTO_LAND,
        PX4_CUSTOM_SUB_MODE_AUTO_RTGS
    };


*/

 const char PROGMEM p_m_offb[] = "offb"; // OFFBOARD
 const char PROGMEM p_m__rdy[] = "rdy"; 
 const char PROGMEM p_m_tkof[] = "tkof"; // OFFBOARD
 const char PROGMEM p_m_miss[] = "miss";
 const char PROGMEM p_m_rtgs[] = "rtgs";

 char const * const mode_c_strings[] PROGMEM ={ 
    s_mode_n, p_m_manu, s_m_alth, s_m_posh,
    s_m_auto, s_m_acro, p_m_offb, s_m_stab
 };

 char const * const subm_c_strings[] PROGMEM ={ 
    p_m__rdy, p_m_tkof, s_m_loit, p_m_miss,
    s_m__rtl, s_m_land, p_m_rtgs    
 };

#else


 #ifdef IS_COPTER
 char const * const mode_c_strings[] PROGMEM ={ 
    s_m_stab, s_m_acro, s_m_alth, s_m_auto, s_m_guid, 
    s_m_loit, s_m__rtl, s_m_circ, s_m_posh, s_m_land, 
    s_m_oflo, s_m_drif, s_mode_n, s_m_sprt, s_m_flip,
    s_m_tune, s_m_hold, s_m__brk, s_m_thrw, s_m_adsb,
    s_m_ngps, s_m_srtl, s_m_flow, s_m_foll
 };
 #endif

/*
plane modes
    MANUAL        = 0,
    CIRCLE        = 1,
    STABILIZE     = 2,
    TRAINING      = 3,
    ACRO          = 4,
    FLY_BY_WIRE_A = 5,
    FLY_BY_WIRE_B = 6,
    CRUISE        = 7,
    AUTOTUNE      = 8,
    AUTO          = 10,
    RTL           = 11,
    LOITER        = 12,
    GUIDED        = 15,
    INITIALISING  = 16
*/
 #ifdef IS_PLANE
 const char * const mode_p_strings[] PROGMEM ={ 
    p_m_manu, s_m_circ, s_m_stab, p_mode03, s_m_acro, 
    p_mode05, p_mode06, p_mode07, p_mode08, s_mode_n,
    s_m_auto, s_m__rtl, s_m_loit, s_mode_n, s_mode_n, 
    s_m_guid, p_mode16, p_mode17, p_mode18, p_mode19
 };
 #endif
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
    p_m_manu, u_mode01, u_mode02, u_mode03, u_mode04, 
    u_mode05, u_mode06, s_m_posh, u_mode08, u_mode09, 
    u_mode10, u_mode11, s_m__rtl, s_m_land, u_mode14,
    u_mode15, p_mode07, u_mode17
};
#endif

const char PROGMEM aq_mode0[] = "arm";
//const char PROGMEM aq_mode1[] = "manu";
//const char PROGMEM aq_mode2[] = "alth";
//const char PROGMEM aq_mode3[] = "posh";
//const char PROGMEM aq_mode4[] = "m_04";
const char PROGMEM aq_mode5[] = "miss";
//const char PROGMEM aq_mode6[] = "m_06";
//const char PROGMEM aq_mode7[] = "m_07";
const char PROGMEM aq_mode8[] = "init";

char const * const mode_aq_strings[] PROGMEM ={ 
    aq_mode0, p_m_manu, s_m_alth, s_m_posh,
    s_mode_n, aq_mode5, s_mode_n, s_mode_n,
    aq_mode8, 
};

#if defined(USE_MWII)

const char PROGMEM mw_mode1[] = "angl";
const char PROGMEM mw_mode2[] = "hori";

char const * const mode_mw_strings[] PROGMEM ={
    s_m_acro, // acro
    mw_mode1, 
    mw_mode2, 
    s_m_alth, // alth
    s_m__rtl, // rtl
    s_m_posh, // posh
};


#endif

static void panFlightMode(point p){
    uint8_t mode;

    //PGM_P mode_str;
    const char * const *ptr;
    byte len;
    PGM_P str;

    
#if defined(USE_UAVTALK)
        mode = osd_mode;
	ptr = mode_u_strings;
	len = sizeof(mode_u_strings)/sizeof(char *);
#endif

#if defined(USE_MWII)
        mode = osd_mode;
	ptr = mode_mw_strings;
	len = sizeof(mode_mw_strings)/sizeof(char *);
#endif

#if defined(USE_MAVLINKPX4)
    typedef struct {
            uint16_t reserved;
            uint8_t main_mode;
            uint8_t sub_mode;
    } PX4_mode;
    
    union { 
        PX4_mode m;
        uint32_t u;
    } pm = { .u=osd_mode };

    len = sizeof(subm_c_strings)/sizeof(char *);
    
    if(pm.m.main_mode == 4 && pm.m.sub_mode < len){
        ptr = subm_c_strings;
        mode=pm.m.sub_mode;
    }else{
        len = sizeof(mode_c_strings)/sizeof(char *);
        ptr = mode_c_strings;
        mode = pm.m.main_mode;
    }
#endif

#if defined(USE_MAVLINK)

    {
        mode = osd_mode;
        if(osd_autopilot == 14) { // autoquad
            
	    int8_t bc;
	    for(bc=7;bc>=0;) {
		if(mode & (1<<bc) ) break;
		--bc;
	    }
	    if(bc<0) bc=8;

	    mode = bc;
	    ptr = mode_aq_strings;
	    len = sizeof(mode_aq_strings)/sizeof(char *);
	} else {    

 #ifdef IS_COPTER
  #ifdef IS_PLANE
            if(sets.model_type==0) {
                ptr = mode_p_strings;
                len = sizeof(mode_p_strings)/sizeof(char *);
            } else {
                ptr = mode_c_strings;
                len = sizeof(mode_c_strings)/sizeof(char *);
            }

  #else
            ptr = mode_c_strings;
            len = sizeof(mode_c_strings)/sizeof(char *);
  #endif    
 #else
  #ifdef IS_PLANE
            ptr = mode_p_strings;
            len = sizeof(mode_p_strings)/sizeof(char *);
  #endif    
 #endif
        }
    }
#endif
    

    if(mode >= len) {
	str=s_mode_n;
    } else
	str=(PGM_P)pgm_read_word(&ptr[mode]);

    osd_printi_1(str,mode);
    

    if(lflags.motor_armed)
        OSD::write_S(0x86);
}


static void panRadarScale(Point p){
    float dd= STEP_WIDTH * radar_zoom;
    
    dd = mul_converth(dd);
    
    if(radar_zoom >=40) {// 10 000 
        dd = f_div1000(dd);
        osd_printf_2(f4_2f, dd , pgm_read_byte(&measure->distchar));
    } else
        osd_printf_2(f4_0f, dd, get_mhigh());
}



/* **************************************************************** */
// Panel  : panCh
// Needs  : X, Y locations
// Output : Scaled channel values from MAVLink
// Size   
// Staus  : done

static void panCh(point p){
    for(byte i=0; i<8;i++) {
	osd_printi_2(PSTR("C%d%5i\xff"), i+1, chan_raw[i] );
    }
}

#if defined(USE_SENSORS)
static void printSensor(byte n){
    SensorInfo s;

    eeprom_read_len((byte *)&s,  EEPROM_offs(sensors) + n * sizeof(SensorInfo),  sizeof(SensorInfo) );

    float v=s.K * sensorData[n] + s.A;

    osd.printf(s.format,v); // format in RAM!
}

static void NOINLINE panSensor(point p, byte n) {
    register byte * bp = &flgSensor[n];
    
    if(is_on(p)) {
	*bp=1;
	fPulseSensor[n] = is_alt(p);
	printSensor(n);
    } else
	*bp=0;
    
}


static void  panSensor1(point p) {
    panSensor(p,0);
}    

static void  panSensor2(point p) {
    panSensor(p,1);
}

static void  panSensor3(point p) {
    panSensor(p,2);
}

static void  panSensor4(point p) {
    panSensor(p,3);
}
#endif


static void panHdop(point p) {
    float f = eph/100.0;
    osd_printf_1(f4_2f, f);
}


static byte NOINLINE get_chan_pos(byte ch, byte fExt=0){
    // 1000 - 2000 
    // 1200
    // 1400
    // 1600
    // 1800
    const uint16_t v=chan_raw[ch];
    
    byte n;
    const uint16_t low =(fExt?800:1000);
    const uint16_t high=(fExt?2200:2000);
    
    
    if(v<low) n=0;
    else {
	n=( v - low)/((high-low)/5);
	if(n>4) n=4;
    }

    return n;
}

static const char PROGMEM fci[]="C%i ";

static void panState(point p) {
    byte ch = get_alt_num(p) + 4;

    if(has_sign(p)) osd_printi_1(fci,ch+1);

    byte n = get_chan_pos(ch, is_alt(p));

    print_eeprom_string(PANSTATE_STR_ID + n, OSD::write_S);
}

static void panScale(point p) {
    byte ch = get_alt_num(p) + 4;

    if(has_sign(p)) osd_printi_1(PSTR("%i"),ch+1);

    byte n = get_chan_pos(ch, is_alt(p));
    byte c;

    for(byte i=0;i<5;i++){
	c=0x80;
	if(i==n) c=0x81;
	osd.write_S(c);
    }
}


static void panCValue(point p) {
    byte ch = get_alt_num(p) + 4;

    if(has_sign(p)) osd_printi_1(fci,ch+1);

    osd_printi_1(f_4i+1,chan_raw[ch]);
}


static void panDayTime(point p) {
/*
    uint8_t seconds, minutes, hours,  month;

    // calculate minutes 
    minutes  = seconds / 60;
    seconds -= minutes * 60;
    // calculate hours 
    hours    = minutes / 60;
    minutes -= hours   * 60;
    // calculate days 
    days     = hours   / 24;
    hours   -= days    * 24;
*/

    if(!lflags.got_date) return;
    
    uint16_t min=day_seconds / 60;

    if(is_alt2(p)) { // show seconds
        printTime(min, false, (day_seconds % 60) | 0x80);
    } else 
        printTime(min, is_alt(p));
}

static const PROGMEM char f_02i[]=".%02d";

#if defined(USE_NMEA)
static void panDate(point p) {
    uint32_t date=msgbuf.nmea.date;
    
    // 230394 – Дата, 23 марта 1994 года
    uint8_t day = date / 10000;
    date -= day*10000;
    uint8_t mon = date / 100;
    date -= mon*100 + 2000; 

    if(is_alt(p)) { // yy.m.d
        osd_printi_1(f_02i+1,  day);
        osd_printi_1(f_02i, mon);
        osd_printi_1(f_4i,  date);
    } else {
        osd_printi_1(f_4i+1,   date);
        osd_printi_1(f_02i, mon);
        osd_printi_1(f_02i, day);
    }

}    
#else
static void panDate(point p) {
  /* Unix time starts in 1970 on a Thursday */
//  uint16_t dayOfWeek = 4;
  uint16_t year      = 1970;
  uint8_t month;

  uint32_t days = sys_days;
//  uint16_t y_day;

    if(!lflags.got_date) return;


  while(1) {
    bool     leapYear   = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
    uint16_t daysInYear = leapYear ? 366 : 365;
    
    if (days >= daysInYear)  {
//      dayOfWeek += leapYear ? 2 : 1;
      days      -= daysInYear;
//      if (dayOfWeek >= 7) dayOfWeek -= 7;
      ++year;
    } else {
//      y_day = days;
//      dayOfWeek  += days;
//      dayOfWeek  %= 7;

      /* calculate the month and day */
      static const PROGMEM uint8_t daysInMonth[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
      for(month = 0; month < 12; ++month) {
        uint8_t dim = pgm_read_byte(&daysInMonth[month]);

        /* add a day to feburary if this is a leap year */
        if (month == 1 && leapYear)      ++dim;

        if (days >= dim)
          days -= dim;
        else
          break;
      }
      break;
    }
  }
/*
  tm->tm_sec  = seconds;
  tm->tm_min  = minutes;
  tm->tm_hour = hours;
  tm->tm_mday = days + 1;
  tm->tm_mon  = month;
  tm->tm_year = year;
  tm->tm_wday = dayOfWeek;
*/

//    static const PROGMEM char f_02i[]=".%02d";
    if(is_alt(p)) { // yy.m.d
        osd_printi_1(f_02i+1,  days+1);
        osd_printi_1(f_02i, month+1);
        osd_printi_1(f_4i,  year);
    } else {
        osd_printi_1(f_4i+1,   year);
        osd_printi_1(f_02i, month+1);
        osd_printi_1(f_02i, days+1);
    }
}
#endif




static void panMotor(point p) {
    if(is_alt(p)) { // absolute values
        for(byte i=0;i<4;i++){
            osd_printi_1(f_4i+1, pwm_out[i]);
            if(i==1) osd_nl();
            else     osd_blank();
        }
    } else { // in percent
        for(byte i=0;i<4;i++){
            osd_printi_1(f_02i+1, (pwm_out[i]-1100)/9);
            if(i==1) osd_nl();
            else     osd_blank();
        }
    
    }
}

#ifdef USE_VIBE
static void panVibe(point p) {
    if(has_sign(p)) osd_print_S(PSTR("  x  y  z\xff"));
    
    byte i;
    for(i=0;i<3;i++)
        osd_printf_1(f3_0f, vibration[i]);

    osd_nl();
    for(i=0;i<3;i++)
        osd_printi_1(f3i, clipping[i]);
}
#endif


static void panVario(point p) {

    PGM_P f;

    byte x=0;

    if(has_sign(p)) {
        if (!is_alt(p)) {
            f=PSTR("\xb2\xff\xb2\xff\xc6\xff\xb2\xff\xb2");
            x+=1;
        } else {
            f=PSTR(" \xb3\xff \xb3\xff \xc5\xff \xb3\xff \xb3");
        }
        osd_print_S(f);
        osd_setPanel(p);
    } 

    // calculate climb char - 9 pos in 5 chars = 45 points, chars C7-D0

    int linePosition = int(-vertical_speed*9) ; // 0 at middle, 9 points bwtween scale

    if(!(screen_flags & scrFlg_Vario_MS)) linePosition*=60;
    
    if(is_alt2(p)) linePosition/=10;
    if(is_alt3(p)) linePosition/=2;
    if(is_alt4(p)) linePosition/=4;
    
    linePosition = (linePosition + totalNumberOfLines) / 2; // move to middle

    int8_t  charPosition = linePosition / 9;
    uint8_t selectedChar = 0xC7 + 8 - (linePosition % 9);

    if(charPosition >= AH_ROWS) {
        charPosition = AH_ROWS-1;
        selectedChar = 0x7e;
    } else if(charPosition < 0){
        charPosition = 0;
        selectedChar = 0x60;
    } 
        
    OSD::write_xy(x, charPosition, selectedChar);
}

#ifdef USE_ADSB
static void panADSB(point p) {
// show up to 4 rows of pointers to nearest aircrafts with optional distances
 
    for(uint8_t i=0; i<MAX_ADSB; i++) {
        if(adsb[i].cnt) {
            if(has_sign(p)) OSD::write_raw(0x20);

            float distance = coord_dist(&adsb[i].coord, &osd_pos, true);
    
            showArrow(coord_bearing());
            printFullDist(distance);
        }
    }
}
#endif

#if HARDWARE_TYPE > 0
// features for big boards
#endif

#if 0
uint16_t readVCC() { // in mv
    ADMUX = 0x4e; //AVCC with external capacitor at AREF pin, 1.1v as meashured
    delay_1();
    sum=0;

#define VCC_AVGB 100

    for(byte i=VCC_AVGB; i>0; i--){
        delay_1();

        ADCSRA |= 1 << ADSC; // start conversion

        while (bit_is_set(ADCSRA, ADSC));

        byte low  = ADCL;
        byte high = ADCH;

        uint16_t v = (high << 8) | low;
    // return 11253 / v;
        sum+=  v;
    }
    
    return (118645531UL /* * VCC_AVGB / 100 */ ) / sum; // in mv, calibrated
}
#endif











static void NOINLINE storeChannels(){

    uint16_t *cp= &chan_raw_middle[0];
    for(byte i=0; i<4; i++,cp++){
        if (*cp < 1000)
           *cp = chan_raw[i];   // запомнить начальные значения  - центр джойстика для первых 4 каналов
    }
}

static int NOINLINE channelDiff(byte n){
    return chan_raw[n] - chan_raw_middle[n];
}


#ifdef USE_SETUP

/* **************************************************************** */
// Panel  : panSetup
// Needs  : Nothing, uses whole screen
// Output : The settings menu
// Size   : fullscreen
// Staus  : done

/* in vars.h
struct Params {
    PGM_P name; 	// наименование
    char type;		// тип (f-float, b - byte etc)
    void *value;	// адрес самой переменной
    int fmt_id:4;	// формат печати параметра
    int minmax:4;	// диапазон изменения параметра
};

struct Setup_screen {
    const Params * const ptr;	// описатель экрана
    byte size;		// его размер
    fptr tail;	// функция отображения остального
};
*/


void renew(){
    OSD::adjust();
}


void setup_horiz(){
    osd.setPanel(8+1, 6);
    showHorizon();
}

#if defined(USE_SENSORS)
void setup_sens() {
    osd.setPanel(6,10);
    for(byte i=0;i<4;i++) {
	printSensor(i);
        osd_nl();
    }
}
#endif

// в нашем распоряжении 16 строк
static const PROGMEM char n_sets[]        = "   OSD setup";
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


#if defined(USE_SENSORS)
static const PROGMEM char n_sensors[]     = "   Pin Sensors";
static const PROGMEM char n_k_sensor1[]   = "1 (V1) K";
static const PROGMEM char n_a_sensor1[]   = "       A";
static const PROGMEM char n_k_sensor2[]   = "2 (V2) K";
static const PROGMEM char n_k_sensor3[]   = "3 (Current) K";
static const PROGMEM char n_k_sensor4[]   = "4 (RSSI) K";
#endif

static const PROGMEM char f_batt[] = "%3.1f\x76";
static const PROGMEM char f_int[]  = "%.0f";
static const PROGMEM char f_float[]= "%.3f";

typedef struct MIN_MAX {
    int16_t min;
    int16_t max;
} Min_Max;

static const PROGMEM Min_Max min_max[] = {
    { 0, 255},          // 0 - bytes
    { 1,   4},          // 1 - screens
    { 0,   3},          // 2 - contrast
    { -31, 31},         // 3 - horizontal
    { -15, 15},         // 4 - vertical
    { -4,  4},          // 5 - horizon
    { -8000, 8000},     // 6 - sesnor factor
    { -100,  100 },      // 7 - sensor add
};


static const PROGMEM char * const s_fmts[] = { // форматы печати параметра
    f_batt,     // 0
    f_int,      // 1
    f_float     // 2
};

// первый экран настроек
static const PROGMEM Params params1[] = { 
	{n_sets,    0,   0,                      0},      // header
	{n_batt,   'B',  &sets.battv ,           0 },
	{n_battB,  'B',  &sets.battBv,           0 },
                                                // format minmax
	{n_stall,  'b',  &sets.stall,            (1 <<4) | 0 },
	{n_oversp, 'b',  &sets.overspeed,        (1 <<4) | 0 },
	{n_charge, 'b',  &sets.batt_warn_level,  (1 <<4) | 0 },
	{n_rssi,   'b',  &sets.rssi_warn_level,  (1 <<4) | 0 },

	{n_screen,  0,   0,                      0}, // header
	{n_scr,    'b',  &sets.n_screens,        (1 <<4) | 1 },
	{n_contr,  'b',  &sets.OSD_BRIGHTNESS,   (1 <<4) | 2 },
	{n_horiz,  'Z',  &sets.horiz_offs,       (1 <<4) | 3 },
	{n_vert,   'z',  &sets.vert_offs,        (1 <<4) | 4 },
};

// второй экран - горизонт
static const PROGMEM Params params2[] = { 
	{n_horizon,     'h', 0,                    0}, // header with pal/ntsc string
	{n_k_RollPAL,   'f', &sets.horiz_kRoll,    (2 <<4) | 5 },
	{n_k_PitchPAL,  'f', &sets.horiz_kPitch,   (2 <<4) | 5 },
	{n_k_RollNTSC,  'f', &sets.horiz_kRoll_a,  (2 <<4) | 5 },
	{n_k_PitchNTSC, 'f', &sets.horiz_kPitch_a, (2 <<4) | 5 },
};

#if defined(USE_SENSORS)// третий экран - сенсоры

#define SENSOR(n) ((SensorInfo *)(EEPROM_offs(sensors) + n * sizeof(SensorInfo)))

static const PROGMEM Params params3[] = {
	{n_sensors,     0,   0,             0}, 
	{n_k_sensor1,   's', &SENSOR(0)->K, (2 <<4) | 5 },
	{n_a_sensor1,   's', &SENSOR(0)->A, (2 <<4) | 7 },
	{n_k_sensor2,   's', &SENSOR(1)->K, (2 <<4) | 5 },
	{n_a_sensor1,   's', &SENSOR(1)->A, (2 <<4) | 7 },
	{n_k_sensor3,   's', &SENSOR(2)->K, (2 <<4) | 6 },
	{n_a_sensor1,   's', &SENSOR(2)->A, (2 <<4) | 7 },
	{n_k_sensor4,   's', &SENSOR(3)->K, (2 <<4) | 6 },
	{n_a_sensor1,   's', &SENSOR(3)->A, (2 <<4) | 7 },
	
};
#endif

#ifdef SLAVE_BUILD // internal OSD of Omnibus board

static const  char n_Parameters[]     = "   Full Parameter list";

static const PROGMEM Params params4[] = {
	{n_Parameters,     0,   0,             0}, 
};

#endif

static const PROGMEM Setup_screen screens[] = {
    {params1, (sizeof(params1)/sizeof(Params)), 0 },
    {params2, (sizeof(params2)/sizeof(Params)), setup_horiz },
#if defined(USE_SENSORS)
    {params3, (sizeof(params3)/sizeof(Params)), setup_sens },
#endif
#if defined(SLAVE_BUILD) && defined(MAVLINK_PARAMS) // internal OSD of Omnibus board

    {params4, 0, setup_params },
#endif
    {0,0} // end marker
};

#define SETUP_N_SCREENS (sizeof(screens)/sizeof(Setup_screen) - 1)

/* in vars.h
static byte setup_menu=1; // номер строки меню
static byte setup_screen=0; // номер экрана меню
static uint16_t chan_raw_middle[3]; // запомненные при входе значения каналов

const Params *params; // указатель на текущий набор параметров


* in func.h
void inline reset_setup_data(){ // called on any screen change
    memset((byte *)chan_raw_middle, 0, sizeof(chan_raw_middle)); // clear channels middle
}
*/
#ifdef SLAVE_BUILD
    static uint8_t top_offset=0;
#endif


// переходы вверх-вниз в пределах экрана
static NOINLINE void move_menu(int8_t dir){

    const Setup_screen *pscreen;

    pscreen = &screens[setup_screen];


#if defined(SLAVE_BUILD) && defined(MAVLINK_PARAMS)
    uint16_t n= pscreen->size;
    
    if(n==0){ // special case, do it per-screen
        switch(setup_screen){
        case 3: // parameters
            n=params_list[0].param_count+1;

again2:
    
            if(      dir < 0 && setup_menu == 0) setup_menu = n;	// цикл по параметрам,
            else if( dir > 0 && setup_menu == n) setup_menu = 0;
            else setup_menu +=dir;
            
            if(      dir < 0 && setup_menu < top_offset) top_offset--;
            else if( dir > 0 && setup_menu - top_offset > (MAX7456_screen_rows-1)) top_offset++;
        

            if(setup_menu==0) goto again2;          // пропускаем заголовок                
            break;
        }
        return;
    
    } else n--;
    
#else
    byte n= pgm_read_byte((void *)&pscreen->size) -1;
#endif

again:
    
    if(      dir < 0 && setup_menu == 0) setup_menu = n;	// цикл по параметрам,
    else if( dir > 0 && setup_menu == n) setup_menu = 0;
    else setup_menu +=dir;

    if(!pgm_read_word((void *)&params[setup_menu].value) ) goto again; // если нет связанной переменной то еще шаг - пропускаем заголовок
}

// переходы по экранам настройки
static void /*NOINLINE*/ move_screen(int8_t dir){

    setup_menu=1;

    byte n=SETUP_N_SCREENS - 1;

    if(     dir < 0 && setup_screen == 0)  setup_screen = n;	// цикл по экранам,
    else if(dir > 0 && setup_screen == n)  setup_screen = 0;
    else setup_screen +=dir;
}


#define SETUP_START_ROW 1


static void panSetup(){
    //static const PROGMEM float incs[]={1, 0.1, 0.01, 0.001 };
    static const PROGMEM uint16_t incs[]={1, 10, 100, 1000 };

    const Params *p;
    float v = 0;
    byte type;
    char *nm;
    byte k;

    int8_t offs=0;

    float c_val=0;

    const Setup_screen *pscreen;

    storeChannels(); // save channels values on first entry to screen (clears on screen switch)

    pscreen = &screens[setup_screen];

    params = (const Params *)pgm_read_word((void *)&pscreen->ptr);

#if defined(SLAVE_BUILD) && defined(MAVLINK_PARAMS)
    uint16_t size = pscreen->size;
    
    if(size==0){ // special case, do it per-screen
        uint8_t sel_row=0;
    
        switch(setup_screen){
        case 3: // parameters
        // first draw current state
            uint16_t psize=params_list[0].param_count+1;
            for(byte i=0; i < psize; i++) {
                byte row = SETUP_START_ROW + i;

                
                if(i==0) {
    	            OSD::setPanel(1, row);
        	    p = &params[i];
	            nm=(char *)pgm_read_word((void *)&p->name);
    
        	    osd_print_S(nm);
        	} else {
        	    row-=top_offset;
        	    OSD::setPanel(1, row);
        	    char buf[20];
        	    
        	    strncpy(buf, params_list[i-1].param_id, 16);
        	    osd_print_S(buf);
        	}    
        
	        //            x    y
                OSD::setPanel(19, row);
            

	        if(i == setup_menu) { // current pos
	            OSD::write_S('>');
	        }

	        k=1;
	        v = params_list[i-1].param_value;

                const char *fmt="";
                switch(params_list[i-1].param_type){
                case MAV_PARAM_TYPE_UINT8:  /* 8-bit unsigned integer  */
                    fmt="%3.0f";
                    break;
                case MAV_PARAM_TYPE_INT8:   /* 8-bit signed integer  */
                    fmt="%3.0f";
                    break;
                case MAV_PARAM_TYPE_UINT16: /* 16-bit unsigned integer  */
                    fmt="%5.0f";
                    break;
                case MAV_PARAM_TYPE_INT16:  /* 16-bit signed integer  */
                    fmt="%5.0f";
                    break;
                case MAV_PARAM_TYPE_UINT32: /* 32-bit unsigned integer  */
                case MAV_PARAM_TYPE_UINT64: /* 64-bit unsigned integer  */
                    fmt="%10.0f";
                    break;
                case MAV_PARAM_TYPE_INT32:  /* 32-bit signed integer  */
                case MAV_PARAM_TYPE_INT64:  /* 64-bit signed integer  */
                    fmt="%10.0f";
                    break;
                case MAV_PARAM_TYPE_REAL32: /* 32-bit floating-point  */
                case MAV_PARAM_TYPE_REAL64: /* 64-bit floating-point  */
                    fmt="%f";
                    break;
                }

                if(i == setup_menu) {
                    c_val = v;  // store currently edited value
                    sel_row = row;
                }

                osd_printf_1(fmt, v);
        
            }
        
            if(!lflags.flag_05s) return;
            lflags.flag_05s=0;

            lflags.got_data=1;   // renew screen

            {
	        int cd;

        	cd=channelDiff(1);
	        if ( cd >  150){  move_menu(1);   return; } // переходы по строкам по верх-низ
                if ( cd < -150){  move_menu(-1);  return; }
        
                cd=channelDiff(3);
                if (cd >  150){  move_screen(1);  return; } // переходы по экранам - левый дж лево-право
                if (cd < -150){  move_screen(-1); return; }
            }


            OSD::setPanel(/*col*/ 20, sel_row); // в строку с выбранным параметром

            p = &params[setup_menu];

            bool fNeg=false;
            int diff = channelDiff(0); // ( chan_raw_middle[0] - chan_raw[0] );
            if(diff<0) {
        	diff = -diff;
        	fNeg=true;
            }

            k    = 1;
            v    = c_val;

            mavlink_param_value_t &cur_param = params_list[sel_row - SETUP_START_ROW -1];

            {
                float inc = 1.0;
                int min, max;

                switch(cur_param.param_type){
                case MAV_PARAM_TYPE_UINT8:  /* 8-bit unsigned integer | */
                case MAV_PARAM_TYPE_INT8:   /* 8-bit signed integer | */
                case MAV_PARAM_TYPE_UINT16: /* 16-bit unsigned integer | */
                case MAV_PARAM_TYPE_INT16:  /* 16-bit signed integer | */
                case MAV_PARAM_TYPE_UINT32: /* 32-bit unsigned integer | */
                case MAV_PARAM_TYPE_UINT64: /* 64-bit unsigned integer | */
                case MAV_PARAM_TYPE_INT32:  /* 32-bit signed integer | */
                case MAV_PARAM_TYPE_INT64:  /* 64-bit signed integer | */
            	    if(     diff>300)	inc=10;	    
        	    break;

                case MAV_PARAM_TYPE_REAL32: /* 32-bit floating-point | */
                case MAV_PARAM_TYPE_REAL64: /* 64-bit floating-point | */
        	    inc /= incs[(int)(diff/100) - 1];
        	    break;
                }
    
                if(diff>100){
        	    if(fNeg) inc = -inc;
    	            v+= inc;

//                    if(v<min) v=min;
//                    if(v>max) v=max;
                }
            }

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wfloat-equal" // yes I know

            if(v != c_val) { // value changed
        	cur_param.param_value = v;
                
                // send parameter back
                mavlink_msg_param_set_send(MAVLINK_COMM_0, apm_mav_system, apm_mav_component,
                    cur_param.param_id, cur_param.param_value, cur_param.param_type);
            }
#pragma GCC diagnostic pop
            break;
        }
        return;

    }
#else
    byte size = pgm_read_byte((void *)&pscreen->size);
#endif

// first draw current state
    for(byte i=0; i < size; i++) {
	{
	    byte row = SETUP_START_ROW + i;

	    p = &params[i];
	    nm=(char *)pgm_read_word((void *)&p->name);

	    OSD::setPanel(1, row);

	    osd_print_S(nm);
        
	    //            x    y
            OSD::setPanel(19, row);
        }

	if(i == setup_menu) { // current pos
	    OSD::write_S('>');
	}

	type=pgm_read_byte((void *)&p->type);
	k=1;

        switch(type & 0x7f){
        
        case 'h': {		 // header
            PGM_P f;
    	    if(OSD::getMode()) 
		f=PSTR(" (PAL)");
	    else
		f=PSTR(" (NTSC)");
	    osd_print_S(f);
	    }
	    // no break!
	case 0:
	    continue;	// no value
        
        
        case 'B':
            k=10;
            // no break!
        case 'b': // byte param
	    { 
		int l = *((byte *)(pgm_read_word((void *)&p->value) ) ) ;
		v = l / (float)k;
	    }
	    break;

	case 'z': // vertical offs
	    offs=0x10;
	    goto as_char;
	case 'Z': // horiz offs
	    offs=0x20;
//	    goto as_char;
        case 'c': // signed byte param
as_char:
	    { 
		int l = *((char *)(pgm_read_word((void *)&p->value) ) ) - offs;
		v = l /* / (float)k */ ;
	    }
	    break;
	    
        case 'f': // float param
	    v=*((float *)(pgm_read_word((void *)&p->value) ));
	    break;

#if defined(USE_SENSORS)
	case 's': //sensors in EEPROM
	    uint16_t ptr=pgm_read_word((void *)&p->value);
	    eeprom_read_len((byte *)&v,  ptr,  sizeof(float) );
	    break;
#endif
	}

	if(i == setup_menu) c_val = v;  // store currently edited value

        byte f_mm=(pgm_read_byte((void *)&p->fmt_mm) >>4) & 0xf;

	osd_printf_1((PGM_P)pgm_read_word((void *)&s_fmts[f_mm]), v);
    }

    {
        fptr tail = (fptr) pgm_read_word((void *)&pscreen->tail);

        if(tail) tail();
    }
    if(!lflags.flag_05s) return;
    lflags.flag_05s=0;

    lflags.got_data=1;   // renew screen

    {
	int cd;

	cd=channelDiff(1);
	if ( cd >  150){  move_menu(1);   return; } // переходы по строкам по верх-низ
        if ( cd < -150){  move_menu(-1);  return; }
        
        cd=channelDiff(3);
        if (cd >  150){  move_screen(1);  return; } // переходы по экранам - левый дж лево-право
        if (cd < -150){  move_screen(-1); return; }
    }


    OSD::setPanel(/*col*/ 20, SETUP_START_ROW + setup_menu); // в строку с выбранным параметром

    p = &params[setup_menu];

    bool fNeg=false;
    int diff = channelDiff(0); // ( chan_raw_middle[0] - chan_raw[0] );
    if(diff<0) {
	diff = -diff;
	fNeg=true;
    }

    void *pval=(void *)pgm_read_word((void *)&p->value);

    type = pgm_read_byte((void *)&p->type);
    k    = 1;
    v    = c_val;

    {
        float inc = 1.0;
        switch (type & 0x7f){
    	case 'B': // batt voltage
            k=10;
	case 'z': // offset
	case 'Z': // offset
	case 'c': // char
    	case 'b': // byte param
    	    size= 1;
	    if(     diff>300)	inc=10;
	    
	    inc /= k;
	    break;

	case 's': // sensors
        case 'f': // float param
	    size=4;
	
	    inc /= incs[(int)(diff/100) - 1];
	    break;
        }

    
    
        if(diff>100){
	    if(fNeg) inc = -inc;
	    float_add(v, inc);

            byte mm=pgm_read_byte((void *)&p->fmt_mm) & 0xf;

            {
                int min =(int)pgm_read_word((void *)&(min_max[mm].min));
                if(v<min) v=min;
            }
            {
                int max =(int)pgm_read_word((void *)&(min_max[mm].max));
                if(v>max) v=max;
            }
        }
    }

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wfloat-equal" // yes I know

    if(v != c_val) { // value changed
//Serial.printf_P(PSTR("write new=%f old=%f\n"), v, value_old);;
	int8_t cv=(int8_t)(v * k); // предварительно посчитаем на всякий случай
        byte add=0;

        switch (type & 0x7f){
    	    case 'Z':
    		add= 0x20;
    		goto as_c;
    	    case 'z':
    		add =  0x10;
	    case 'c':
as_c:		*((char *)pval) = cv + add;
		break;

            case 'B':
            case 'b': // byte param
	        *((byte *)pval) = (byte)(cv);
	        break;
	    
            case 'f': // float param
	        *((float *)pval) = v;
	        break;

#if defined(USE_SENSORS)
	    case 's': //sensors in EEPROM
	        float f=v;
	        eeprom_write_len((byte *)&f, (uint16_t)pval,  sizeof(float) );
	        goto no_write;
#endif
	}


	eeprom_write_len( (byte *)pval,  EEPROM_offs(sets) + ((byte *)pval - (byte *)&sets),  size );
#if defined(USE_SENSORS)
no_write:
#endif
        if(type & 0x80) renew();

    }
#pragma GCC diagnostic pop
}
#endif

typedef void (*fPan_ptr)(Point p);

struct Panels_list {
    byte n;
    fPan_ptr f;
    byte sign;
};

#define RADAR_CHAR 0x1F // code of the radar symbol

//table - 546 bytes of flash economy 
// ids - max 127 so bit 0x80 is a flag of "always call"

const Panels_list PROGMEM panels_list[] = {
//    id                        func           sign
    { ID_of(horizon),		panHorizon, 	0 },
    { ID_of(pitch),		panPitch, 	0 },
    { ID_of(roll),		panRoll, 	0 },
    { ID_of(batt_A) | 0x80,	panBatt_A, 	0xbc  },
    { ID_of(batt_B) | 0x80,	panBatt_B, 	0x26  },
    { ID_of(GPS_sats),		panGPSats, 	0 },
    { ID_of(GPS),		panGPS, 	0 },
    { ID_of(coordLat),		panGPS_lat, 	3 },
    { ID_of(coordLon),		panGPS_lon, 	4 },
    { ID_of(batteryPercent),	panBatteryPercent, 0 },
    { ID_of(COG),		panCOG, 	0 },
    { ID_of(rose),		panRose, 	0 },
    { ID_of(heading),		panHeading, 	0 },
    { ID_of(Fdata),		panFdata, 	0 },
    { ID_of(homeDist) | 0x80,	panHomeDis, 	0x0b },
    { ID_of(homeDir), 		panHomeDir, 	0 },
    { ID_of(time),		panTime, 	0 },
    { ID_of(WP_dist),		panWPDis,	0x5c },
    { ID_of(alt),		panAlt, 	0x11 },
    { ID_of(homeAlt),		panHomeAlt, 	0x12 },
    { ID_of(vel),		panVel, 	0x14 },
    { ID_of(airSpeed),		panAirSpeed, 	0x13 },
    { ID_of(throttle),		panThr, 	0x02 },
    { ID_of(FMod),		panFlightMode,	0x7f },
    { ID_of(curr_A) | 0x80,     panCur_A, 	0xbd },
    { ID_of(Power),		panPower, 	'W'  },
    { ID_of(windSpeed),		panWindSpeed, 	0x1d },
    { ID_of(climb) | 0x80,	panClimb, 	0x15 },
    { ID_of(tune),		panTune, 	0 },
    { ID_of(RSSI),		panRSSI, 	0x09 },
    { ID_of(eff),		panEff, 	0 },
    { ID_of(temp),		panTemp, 	0 },
    { ID_of(ch),		panCh, 		0 },
    { ID_of(distance),		panDistance, 	0x8f },
    { ID_of(RadarScale),	panRadarScale, 	RADAR_CHAR  },
    { ID_of(Hdop),		panHdop, 	0x1f  },
    { ID_of(State),		panState, 	0  },
    { ID_of(Scale),		panScale, 	0  },
    { ID_of(CValue),		panCValue, 	0  },
#if defined(USE_SENSORS)
    { ID_of(sensor1) | 0x80,	panSensor1, 	0 },
    { ID_of(sensor2) | 0x80,	panSensor2, 	0 },
    { ID_of(sensor3) | 0x80,	panSensor3, 	0 },
    { ID_of(sensor4) | 0x80,	panSensor4, 	0 },
#endif
    { ID_of(callSign),		panCALLSIGN, 	0 },
    { ID_of(message),		panMessage, 	0 },
    { ID_of(fDate),		panDate, 	0 },
    { ID_of(dayTime),		panDayTime, 	0 },
    { ID_of(pMotor),		panMotor, 	0 },
#ifdef USE_VIBE
    { ID_of(fVibe),		panVibe, 	0 },
#endif
    { ID_of(fVario),		panVario, 	0 },
#ifdef USE_ADSB
    { ID_of(fADSB),		panADSB, 	0 },
#endif
// warnings should be last
    { ID_of(warn) | 0x80,       panWarn,	0 }, // show warnings even if screen is disabled
    {0, 0}
};


static void print_all_panels(const Panels_list *pl ) {

#if defined(DEBUG)
    extern uint16_t packet_drops;
    extern long bytes_comes;
    extern volatile uint16_t lost_bytes;
    extern uint16_t packets_skip;
    extern uint16_t packets_got;

    OSD::setPanel(0,0);
    osd.printf_P(PSTR("crc=%u b=%ld bl=%u"), packet_drops, bytes_comes,  lost_bytes);
    osd.printf_P(PSTR("\xffpg=%u ps=%u"), packets_got, packets_skip);
    
#endif

    for(;;){
	byte n = pgm_read_byte(&pl->n); // номер панели в массиве
	fPan_ptr f = (fPan_ptr)pgm_read_word(&pl->f);
	if(f==0) break;
	
	point p = readPanel(n & 0x7f);// читать непосредственно из EEPROM
	
        osd_setPanel(p); // place cursor
	if(is_on(p)){
	    if(has_sign(p)) {
		byte s = pgm_read_byte(&pl->sign);
		if(s) OSD::write_S(s);
	    }
	    f(p);
	} else if(n & 0x80) { // call even if not visible - w/o sign (usually for calculations)
	    f(p);
	}
	pl++;
    }
}

uint16_t uidiff(uint16_t a, uint16_t b){
    if(a>b) return a-b;
    return b-a;

}

void writePanels(){ 

    unsigned long pt = millis();
    osd.detectMode(); // PAL/NTSC live

// если выбран самолет
    if(sets.model_type == 0 ) { /* plane */ 
        if( lflags.motor_armed  && lflags.in_air  &&
          ((int)osd_alt_to_home > 10 || (int)osd_groundspeed > 1 || osd_throttle > 1 )){
            landed = pt; // пока летаем - заармлен, в воздухе, движется и есть газ -  постоянно обновляем это время
//DBG_PRINTF("set p landed=%u\n", landed);
	}
    } else // copter
         if (!lflags.motor_armed && lflags.last_armed_status ){ // copter only on motors disarm
            landed = pt; // запомнится время дизарма
//DBG_PRINTF("set c landed=%u\n", landed);
    }
    
    lflags.last_armed_status = lflags.motor_armed;
    


    if(sets.n_screens>MAX_PANELS) sets.n_screens = MAX_PANELS;

//DBG_PRINTF("time_since(&lastMAVBeat)=%d\n", time_since(&lastMAVBeat));

#ifdef SHOW_NO_DATA
//    if(pt > (lastMAVBeat + 2500)){
    {
	uint16_t t=time_since(&lastMAVBeat);
        if(t > 2500){
            panWaitMAVBeats(); //Waiting for MAVBeats...
            return;
        }
    }
#endif

    if(FLAGS.results_on){
 //Only show flight summary 10 seconds after landing and if throttle < 15
//  if (!lflags.motor_armed && (((pt / 10000) % 2) == 0) && (trip_distance > 50)){
//  if (!lflags.motor_armed && (((seconds / 10) % 2) == 0) && (trip_distance > 50)){
//  if (!lflags.motor_armed && ( pt - landed < 10000 ) && ((int)trip_distance > 5)){ // 10 seconds after disarm
        if ( !lflags.motor_armed && landed /* not 0! */ /* && time_since(&landed) < 3000 MarcMerlin fix */ 
#if !defined(DEBUG) || 1
          && ((int)trip_distance > 5) // show always in debug mode
#endif
                                 ){ // 3 seconds after disarm one can jerk sticks

//DBG_PRINTF("set FData landed=%u\n", landed);

           lflags.fdata=1;
           storeChannels(); // remember control state
           fdata_screen=panelN;

           goto show_fdata;
      } else if(lflags.fdata){
           if(fdata_screen!=panelN) { // turn off by screen switch
               panelN=fdata_screen;
               lflags.fdata=0;
//DBG_PRINTLN("reset FData by sw");
           }

           if(labs(channelDiff(2))>300 || labs(channelDiff(3))>300 || lflags.motor_armed){ // or by throttle stick - and disable Flight Data when armed
//DBG_PRINTLN("reset FData by throttle");
               lflags.fdata=0;
           }
show_fdata:
           panFdata({1,1});    //Flight summary panel
           return;
      }
  }
  
    //Normal osd panel

//	OSD::setPanel(0,0);
//	osd.printf_P(PSTR("p=%d t=%d"),panelN, sets.ch_toggle);

    if(sets.n_screens==0 || panelN < sets.n_screens){ // конфигурируемые юзером экраны
	print_all_panels(panels_list);
    } else { 			// last panel

#ifdef USE_SETUP
	if(!lflags.motor_armed) {
	    panSetup();			// Setup when not armed
	}  else 
#endif
         { // warnings on clear screen
	//    print_all_panels(&panels_list[sizeof(panels_list)/sizeof(Panels_list)-2]); // warnings only
	    point p={3,3};
	    osd_setPanel(p); // place cursor    
	    panWarn(p);
	}
    } 
}


