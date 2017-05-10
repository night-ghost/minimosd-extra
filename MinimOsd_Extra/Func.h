#pragma once

extern struct loc_flags lflags;  // все булевые флаги кучей


static boolean inline is_on(point p){
    return p.y < 0x80;
}

static boolean inline has_sign(point p){
    return !(p.x & 0x80);
}


static boolean inline is_alt(point p){
    return (p.y & 0x40);
}

static point inline do_alt(point p){
    p.y |= 0x40;
    return p;
}

static boolean inline is_alt2(point p){
    return (p.y & 0x20);
}

static boolean inline is_alt3(point p){
    return (p.y & 0x10);
}

static boolean inline is_alt4(point p){
    return (p.x & 0x40);
}

byte get_alt_num(point p){
    return (is_alt2(p)?1:0) | (is_alt3(p)?2:0) | (is_alt4(p)?4:0);
}


byte get_alt_filter(point p){
    switch( (is_alt(p)?1:0) | (is_alt2(p)?2:0)) {
    
    case 1:
	return 10;
    case 2:
	return 30;
    case 3:
	return 100;
    default: 
	return 0;
    }
}

static inline void readSettings() {
//    eeprom_read_len((byte *)&flags, EEPROM_offs(flags), sizeof(Flags) );
    eeprom_read_len((byte *)&sets,  EEPROM_offs(sets),  sizeof(Settings) );

// сразу настроим системы измерения
    measure = FLAGS.measure ? &imper :  &metr;

}


// rean one point from current screen
point NOINLINE readPanel(byte n) {
    point p; //                     shift to current screen     selected point
    eeprom_read_len((byte *)&p,  OffsetBITpanel * (int)panelN + n * sizeof(Point),  sizeof(Point) );
    return p;
}

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

int NOINLINE normalize_angle(int a){
    if(a<0)   a+=360;
    if(a>360) a-=360;
    return a;
}

uint16_t NOINLINE time_since(uint32_t *t){
    return (uint16_t)(millis() - *t); // loop time no more 1000 ms

}

static void inline reset_setup_data(){ // called on any screen change
    memset((byte *)chan_raw_middle, 0, sizeof(chan_raw_middle)); // clear channels middle
}



byte get_switch_time(byte n){
    uint16_t val = sets.autoswitch_times;
    while(true){
       if(n-- == 0) return val & 0xf;
       
       val = val >> 4;
    }
}

point NOINLINE readPanel(byte n);

void doScreenSwitch(){
	lflags.got_data=1; // redraw even no news
	
	reset_setup_data(); // clear channels middle values
	
	union {
	    point p;
	    uint16_t i;
	} upi;
	
	upi.p = readPanel(0); // read flags for new screen
	screen_flags = upi.i;
//	screen_flags = (upi.i & 0xff)<<8 | (upi.i>>8) ;
//DBG_PRINTF("screen flags %x\n", screen_flags);

}

#if HARDWARE_TYPE > 0
#define USE_AUTOSWITCH 1
#endif

