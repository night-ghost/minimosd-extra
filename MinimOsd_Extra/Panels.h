/******* PANELS - POSITION *******/


extern struct loc_flags lflags;  // все булевые флаги кучей

typedef void (*fptr)();

static void NOINLINE osd_setPanel(Point p){
    OSD::setPanel(p.x,p.y);
}

static void NOINLINE osd_nl(){
    OSD::write_S('|');
}

static void NOINLINE osd_blank(){
    OSD::write_S(' ');
}

static byte get_mhigh(){
    return pgm_read_byte(&measure->high);
}

static const PROGMEM char fmt_xtrack[]="\x20\x58\x65%4.0f%c";
//static const PROGMEM char f4_0fc[]="%4.0f%c";
#define f4_0fc (&fmt_xtrack[3])

static float /*NOINLINE*/ cnvGroundSpeed() { // вынос инварианта

    return osd_groundspeed * get_converts();
}

/*
static int NOINLINE fp_div100(float *f){
    return (int)f/100.0;
}*/

static void NOINLINE printTime(int t, byte blink){
    osd.printf_P(PSTR("%3i%c%02i"),((int)t/60)%60,(blink && lflags.blinker)?0x20:0x3a, (int)t%60);
}

static void NOINLINE printTime(int t){
    printTime(t, 0);
}

static void NOINLINE printTimeCnv(uint32_t *t, byte blink){
    printTime(*t/1000, blink);
}

static void NOINLINE osd_printf_1(PGM_P fmt, float f){
    osd.printf_P(fmt, f);
}

static void NOINLINE osd_printf_2(PGM_P fmt, float f, byte c){
    osd.printf_P(fmt, f, c);
}

static void NOINLINE osd_printi_1(PGM_P fmt, int f){
    osd.printf_P(fmt, f);
}


static void printSpeed(PGM_P fmt, float s, byte alt){
    float k;
    byte c;
    
    if(alt){
	k=3.6;
	c=0x18;
    } else {
	k=1;
	c=pgm_read_byte(&measure->spe);
    }
    osd_printf_2(fmt,s/k,c);

}

static void NOINLINE printSpeedCnv(PGM_P fmt, float *s, byte alt){
    printSpeed(fmt, *s * get_converts(), alt);
}

static void printSpeed(float s, byte alt){
    printSpeed(PSTR("%3.0f%c"), s, alt);
}

static void printSpeedCnv(float *s, byte alt){
    printSpeedCnv(PSTR("%3.0f%c"), s, alt);
}

static void printSpeed(float s){
    printSpeed(s, false);
}

static void printSpeedCnv(float *s){
    printSpeedCnv(s, false);
}


void inline write_arrow(byte arrow_set1){
    OSD::write_S(arrow_set1); OSD::write_S(arrow_set1+1);
}

// ---------------- EXTRA FUNCTIONS ----------------------
// Show those fancy 2 char arrows
static void showArrow(uint8_t rotate_arrow,uint8_t method, byte alt){
    char arrow_set1 = 0x90;


    while(rotate_arrow>16) rotate_arrow -= 16;
    while(rotate_arrow<1)  rotate_arrow += 16;

    arrow_set1 += rotate_arrow * 2 - 2;

    if(method==1) {
	printSpeedCnv(&osd_windspeed, alt);
	osd_nl();
    }

    write_arrow(arrow_set1);

    switch(method) {  
    case 1:		// airspeed
	printSpeedCnv(PSTR("%2.0f%c"), &nor_osd_windspeed, alt);
	break;
    
    case 2:	//      course
	//osd.printf_P(PSTR("%4i\x05"), off_course);
	osd_printi_1(PSTR("%3i\x05"), off_course);
	break;

    default:		// just arrow
	break;
    }
}

static void showArrow(uint8_t rotate_arrow,uint8_t method){
    showArrow(rotate_arrow, method, false);
}


