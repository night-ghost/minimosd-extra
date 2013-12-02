/*Panels variables*/
//Will come from APM telem port
#include <DMD_SommeAverage.h>
#include "RSSIFilter.h"


#define MASK_OSD_GET_RSSI_CONF        (1<<0) 
#define MASK_OSD_NORMAL_MODE          (1<<1) 
#define MASK_OSD_TUNING_MODE          (1<<2) 
#define MASK_OSD_TUNING_CH6_PARAM     (1<<3) 
#define MASK_OSD_TUNING_CHECK_PWM     (1<<4) 
#define MASK_OSD_TUNING_INIT_VALUE    (1<<5) 
#define MASK_OSD_DISPLAY_CH6_VALUE    (1<<6) 
#define MASK_OSD_LOGGING_MODE         (1<<7) 
#define MASK_OSD_LOGGING_CHECK_PWM    (1<<8) 

static int16_t osd_state_screen = 0;

//Voir fichier Parameters.pde ou defines.h dans le r�p. Arducopter :
/*@Values: 
0:CH6_NONE,
1:CH6_STABILIZE_KP,
2:CH6_STABILIZE_KI,
3:CH6_YAW_KP,
4:CH6_RATE_KP,
5:CH6_RATE_KI,
6:CH6_YAW_RATE_KP,
7:CH6_THROTTLE_KP,
9:CH6_RELAY,
10:CH6_WP_SPEED,
12:CH6_LOITER_KP,
13:CH6_HELI_EXTERNAL_GYRO,
14:CH6_THR_HOLD_KP,
17:CH6_OPTFLOW_KP,
18:CH6_OPTFLOW_KI,
19:CH6_OPTFLOW_KD,
21:CH6_RATE_KD,
22:CH6_LOITER_RATE_KP,
23:CH6_LOITER_RATE_KD,
24:CH6_YAW_KI,
25:CH6_ACRO_KP,
26:CH6_YAW_RATE_KD,
27:CH6_LOITER_KI,
28:CH6_LOITER_RATE_KI,
29:CH6_STABILIZE_KD,
30:CH6_AHRS_YAW_KP,
31:CH6_AHRS_KP,
32:CH6_INAV_TC,
33:CH6_THROTTLE_KI,
34:CH6_THR_ACCEL_KP,
35:CH6_THR_ACCEL_KI,
36:CH6_THR_ACCEL_KD,
38:CH6_DECLINATION,
39:CH6_CIRCLE_RATE*/


/**
Les valeurs de TUNE_PARAM_ID et RSSI_CONFIG_ID sont recuperees dans le fichier de log ArdupilotPlanner.log

2013-09-16 19:10:44,137  INFO ArdupilotMega.MAVLink - 137 got param 24 of 272 name: RSSI_PIN ...
2013-09-16 19:10:44,168  INFO ArdupilotMega.MAVLink - 168 got param 25 of 272 name: THR_ACC_ENABLE ...
...
2013-09-16 19:10:45,182  INFO ArdupilotMega.MAVLink - 182 got param 50 of 272 name: TUNE ...
2013-09-16 19:10:45,213  INFO ArdupilotMega.MAVLink - 213 got param 51 of 272 name: TUNE_LOW ...
2013-09-16 19:10:45,260  INFO ArdupilotMega.MAVLink - 260 got param 52 of 272 name: TUNE_HIGH ...

*/


#define RSSIPIN 12              // Miso Pin
RSSIFilter rssiFilter(160000, 135, -2, 3.5);
//long last_rssi_measure_time=0;
static const char* RSSI_PARAM_NAME = "RSSI_PIN"; 
static boolean rssi_signal_from_apm = true;

static const char* TUNE_PARAM_NAME = "TUNE"; 
//static const int16_t TUNE_PARAM_ID = 50;//152;
static const char* TUNE_HIGH_NAME = "TUNE_HIGH"; 
static const char* TUNE_LOW_NAME = "TUNE_LOW"; 

static const char* LOG_PARAM_NAME = "LOG_BITMASK"; 

#define TUNE_ITEM_NUMBER    7 //9 //Max 14 lines
#define TUNE_ITEM_LENGTH    15 //Size max of a param label

static const int8_t TUNING_OPT_ID[TUNE_ITEM_LENGTH]={0, 1, 4, 5, 21, 6, 25};
static const char* TUNING_PARAM_NAME_1[TUNE_ITEM_LENGTH]={"", "STB_PIT_P", "RATE_PIT_P", "RATE_PIT_I", "RATE_PIT_D", "RATE_YAW_P", "ACRO_P"};
static const char* TUNING_PARAM_NAME_2[TUNE_ITEM_LENGTH]={"", "STB_RLL_P", "RATE_RLL_P", "RATE_RLL_I", "RATE_RLL_D", "RATE_YAW_P", "ACRO_P"};

static float current_tuning_value = -1; //Realtime value of the parameter tuned by CH6 (CH6 is not set to none), displayed in normal OSD mode
static int8_t current_tuning_item = 0; //Selected parameter position 
static int8_t tuning_item_selected = 0; //Position of the actual parameter tuned by CH6


static float    osd_vbat_A = 0;                 // Battery A voltage in milivolt
static float    osd_curr_A = 0;                 // Battery A current
static int8_t   osd_battery_remaining_A = 0;    // 0 to 100 <=> 0 to 1000
static uint8_t  osd_battery_pic_A = 0xb9; //DMD old : 0xb4;       // picture to show battery remaining
//static float    osd_vbat_B = 0;               // voltage in milivolt
//static float    osd_curr_B = 0;                 // Battery B current
static float climb_rate = 100;                 // DMD The cm/s we are moving up or down based on filtered data - Positive = UP
//static DMD_SommeAverage climb_average;



