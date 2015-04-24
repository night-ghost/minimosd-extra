
/*Panels variables*/
//Will come from APM telem port

 Flags flags; // битовые флаги из EEPROM
 Settings sets;	// настройки из EEPROM
 Panel panel;


static float        max_home_distance = 0;
static float        max_osd_airspeed = 0;
static float        max_osd_groundspeed = 0; 
static float        max_osd_home_alt = 0;
static float        max_osd_windspeed = 0;
static float        nor_osd_windspeed = 0;
static float        vs = 0;

static float tdistance = 0;

static const char strclear[] PROGMEM ="\x20\x20\x20\x20\x20\x20\x20\x20";


static float        nav_roll = 0; // Current desired roll in degrees
static float        nav_pitch = 0; // Current desired pitch in degrees
static float        nav_bearing = 0; // Current desired heading in degrees

static int16_t      wp_target_bearing = 0; // Bearing to current MISSION/target in degrees
static uint16_t     wp_dist = 0; // Distance to active MISSION in meters
static uint8_t      wp_number = 0; // Current waypoint number
#ifdef IS_PLANE
static float	    alt_error = 0; // Current altitude error in meters
static float        aspd_error = 0; // Current airspeed error in meters/second
static boolean      takeofftime = 0;
static long         osd_home_alt = 0; 
static float        osd_alt_to_home = 0; 
static unsigned long FTime = 0;
static unsigned long landed = 4294967295;

static int          takeoff_heading = -400;         // Calculated takeoff heading
#endif

static float	    xtrack_error = 0; // Current crosstrack error on x-y plane in meters

static uint16_t     eph = 0;

static uint8_t      currentBasePanel=255; //0 - Normal OSD; 1 - Flight summary; 2 - No mavlink data (pre-set = 255 to force osd.clear() after boot screen

static bool         motor_armed = 0;
static bool         last_armed_status = 0;
static bool         ma = 0;

static uint16_t     ch_raw = 0;

static uint16_t chan_raw[8];
//static uint16_t     chan1_raw = 0;
//static uint16_t     chan2_raw = 0;
//static uint16_t     chan3_raw = 0;
//static uint16_t     chan4_raw = 0;
//static uint16_t     chan5_raw = 0;
//static uint16_t     chan6_raw = 0;
//static uint16_t     chan7_raw = 0;
//static uint16_t     chan8_raw = 0;

static uint8_t      check_warning = 1;

static float        converts = 0;
static float        converth = 0;
static uint16_t     distconv = 0;

static uint8_t      spe = 0;
static uint8_t      high = 0;
static int16_t      temps = 0;
static uint16_t     osd_vbat_A = 0;                 // Battery A voltage in milivolt
static uint16_t     osd_vbat_B = 0;                 // voltage in milivolt
static int16_t      osd_curr_A = 0;                 // Battery A current
static float        mah_used = 0;
static uint8_t      osd_battery_remaining_A = 0;    // 0 to 100 <=> 0 to 1000
static uint8_t      osd_battery_remaining_B = 0;    // 0 to 100 <=> 0 to 1000

static int8_t       max_battery_reading = 0;    // 0 to 100 <=> 0 to 1000
static int8_t       last_battery_reading = 0;    // 0 to 100 <=> 0 to 1000

static uint8_t      osd_battery_pic_A[2] = {0x8d, 0x8d};     // picture to show battery remaining
static uint8_t      osd_battery_pic_B[2] = {0x8d, 0x8d};     // picture to show battery remaining





static uint16_t     remaining_estimated_flight_time_seconds = 0;
static uint8_t      osd_mode = 0;                   // Navigation mode from RC AC2 = CH5, APM = CH8
static unsigned long one_sec_timer = 0;
static unsigned long last_timer = 0;

static unsigned long total_flight_time_milis = 0.0;
static uint16_t      total_flight_time_seconds = 0.0;
static unsigned long runt = 0;


static const char*  warning_string;
static boolean      warning_found = 0;
static boolean      canswitch = 1;
static uint8_t      osd_off_switch = 0;
static uint8_t      osd_switch_last = 100;
static uint8_t      rotation = 0;
static unsigned long         osd_switch_time = 0;

#ifdef IS_PLANE
static float        palt = 0;	// высота выключения газа
#endif

static float        osd_climb = 0;
static float        osd_lat = 0;                    // latidude
static float        osd_lon = 0;                    // longitude
static uint8_t      osd_satellites_visible = 0;     // number of satelites
static uint8_t      osd_fix_type = 0;               // GPS lock 0-1=no fix, 2=2D, 3=3D
static uint16_t     osd_cog;                        // Course over ground
static uint16_t     off_course;
static uint8_t      osd_got_home = 0;               // tels if got home position or not
static float        osd_home_lat = 0;               // home latidude
static float        osd_home_lon = 0;               // home longitude
static long         osd_home_distance = 0;          // distance from home
static uint8_t      osd_home_direction;             // Arrow direction pointing to home (1-16 to CW loop)

static int16_t       osd_pitch = 0;                  // pitch from DCM
static int16_t       osd_roll = 0;                   // roll from DCM

static float        osd_heading = 0;                // ground course heading from GPS

static float        osd_alt_rel = 0;                    // altitude - float from MAVlink!
static long         osd_alt_gps = 0;                    // altitude GPS
static float        osd_airspeed = 0;              // airspeed
static float        osd_windspeed = 0;
//static float        osd_windspeedz = 0;
static float        osd_winddirection = 0;

static float        osd_groundspeed = 0;            // ground speed

static uint8_t      osd_throttle = 0;               // throtle
static uint16_t     temperature = 0;
static uint8_t      tempconv = 1;
static uint16_t     tempconvAdd = 0;
static byte         distchar = 0;
static byte         climbchar = 0;





//MAVLink session control
static byte         mavbeat = 0;

static long         lastMAVBeat = 0;
//`static byte         waitingMAVBeats = 1;

static uint8_t      apm_mav_system; 
static uint8_t      apm_mav_component;
static byte         blinker = 0;
static boolean      one_sec_timer_switch = 0;

static const uint8_t npanels = 4;
static uint8_t panelN = 0; 


byte modeScreen = 0; //NTSC:0, PAL:1

//*************************************************************************************************************
static uint8_t      osd_rssi = 0; //raw value from mavlink
static uint16_t     rssi_in = 0; //temp readed value
static uint16_t     rssi = 0; //normalized 0-100%

