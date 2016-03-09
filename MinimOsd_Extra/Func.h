
extern struct loc_flags lflags;  // все булевые флаги кучей

inline boolean getBit(byte Reg, byte whichBit) {
    return  Reg & (1 << whichBit);
}


// чтение пакетов нужного протокола
void getData(){
#if defined(USE_UAVTALK)
//  слушаем по очереди до первого валидного пакета, по пришествию пакета слушать только подключенный протокол
    if(lflags.mavlink_active || !lflags.uavtalk_active && lflags.blinker){
        read_mavlink();
    } else {
	uavtalk_read();
    }
#else
    read_mavlink();
#endif
}


//------------------ Battery Remaining Picture ----------------------------------

char setBatteryPic(uint16_t bat_level,byte *bp)
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

    return 0;
}

//------------------ Home Distance and Direction Calculation ----------------------------------

int grad_to_sect(int grad){
    return round(grad/360.0 * 16.0)+1; //Convert to int 1-16.
}

/*int grad_to_sect(float grad){
    return round(grad/360.0 * 16.0)+1; //Convert to int 1-16.
}*/

void setHomeVars(OSD &osd)
{
    float dstlon, dstlat;
    int bearing;
    byte en=0;



#ifdef IS_COPTER
 #ifdef IS_PLANE
    // copter & plane - differ by model_type
    switch(sets.model_type){
    case 0: //plane
	if(osd_throttle > 3 && takeoff_heading == -400)
	    takeoff_heading = osd_heading;

	osd_alt_to_home = (osd_alt_rel - osd_home_alt/1000.0);
  
	if(osd_got_home == 0 && osd_fix_type == 3 )
	    en=1;
	break;

    case 1:
        if (lflags.motor_armed && !lflags.last_armed_status){
	//If motors armed, reset home in Arducopter version
	    osd_got_home = 0;
	}

	lflags.last_armed_status = lflags.motor_armed;

	if(osd_got_home == 0 && osd_fix_type > 1 )
	    en=1;
    }
 #else
  //Check disarm to arm switching.
  if (lflags.motor_armed && !lflags.last_armed_status){
    //If motors armed, reset home in Arducopter version
    osd_got_home = 0;
  }

  lflags.last_armed_status = lflags.motor_armed;

  if(osd_got_home == 0 && osd_fix_type > 1 )
    en=1;
 #endif
#else
 #ifdef IS_PLANE
  if(osd_throttle > 3 && takeoff_heading == -400)
    takeoff_heading = osd_heading;

  osd_alt_to_home = (osd_alt_rel - osd_home_alt/1000.0);
  
  if(osd_got_home == 0 && osd_fix_type == 3 )
    en=1;
  
 #endif
#endif

    if(en){
        osd_home_lat = osd_lat;
        osd_home_lon = osd_lon;

        //osd_alt_cnt = 0;
        osd_got_home = 1;
    } else if(osd_got_home == 1){
        double scaleLongDown = cos(abs(osd_home_lat) * 0.0174532925);

        //DST to Home
        dstlat = fabs(osd_home_lat - osd_lat) * 111319.5;
        dstlon = fabs(osd_home_lon - osd_lon) * 111319.5 * scaleLongDown;
        osd_home_distance = sqrt(sq(dstlat) + sq(dstlon));
	dst_x=(int)dstlat;
	dst_y=(int)dstlon;

        //DIR to Home
        dstlon = (osd_home_lon - osd_lon); //OffSet_X
        dstlat = (osd_home_lat - osd_lat) / scaleLongDown; //OffSet Y
        
        bearing = 90 + (atan2(dstlat, -dstlon) * 57.295775); //absolut home direction
        
        if(bearing < 0) bearing += 360;//normalization
        bearing = bearing - 180 - osd_heading;//absolut return direction  //relative home direction
        if(bearing < 0) bearing += 360;//normalization

        osd_home_direction = grad_to_sect(bearing);//array of arrows =)
  }
}

// вычисление нужных переменных
// накопление статистики и рекордов
void setFdataVars()
{
  //Moved from panel because warnings also need this var and panClimb could be off
  vs = (osd_climb * pgm_read_float(&measure->converth) * 60) * 0.1 + vs * 0.9; // комплиментарный фильтр 1/10

  if(max_battery_reading < osd_battery_remaining_A) // мы запомним ее еще полной
	max_battery_reading = osd_battery_remaining_A;

  unsigned long time_lapse = millis() - runt;
  runt = millis();


  if (lflags.takeofftime == 0 && osd_alt_to_home > 5 && osd_throttle > 10){
    lflags.takeofftime = 1;
    tdistance = 0;
  }


    if (osd_groundspeed > 1.0) tdistance += (osd_groundspeed * time_lapse / 1000.0);

    mah_used += (osd_curr_A * 10.0 * time_lapse / 3600000.0);


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

        if(rssi > 100) rssi = 100;
        if(rev) rssi=100-rssi;
    } else 
        rssi = rssi_v;


  //Set max data