static uint16_t channel7_value;                 //DMD activation OSD Tuning
static uint16_t rc1_roll_value;                 //DMD change value OSD Tuning
static uint16_t rc2_pitch_value;                //DMD change value OSD Tuning
static uint16_t rc3_throttle_value;                //DMD change value OSD Tuning
static uint16_t rc4_yaw_value;                  //DMD change value OSD Tuning
static uint16_t rc6_ch6_value;                  //DMD change value OSD Tuning

//OSD Tuning End

static uint32_t  local_climb_time;

//static uint16_t osd_battery_remaining_B = 0;  // 0 to 100 <=> 0 to 1000
//static uint8_t  osd_battery_pic_B = 0xb4;     // picture to show battery remaining

static uint16_t osd_mode = 0;                   // Navigation mode from RC AC2 = CH5, APM = CH8
static uint8_t  osd_nav_mode = 0;               // Navigation mode from RC AC2 = CH5, APM = CH8

static float    osd_lat = 0;                    // latidude
static float    osd_lon = 0;                    // longitude
static uint8_t  osd_satellites_visible = 0;     // number of satelites
static uint8_t  osd_fix_type = 0;               // GPS lock 0-1=no fix, 2=2D, 3=3D

static uint8_t  osd_got_home = 0;               // tels if got home position or not
static float    osd_home_lat = 0;               // home latidude
static float    osd_home_lon = 0;               // home longitude
static float    osd_home_alt = 0; 
static long     osd_home_distance = 0;          // distance from home
static uint8_t  osd_home_direction;             // Arrow direction pointing to home (1-16 to CW loop)

static int8_t      osd_pitch = 0;                  // pitch form DCM
static int8_t      osd_roll = 0;                   // roll form DCM
static int8_t      osd_yaw = 0;                    // relative heading form DCM
static float    osd_heading = 0;                // ground course heading from GPS
static float    osd_alt = 0;                    // altitude
static float    osd_groundspeed = 0;            // ground speed
static uint16_t osd_eph = 0;                    //DMD GPS HDOP horizontal dilution of position in cm (m*100)
static uint16_t osd_throttle = 0;               // throtle
static uint8_t osd_rssi = 0;                   //DMD Rssi 
static uint16_t temp = 245;                   // DMD Temperature in °C * 10

//DMD osd_alt
static uint8_t      osd_alt_cnt = 0;              // counter for stable osd_alt
static float        osd_alt_prev = 0;             // previous altitude

//MAVLink session control
static boolean  mavbeat = 0;
static boolean  armed = 0;   //DMD copter armed 1, or disarmed 0
static float    lastMAVBeat = 0;
static boolean  waitingMAVBeats = 1;
static uint8_t  apm_mav_type;
static uint8_t  apm_mav_system; 
static uint8_t  apm_mav_component;
static boolean  enable_mav_request = 0;

static uint32_t flight_time = 0; //DMD flight time
static uint32_t last_time = 0; //DMD flight time

// Panel BIT registers
byte panA_REG = 0b00000000;
byte panB_REG = 0b00000000;
byte panC_REG = 0b00000000;

byte modeScreen = 1; //NTSC:0, PAL:1 //DMD 0 default

byte SerCMD1 = 0;
byte SerCMD2 = 0;


int tempvar;      // Temporary variable used on many places around the OSD

// First 8 panels and their X,Y coordinate holders
byte panCenter_XY[2]; // = { 13,7,0 };
byte panPitch_XY[2]; // = { 11,1 };
byte panRoll_XY[2]; // = { 23,7 };
byte panBatt_A_XY[2]; // = { 23,1 };
//byte panBatt_B_XY[2]; // = { 23,3 }; BatB_BIT => Climb_BIT
byte panClimb_XY[2]; // = { 23,3 }; //DMD ajout
byte panGPSats_XY[2]; // = { 2,12 };
byte panGPL_XY[2]; // = { 2,11 };
byte panGPS_XY[2]; // = { 2,13 };

// Second 8 set of panels and their X,Y coordinate holders
byte panRose_XY[2]; // = { 16,13 };
byte panHeading_XY[2]; // = { 16,12 };
byte panMavBeat_XY[2]; // = { 2,10 };
byte panHomeDir_XY[2]; // = { 0,0 };
byte panHomeDis_XY[2]; // = { 0,0 };
byte panWPDir_XY[2]; //DMD Affichage du courant en Ampere// = { 0,0 };
byte panWPDis_XY[2]; //DMD Affichage de la valeur parametre en optimisation via CH6 // = { 0,0 };
byte panRSSI_XY[2] = { 24, 6 }; //DMD Rssi

// Third set of panels and their X,Y coordinate holders
byte panCur_A_XY[2]; // = { 23,1 }; //DMD ajout du current
//byte panCur_B_XY[2]; // = { 23,3 }; CurB_BIT => Temp_BIT
byte panTemp_XY[2]; // = { 23,3 }; //DMD Ajout
byte panAlt_XY[2]; // = { 0,0 };
byte panVel_XY[2]; // = { 0,0 };
byte panThr_XY[2]; // = { 0,0 };
byte panFMod_XY[2]; // = { 0,0 };
byte panHorizon_XY[2]; // = {8,centercalc}
//byte panXXX_XY[2] = { 0,0 };


