/*
    NMEA parsing, based on GPS.ino from ScarabOSD


*/

// NMEA protocol GGA and RMC sentences parsed


  #define GPS_FILTER_VECTOR_LENGTH 5

/*
  static float GPS_scaleLonDown; // this is used to offset the shrinking longitude as we go towards the poles
  // moving average filter variables
 
  static uint8_t GPS_filter_index = 0;
  static int32_t GPS_filter[2][GPS_FILTER_VECTOR_LENGTH];
  static int32_t GPS_filter_sum[2];
  static int32_t GPS_read[2];
  static int32_t GPS_filtered[2];
  static int32_t GPS_degree[2];    //the lat lon degree without any decimals (lat/10 000 000)
  static uint16_t fraction3[2];
*/

#define MINSATFIX 6


////////////////////////////////////////////////////////////////////////////////////
// Utilities
//


#define DIGIT_TO_VAL(_x)        (_x - '0')
uint32_t GPS_coord_to_degrees(char* s) {
  char *p, *q;
  uint8_t deg = 0, min = 0;
  unsigned int frac_min = 0;
  uint8_t i;

  // scan for decimal point or end of field
  for (p = s; isdigit(*p); p++) ;
  q = s;

  // convert degrees
  while ((p - q) > 2) {
    if (deg)
      deg *= 10;
    deg += DIGIT_TO_VAL(*q++);
  }
  // convert minutes
  while (p > q) {
    if (min)
      min *= 10;
    min += DIGIT_TO_VAL(*q++);
  }
  // convert fractional minutes
  // expect up to four (five) digits, result is in
  // ten-thousandths of a minute
  if (*p == '.') {
    q = p + 1;
    for (i = 0; i < 5; i++) {
      frac_min *= 10;
      if (isdigit(*q))
        frac_min += *q++ - '0';
    }
  }
  return deg * 10000000UL + (min * 10000000UL + frac_min*100UL) / 60;
}

// helper functions 
uint16_t grab_fields(char* src, uint8_t mult) {  // convert string to uint16
  uint8_t i;
  uint16_t tmp = 0;

  for(i=0; src[i]!=0; i++) {
    if(src[i] == '.') {
      i++;
      if(mult==0)   break;
      else  src[i+mult] = 0;
    }
    tmp *= 10;
    if(src[i] >='0' && src[i] <='9') tmp += src[i]-'0';
  }
  return tmp;
}

uint8_t hex_c(uint8_t n) {    // convert '0'..'9','A'..'F' to 0..15
  n -= '0';
  if(n>9)  n -= 7;
  n &= 0x0F;
  return n;
} 


// Parse a (potentially negative) number with up to 2 decimal digits -xxxx.yy
int32_t parseDecimal(const char *term)
{
  bool negative = *term == '-';
  if (negative) ++term;
  
  int32_t ret = 100 * (int32_t)atol(term);
  
  while (isdigit(*term)) ++term;
  if (*term == '.' && isdigit(term[1]))
  {
    ret += 10 * (term[1] - '0');
    if (isdigit(term[2]))
      ret += term[2] - '0';
  }
  return negative ? -ret : ret;
}


int32_t parseTime(const char *term)
{
  
  int32_t ret = (int32_t)atol(term);
  
  uint8_t h = ret / 10000;
  ret -= h*10000;
  uint8_t m=ret/100;
  ret-= m*100;
  
  return h * 3600 + m*60 + ret;  // time in seconds
}


#define FRAME_GGA  1
#define FRAME_RMC  2
  
