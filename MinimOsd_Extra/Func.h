
extern struct loc_flags lflags;  // все булевые флаги кучей


void NOINLINE millis_plus(uint32_t *dst, uint16_t inc) {
    *dst = millis() + inc;
}


void NOINLINE long_plus(uint32_t *dst, uint16_t inc) {
    *dst +=  inc;
}

int NOINLINE long_diff(uint32_t *l1, uint32_t *l2) {
    return (int)(l1-l2);
}


static inline boolean getBit(byte Reg, byte whichBit) {
    return  Reg & (1 << whichBit);
}

float NOINLINE get_converth(){
    return pgm_read_float(&measure->converth);
}

float NOINLINE get_converts(){
    return pgm_read_float(&measure->converts);
}

float NOINLINE f_div1000(float f){
    return f/1000;
}

void NOINLINE mav_message_start(byte len, byte time){
    mav_msg_ttl=seconds + time;// time to show
    mav_msg_len = len;
    mav_msg_shift = count02s;
    
//    lflags.flgMessage=1;
}

uint16_t NOINLINE time_since(uint32_t *t){
    return (uint16_t)(millis() - *t); // loop time no more 1000 ms

}

static void inline reset_setup_data(){ // called on any screen change
    memset((byte *)chan_raw_middle, 0, sizeof(chan_raw_middle)); // clear channels middle
}

static void pan_toggle(){
    byte old_panel=panelN;

    uint16_t ch_raw;

    if(sets.ch_toggle == 0) 
	return;
    else if(sets.ch_toggle == 1) 
	ch_raw = PWM_IN;	// 1 - используем внешний PWM для переключения экранов
    else if(sets.ch_toggle >= 5 && sets.ch_toggle <= 8)
	ch_raw = chan_raw[sets.ch_toggle-1];
    else 
        ch_raw = chan_raw[7]; // в случае мусора - канал 8


//	автоматическое управление OSD  (если режим не RTL или CIRCLE) смена режима туда-сюда переключает экран
    if (sets.ch_toggle == 4){
      if ((osd_mode != 6) && (osd_mode != 7)){
        if (osd_off_switch != osd_mode){ 
            osd_off_switch = osd_mode;
            //osd_switch_time = millis();
            millis_plus(&osd_switch_time,0);
            if (osd_off_switch == osd_switch_last){
              lflags.rotatePanel = 1;
            }
        }
//        if ((millis() - osd_switch_time) > 2000){
        if ( time_since(&osd_switch_time) > 2000){
          osd_switch_last = osd_mode;
        }
      }
    }
    else  {
      if (!sets.switch_mode){  //Switch mode by value
        /*
	    Зазор канала = диапазон изменения / (число экранов+1)
	    текущий номер = приращение канала / зазор
        */
        int d = (1900-1100)/sets.n_screens;
        byte n = ch_raw>1100 ?(ch_raw-1100)/d : 0 ;
        //First panel
        if ( panelN != n) {
          panelN = n;
        }
      } else{ 			 //Rotation switch
        if(flags.chkSwitchOnce) { // once at 1 -> 0
            if (ch_raw > 1200) {
                lflags.last_sw_ch = 1;
            } else { // выключено
                if(lflags.last_sw_ch) lflags.rotatePanel = 1;
                lflags.last_sw_ch = 0;
            }
        } else {
            if (ch_raw > 1500) { // full on
                if (osd_switch_time < millis()){ // переключаем сразу, а при надолго включенном канале переключаем каждые 0.5 сек
                    lflags.rotatePanel = 1;
                    //osd_switch_time = millis() + 500;
                    millis_plus(&osd_switch_time, 500);
                }
            }
        }// once
      }
    }
    if(lflags.rotatePanel == 1){
	lflags.rotatePanel = 0;
        panelN++;
        if (panelN > sets.n_screens)
            panelN = 0;

    }
//  }
  if(old_panel != panelN){
//	readPanelSettings();
	lflags.got_data=1; // redraw even no news
	
	//extern void reset_setup_data();
	reset_setup_data();
	
	static const char msg[] PROGMEM = "Screen 0";

	const char *cp;
	byte *wp;
	for(cp=msg, wp=mav_message;;){
	    byte c=pgm_read_byte(cp++);
	    *wp++ = c;
	    if(c==0) break;
	}
	
	mav_message[sizeof(msg)-2] += panelN;
	
	mav_message_start(sizeof(msg)-1,3); // len, time
  }

}



//------------------ Battery Remaining Picture ----------------------------------