static void pan_toggle(){
    byte old_panel=panelN;
    
    static uint16_t ch_min=1100;
    static uint16_t ch_max=1900;
    

    uint16_t ch_raw;

    if(sets.ch_toggle <= 2) // disabled
	return;
#ifdef PWM_PIN
    else if(sets.ch_toggle == 3) 
	ch_raw = PWM_IN;	// 1 - используем внешний PWM для переключения экранов
#endif
    else if(sets.ch_toggle >= 5 && sets.ch_toggle <= 8)
	ch_raw = chan_raw[sets.ch_toggle-1];
    else 
        ch_raw = chan_raw[7]; // в случае мусора - канал 8

    if(ch_raw < 800 || ch_raw > 3000) return; // not in valid range - no switch

// autoscale
    if(ch_raw < ch_min) ch_min = ch_raw;
    if(ch_raw > ch_max) ch_max = ch_raw;

//	автоматическое управление OSD  (если режим не RTL или CIRCLE) смена режима туда-сюда переключает экран
    if (sets.ch_toggle == 4){
      if ((osd_mode != 6) && (osd_mode != 7)){
        if (osd_off_switch != osd_mode){
            osd_off_switch = osd_mode;
            millis_plus(&osd_switch_time,0); //osd_switch_time = millis();
            if (osd_off_switch == osd_switch_last){
              lflags.rotatePanel = 1;
            }
        }
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
        int d = (ch_max-ch_min)/sets.n_screens;
        byte n = ch_raw>ch_min ?(ch_raw-ch_min)/d : 0 ;
        //First panel
        if ( panelN != n) {
          panelN = n;
        }
      } else{ 			 //Rotation switch
        byte ch_on=0;
//* // allows to comment out all "by 200" code
        if(FLAGS.chkSwitch200) {
/*
    	    if(last_chan_raw)
        	ch_on = (ch_raw - last_chan_raw) > 200;
            last_chan_raw = ch_raw;
*/
//[[ @MM
          // Switch changed from its last position
          if (abs (ch_raw - ch_raw_prev1) > 200) {
            // but is the same than 2 positions ago
            if (abs (ch_raw - ch_raw_prev2) < 200) {
              // and it's been less than 1 sec since the position switch and back
              if ( time_since(&osd_switch_time) > 1000){ // if (osd_switch_time + 1000 > millis()) {
                // then rotate
                lflags.rotatePanel = 1;
              }
              // stop continuous rotation, forcing a switch flip to restart the process
              // or if the flip didn't happen because it happened too slowly, reset too.
              ch_raw_prev2 = 0;
            } else {
              millis_plus(&osd_switch_time,0); //osd_switch_time = millis();
              // If position changed and is different from what it was 2 positions ago
              // record the new state
              ch_raw_prev2 = ch_raw_prev1;
              ch_raw_prev1 = ch_raw;
            }
         }
//]] @MM

        } else
//*/
            ch_on = (ch_raw > (ch_min+ch_max)/2);

        if(FLAGS.chkSwitchOnce) { // once at 1 -> 0
            if (ch_on) { // in HIGH range
                lflags.last_sw_ch = 1;
            } else { // выключено
                if(lflags.last_sw_ch) lflags.rotatePanel = 1;
                lflags.last_sw_ch = 0;
            }
        } else {
            if (ch_on) { // full on and valid
                if (osd_switch_time < millis()){ // переключаем сразу, а при надолго включенном канале переключаем каждые 0.5 сек
                    lflags.rotatePanel = 1;
                    //osd_switch_time = millis() + 500;
                    millis_plus(&osd_switch_time, 500);
                }
            }
        }// once
      }
    }
    if(lflags.rotatePanel){
next_panel:
	lflags.rotatePanel = 0;
        panelN++;
        if (panelN > sets.n_screens)
            panelN = 0;

    }
#ifdef USE_AUTOSWITCH
        else {
            if(FLAGS.AutoScreenSwitch && autoswitch_time && autoswitch_time<seconds) { // автопереключение активно и время вышло
//DBG_PRINTLN("switch by AutoSwitch");
               lflags.autosw=1; // авторежим
               lflags.rotatePanel=1; // переключить
            }
    }
#endif

    if(old_panel != panelN){
//DBG_PRINTF("switch from %d to %d\n",old_panel, panelN);

	doScreenSwitch();

#ifdef USE_AUTOSWITCH
       if(FLAGS.AutoScreenSwitch && lflags.autosw && sets.n_screens>0 && panelN == sets.n_screens) 
           goto next_panel;  // при автопереключении пропускаем пустой экран
       
       byte swt = get_switch_time(panelN);
//DBG_PRINTF("autoswitch time=%d N=%d\n", swt, panelN);
       if(swt) { // установлено время переключения
           autoswitch_time = seconds + swt; // следующее
//         if(autoswitch_time < seconds) { // overflow    
//         }
       } else {        // no autoswitch
           if(lflags.autosw) goto next_panel;  // при автопереключении пропускаем  экраны без автопереключения
           autoswitch_time=0; // при ручном переключении отменить автомат
       }
       
#endif

	if(!lflags.autosw) {
	    static const char msgs[] PROGMEM = "Screen 0";

	    // strcpy_P((char *)mav_message,msg); 10 bytes more
	    const char *cp;
	    byte *wp;
	    for(cp=msgs, wp=mav_message;;){
	        byte c=pgm_read_byte(cp++);
	        *wp++ = c;
	        if(c==0) break;
	    }
	
	    mav_message[sizeof(msgs)-2] += panelN;
	
	    mav_message_start(sizeof(msgs)-1,3); // len, time
	}

       lflags.autosw=0; // once

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


static float NOINLINE diff_coord(float &c1, float &c2){
    return (c1 - c2) * 111319.5;
}


static float /* NOINLINE */ distance(float x, float y){
    return sqrt(sq(x) + sq(y));
}

static void setHomeVars()
{
    float dstlon, dstlat;


    if(osd_fix_type!=0) lflags.gps_active=1; // если что-то появилось то запомним что было

#ifdef IS_COPTER
 #ifdef IS_PLANE
 
#if defined(USE_NMEA) // no arming

    if(osd_fix_type >= 3 && osd_satellites_visible >=6)
        lflags.motor_armed=true;

#else
 
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
        total_flight_time_milis=0; // reset on arm
    } 

    if (!lflags.motor_armed && lflags.was_armed ){ // on motors disarm 

        if(lflags.resetHome) {
            lflags.osd_got_home = 0;	//If motors armed, reset home 
            lflags.was_armed = false;   // and clear armed flag
        }
    }
#endif
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
        lflags.osd_got_home = 1;
        home_alt_mav=osd_alt_mav; // store this altitude too
    } 
    
    if(lflags.osd_got_home){
	{
            float scaleLongDown = cos(abs(osd_home.lat) * 0.0174532925);
            //DST to Home
            dstlat = diff_coord(osd_home.lat, osd_pos.lat);
            dstlon = diff_coord(osd_home.lon, osd_pos.lon) * scaleLongDown;
        }

        osd_home_distance = distance(dstlat, dstlon);
	dst_x=(int)fabs(dstlat); 		// prepare for RADAR
	dst_y=(int)fabs(dstlon);

        { //DIR to Home
            int bearing;

            bearing = atan2(dstlat, -dstlon) * 57.295775; //absolute home direction
        
    //        bearing += ;//absolut return direction  //relative home direction
            bearing=normalize_angle(90 + bearing - 180 - osd_heading);

            osd_home_direction = grad_to_sect(bearing); 
        }
  }
}