bool parse_NMEA_char(char c, char *string) {
    uint8_t frameOK = 0;

    static uint8_t param = 0, offset = 0, parity = 0;
    static uint8_t checksum_param, frame = 0;
  
    switch(c){
    case '$':
        param = 0;      // start
        offset = 0; 
        parity = 0; 
        frame=0;    // no frame
        break;
        
    case ',':
    case '*':
        string[offset] = 0;

        switch(param) { // words in sentence
        case 0:    //frame identification
            frame = 0;
            if (string[0] == 'G' && string[2] == 'G' && string[3] == 'G' && string[4] == 'A') frame = FRAME_GGA;
            if (string[0] == 'G' && string[2] == 'R' && string[3] == 'M' && string[4] == 'C') frame = FRAME_RMC;
            break;

/*
 $GPGGA,123519,4807.038,N,01131.000,E,1,08,0.9,545.4,M,46.9,M,,*47

где:

0  GGA – NMEA Заговолок
1  123519 –UTC время 12:35:19
2 3  4807.038, N – Широта, 48 градусов 7.038 минуты северной широты
4 5  01131.000, Е – Долгота, 11 градусов 31.000 минуты восточной долготы
6   - тип решение
    0 – нет решения,
    1 – StandAlone,
    2 – DGPS,
    3 – PPS,
    4 – фиксированный RTK,
    5 – не фиксированный RTK,
    6 – использование данных инерциальных систем,
    7 – ручной режим,
    8 – режим симуляции
7  08 – количество используемых спутников
8  0.9 – геометрический фактор, HDOP
9 10  545.4, М – высота над уровнем моря в метрах
11 12  46.9, М – высота геоида над эллипсоидом WGS 84
13  [пустое поле] – время прошедшее с момента получения последней DGPS поправки. Заполняется при активизации DGPS режима
14  [пустое поле] – идентификационный номер базовой станции. Заполняется при активизации DGPS режима. 


$GPRMC,123519,A,4807.038,N,01131.000,E,022.4,084.4,230394,003.1,W*6A

где:

0    RMC – NMEA заголовок
1    123419 – UTC время, 12:34:59
2    А – статус (А- активный, V- игнорировать)
3 4    4807.038,N – Широта, 48 градусов 07.038 минут северной широты
5 6    01131.000,Е – Долгота, 11 градусов 31.000 минута восточной долготы
7    022.4 – Скорость, в узлах
8    084.4 – Направление движения, в градусах
9    230394 – Дата, 23 марта 1994 года
10    003.1,W – Магнитные вариации

          Time         Lat         N/S         Lon          E/W          Fix     #Sat    Hdop      Alt     Unit    Geoid  Unit  ...  *CS
 ---0--|----1-------|----2------|----3------|----4-------|----5-------|----6---|---7---|---8----|--9-----|--10---|-11----|12-|13|-14--|-
 $GPGGA, 123519     , 4807.038  , N / S     , 01131.000  , E / W      , 1      , 08    , 0.9    , 545.4  , M     , 46.9  , M ,  , *47
 $GPGGA, 002153.000 , 3342.6618 , S / N     , 11751.3858 , W / W      , 1      , 10    , 1.2    , 27.0   , M     , -34.2 , M ,  , 0000 *5E
 -- 0 -|--- 1 ------|--- 2 -----|--- 3 -----|--- 4 ------|--- 5 ------|--- 6 --|-- 7 --|-- 8 ---|--9-----|--10---|-11----|12-|13|-14--|-
 $GPRMC, 123519     , A         , 4807.038  , S / N      , 01131.000  , E / W  , 022.4 , 084.4  , 230394 , 003.1 , W *6A
 $GPRMC, 161229.487 , A         , 3723.2475 , N / S      , 12158.3416 , W / E  , 0.13  , 309.62 , 120598 ,       , *10
 ---0--|----1-------|----2------|----3------|----4-------|----5-------|----6---|---7---|---8----|--9-----|--10---|-11----|12-|13|-14--|-
          Time         Status      Lat         N/S          Lon          E/W     Speed   Course    Date     M.V  ...  *CS

store to msg.nmea.lat

*/
        case 1:
            if (frame !=0 ) { // time at 1st pos
                msg.nmea.time= parseTime(string);
            }
            break;
            
        case 2:    
            if (frame == FRAME_GGA) {msg.nmea.lat = GPS_coord_to_degrees(string);}
            break;
            
        case 3:
            if (frame == FRAME_GGA && string[0] == 'S') msg.nmea.lat = -msg.nmea.lat;
            if (frame == FRAME_RMC) {msg.nmea.lat = GPS_coord_to_degrees(string);}
            break;

        case 4:
            if (frame == FRAME_GGA) {msg.nmea.lon = GPS_coord_to_degrees(string);}
            if (frame == FRAME_RMC  && string[0] == 'S') msg.nmea.lat = -msg.nmea.lat;
            break;

        case 5:
            if (frame == FRAME_GGA && string[0] == 'W') msg.nmea.lon = -msg.nmea.lon;
            if (frame == FRAME_RMC) {msg.nmea.lon = GPS_coord_to_degrees(string);}
            break;

        case 6:
            if (frame == FRAME_GGA) {  msg.nmea.fix = (string[0] - '0');         }
            if (frame == FRAME_RMC && string[0] == 'W') msg.nmea.lon = -msg.nmea.lon;
            break;

        case 7:
            if (frame == FRAME_GGA) {msg.nmea.sats = grab_fields(string,0);}
            if (frame == FRAME_RMC) {msg.nmea.speed = ((uint32_t)grab_fields(string,1)*5144L)/1000L;}  //gps speed in cm/s will be used for navigation
            break;
            

        case 8:
            if (frame == FRAME_GGA) {msg.nmea.hdop  = grab_fields(string,1);}
            if (frame == FRAME_RMC) {msg.nmea.course = grab_fields(string, 0); }                 //ground course deg
            break;

        case 9:
            if (frame == FRAME_GGA) {msg.nmea.alt = grab_fields(string,1);}  // altitude in meters added by Mis
            if (frame == FRAME_RMC) {msg.nmea.date = grab_fields(string,0); }
            break;
            
      } 
      
      param++; 
      offset = 0;
      if (c == '*') checksum_param=1;
      else parity ^= c;
      break;

    case '\r':
    case '\n':
      if (checksum_param) { //parity checksum
        uint8_t checksum = hex_c(string[0]);
        checksum <<= 4;
        checksum += hex_c(string[1]);
        if (checksum == parity) {
            frameOK = 1;
            
            // move GPS data to OSD data
            osd_pos.lat            = msg.nmea.lat;
            osd_pos.lon            = msg.nmea.lon;
            osd_pos.alt = osd_alt_mav = msg.nmea.alt * 10;
            eph                    = msg.nmea.hdop * 10;
            osd_heading            = msg.nmea.course;
            osd_groundspeed        = msg.nmea.speed;
            osd_fix_type           = msg.nmea.fix;
            osd_satellites_visible = msg.nmea.sats;
            day_seconds            = msg.nmea.time;
//            msg.nmea.date;
        }
      }
      checksum_param=0;
      break;

    default:
        if (offset < NMEA_BUF_LENGTH) 
            string[offset++] = c;
        
        if (!checksum_param) parity ^= c;
    }
//    if(frame) 
//        GPS_Present = 1;
        
    return frameOK;
  }