static char setBatteryPic(uint16_t bat_level,byte *bp)
{

    if(bat_level>128) {
	*bp++=0x89; // нижняя полная, работаем с верхней
	bat_level -=128;
    }else {
	bp[1] = 0x8d; // верхняя пустая, работаем с нижней
	if(bat_level <= 17 && lflags.blinker){
	    *bp   = 0x20;
	    bp[1] = 0x20;
	    return 1;	// если совсем мало то пробел вместо батареи - мигаем
	}
    }

#if 0
    // разбиваем участок 0..128 на 5 частей
  if(bat_level <= 26){
    *bp   = 0x8d;
  }
  else if(bat_level <= 51){
    *bp   = 0x8c;
  }
  else if(bat_level <= 77){
    *bp   = 0x8b;
  }
  else if(bat_level <= 103){
    *bp   = 0x8a;
  }
  else 
    *bp   = 0x89;
#else
    byte n = bat_level / 26;
    
    *bp   = 0x8d - n;

#endif

    return 0;
}

//------------------ Home Distance and Direction Calculation ----------------------------------

int NOINLINE grad_to_sect(int grad){
    //return round(grad/360.0 * 16.0)+1; //Convert to int 1-16.
    
    return (grad*16 + 180)/360 + 1; //Convert to int 1-16.
}

static int grad_to_sect_p(int grad){
    //return round(grad/360.0 * 16.0)+1; //Convert to int 1-16.

    while(grad < 0) grad +=360;
    
    return grad_to_sect(grad);
}



float NOINLINE diff_coord(float &c1, float &c2){
    return (c1 - c2) * 111319.5;
}


/*int grad_to_sect(float grad){
    return round(grad/360.0 * 16.0)+1; //Convert to int 1-16.
}*/

static float distance(float x, float y){
    return sqrt(sq(x) + sq(y));
}

static void setHomeVars()
{
    float dstlon, dstlat;
    int bearing;


    if(osd_fix_type!=0) lflags.gps_active=1; // если что-то появилось то запомним что было

#ifdef IS_COPTER
 #ifdef IS_PLANE
    // copter & plane - differ by model_type
    if(sets.model_type == 0){  //plane
	if(osd_throttle > 50 && takeoff_heading == -400) // lock runway direction
	    takeoff_heading = osd_heading;
    }

    if (lflags.motor_armed && !lflags.was_armed ){ // on motors arm 
	lflags.osd_got_home = 0;   			//    reset home: Хуже не будет, если ГПС был а при арме исчез то наф такой ГПС
//	if(osd_fix_type>=3) {					//  if GPS fix OK
//	    en=1;                			         // lock home position
//	}  само сделается через пару строк
        lflags.was_armed = lflags.motor_armed; // only once
    } 


 #else // pure copter
  //Check disarm to arm switching.
  if (lflags.motor_armed && !lflags.was_armed){
    lflags.osd_got_home = 0;	//If motors armed, reset home 
//    if(osd_fix_type>=3) {	//  if GPS fix OK
//        en=1;                   // lock home position
//    } само сделается через пару строк

    lflags.was_armed = lflags.motor_armed; // only once
  }


 #endif
#else // not copter
 #ifdef IS_PLANE

    if(osd_throttle > 10 && takeoff_heading == -400)
	takeoff_heading = osd_heading;

    if (lflags.motor_armed && !lflags.last_armed_status){ // plane can be armed too
	lflags.osd_got_home = 0;	//If motors armed, reset home in Arducopter version
	takeoff_heading = osd_heading;
    }

    lflags.last_armed_status = lflags.motor_armed;
 
 #endif
#endif

    if(!lflags.osd_got_home && osd_fix_type >= 3 ) { // first home lock on GPS 3D fix - ну или если фикс пришел уже после арма
        osd_home = osd_pos; // lat, lon & alt

        //osd_alt_cnt = 0;
        lflags.osd_got_home = 1;
    } else if(lflags.osd_got_home){
        float scaleLongDown = cos(abs(osd_home.lat) * 0.0174532925);

        //DST to Home

//        dstlat = (osd_home.lat - osd_pos.lat) * 111319.5;
//        dstlon = (osd_home.lon - osd_pos.lon) * 111319.5 * scaleLongDown;
        dstlat = diff_coord(osd_home.lat, osd_pos.lat);
        dstlon = diff_coord(osd_home.lon, osd_pos.lon) * scaleLongDown;
        
        //osd_home_distance = sqrt(sq(dstlat) + sq(dstlon));
        osd_home_distance = distance(dstlat, dstlon);
	dst_x=(int)fabs(dstlat);
	dst_y=(int)fabs(dstlon);

        //DIR to Home
        bearing = atan2(dstlat, -dstlon) * 57.295775; //absolute home direction
        
//        if(bearing < 0) bearing += 360;//normalization
        bearing = 90 + bearing - 180 - osd_heading;//absolut return direction  //relative home direction
        while(bearing < 0) bearing += 360;//normalization

        osd_home_direction = grad_to_sect(bearing); 
  }
}