/*void  printArrow(byte c){
    OSD::write_S(c); OSD::write_S(c+1);
}*/

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
static void showHorizon(byte start_col, byte start_row) {
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
    
    pitch_line = (int)(round(tan(-AH_PITCH_FACTOR * osd_att.pitch) * AH_TOTAL_LINES)) + AH_TOTAL_LINES/2;	// 90 total lines
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


static void showILS(byte start_col, byte start_row) {
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

        char alt = (osd_alt_rel * get_converth() + 5) * 4.4; //44 possible position 5 rows times 9 chars

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

byte radar_char(){
// символы квадрика с ориентацией
    static const byte arr[] PROGMEM = {0xb0, 0xb1, 0xb4, 0xb5, 0xb6, 0xb7, 0x7b, 0x7d };

//    int index = (int)((osd_heading + 22.5) / 45.0);
    int index = (2*osd_heading + 45) / 90;
    index = index > 7 ? 0 : index;
    
    return pgm_read_byte(&arr[index]);
}

static void showRADAR(byte center_col, byte center_line) {


    // calculate distances from home in lat (y) and lon (x) direction in [m]
//    int dst_y = (int)(-111319.5 * (osd_home.lat - osd_pos.lat));
//    int dst_x = (int)(-111319.5 * (osd_home.lon - osd_pos.lon) * cos(fabs(osd_home.lat) * 0.0174532925));
    
    // calculate display offset in y and x direction
    radar_zoom = max((int)(abs(dst_y) / STEP_WIDTH), (int)(abs(dst_x) / STEP_WIDTH)) + 1;
    

    byte y = (int)(dst_y / (radar_zoom / SCALE_Y));
    byte x = (int)(dst_x / (radar_zoom / SCALE_X) + 0.5);	// for even grid correction



    if(flags.flgTrack){
	static Point trk[4];
	if(trk[0].x !=x || trk[0].y !=y){	// положение изменилось
	    for(byte i=4; i!=1;){
		i--;
		trk[i] = trk[i-1]; // move points to end

//		OSD::write_xy(center_col + x, center_line - y, c);
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


    // show home
//    OSD::setPanel(center_col, center_line);
//    osd.printf_P(PSTR("\xF5\xF6"));
}





/******* PANELS - DEFINITION *******/
/* **************************************************************** */

/* **************************************************************** */
// Panel  : COG Course Over Ground
// Needs  : X, Y locations
// Output : 
// Size   : 
// Staus  : done

static void panCOG(point p){

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

static void printDist(float d){
      osd_printf_2(PSTR("%5.0f%c"), d, get_mhigh());
}

static void printDistCnv(float d){
      printDist( d * get_converth());
}




static void printFullDist(float dd){
    dd *= get_converth();
    if ((int)dd <= 9999) {
        printDist(dd);
    }else{
         osd_printf_2(PSTR("%5.2f%c"), (dd / pgm_read_word(&measure->distconv)), pgm_read_byte(&measure->distchar));
    }
}


// Panel  : ODO
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panDistance(point p){
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
    char m;
};


static void print_list(const Formats *f){
    PGM_P fmt;
    byte t;
    char m;
    float *v;
    float k;
    const byte *c;
    char h;
    
    float val=0;

    for(;;){
	fmt=(const char *)pgm_read_word(&f->fmt);
	if(fmt==0) {
	    return;
	}

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

	case 'f':
	default:
	    k=1;
as_f:
	    val = ( * (float *)v ) * k;
	    break;
	}


#ifdef DEBUG
//    Serial.printf_P(PSTR("list fmt=%S val=%f k=%f h=%d\n"),fmt,val, k,h);
#endif

	osd_printf_2(fmt,val,h);

	osd_nl();
	f++;
    }


}

static void panFdata(point p){ // итоги полета

    static const char PROGMEM fmt0[]="|\x0B%5f%c";
    static const char PROGMEM fmt1[]="\x8F%5f%c";
    static const char PROGMEM fmt2[]="\x14%5f%c";
    static const char PROGMEM fmt3[]="\x12%5f%c";
    static const char PROGMEM fmt4[]="\x03%10.6f";
    static const char PROGMEM fmt5[]="\x04%10.6f";

    static const PROGMEM Formats fd[] = {
	{fmt0, 'h',  &max_home_distance   },
	{fmt1, 'h',  &tdistance           },
	{fmt2, 's',  &max_osd_groundspeed },
	{fmt3, 'h',  &max_osd_home_alt    },
	{fmt4, 'f',  &osd_pos.lat         },
	{fmt5, 'f',  &osd_pos.lon         },
	{0}
    };

  OSD::write_xy(p.x, p.y, 0x08); // this is absolutely needed!

  printTimeCnv(&total_flight_time_milis, 0);


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
    
static void panTune(point p){

#ifdef IS_COPTER
    static const PROGMEM char fmt0[]="\x4E\x52%3.0f\x05";
    static const PROGMEM char fmt1[]="\x4E\x50%3.0f\x05";
    static const PROGMEM char fmt2[]="\x4E\x48%4.0f\x05";
    static const PROGMEM char fmt3[]="\x54\x42%6.1f\x05";
    static const PROGMEM char fmt4[]="\x41\x45%5.1f%c";
    static const PROGMEM char fmt5[]="\x58\x45%4.0f\x6D";
    static const PROGMEM char fmt6[]="\x41\x45%5.1f%c";

    static const PROGMEM Formats fd[] = {
	{ fmt0, 'i', &nav_roll          },
	{ fmt1, 'i', &nav_pitch         },
	{ fmt2, 'i', &nav_bearing       },
	{ fmt3, 'i', &wp_target_bearing },
	{ fmt4, 'h', &alt_error         },
	{ fmt5, 'i', &xtrack_error      },
	{ fmt6, 's', &aspd_error        },
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

    float err = alt_error * get_converth();

    osd_printf_2(f, -err, get_mhigh());
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

static void panTemp(point p){
    osd_printf_2(PSTR("%5.1f%c"), ((temperature / 10.0 * pgm_read_byte(&measure->tempconv) + pgm_read_word(&measure->tempconvAdd)) / 100), pgm_read_byte(&measure->temps));    
}

/* **************************************************************** */
// Panel  : efficiency
// Needs  : X, Y locations
// Output : 
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done
static void panEff(point p){

    static float ddistance = 0;
    float        eff = 0; //Efficiency

    if(sets.model_type==0){ // plane
#ifdef IS_PLANE
        if (osd_throttle >= 1){
          if (!lflags.throttle_on) 
              lflags.throttle_on = 1;
    
            if (osd_groundspeed != 0) {
        	//eff = (((float)osd_curr_A * 10.0 ) / cnvGroundSpeed())*0.1  + eff * 0.9;
#if defined(USE_FILTER)
        	filter(eff, (((float)osd_curr_A ) / cnvGroundSpeed())*10.0);
#else
        	eff = (((float)osd_curr_A ) / cnvGroundSpeed())* (10.0 * 0.1) + eff * 0.9; // комплиментарный фильтр 1/10
        	//dst+=(val-dst)*k;
        	//eff += ((((float)osd_curr_A ) / cnvGroundSpeed())* 10.0  - eff) * 0.1; // комплиментарный фильтр 1/10
        	
        	//float e0=(((float)osd_curr_A ) / cnvGroundSpeed())* 10.0;
        	//eff += (e0  - eff) * 0.1; // комплиментарный фильтр 1/10
#endif
	    }
	    
    	    if(has_sign(p))
		OSD::write_S(0x16);
            
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
		OSD::write_S(0xee);

            if (osd_climb < -0.05){
                float glide = ((osd_alt_to_home / (palt - osd_alt_to_home)) * (tdistance - ddistance)) * get_converth();
                int iGlide=glide;
                if (iGlide > 9999) glide = 9999.0;
                if (iGlide > 0){
                    osd_printf_2(f4_0fc, glide, get_mhigh()); // аэродинамическое качество
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
            remaining_estimated_flight_time_seconds = f_div1000((float)osd_battery_remaining_A * total_flight_time_milis / 
        					    (max_battery_reading - osd_battery_remaining_A));
            last_battery_reading = osd_battery_remaining_A;
	}
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

    osd_printi_1(PSTR("%3i\x25"), rssi);
}

/* **************************************************************** */
// Panel  : panCALLSIGN
// Needs  : X, Y locations
// Output : Call sign identification
// Size   : 1 x 6Hea  (rows x chars)
// Staus  : done

static void panCALLSIGN(point p){
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

static void panWindSpeed(point p){

    int /*float*/ dir = osd_winddirection;

    if (dir < 0)  dir+=360;

#if defined(USE_FILTER)
    filter(nor_osd_windspeed,  osd_windspeed, 0.01 ); // комплиментарный фильтр 1/100 
#else
    //nor_osd_windspeed = osd_windspeed * 0.01 + nor_osd_windspeed * 0.99; // комплиментарный фильтр 1/100 
    //dst+=(val-dst)*k;
    nor_osd_windspeed += (osd_windspeed - nor_osd_windspeed) * 0.01; // комплиментарный фильтр 1/100 
#endif

    showArrow(grad_to_sect(dir - osd_heading),1, is_alt(p)); //print data to OSD
}

/* **************************************************************** */
// Panel  : panCur_A
// Needs  : X, Y locations
// Output : Current symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panCur_A(point p){

    osd_printf_1(PSTR("%5.2f\x0e"), (float(osd_curr_A) * 0.01)); // in amps
}

/* **************************************************************** */
// Panel  : panAlt
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panAlt(point p){
    long v=osd_pos.alt;
    if(is_alt(p)) v-=osd_home.alt;

//    printDistCnv(v/1000.0);
    printDistCnv(f_div1000(v));

}

/*
static void panBaroAlt(point p){

    printDistCnv(osd_baro_alt/1000.0);

}
*/

/* **************************************************************** */
// Panel  : panHomeAlt
// Needs  : X, Y locations
// Output : Alt symbol and home altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panHomeAlt(point p){

    float v=osd_alt_to_home;
    
    if((*(long *)&v)==0) v = osd_alt_rel;
    //printDist(osd_alt_rel * get_converth();
    printDistCnv(v);
}



/* **************************************************************** */
// Panel  : panClimb
// Needs  : X, Y locations
// Output : Alt symbol and altitude value in meters from MAVLink
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done

static void panClimb(point p){
    if(is_alt(p)) { 	// in m/s
	float v= vertical_speed/60;
	PGM_P fmt;
	
	if(abs((int)v)<10)
	    fmt=PSTR("% 5.2f\x18");
	else
	    fmt=PSTR("% 5.1f\x18");
	osd_printf_1(fmt, v);
    } else
        osd_printf_2(f4_0fc, vertical_speed, pgm_read_byte(&measure->climbchar));
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

#define WARNINGS 10

uint8_t warning;

static void check_warn()
{
    uint16_t wmask = 0;
    uint16_t bit;
    uint8_t prev_warn;


    if (!lflags.one_sec_timer_switch) return;
    lflags.one_sec_timer_switch=0;


    int iAirspeed = osd_airspeed * get_converts();
    int iVolt = osd_vbat_A/100; // in 0.1v as sets.battv is


//1
 if ((osd_fix_type) < 2) 
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
 if (!(sets.RSSI_raw%2) && rssi < sets.rssi_warn_level )
    wmask |= (1<<4);

    int iVs = (int)abs(vertical_speed) /10;

//6
 if (sets.model_type==1 && sets.stall >0 && iVs > sets.stall ) // copter - vertical speed
    wmask |= (1<<5);

    iVolt = osd_vbat_B/100; // in 0.1v as sets.battBv is

//7    voltage limit set and less                   capacity limit set and less
 if (sets.battBv !=0 && iVolt!=0 && (iVolt < sets.battBv) )
    wmask |= (1<<6);


//8
 if(mav_fence_status == FENCE_BREACH_MINALT)
    wmask |= (1<<7);

//9
 if(mav_fence_status == FENCE_BREACH_MAXALT)
    wmask |= (1<<8);

//10
 if(mav_fence_status == FENCE_BREACH_BOUNDARY)
    wmask |= (1<<9);

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
const char PROGMEM w7[]="Batt B low!"; 
const char PROGMEM w8[]="Fence Low!";
const char PROGMEM w9[]="Fence High!";
const char PROGMEM w10[]="Fence Far!";

const char * const warn_str[] = {
    0, // 0
    w1,
    w2,
    w3,
    w4,
    w5,
    w6,
    w7,
    w8,
    w9,
    w10
};

static void panWarn(point p){
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

static void panThr(point p){
    osd_printi_1(PSTR("%3.0i%%"), osd_throttle);
}

/* **************************************************************** */
// Panel  : panBatteryPercent
// Needs  : X, Y locations
// Output : Battery state from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done

static void osd_print_bat(PGM_P fmt, float f){
    osd.printf_P(fmt, osd_battery_pic_A[0], osd_battery_pic_A[1], f);
}

static byte guessMaxVolt(){
    if(max_battery_reading >=95 && max_battery_reading <=100) 
        return 100;

    return 255;
}

static void panBatteryPercent(point p){

    float val;

    byte maxv = guessMaxVolt();

    val = (float)osd_battery_remaining_A/maxv*100;


    if(has_sign(p)) {
	OSD::write_S(0x88); // донышко батарейки не зависит от

        setBatteryPic(byte(val * 2.56), osd_battery_pic_A);     // battery A remmaning picture
//    setBatteryPic(osd_battery_remaining_B, osd_battery_pic_B);     // battery B remmaning picture

	if (is_alt(p))
	    osd_print_bat(PSTR("%c%c\x8e%2.0f%%"), val);
	else
    	    osd_print_bat(PSTR("%c%c\x8e%4.0f\x01"), (float)mah_used);
    } else {
	if (is_alt(p))
	    osd_printf_1(PSTR("%2.0f%%"),val);
	else
	    osd_printf_1(PSTR("%4.0f\x01"),(float)mah_used);
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

    if(!lflags.osd_got_home) return;

    printFullDist(osd_home_distance);
}


/* **************************************************************** */
// Panel  : panHorizon
// Needs  : X, Y locations
// Output : 5 x 12 Horizon line surrounded by 2 cols (left/right rules)
// Size   : 5 x 14  (rows x chars)
// Staus  : done

const char str_hud[] PROGMEM = "\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3|";

const char str_mid[] PROGMEM = "\xC6\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xC5|";

static void panHorizon(point p){
  
  // сначала нарисуем стрелочки.

    if(is_alt(p)) {
        osd.print_P(str_hud);
        osd.print_P(str_hud);
        osd.print_P(str_mid);
        osd.print_P(str_hud);
        osd.print_P(str_hud);
    } else {
/* we don't need to clear screen!
	for(byte j=5; j!=0; j--) {
	    for(byte i=14; i!=0; i--)
		osd_blank();
	    osd_nl();
	}
*/
//	osd.print_P(str_mid);
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

static void panPitch(point p){
//Serial.printf_P(PSTR("pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();

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
// Panel  : panBattery A (Voltage 1)
// Needs  : X, Y locations
// Output : Voltage value as in XX.X and symbol of over all battery status
// Size   : 1 x 8  (rows x chars)
// Staus  : done


static void NOINLINE printVolt(uint16_t v) {
//    osd_printf_1(PSTR("%5.2f\x0D"), v/1000.0);
    osd_printf_1(PSTR("%5.2f\x0D"), f_div1000(v));
}

static void panBatt_A(point p){

    printVolt(osd_vbat_A);
}


/* **************************************************************** */
// Panel  : panBattery B (Voltage 2)
// Needs  : X, Y locations
// Output : Voltage value as in XX.X and symbol of over all battery status
// Size   : 1 x 8  (rows x chars)
// Staus  : done

static void panBatt_B(point p){
    if(is_on(p)) {
	flags.useExtVbattB=1; // отобразить состояние панели во ФЛАГЕ
        printVolt(osd_vbat_B);
    } else
        flags.useExtVbattB = ( sets.battBv!=0 ); // включено если есть надобность контроля
}




//------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

static void panWaitMAVBeats(){

#if 0 // testintg things
    OSD::setPanel(3,3);
    
    showArrow(grad_to_sect(seconds),0);
    osd.print(seconds);
    osd_nl();
    
    int rotate_arrow = grad_to_sect(seconds);
    osd.print(rotate_arrow );
    osd_nl();

    char arrow_set1 = 0x90;


    while(rotate_arrow>16) rotate_arrow -= 16;
    while(rotate_arrow<1)  rotate_arrow += 16;
    
//    rotate_arrow &= 0x0f;

    arrow_set1 += rotate_arrow * 2 - 2;

    osd.printf_P(PSTR("%x"),arrow_set1);
#endif

    OSD::setPanel(5,9);
    osd.print_P(PSTR("No input data! "));

#ifdef DEBUG
    extern uint16_t packet_drops;
    extern long bytes_comes;
    extern volatile uint16_t lost_bytes;
    extern uint16_t packets_skip;
    extern uint16_t packets_got;

    OSD::setPanel(2,11);
    osd.printf_P(PSTR("crc drops=%u |bytes=%ld lost=%u"),packet_drops, bytes_comes,  lost_bytes);
    osd.printf_P(PSTR("|packets got=%u skip=%u"), packets_got, packets_skip);
    
    lflags.input_active=0;
#endif
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
    if (osd_fix_type == 3) gps_str = 0x0f;

    if ((eph >= 200) && lflags.blinker)
       gps_str = 0x20;

    if(has_sign(p))
	OSD::write_S(gps_str);

    osd_printi_1(PSTR("%2i"), osd_satellites_visible);
}

/* **************************************************************** */
// Panel  : panGPS
// Needs  : X, Y locations
// Output : two row numeric value of current GPS location with LAT/LON symbols as on first char
// Size   : 2 x 12  (rows x chars)
// Staus  : done

static void NOINLINE print_GPS(PGM_P f){
    if(*((long *)&osd_pos.lon) || *((long *)&osd_pos.lat)) // не выводим координат если нету
	osd.printf_P(f, osd_pos.lat, osd_pos.lon);
}

static void panGPS(point p){

    PGM_P f;

    if(has_sign(p)){
	if(is_alt(p))
	    f=PSTR("\x03%9.5f|\x04%9.5f");
	else
	    f=PSTR("\x03%10.6f|\x04%10.6f");
    }else {
	if(is_alt(p))
	    f=PSTR("%9.5f|%9.5f");
	else
	    f=PSTR("%10.6f|%10.6f");
    }

    //osd.printf_P(f, (double)osd_pos.lat, (double)osd_pos.lon);
    print_GPS(f);
}

/* **************************************************************** */
// Panel  : panGPS2
// Needs  : X, Y locations
// Output : one row numeric value of current GPS location with LAT/LON symbols as on first char
// Size   : 1 x 25  (rows x chars)
// Staus  : done

static void panGPS2(point p){

    PGM_P f;

    if(has_sign(p)){
	if(is_alt(p))
	    f=PSTR("\x03%9.5f \x04%9.5f");
	else
	    f=PSTR("\x03%10.6f \x04%10.6f");
    } else {
        if(is_alt(p))
    	    f=PSTR("%9.5f %9.5f");
    	else
    	    f=PSTR("%10.6f %10.6f");
    }

//    osd.printf_P(f, (double)osd_pos.lat, (double)osd_pos.lon);
    print_GPS(f);

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

    osd_printi_1(PSTR("%3i\x05"), osd_heading);
}

/* **************************************************************** */
// Panel  : panRose
// Needs  : X, Y locations
// Output : a dynamic compass rose that changes along the heading information
// Size   : 2 x 13  (rows x chars)
// Staus  : done

static void panRose(point p){
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


static int getTargetBearing(){
    if (wp_target_bearing < 0) wp_target_bearing+=360;

    return grad_to_sect(wp_target_bearing - osd_heading); //Convert to int 1-16 
}

/* **************************************************************** */
// Panel  : panWPDir
// Needs  : X, Y locations
// Output : 2 symbols that are combined as one arrow, shows direction to next waypoint
// Size   : 1 x 2  (rows x chars)
// Staus  : not ready

static void panWPDir(point p){
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

static void panWPDis(point p){

    if (xtrack_error > 999)  xtrack_error = 999;
    if (xtrack_error < -999) xtrack_error = -999;


    byte h=get_mhigh();

    //osd.printf_P(PSTR("%2i %4.0f%c|"), wp_number,((float)wp_dist * pgm_read_float(&measure->converth)), h);
    osd_printi_1(PSTR("%2i "), wp_number);
    osd_printf_2(PSTR("%4.0f%c|"), ((float)wp_dist * get_converth()), h);
    
    showArrow(getTargetBearing(), 0);

    if (osd_mode == 10){ // auto
        osd_printf_2(PSTR("\x20\x58\x65%4.0f%c"), (xtrack_error * get_converth()), h);
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

static void panHomeDir(point p){
    if(!lflags.osd_got_home) return;

    showArrow(osd_home_direction,0);
}

static void panMessage(point p){

#define MAX_MSG_SIZE 26

//  if(lflags.flgMessage) {
    if(mav_message[0] && mav_msg_ttl != seconds) { // вызывается не реже 2 раз в секунду поэтому точное сравнение будет работать
	char sign;

        if(mav_msg_severity <= MAV_SEVERITY_CRITICAL) sign='!';
	else sign=0;


/*	byte len=mav_msg_len; 
	{
	    char *cp = (char *)&mav_message[len];
	    for(;;) {
		byte c = *(--cp);
		
		if(c==0 || c==0x20){
		    len--;
		} else {
		    cp[1]=0;
		    break;
		}
	    }

	}
*/
	int8_t diff = MAX_MSG_SIZE - mav_msg_len; // can it fit to screen?
	if( diff >= 0) { 		// yes! message less than screen
	    OSD::setPanel(p.x + ((byte)diff)/2,p.y); // show it centered
	    if(has_sign(p) && sign) OSD::write_S(sign);
	    osd.print((char *)mav_message);


//OSD::setPanel(p.x,p.y +1);
//osd.printf_P(PSTR("diff=%d len=%d"), diff, len);

	} else {				// message don't fit
	    int pos;
	    
	    if(has_sign(p) && sign) OSD::write_S(sign);
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
//OSD::setPanel(p.x,p.y +1);
//osd.printf_P(PSTR("pos=%d diff=%d len=%d"), pos, diff, len);
	}
//OSD::setPanel(p.x,p.y +1);
//osd.printf_P(PSTR(" sev=%d"), mav_msg_severity);
    } else {
	mav_message[0]=0; // no message
//	lflags.flgMessage=0;
    }
//  } // lflags.flgMessage
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
const char PROGMEM s_mode04[] = "guid"; //Guided	4
const char PROGMEM s_mode05[] = "loit"; //Loiter	5
const char PROGMEM s_mode06[] = "rtl";  //Return to Launch 6
const char PROGMEM s_mode07[] = "circ"; //Circle	7
const char PROGMEM s_mode08[] = "posh"; //Position Hold (Old) 8
const char PROGMEM s_mode09[] = "land"; //Land		9
const char PROGMEM s_mode10[] = "oflo"; //OF_Loiter 	10
const char PROGMEM s_mode11[] = "drif"; //Drift		11
const char PROGMEM s_mode_n[] = "m_%d"; //              12
const char PROGMEM s_mode13[] = "sprt"; //Sport		13
const char PROGMEM s_mode14[] = "flip"; //Flip		14
const char PROGMEM s_mode15[] = "tune"; //Tune		15
const char PROGMEM s_mode16[] = "hold"; //Position Hold (Earlier called Hybrid) 16

#ifdef IS_COPTER
char const * const mode_c_strings[] PROGMEM ={ 
    s_mode00, s_mode01, s_mode02, s_mode03, s_mode04, 
    s_mode05, s_mode06, s_mode07, s_mode08, s_mode09, 
    s_mode10, s_mode11, s_mode_n, s_mode13, s_mode14,
    s_mode15, s_mode16
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
const char PROGMEM p_mode00[] = "manu"; //Manual
//const char PROGMEM p_mode01[] = "circ"; //CIRCLE
//const char PROGMEM p_mode02[] = "stab"; //Stabilize
const char PROGMEM p_mode03[] = "trai"; //Training
//const char PROGMEM p_mode04[] = "acro"; //ACRO
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

#ifdef IS_PLANE
const char * const mode_p_strings[] PROGMEM ={ 
    p_mode00, s_mode07, s_mode00, p_mode03, s_mode01, 
    p_mode05, p_mode06, p_mode07, p_mode08, s_mode_n,
    s_mode03, s_mode06, s_mode05, s_mode_n, s_mode_n, 
    s_mode04, p_mode16, p_mode17, p_mode18, p_mode19
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
    p_mode00, u_mode01, u_mode02, u_mode03, u_mode04, 
    u_mode05, u_mode06, s_mode08, u_mode08, u_mode09, 
    u_mode10, u_mode11, s_mode06, s_mode09, u_mode14,
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
    aq_mode0, p_mode00, s_mode02, s_mode08,
    s_mode_n, aq_mode5, s_mode_n, s_mode_n,
    aq_mode8, 
};

#if defined(USE_MWII)
/*
    { 0, 1, &msg.mwii.mode.armed},   0
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

static void panFlightMode(point p){

    //PGM_P mode_str;
    const char * const *ptr;
    
#if defined(USE_UAVTALK)
    if(lflags.uavtalk_active) {
	ptr = mode_u_strings;
    } else 
#endif

#if defined(USE_MWII)
    if(lflags.mwii_active) {
	ptr = mode_mw_strings;
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

	    osd_mode = bc;
	    ptr = mode_aq_strings;
	} else {

#ifdef IS_COPTER
 #ifdef IS_PLANE
            if(sets.model_type==0) {
                ptr = mode_p_strings;
            } else {
                ptr = mode_c_strings;
            }

 #else
            ptr = mode_c_strings;
 #endif    
#else
 #ifdef IS_PLANE
            ptr = mode_p_strings;
 #endif    
#endif
        }
    }
    
    PGM_P str=(PGM_P)pgm_read_word(&ptr[osd_mode]);

    osd_printi_1(str,osd_mode);
    

    if(lflags.motor_armed)
        OSD::write_S(0x86);
}


static void panRadarScale(Point p){
    float dd= radar_zoom * STEP_WIDTH * get_converth();
    
    if(radar_zoom >=40) // 10 000 
        osd_printf_2(PSTR("%4.2f%c"), f_div1000(dd), pgm_read_byte(&measure->distchar));
    else
        osd_printf_2(PSTR("%4.0f%c"), dd, get_mhigh());
}





/* **************************************************************** */
// Panel  : panCh
// Needs  : X, Y locations
// Output : Scaled channel values from MAVLink
// Size   
// Staus  : done

static void panCh(point p){
    for(byte i=0; i<8;i++)
	osd.printf_P(PSTR("C%d%5i|"), i+1, chan_raw[i] );
}

#if defined(USE_SENSORS)
static void printSensor(byte n){

    SensorInfo s;


    eeprom_read_len((byte *)&s,  EEPROM_offs(sensors) + n * sizeof(SensorInfo),  sizeof(SensorInfo) );

    float v=s.K * sensorData[n] + s.A;

//Serial.printf_P(PSTR("\n n=%d k=%f v=%d fmt=%s addr=%d sz=%d\n"),n,s.K,sensorData[n], s.format, EEPROM_offs(sensors) + n * sizeof(SensorInfo), sizeof(SensorInfo));

    osd.printf(s.format,v);
}

static void NOINLINE panSensor1(point p) {
    if(is_on(p)) {
	lflags.flgSensor1=1;
	printSensor(0);
    } else
	lflags.flgSensor1=0;
    
}

static void NOINLINE panSensor2(point p) {
    if(is_on(p)) {
	lflags.flgSensor2=1;
        printSensor(1);
    } else
	lflags.flgSensor2=0;
}

static void NOINLINE panSensor3(point p) {
    if(is_on(p)) {
	lflags.flgSensor3=1;
	lflags.fPulseSensor3 = is_alt(p);
        printSensor(2);
    } else
	lflags.flgSensor3=0;
}

static void NOINLINE panSensor4(point p) {
    if(is_on(p)) {
	lflags.flgSensor4=1;
	lflags.fPulseSensor4 = is_alt(p);
        printSensor(3);
    } else
	lflags.flgSensor4=0;
}
#endif


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
    showHorizon(8+1, 6);
}

#if defined(USE_SENSORS)
void setup_sens() {
    /*if(is_on(panel.sensor1))*/    panSensor1({8 , 6});
    /*if(is_on(panel.sensor2))*/    panSensor2({8 , 7});
    /*if(is_on(panel.sensor3))*/    panSensor3({8 , 8});
    /*if(is_on(panel.sensor4))*/    panSensor4({8 , 9});
}
#endif

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


#if defined(USE_SENSORS)
static const PROGMEM char n_sensors[]     = "   Pin Sensors";
static const PROGMEM char n_k_sensor1[]   = "1 (V1) K";
static const PROGMEM char n_a_sensor1[]   = "       A";
static const PROGMEM char n_k_sensor2[]   = "2 (V2) K";
static const PROGMEM char n_k_sensor3[]   = "3 (Current) K";
static const PROGMEM char n_k_sensor4[]   = "4 (RSSI) K";
#endif

static const PROGMEM char f_float[]= "%.3f";
static const PROGMEM char f_batt[] = "%3.1f\x76";
static const PROGMEM char f_int[]  = "%.0f";


// первый экран настроек
static const PROGMEM Params params1[] = { 
	{n_sets,    0,   0,  0,                    0, 0},      // header
	{n_batt,   'b', 10, &sets.battv ,          0, f_batt, 0, 255 },
	{n_battB,  'b', 10, &sets.battBv,          0, f_batt, 0, 255 },

	{n_stall,  'b', 1, &sets.stall,            0, f_int, 0, 255 },
	{n_oversp, 'b', 1, &sets.overspeed,        0, f_int, 0, 255 },
	{n_charge, 'b', 1, &sets.batt_warn_level,  0, f_int, 0, 255 },
	{n_rssi,   'b', 1, &sets.rssi_warn_level , 0, f_int, 0, 255 },

	{n_screen,  0,  0,   0,                    0,     0}, // header
	{n_scr,    'b', 1,   &sets.n_screens,      0,     f_int, 1, 4},
	{n_contr,  'b', 1,   &sets.OSD_BRIGHTNESS, renew, f_int, 0, 3},
	{n_horiz,  'Z', 1,   &sets.horiz_offs,     renew, f_int, -31, 31 },
	{n_vert,   'z', 1,   &sets.vert_offs,      renew, f_int, -15, 15 },
};

// второй экран - горизонт
static const PROGMEM Params params2[] = { 
	{n_horizon,     'h', 0,   0,                    0, 0}, // header with pal/ntsc string
	{n_k_RollPAL,   'f', 1,   &sets.horiz_kRoll,    0, f_float, -4, 4},
	{n_k_PitchPAL,  'f', 1,   &sets.horiz_kPitch,   0, f_float, -4, 4},
	{n_k_RollNTSC,  'f', 1,   &sets.horiz_kRoll_a,  0, f_float, -4, 4},
	{n_k_PitchNTSC, 'f', 1,   &sets.horiz_kPitch_a, 0, f_float, -4, 4},
};

#if defined(USE_SENSORS)// третий экран - сенсоры

#define SENSOR(n) ((SensorInfo *)(EEPROM_offs(sensors) + n * sizeof(SensorInfo)))

static const PROGMEM Params params3[] = {
	{n_sensors,     0,   0,   0,                 0, 0}, 
	{n_k_sensor1,   's', 1,   &SENSOR(0)->K, 0, f_float, -8000, 8000},
	{n_a_sensor1,   's', 1,   &SENSOR(0)->A, 0, f_float, -100, 100},
	{n_k_sensor2,   's', 1,   &SENSOR(1)->K, 0, f_float, -8000, 8000},
	{n_a_sensor1,   's', 1,   &SENSOR(1)->A, 0, f_float, -100, 100},
	{n_k_sensor3,   's', 1,   &SENSOR(2)->K, 0, f_float, -8000, 8000},
	{n_a_sensor1,   's', 1,   &SENSOR(2)->A, 0, f_float, -100, 100},
	{n_k_sensor4,   's', 1,   &SENSOR(3)->K, 0, f_float, -8000, 8000},
	{n_a_sensor1,   's', 1,   &SENSOR(3)->A, 0, f_float, -100, 100},
	
};
#endif

static const PROGMEM Setup_screen screens[] = {
    {params1, (sizeof(params1)/sizeof(Params)), 0 },
    {params2, (sizeof(params2)/sizeof(Params)), setup_horiz },
#if defined(USE_SENSORS)
    {params3, (sizeof(params2)/sizeof(Params)), setup_sens },
#endif
    {0,0} // end marker
};

#define SETUP_N_SCREENS (sizeof(screens)/sizeof(Setup_screen) - 1)

static byte setup_menu=1; // номер строки меню
static byte setup_screen=0; // номер экрана меню
static uint16_t chan1_raw_middle, chan2_raw_middle; // запомненные при входе значения каналов 1 и 2
static uint16_t /*chan3_raw_middle,*/ chan4_raw_middle; // запомненные при входе значения каналов 3 и 4
const Params *params; // указатель на текущий набор параметров



static void move_menu(char dir){

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


static void panSetup(){

    const Params *p;
    float v = 0;
    byte size;
    byte type;
    float inc = 0;
    byte col = 0;
    char *nm;
    int min, max;
    byte k;

    int8_t offs=0;

    float c_val=0;

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
        
        //while(OSD::col < 19) OSD::write_S(' ');
        OSD::setPanel(19, SETUP_START_ROW + i);

	if(i == setup_menu) {
	    OSD::write_S('>');
	    col=OSD::col;
	} else {
	    osd_blank();
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

	case 'z': // vertical offs
	    offs=0x10;
	    goto as_char;
	case 'Z': // horiz offs
	    offs=0x20;
	    goto as_char;
        case 'c': // signed byte param
as_char:
	    { 
		int l = *((char *)(pgm_read_word((void *)&p->value) ) ) - offs;
		v = l / (float)k;
	    }
	    break;
	    
        case 'f': // float param
	    v=*((float *)(pgm_read_word((void *)&p->value) ));
	    break;

#if defined(USE_SENSORS)
	case 's': //sensors in EEPROM
	    uint16_t ptr=pgm_read_word((void *)&p->value);
	    float f;
	    eeprom_read_len((byte *)&f,  ptr,  sizeof(float) );
	    v=f;
	    break;
#endif
	}

	if(i == setup_menu) c_val = v; 


	osd_printf_1((PGM_P)pgm_read_word((void *)&p->fmt), v);
    }

    fptr tail = (fptr) pgm_read_word((void *)&pscreen->tail);

    if(tail) tail();

    if(!lflags.flag_05s) return;
    lflags.flag_05s=0;

    lflags.got_data=1;   // renew screen



    if ((chan_raw[1] - 150) > chan2_raw_middle ){  move_menu(1);    return; } // переходы по строкам по верх-низ
    if ((chan_raw[1] + 150) < chan2_raw_middle ){  move_menu(-1);   return; }

    if ((chan_raw[3] - 150) > chan4_raw_middle ){  move_screen(1);  return; } // переходы по экранам - левый дж лево-право
    if ((chan_raw[3] + 150) < chan4_raw_middle ){  move_screen(-1); return; }


    OSD::setPanel(col, SETUP_START_ROW + setup_menu); // в строку с выбранным параметром

    p = &params[setup_menu];

    bool fNeg=false;
    int diff = ( chan1_raw_middle - chan_raw[0] );
    if(diff<0) {
	diff = -diff;
	fNeg=true;
    }

    void *pval=(void *)pgm_read_word((void *)&p->value);

    min =(int)pgm_read_word((void *)&p->min);
    max =(int)pgm_read_word((void *)&p->max);

    type=pgm_read_byte((void *)&p->type);
    k=pgm_read_byte((void *)&p->k);


    v=c_val;
    
    switch (type){
	case 'z':
	case 'Z':
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

	case 's': // sensors
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
//    bool press=false;
        
    
    if(diff>100){
//if(diff) Serial.printf_P(PSTR("diff=%d inc=%f\n"), diff,inc); Serial.wait();
	if(fNeg) v += inc;
	else     v -= inc;

        if(v<min) v=min;
        if(v>max) v=max;
    }


    if(v != c_val) {
//Serial.printf_P(PSTR("write new=%f old=%f\n"), v, value_old);;
	int8_t cv=(char)(v * k);

        switch (type){
    	    case 'Z':
    		*((char *)pval) = cv + 0x20;
    		break;
    	    case 'z':
    		*((char *)pval) = cv + 0x10;
    		break;

	    case 'c':
		*((char *)pval) = cv;
		break;

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
//	osd_printf_1((PGM_P)pgm_read_word((void *)&p->fmt), v); // updated value

no_write:
	fptr cb = (fptr) pgm_read_word((void *)&p->cb);


//Serial.printf_P(PSTR("cb=%x\n"), (int)cb); Serial.wait();

//Serial.printf_P(PSTR("sets.horiz_offs=%d\n"), sets.horiz_offs); 

	if(cb) cb(); // show tail
    }

}


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
    { ID_of(horizon),		panHorizon, 	0 },
    { ID_of(pitch),		panPitch, 	0  },
    { ID_of(roll),		panRoll, 	0  },
    { ID_of(batt_A),		panBatt_A, 	0xbc  },
    { ID_of(batt_B) | 0x80,	panBatt_B, 	0x26  },
    { ID_of(GPS_sats),		panGPSats, 	0 },
    { ID_of(GPS),		panGPS, 	0  },
    { ID_of(GPS2),		panGPS2, 	0  },
    { ID_of(batteryPercent),	panBatteryPercent, 0 },
    { ID_of(COG),		panCOG, 	0 },
//10
    { ID_of(rose),		panRose, 	0 },
    { ID_of(heading),		panHeading, 	0 },
    { ID_of(Fdata),		panFdata, 	0 },
    { ID_of(homeDist),		panHomeDis, 	0x0b },
    { ID_of(homeDir), 		panHomeDir, 	0 },
    { ID_of(time),		panTime, 	0 },
//16
    { ID_of(WP_dist),		panWPDis,	0x5c },
    { ID_of(alt),		panAlt, 	0x11 }, // GPS Alt
    { ID_of(homeAlt),		panHomeAlt, 	0x12 },
    { ID_of(vel),		panVel, 	0x14 },
//20
    { ID_of(airSpeed),		panAirSpeed, 	0x13 },
    { ID_of(throttle),		panThr, 	0x02 },
    { ID_of(FMod),		panFlightMode,	0x7f },
    { ID_of(curr_A),		panCur_A, 	0xbd },
    { ID_of(windSpeed),		panWindSpeed, 	0x1d },
    { ID_of(climb),		panClimb, 	0x15 },
    { ID_of(tune),		panTune, 	0 },
    { ID_of(RSSI),		panRSSI, 	0x09 },
    { ID_of(eff),		panEff, 	0 },
    { ID_of(temp),		panTemp, 	0 },
    { ID_of(ch),		panCh, 		0 },
    { ID_of(distance),		panDistance, 	0x8f },
    { ID_of(RadarScale),	panRadarScale, 	RADAR_CHAR  },
#if defined(USE_SENSORS)
    { ID_of(sensor1) | 0x80,	panSensor1, 	0 },
    { ID_of(sensor2) | 0x80,	panSensor2, 	0 },
    { ID_of(sensor3) | 0x80,	panSensor3, 	0 },
    { ID_of(sensor4) | 0x80,	panSensor4, 	0 },
#endif
    { ID_of(callSign),		panCALLSIGN, 	0 },
    { ID_of(message),		panMessage, 	0 },
// warnings should be last
    { ID_of(warn) | 0x80,       panWarn,	0 }, // show warnings even if screen is disabled
    {0, 0}
};


static void print_all_panels(const Panels_list *pl ) {

    for(;;){
	//Point *pp = (Point *)pgm_read_word(&pl->p);
	byte n = pgm_read_byte(&pl->n); // номер панели в массиве
	fPan_ptr f = (fPan_ptr)pgm_read_word(&pl->f);
	if(f==0) break;
	
	point p = readPanel(n & 0x7f);// читать непосредственно из EEPROM
	
        osd_setPanel(p);
	if(is_on(p)){
	    if(has_sign(p)) {
		byte s = pgm_read_byte(&pl->sign);
		if(s) OSD::write_S(s);
	    }
	    f(p);
	} else if(n & 0x80) { // call even if not visible - w/o sign
	    f(p);
	}
	pl++;
    }
}

void writePanels(){

    osd.detectMode(); // PAL/NTSC live
    
    unsigned long pt;
    pt=millis();  // текущее время

#ifdef IS_PLANE
    if (lflags.in_air  && ((int)osd_alt_to_home > 10 || (int)osd_groundspeed > 1 || osd_throttle > 1 )){
        landed = pt; // пока летаем постоянно обновляем это время
    }
#ifdef IS_COPTER
      else if (!lflags.motor_armed && lflags.last_armed_status ){ // on motors disarm.
	landed = pt; // запомнится время дизарма
    }
    
    lflags.last_armed_status = lflags.motor_armed;
    
#endif
#else // pure copter

    if (!lflags.motor_armed && lflags.last_armed_status ){ // on motors disarm.
	landed = pt; // запомнится время дизарма
    }
#endif

    if(sets.n_screens>MAX_PANELS) sets.n_screens = MAX_PANELS;

  //Base panel selection
  //No mavlink data available panel
//    if(pt > (lastMAVBeat + 2500)){
    if(time_since(&lastMAVBeat) > 2500){
        panWaitMAVBeats(); //Waiting for MAVBeats...
    }
#ifdef IS_COPTER
 //Only show flight summary 10 seconds after landing and if throttle < 15
//  else if (!lflags.motor_armed && (((pt / 10000) % 2) == 0) && (tdistance > 50)){
//  else if (!lflags.motor_armed && (((seconds / 10) % 2) == 0) && (tdistance > 50)){
//  else if (!lflags.motor_armed && ( pt - landed < 10000 ) && ((int)tdistance > 5)){ // 10 seconds after disarm
  else if (!lflags.motor_armed && time_since(&landed) < 10000 && ((int)tdistance > 5)){ // 10 seconds after disarm

#else
#ifdef IS_PLANE
    //Only show flight summary 7 seconds after landing
  else if ( time_since(&landed) < 10000 && ((int)tdistance > 5)){
#else
    else if(0) {
#endif
#endif

#ifdef DEBUG
    Serial.printf_P(PSTR("fdata\n")); Serial.wait();
#endif

    panFdata({1,1});    //Flight summary panel

#ifdef DEBUG
    Serial.printf_P(PSTR("fdata done\n")); Serial.wait();
#endif


  } else{  //Normal osd panel

//	OSD::setPanel(0,0);
//	osd.printf_P("p=%d t=%d",panelN, sets.ch_toggle);

    //Check for panel toggle
//    if(sets.ch_toggle > 0) pan_toggle(); // This must be first so you can always toggle

    if(sets.n_screens==0 || panelN < sets.n_screens){ // конфигурируемые юзером экраны
	print_all_panels(panels_list);
    } else { 			// last panel

	if(!lflags.motor_armed) {
	    panSetup();			// Setup when not armed
	}  else  { // warnings on clear screen
	    print_all_panels(&panels_list[sizeof(panels_list)/sizeof(Panels_list)-2]); // warnings only
	}

    }
  }
}