void read_NMEA(){
    char string[NMEA_BUF_LENGTH];
    while (Serial.available_S()) {
            uint8_t c = Serial.read_S();
                
#ifdef DEBUG
            bytes_comes+=1;
#endif
            // parse data to msg
            if (parse_NMEA_char(c, &string[0])) {
                set_data_got();
            }
    }
}


static void send_gps_command(PGM_P cp){
    Serial.print_P(cp);
    delay_150();
}


static void init_gps(){
//--- SiRF  --------------------------------------------------------------
// Select / Change the Baud Rates using the NMEA Protocol for SiRF modules
// $PSRF100,Proto,Baudrate,DataBits,StopBits,Parity,C heckSum*CS<cr><lf>

//send_gps_command("$PSRF100,1,4800,8,1,0*0E\r\n"); //  =,NNEA,4800/8/1/None*CS
//send_gps_command( "$PSRF100,1,9600,8,1,0*0D\r\n"); //  =,NNEA,9600/8/1/None*CS
//send_gps_command( "$PSRF100,1,19200,8,1,0*38\r\n"); //  =,NNEA,19200/8/1/None*CS
//send_gps_command( "$PSRF100,1,38400,8,1,0*3D\r\n"); //  =,NNEA,38400/8/1/None*CS
send_gps_command(PSTR( "$PSRF100,1,57600,8,1,0*36\r\n")); //  =,NNEA,57600/8/1/None*CS
//send_gps_command( "$PSRF100,1,115200,8,1,0*05\r\n"); //  =,NMEA,115200/8/1/None*CS
//---
//$PSRF100,0,57600,8,1,0*37 =,SiRF,57600/8/1/N*CS
//$PSRF100,0,115200,8,1,0*04 =,SiRF,115200/8/1/N*CS

//--- u-Blox -----------------------------------------------------------
//# Select / Change the Baud Rates using the NMEA Protocol for u-Blox modules
//# $PUBX,41,portID,inProto,outProto,Baudrate,autoBaud rate*CS<cr><lf>

//send_gps_command("$PUBX,41,1,0003,0002,4800,0*16\r\n"); // =,1,UBX+NMEA,NMEA,4800,0*CS
//send_gps_command( "$PUBX,41,1,0003,0002,9600,0*15\r\n");
//send_gps_command( "$PUBX,41,1,0003,0002,19200,0*20\r\n");
//send_gps_command( "$PUBX,41,1,0003,0002,38400,0*25\r\n");
send_gps_command(PSTR( "$PUBX,41,1,0003,0002,57600,0*2E\r\n"));
//send_gps_command("$PUBX,41,1,0003,0002,115200,0*1D\r\n");

//--- MTK --------------------------------------------------------------
//# Select / Change the Baud Rates using the NMEA Protocol for MTK modules
//# $PMTK51,Baudrate*CS<cr><lf>

//send_gps_command("$PMTK251,4800*14\r\n"); // =,4800*CS<cr><lf>
//send_gps_command("$PMTK251,9600*17\r\n");
//send_gps_command("$PMTK251,19200*22\r\n");
//send_gps_command("$PMTK251,38400*27\r\n");
send_gps_command(PSTR("$PMTK251,57600*2C\r\n"));
//send_gps_command("$PMTK251,115200*1F\r\n");

//--- MTK --------------------------------------------------------------
//# Select / Change rate for MTK modules
//# $PMTK20,Period*CS<cr><lf>

//send_gps_command("$PMTK220,100*2F\r\n"); // =set 10Hz rate
send_gps_command(PSTR("$PMTK220,200*2C\r\n")); // =set 5Hz rate
//send_gps_command($PMTK220,1000*1F\r\n"); // =set 1Hz rate

//--- NemeriX ----------------------------------------------------------
//# Select / Change Baud Rate using NMEA Protocol for NemeriX modules
//# $PNMRX100,Protocol,Baudrate,Parity*CS<cr><lf>

//send_gps_command("$PNMRX100,0,4800,0*48\r\n");  // =,NMEA,4800,None*CS
//send_gps_command("$PNMRX100,0,9600,0*4B\r\n");
//send_gps_command("$PNMRX100,0,19200,0*7E\r\n");
//send_gps_command("$PNMRX100,0,38400,0*7B\r\n");
send_gps_command(PSTR("$PNMRX100,0,57600,0*70\r\n"));
//send_gps_command("$PNMRX100,0,115200,0*43\r\n");

    lflags.data_mode=false;
    lflags.input_active=false; // reset flags - activate auto-baud
}