void NOINLINE calc_max(float &dst, float &src){
    if (dst < src) dst = src;

}



//#define USE_FILTER 1 /* +36 bytes :( */

#if defined(USE_FILTER)
void NOINLINE filter( float &dst, float val, const float k){ // комплиментарный фильтр 1/k
    //dst = (val * k) + dst * (1.0 - k); 
    //dst = val * k + dst - dst*k;
    //dst = (val-dst)*k + dst;
    dst+=(val-dst)*k;
}

void inline filter( float &dst, float val){ // комплиментарный фильтр 1/10
    filter(dst,val,0.1);
}
#endif

void NOINLINE float_add(float &dst, float val){
    dst+=val;
}

// вычисление нужных переменных
// накопление статистики и рекордов
void setFdataVars()
{
//    uint16_t time_lapse = (uint16_t)(millis() - runtime); // loop time no more 1000 ms
    uint16_t time_lapse = time_since(&runtime); // loop time no more 1000 ms
    
    //runtime = millis();
    millis_plus(&runtime,0);

  //Moved from panel because warnings also need this var and panClimb could be off
#if defined(USE_FILTER)
    filter(vertical_speed, (osd_climb * get_converth() ) *  60); // комплиментарный фильтр 1/10
#else
    vertical_speed = (osd_climb * get_converth() ) * ( 60 * 0.1) + vertical_speed * 0.9; // комплиментарный фильтр 1/10
    //dst+=(val-dst)*k;
    //vertical_speed += ((osd_climb * get_converth() ) * 60  - vertical_speed) * 0.1; // комплиментарный фильтр 1/10
    //float vs=(osd_climb * get_converth() ) * 60;
    // vertical_speed += (vs  - vertical_speed) * 0.1; // комплиментарный фильтр 1/10
#endif

    if(max_battery_reading < osd_battery_remaining_A) // мы запомним ее еще полной
	max_battery_reading = osd_battery_remaining_A;

#ifdef IS_PLANE
//                              Altitude above ground in meters, expressed as * 1000 (millimeters)
// osd_home_alt = osd_alt_mav*1000 - mavlink_msg_global_position_int_get_relative_alt(&msg.m);

//    osd_alt_to_home = (osd_alt_mav - osd_home_alt/1000.0); // ->  mavlink_msg_global_position_int_get_relative_alt(&msg.m)/1000;

    if (!lflags.in_air  && (int)osd_alt_to_home > 5 && osd_throttle > 10){
	lflags.in_air = 1; // взлетели!
	trip_distance = 0;
    }
#endif

//    float time_1000 = time_lapse / 1000.0; // in seconds
    float time_1000 = f_div1000(time_lapse); // in seconds

    //if (osd_groundspeed > 1.0) trip_distance += (osd_groundspeed * time_lapse / 1000.0);
    if(lflags.osd_got_home && lflags.motor_armed) float_add(trip_distance, osd_groundspeed * time_1000);

    //mah_used += (osd_curr_A * 10.0 * time_lapse / (3600.0 * 1000.0));
    float_add(mah_used, (float)osd_curr_A * time_1000 / (3600.0 / 10.0));

    uint16_t rssi_v = rssi_in;
//    byte ch = sets.RSSI_raw / 2;

//    if(ch == 0) rssi_v = osd_rssi; // mavlink
//    if(ch == 4) rssi_v = chan_raw[7]; // ch 8
//    if(ch == 1 || ch == 2) rssi_v = rssi_in; // analog/pwm input

    if((sets.RSSI_raw % 2 == 0))  {
	uint16_t l=sets.RSSI_16_low, h=sets.RSSI_16_high;
	bool rev=false;

	if(l > h) {
	    l=h;
	    h=sets.RSSI_low;
	    rev=true;
	}

        if(rssi_v < l) rssi_v = l;
        if(rssi_v > h) rssi_v = h;

        rssi = (int16_t)(((float)rssi_v - l)/(h-l)*100.0f);
        //rssi = map(rssi_v, l, h, 0, 100); +200 bytes

        if(rssi > 100) rssi = 100;
        if(rev) rssi=100-rssi;
    } else 
        rssi = rssi_v;


  //Set max data
#ifdef IS_COPTER
 #ifdef IS_PLANE
    if((sets.model_type == 0 && lflags.in_air) || lflags.motor_armed){
 #else
    if (lflags.motor_armed)  {
 #endif
#else
 #ifdef IS_PLANE
  if (lflags.in_air){
 #else
    if(0){
 #endif
#endif

    //total_flight_time_milis += time_lapse;
    long_plus(&total_flight_time_milis, time_lapse);
    
    //if (osd_home_distance > max_home_distance) max_home_distance = osd_home_distance;
    float f=osd_home_distance;
    calc_max(max_home_distance, f);
    f=osd_airspeed;
    calc_max(max_osd_airspeed, f);
    calc_max(max_osd_groundspeed, osd_groundspeed);
    calc_max(max_osd_home_alt, osd_alt_mav);
    calc_max(max_osd_windspeed, osd_windspeed);

    f=osd_curr_A;
    calc_max(max_osd_curr_A, f);
    calc_max(max_osd_climb, osd_climb);
    f=-osd_climb;
    calc_max(min_osd_climb, f);
  }
}



void NOINLINE gps_norm(float &dst, long f){
    dst = f / GPS_MUL;
}


void NOINLINE set_data_got() {
    lastMAVBeat = millis();
    //millis_plus(&lastMAVBeat, 0);

    lflags.got_data = 1;
#ifdef DEBUG
    if(!lflags.input_active){ // first got packet
	max_dly=0;
    }
#endif
    lflags.input_active=1;
}


void NOINLINE delay_byte(){
    if(!Serial.available_S())
        delayMicroseconds((1000000/TELEMETRY_SPEED*10)); //время приема 1 байта
}



// чтение пакетов нужного протокола
static void getData(){
//LED_BLINK;

    bool got=false;

#if defined(USE_MAVLINK)
    if(lflags.mavlink_active){
	read_mavlink();
#else
    if(0){
#endif
#if defined(USE_UAVTALK)
    } else if(lflags.uavtalk_active) {
	extern bool uavtalk_read(void);
	uavtalk_read();
#endif
#if defined(USE_MWII)
    } else if(lflags.mwii_active) {
	extern bool mwii_read(void);
	mwii_read();
#endif
#if defined(USE_LTM)
    } else if(lflags.ltm_active) {
	extern void read_ltm(void);
	read_ltm();
#endif
    } else {
	switch(count05s % 5){
#if defined(AUTOBAUD)
	case 1: {
	    Serial.end();
	    static uint8_t last_pulse = 15; // 57600 by default
	    uint8_t pulse=255;

	    { // isolate PT and SPEED
		uint32_t pt = millis() + 100; // не более 0.1 секунды
	
	        for(byte i=250; i!=0; i--){
	            if(millis()>pt) break; // not too long
	            long t=pulseIn(PD0, 0, 2500); // 2500uS * 250 = 
	            if(t>255) continue;   // too long - not single bit
	            uint8_t tb = t;       // it less than 255 so convert to byte
	            if(tb==0) continue;   // no pulse at all
	            if(tb<pulse) pulse=tb;// find minimal possible - it will be bit time
	        }
	    }
	    
	    long speed;
	    
	    if(pulse == 255)    pulse = last_pulse; // no input at all - use last
	    else                last_pulse = pulse; // remember last correct time
	
	// F_CPU   / BAUD for 115200 is 138
	// 1000000 / BAUD for 115200 is 8.68uS
	//  so I has no idea about pulse times - thease simply measured
	
	    if(     pulse < 11) 	speed = 115200;
	    else if(pulse < 19) 	speed =  57600;
	    else if(pulse < 29) 	speed =  38400;
	    else if(pulse < 40) 	speed =  28800;
	    else if(pulse < 60) 	speed =  19200;
	    else if(pulse < 150)	speed =   9600;
	    else                        speed =   4800;

#ifdef DEBUG
	    OSD::setPanel(3,6);
	    osd.printf_P(PSTR("pulse=%d speed=%ld"),pulse, speed);
#endif
	    Serial.flush();
	    Serial.begin(speed);
	    } break;
#endif    
	
	
#if defined(USE_UAVTALK)
	case 2:
	    extern bool uavtalk_read(void);
	    uavtalk_read();
	    break;
#endif
#if defined(USE_MWII)
	case 3:
	    extern bool mwii_read(void);
	    mwii_read();
	    break;
#endif
#if defined(USE_LTM)
	case 4:
	    extern void read_ltm(void);
	    read_ltm();
	    break;
#endif
	default: // 0 and all not used
#if defined(USE_MAVLINK)
	    read_mavlink();
#endif
	    break;
	}
    }

}

bool NOINLINE timeToScreen(){
    return lflags.update_stat && !vsync_wait;
}