#ifdef IS_COPTER
 #ifdef IS_PLANE
    if(sets.model_type == 0 && lflags.takeofftime == 1 || lflags.motor_armed){
 #else
    if (lflags.motor_armed)  {
 #endif
#else
 #ifdef IS_PLANE
  if (lflags.takeofftime == 1){
 #else
    if(0){
 #endif
#endif

    total_flight_time_milis += time_lapse;
//    total_flight_time_seconds = total_flight_time_milis / 1000;
    if (osd_home_distance > max_home_distance) max_home_distance = osd_home_distance;
    if (osd_airspeed > max_osd_airspeed) max_osd_airspeed = osd_airspeed;
    if (osd_groundspeed > max_osd_groundspeed) max_osd_groundspeed = osd_groundspeed;
    if (osd_alt_rel > max_osd_home_alt) max_osd_home_alt = osd_alt_rel;
    if (osd_windspeed > max_osd_windspeed) max_osd_windspeed = osd_windspeed;
  }
}


void pan_toggle(){
    byte old_panel=panelN;

    uint16_t ch_raw;

    if(sets.ch_toggle == 1) 
	ch_raw = PWM_IN;	// 1 - используем внешний PWM для переключения экранов
    else if(sets.ch_toggle >= 5 && sets.ch_toggle <= 8)
	ch_raw = chan_raw[sets.ch_toggle-1];
    else 
        ch_raw = chan_raw[7];


/* no more autoswitch - warnings always on

  //If there is a warning but warnings disabled force switch to panel 0
  if(lflags.canswitch == 0 && !is_on(panel.warn)){ 
    if(panelN != sets.auto_screen_switch){
      lflags.osd_clear = 1;
    }
    panelN = sets.auto_screen_switch; 

  }  else{
    //Flight mode switching
*/

//	автоматическое управление OSD  (если режим не RTL или CIRCLE) смена режима туда-сюда переключает экран
    if (sets.ch_toggle == 4){
      if ((osd_mode != 6) && (osd_mode != 7)){
        if (osd_off_switch != osd_mode){ 
            osd_off_switch = osd_mode;
            osd_switch_time = millis();
            if (osd_off_switch == osd_switch_last){
              lflags.rotatePanel = 1;
            }
        }
        if ((millis() - osd_switch_time) > 2000){
          osd_switch_last = osd_mode;
        }
      }
    }
    else  {
      if (sets.switch_mode == 0){  //Switch mode by value
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
        if (ch_raw > 1200) {
/*
    	    if(!lflags.sw_state) {// last state is off
        	lflags.mode_switch=1; // установим флаг включения
        	
    	    }
    	    
            if (osd_switch_time < millis()){ // при надолго включенном канале переключаем каждые 0.5 сек
                lflags.rotatePanel = 1;
                osd_switch_time = millis() + 500;
                
                lflags.mode_switch=0; // больше не надо переключать
            }
            lflags.sw_state=1; // состояние
        } else { // выключено
    	    if(lflags.mode_switch){ // кратковременное переключение
    		lflags.mode_switch=0;
                lflags.rotatePanel = 1;
    	    }
            lflags.sw_state=0;
        }
*/
            if (osd_switch_time < millis()){ // переключаем сразу, а при надолго включенном канале переключаем каждые 0.5 сек
                lflags.rotatePanel = 1;
                osd_switch_time = millis() + 500;
            }
        } else { // выключено
/*    	    if(lflags.mode_switch){ // кратковременное переключение
    		lflags.mode_switch=0;
                lflags.rotatePanel = 1;
    	    }
            lflags.sw_state=0;
*/
        }

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
        lflags.osd_clear = 1;
    
	readPanelSettings();
	lflags.got_data=1; // redraw even no news
  }
  
  
    //If there is a panel switch or a change in base panel then clear osd
    if ((lflags.osd_clear == 1) || (currentAutoPanel != 0)){
//      osd.clear();
      lflags.osd_clear = 0;
      currentAutoPanel = 0;
    }
}