void heartBeat() {
    if(!lflags.input_active)
        init_gps();
}

#if 0 
void GPS_NewData() {
  GPS_SerialInitialised=0;
  if (GPS_active>0)
    GPS_active--;
  if (msg.nmea.fix && (msg.nmea.sats >= MINSATFIX)) {
    if (msg.nmea.fix_HOME == 0){
      GPS_reset_home_position();
      msg.nmea.fix_HOME=1;
      if (!msg.nmea.fix_HOME) {
        GPS_distanceToHome = 0;
        GPS_directionToHome = 0;
        msg.nmea.alt = 0 ;
        MwAltitude = 0 ;
      }  
    }

    //calculate distance. bearings etc
    uint32_t dist;
    int32_t  dir;
    GPS_distance_cm_bearing(&msg.nmea.lat,&msg.nmea.lon,&GPS_home[LAT],&GPS_home[LON],&dist,&dir);
    GPS_distanceToHome = dist/100;
    GPS_directionToHome = dir/100;
    msg.nmea.alt =  msg.nmea.alt- msg.nmea.alt_home;
    MwAltitude = msg.nmea.alt *100;
    GPS_latitude = msg.nmea.lat;
    GPS_longitude = msg.nmea.lon;
    int16_t MwHeading360=msg.nmea.course/10;
    if (MwHeading360>180)
    MwHeading360 = MwHeading360-360;
    MwHeading   = MwHeading360;
    
    if (GPS_armedangleset==0)  
      armedangle=MwHeading;
    if (GPS_distanceToHome>20){
      GPS_armedangleset = 1;
      armed=1;
    }
  
    if (GPS_armedangleset==1){
      if ((GPS_distanceToHome<20)&&(msg.nmea.speed<75)){
        if ((GPS_home_timer+5000)>millis()){
        }
        else if((GPS_home_timer+15000)>millis()){
          configPage=0;
          armed=0;
        }      
        else{
           configMode=0;
           GPS_armedangleset=0;
           previousarmedstatus=0;
        }      
      }
      else {
        GPS_home_timer=millis();
      }    
    }
  }
}


void GPS_calc_longitude_scaling(int32_t lat) {
  float rads       = (abs((float)lat) / 10000000.0) * 0.0174532925;
  GPS_scaleLonDown = cos(rads);
}


void GPS_reset_home_position() {
  if (msg.nmea.fix && msg.nmea.sats >= MINSATFIX) {
      GPS_home[LAT] = msg.nmea.lat;
      GPS_home[LON] = msg.nmea.lon;
      msg.nmea.alt_home = msg.nmea.alt;
      GPS_calc_longitude_scaling(msg.nmea.lat);  //need an initial value for distance and bearing calc
      msg.nmea.fix_HOME = 1;
  }
}


////////////////////////////////////////////////////////////////////////////////////
// Get distance between two points in cm
// Get bearing from pos1 to pos2, returns an 1deg = 100 precision
void GPS_distance_cm_bearing(int32_t* lat1, int32_t* lon1, int32_t* lat2, int32_t* lon2,uint32_t* dist, int32_t* bearing) {
  float dLat = *lat2 - *lat1;                                    // difference of latitude in 1/10 000 000 degrees
  float dLon = (float)(*lon2 - *lon1) * GPS_scaleLonDown;
  *dist = sqrt(sq(dLat) + sq(dLon)) * 1.113195;
  
  *bearing = 9000.0f + atan2(-dLat, dLon) * 5729.57795f;      //Convert the output redians to 100xdeg
  if (*bearing < 0) *bearing += 36000;
}


#endif