void NOINLINE calc_max(float &dst, float src){
    if (dst < src) dst = src;

}



#define USE_FILTER 1 

#if defined(USE_FILTER)
void NOINLINE filter( float &dst, float val, const byte k){ // комплиментарный фильтр 1/k
    if(dst==0 || k==0 || k==1) dst=val;
    else
        //dst = (val * k) + dst * (1.0 - k); 
        //dst = val * k + dst - dst*k;
        //dst = (val-dst)*k + dst;
        dst+=(val-dst)/k;
}

void filter( float &dst, float val){ // комплиментарный фильтр 1/10
    filter(dst,val,10);
}
#endif

void NOINLINE float_add(float &dst, float val){
    dst+=val;
}

// вычисление нужных переменных
// накопление статистики и рекордов
void setFdataVars()
{
    float time_1000; 


    uint16_t time_lapse = time_since(&runtime); // loop time no more 1000 ms
    //runtime = millis();
    millis_plus(&runtime,0);

    time_1000 = f_div1000(time_lapse); // in seconds


#if defined(USE_FILTER)
                          // voltage in mV, current in 10mA
        filter(power, (osd_vbat_A / (1000 * 100.0) * osd_curr_A )); // комплиментарный фильтр 1/10
#else
	{
            float pow= (osd_vbat_A / (1000 * 100.0) * osd_curr_A );
            power += (pow - power) * 0.1; // комплиментарный фильтр 1/10
        }
#endif


    //Moved from panel because warnings also need this var and panClimb could be off
#if defined(USE_FILTER)
        filter(vertical_speed, (osd_climb * get_converth() ) *  60, climb_filter); // комплиментарный фильтр 1/10..100
#else
	{
            float speed_raw= (osd_climb * get_converth() ) *  60;
            vertical_speed += (speed_raw - vertical_speed) * 0.1; // комплиментарный фильтр 1/10
        }
#endif

        if(max_battery_reading < osd_battery_remaining_A) // мы запомним ее еще полной
            max_battery_reading = osd_battery_remaining_A;

#ifdef IS_PLANE
//                              Altitude above ground in meters, expressed as * 1000 (millimeters)
    if (sets.model_type == 0  /* plane */ && !lflags.in_air  && (int)osd_alt_to_home > 5 && osd_throttle > 30){
	lflags.in_air = 1; // взлетели!
	trip_distance = 0;
    }
#endif


#if !defined USE_UAVTALK
    float_add(mah_used, (float)osd_curr_A * time_1000 / (3600.0 / 10.0));
#endif

    { // isolate RSSI calc
        int16_t rssi_v = rssi_in;

        if((sets.RSSI_raw % 2 == 0))  {
            int16_t l=sets.RSSI_16_low, h=sets.RSSI_16_high;
            bool rev=false;

            if(l > h) {
                l=h;
                h=sets.RSSI_16_low;
                rev=true;
            }

            if(rssi_v < l) rssi_v = l;
            if(rssi_v > h) rssi_v = h; // all rssi values is limited to 4096 so we can multiply it only by 16
            
            uint16_t diap = h-l;
            uint16_t val  = rssi_v - l;
            rssi_v = (int16_t)(((float)val)/diap*100.0f);
            //rssi = map(rssi_v, l, h, 0, 100); +200 bytes

            if(rssi_v > 100) rssi_v = 100;
            if(rssi_v < 0)   rssi_v = 0;
            
            if(rev) rssi_v=100-rssi_v;
            rssi_norm=rssi_v;
        } else 
            rssi_norm = rssi_v;
    }

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
    if(0){ // neither copter nor plane
 #endif
#endif

    long_plus(&total_flight_time_milis, time_lapse);


    //if (osd_groundspeed > 1.0) trip_distance += (osd_groundspeed * time_lapse / 1000.0);
    if(lflags.osd_got_home) 
        float_add(trip_distance, osd_groundspeed * time_1000);
    
    //if (osd_home_distance > max_home_distance) max_home_distance = osd_home_distance;
    float f=osd_home_distance;
    calc_max(max_home_distance, f);
    calc_max(max_osd_airspeed, osd_airspeed);
    calc_max(max_osd_groundspeed, osd_groundspeed);
    calc_max(max_osd_home_alt, osd_alt_mav);
    calc_max(max_osd_windspeed, osd_windspeed);
    calc_max(max_osd_power, power);

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
    lastMavSeconds=seconds;

    lflags.got_data = 1;
#ifdef DEBUG
    if(!lflags.input_active){ // first got packet
	max_dly=0;
    }
#endif
    lflags.input_active=1;
}




// чтение пакетов нужного протокола
static void getData(){
//LED_BLINK;

//    bool got=false;

again:
    if(lflags.input_active || lflags.data_mode || lflags.blinker) {

#if defined(USE_MAVLINK)
	read_mavlink();
#elif defined(USE_UAVTALK)
	extern bool uavtalk_read(void);
	uavtalk_read();
#elif defined(USE_MWII)
	extern bool mwii_read(void);
	mwii_read();
#elif defined(USE_LTM)
	extern void read_ltm(void);
	read_ltm();
#elif defined(USE_NMEA)
	extern void read_NMEA(void);
	read_NMEA();
#else
#warning "No data protocol defined, compiling for MAVlink"
#endif

	lflags.data_mode=lflags.input_active; // if not received any then flag clears

    } else {

	memset( &msg.bytes[0], 0, sizeof(msg.bytes)); // clear packet buffer to initial state
    
#if defined(AUTOBAUD)
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
	
	if(pulse == 255)    pulse = last_pulse; // no input at all - use last
	else                last_pulse = pulse; // remember last correct time
	
	// F_CPU   / BAUD for 115200 is 138
	// 1000000 / BAUD for 115200 is 8.68uS
	//  so I has no idea about pulse times - thease simply measured

	byte rate;
	byte sp;
	if(     pulse < 11) 	{ sp = 24; rate = 2;  }  // *4 /2
	else if(pulse < 19) 	{ sp = 12; rate = 4;  }  // *4 /4
	else if(pulse < 29) 	{ sp =  8; rate = 6;  }  // *4 /6
	else if(pulse < 40) 	{ sp =  6; rate = 8;  }
	else if(pulse < 60) 	{ sp =  4; rate = 16; }
	else if(pulse < 150)	{ sp =  2; rate = 32; }
	else                    { sp =  1; rate = 64; }

	long speed = sp*4800L;

	stream_rate = rate;
#ifdef DEBUG
	OSD::setPanel(3,2);
	osd.printf_P(PSTR("pulse=%d sp=%d speed=%ld"),pulse, sp, speed);
#endif
	serial_speed=speed; // store detected port speed for show
	Serial.flush();	// clear serial buffer from garbage
	Serial.begin(speed);
#endif    
	
	lflags.data_mode=true; // пробуем почитать данные
	goto again;
    }

}

bool NOINLINE timeToScreen(){ // we should renew screen 
    return lflags.need_redraw && !vsync_wait;
}

#if defined(DEBUG)
inline uint16_t freeRam () {
  extern uint16_t __heap_start, *__brkval; 
  byte v; 
  return (uint16_t) &v - (__brkval == 0 ? (uint16_t) &__heap_start : (uint16_t) __brkval); 
}
#endif

#if !defined(SLAVE_BUILD)

// трансляция PWM на внешний вывод если заданы источник и приемник
#define SET_LOW()   *PWM_out_port &= ~PWM_out_bit
#define SET_HIGH()  *PWM_out_port |=  PWM_out_bit

#if defined PWM_BY_INTERRUPT

void generate_PWM(bool nointerrupt) {
    if(!PWM_out_bit) return;
    
    uint16_t pwm=chan_raw[sets.pwm_src-1 + 5];

    OCR1A = pwm * 2; // 0.5ms tick

    TCCR1A =
       (0 << WGM10) |
       (0 << WGM11) |
       (0 << COM1A1) |
       (0 << COM1A0) | // no active pin om compare-match
       (0 << COM1B1) |
       (0 << COM1B0);

    TCCR1B =
        (0 << ICNC1)| // Input capture noise canceler
        (0 << ICES1)| // Input capture edge select
        (0 << CS10) | // Prescale 8 - 2MHz frequency
        (1 << CS11) | // Prescale 8
        (0 << CS12) | // Prescale 8
        (0 << WGM13)|
        (1 << WGM12); // CTC mode (Clear timer on compare match) with OCR1A as top

    // Not used in this case:
    TCCR1C =
        (0 << FOC1A)| // No force output compare (A)
        (0 << FOC1B); // No force output compare (B)

    TIFR1  = (1 << OCF1A);     // clear interrupt flag
    TIMSK1 = (1 << OCIE1A);     // enable Interrupt on compare A

}

ISR(TIMER1_COMPA_vect){
    static boolean state = false;

    if(state) {  // turn off
        SET_LOW();
        state = false;
        TIMSK1=0; // disable timer interrupts
    } else { 
        SET_HIGH();
        state = true;
    }
}
#else
void generate_PWM(bool nointerrupt) {
    if(PWM_out_bit) { 
	int pwm=chan_raw[sets.pwm_src-1 + 5];
	
//#define OUT_PORT(val) if (val == LOW) { *out &= ~bit; } else { *out |= bit; }
#define SET_LOW()   *PWM_out_port &= ~PWM_out_bit
#define SET_HIGH()  *PWM_out_port |=  PWM_out_bit

#if !defined(PWM_IN_INTERRUPT)
	byte tmp=SREG;

	if(nointerrupt)
	    noInterrupts();		// pulse widh disabled interrups for accuracy but we lose MAVlink bytes
#endif
        switch(sets.pwm_mode){
        case 0: // pwm 
            SET_HIGH(); 		//digitalWrite(PWM_out_pin,1);
            delayMicroseconds(pwm);
            SET_LOW();		//digitalWrite(PWM_out_pin,0);
            break;
        case 1: // on-off
            if(pwm > 1500)
                SET_HIGH(); 		//digitalWrite(PWM_out_pin,1);
            else
                SET_LOW();		//digitalWrite(PWM_out_pin,0);
            break;
        case 2: // off-on
            if(pwm < 1500)
                SET_HIGH(); 		//digitalWrite(PWM_out_pin,1);
            else
                SET_LOW();		//digitalWrite(PWM_out_pin,0);
            break;
        }
#if !defined(PWM_IN_INTERRUPT)
	SREG=tmp; //	if(nointerrupt)    interrupts();
#endif
    }
}


#endif // PWM_BY_INTERRUPT

#endif // SLAVE_BUILD

void delay_150(){
    delay(150);
}

static void NOINLINE osd_printf_2(PGM_P fmt, float f, byte c){
    osd.printf_P(fmt, f);
    if(c) OSD::write_S(c);
}

static void NOINLINE osd_printf_1(PGM_P fmt, float f){
    osd_printf_2(fmt, f, 0);
}

static void NOINLINE osd_printi_1(PGM_P fmt, int f){
    osd.printf_P(fmt, f);
}

static void NOINLINE osd_printi_2(PGM_P fmt, uint16_t i1, uint16_t i2){
    osd.printf_P(fmt,i1,i2);
}

NOINLINE void logo(){
    OSD::setPanel(2, 5);
    osd_print_S(PSTR("MinimOSD-Extra " PROTOCOL " " VERSION "\xff" OSD_MODEL " r" TO_STRING(RELEASE_NUM) " DV\xff"));

    osd.print((uint16_t)millis());

    // Check EEPROM to see if we have initialized it already or not
    // also checks if we have new version that needs EEPROM reset

    if(lflags.bad_config) {
        OSD::setPanel(1,1);
        osd_printi_1(PSTR("Bad Config: %d my " TO_STRING(VER) ), sets.CHK1_VERSION); 
    }

    OSD::update();// Show sign bar
    delay_150();
}

