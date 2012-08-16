/*Panels variables*/
//Will come from APM telem port

//static float	nav_roll = 0; // Current desired roll in degrees
//static float  nav_pitch = 0; // Current desired pitch in degrees
//static int16_t	nav_bearing = 0; // Current desired heading in degrees
//static int16_t	target_bearing = 0; // Bearing to current MISSION/target in degrees
//static uint16_t wp_dist = 0; // Distance to active MISSION in meters
//static float	alt_error = 0; // Current altitude error in meters
//static float aspd_error = 0; // Current airspeed error in meters/second
//static float	xtrack_error = 0; // Current crosstrack error on x-y plane in meters

static int16_t chan1_raw = 0;
static int16_t chan2_raw = 0;
static int16_t chan1_raw_middle = 0;
static int16_t chan2_raw_middle = 0;
static int osd_set = 0;

static int setup_menu = 0;
static int converts = 0;
static int converth = 0;
static int overspeed = 0;
static int stall = 0;
static float battv = 0;
//static int battp = 0;

static uint8_t spe = 0;
static uint8_t high = 0;
static float    osd_vbat_A = 0;                 // Battery A voltage in milivolt
static float    osd_curr_A = 0;                 // Battery A current
static uint16_t osd_battery_remaining_A = 0;    // 0 to 100 <=> 0 to 1000
static uint8_t  osd_battery_pic_A = 0xb4;       // picture to show battery remaining
//static float    osd_vbat_B = 0;               // voltage in milivolt
//static float    osd_curr_B = 0;                 // Battery B current
//static uint16_t osd_battery_remaining_B = 0;  // 0 to 100 <=> 0 to 1000
//static uint8_t  osd_battery_pic_B = 0xb4;     // picture to show battery remaining
static int start_Time = -1;
static uint16_t osd_mode = 0;                   // Navigation mode from RC AC2 = CH5, APM = CH8
static uint8_t  osd_nav_mode = 0;               // Navigation mode from RC AC2 = CH5, APM = CH8
static int text_blink = 0;
//static int warning_type = 0;
static uint8_t warning_type = 0;
//static int char_update = 0;
static int osd_off = 0;
static uint16_t osd_off_switch = 0;
static uint16_t osd_switch_last = 100;
static long osd_switch_time = 0;
static long wind_time = 0;
static float osd_climb = 0;
static long a = 0;
static long b = 0;

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
static float    osd_heading = 0; // ground course heading from GPS
//static float   heding_check = -2;
static float    osd_alt = 0;                    // altitude
static float    osd_airspeed = -1;               // air speed
static float    osd_windspeed = 0.0;
static float    osd_windspeedz = 0.0;
//static float osd_windspeed_check = 0;
static float osd_winddirection = 0;
//static float osd_winddirection_check = 0;
//static float osd_wind_arrow_rotate = 0.0;       // Arrow direction pointing  (0-360 to CW loop)
static uint8_t  osd_wind_arrow_rotate_int;             // Arrow direction pointing  (1-16 to CW loop)

static int wind = 0;
//static int osd_wind_arrow = 0;

static uint8_t  osd_alt_cnt = 0;              // counter for stable osd_alt
static float    osd_alt_prev = 0;             // previous altitude

static float    osd_groundspeed = 0;            // ground speed
static uint16_t osd_throttle = 0;               // throtle

//MAVLink session control
static boolean  mavbeat = 0;
static float    lastMAVBeat = 0;
static boolean  waitingMAVBeats = 1;
static uint8_t  apm_mav_type;
static uint8_t  apm_mav_system; 
static uint8_t  apm_mav_component;
static boolean  enable_mav_request = 0;

// Panel BIT registers
byte panA_REG = 0b00000000;
byte panB_REG = 0b00000000;
byte panC_REG = 0b00000000;
byte panD_REG = 0b00000000;

byte modeScreen = 0; //NTSC:0, PAL:1

byte SerCMD1 = 0;
byte SerCMD2 = 0;

//int tempvar;      // Temporary variable used on many places around the OSD

// First 8 panels and their X,Y coordinate holders
byte panCenter_XY[2]; // = { 13,7,0 };
byte panPitch_XY[2]; // = { 11,1 };
byte panRoll_XY[2]; // = { 23,7 };
byte panBatt_A_XY[2]; // = { 23,1 };
//byte panBatt_B_XY[2]; // = { 23,3 };
byte panGPSats_XY[2]; // = { 2,12 };
byte panGPL_XY[2]; // = { 2,11 };
byte panGPS_XY[2]; // = { 2,13 };
byte panBatteryPercent_XY[2];


// Second 8 set of panels and their X,Y coordinate holders
byte panRose_XY[2]; // = { 16,13 };
byte panHeading_XY[2]; // = { 16,12 };
byte panMavBeat_XY[2]; // = { 2,10 };
byte panHomeDir_XY[2]; // = { 0,0 };
byte panHomeDis_XY[2]; // = { 0,0 };
byte panWPDir_XY[2]; // = { 0,0 };
byte panWPDis_XY[2]; // = { 0,0 };
byte panTime_XY[2];
//byte panRSSI_XY[2] = { 0,0 };

// Third set of panels and their X,Y coordinate holders
byte panCur_A_XY[2]; // = { 23,1 };
//byte panCur_B_XY[2]; // = { 23,3 };
byte panAlt_XY[2]; // = { 0,0 };
byte panHomeAlt_XY[2]; // = { 0,0 };
byte panVel_XY[2]; // = { 0,0 };
byte panAirSpeed_XY[2]; // = { 0,0 };
byte panThr_XY[2]; // = { 0,0 };
byte panFMod_XY[2]; // = { 0,0 };
byte panHorizon_XY[2]; // = {8,centercalc}

// Third set of panels and their X,Y coordinate holders
byte panWarn_XY[2];
byte panOff_XY[2];
byte panWindSpeed_XY[2];
byte panClimb_XY[2];
//byte panTune_XY[2];
byte panSetup_XY[2];

