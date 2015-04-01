#define OSD_VERSION "MinimOSD-Extra 2.4|Copter r806 DV"


/*Panels variables*/
//Will come from APM telem port


static float        max_home_distance = 0;
static float        max_osd_airspeed = 0;
static float        max_osd_groundspeed = 0; 
static float        max_osd_home_alt = 0;
static float        max_osd_windspeed = 0;
static float        nor_osd_windspeed = 0;
static float        vs = 0;

static float tdistance = 0;
static float ddistance = 0;
static const char strclear[] PROGMEM ="\x20\x20\x20\x20\x20\x20\x20\x20";

//static float	    nav_roll = 0; // Current desired roll in degrees
//static float      nav_pitch = 0; // Current desired pitch in degrees
//static int16_t	    nav_bearing = 0; // Current desired heading in degrees
static int16_t	    wp_target_bearing = 0; // Bearing to current MISSION/target in degrees
static int8_t       wp_target_bearing_rotate_int = 0;
static uint16_t     wp_dist = 0; // Distance to active MISSION in meters
static uint8_t      wp_number = 0; // Current waypoint number
//static float	    alt_error = 0; // Current altitude error in meters
//static float      aspd_error = 0; // Current airspeed error in meters/second
static float	    xtrack_error = 0; // Current crosstrack error on x-y plane in meters
static float        eff = 0; //Efficiency
static uint16_t     eph = 0;

static uint8_t      currentBasePanel=255; //0 - Normal OSD; 1 - Flight summary; 2 - No mavlink data (pre-set = 255 to force osd.clear() after boot screen
static uint8_t      base_mode=0;
static uint8_t      panel_auto_switch=0;
static bool         motor_armed = 0;
static bool         last_armed_status = 0;
static bool         ma = 0;
static bool         osd_clear = 0;
static uint16_t     ch_raw = 0;
//static uint16_t     chan1_raw = 0;
//static uint16_t     chan2_raw = 0;
//static uint16_t     chan3_raw = 0;
//static uint16_t     chan4_raw = 0;
static uint16_t     chan5_raw = 0;
static uint16_t     chan6_raw = 0;
static uint16_t     chan7_raw = 0;
static uint16_t     chan8_raw = 0;
//static uint16_t     chan1_raw_middle = 0;
//static uint16_t     chan2_raw_middle = 0;

static uint8_t      ch_toggle = 0;
static uint8_t      check_warning = 1;
//static boolean      osd_set = 0;
static boolean      switch_mode = 0;
//static boolean      haltset = 0;
//static boolean      pal_ntsc = 0;

//static int8_t       setup_menu = 0;
static float        converts = 0;
static float        converth = 0;
static uint8_t      overspeed = 0;
static uint8_t      stall = 0;
static uint8_t      battv = 0; //Battery warning voltage - units Volt *10 
static uint16_t      distconv = 0;
//static int        battp = 0;

static uint8_t      spe = 0;
static uint8_t      high = 0;
static int16_t       temps = 0;
static float        osd_vbat_A = 0;                 // Battery A voltage in milivolt
static int16_t      osd_curr_A = 0;                 // Battery A current
static float        mah_used = 0;
static uint8_t      osd_battery_remaining_A = 0;    // 0 to 100 <=> 0 to 1000
static int8_t       max_battery_reading = 0;    // 0 to 100 <=> 0 to 1000
static int8_t       last_battery_reading = 0;    // 0 to 100 <=> 0 to 1000
static uint8_t      batt_warn_level = 0;
static uint8_t      osd_battery_pic_A = 0xb4;       // picture to show battery remaining

//static float      osd_vbat_B = 0;               // voltage in milivolt
//static float      osd_curr_B = 0;                 // Battery B current
//static uint16_t   osd_battery_remaining_B = 0;  // 0 to 100 <=> 0 to 1000
//static uint8_t    osd_battery_pic_B = 0xb4;     // picture to show battery remaining
static uint16_t     remaining_estimated_flight_time_seconds = 0.0;
static uint8_t      osd_mode = 0;                   // Navigation mode from RC AC2 = CH5, APM = CH8
static uint8_t      osd_nav_mode = 0;               // Navigation mode from RC AC2 = CH5, APM = CH8
//static unsigned long text_timer = 0;
static unsigned long one_sec_timer = 0;
static unsigned long mavLinkTimer = 0;
//static unsigned long warning_timer =0;
//static unsigned long current_flight_start_Time = 0.0;
static unsigned long total_flight_time_milis = 0.0;
static uint16_t      total_flight_time_seconds = 0.0;
static unsigned long runt = 0;
//static unsigned long CallSignBlink = 0;

//static uint8_t      warning_type = 0;
static const char*  warning_string;
static boolean      warning_found = 0;
static boolean      canswitch = 1;
static uint8_t      osd_off_switch = 0;
static uint8_t      osd_switch_last = 100;
static uint8_t      rotation = 0;
static unsigned long         osd_switch_time = 0;
//static unsigned long         descendt = 0;
static float         palt = 0;
static float        osd_climb = 0;
//static float        descend = 0;

static float        osd_lat = 0;                    // latidude
static float        osd_lon = 0;                    // longitude
static uint8_t      osd_satellites_visible = 0;     // number of satelites
static uint8_t      osd_fix_type = 0;               // GPS lock 0-1=no fix, 2=2D, 3=3D
static uint16_t     osd_cog;                        // Course over ground
static uint16_t     off_course;
static uint8_t      osd_got_home = 0;               // tels if got home position or not
static float        osd_home_lat = 0;               // home latidude
static float        osd_home_lon = 0;               // home longitude
//static float        osd_home_alt = 0; 
//static float        osd_alt_to_home = 0; 
static long         osd_home_distance = 0;          // distance from home
static uint8_t      osd_home_direction;             // Arrow direction pointing to home (1-16 to CW loop)

static int16_t       osd_pitch = 0;                  // pitch from DCM
static int16_t       osd_roll = 0;                   // roll from DCM
//static int8_t       osd_yaw = 0;                    // relative heading form DCM
static float        osd_heading = 0;                // ground course heading from GPS
static float        glide = 0;

static float        osd_alt_abs = 0;                    // altitude
static float        osd_alt_rel = 0;                    // altitude
static float        osd_alt_gps = 0;                    // altitude
static float        osd_airspeed = 0;              // airspeed
static float        osd_windspeed = 0;
static float        osd_windspeedz = 0;
static float        osd_winddirection = 0;
static int8_t       osd_wind_arrow_rotate_int;
static int8_t       osd_COG_arrow_rotate_int;

//static uint8_t      osd_alt_cnt = 0;              // counter for stable osd_alt
//static float        osd_alt_prev = 0;             // previous altitude

static float        osd_groundspeed = 0;            // ground speed
static uint8_t     osd_throttle = 0;               // throtle
static uint16_t     temperature = 0;
static uint8_t      tempconv = 1;
static uint16_t     tempconvAdd = 0;
static byte     distchar = 0;
static byte     climbchar = 0;


static float     convertt = 0;
//Call sign variables
static char         char_call[OSD_CALL_SIGN_TOTAL+1] = {0};

//MAVLink session control
static boolean      mavbeat = 0;
//static boolean      iconAS = 0;
//static boolean      iconGS = 0;
//static boolean      iconHA = 0;
//static boolean      iconMSL = 0;
static boolean      landing = 0;
static float        lastMAVBeat = 0;
static boolean      waitingMAVBeats = 1;
//static uint8_t      apm_mav_type;
static uint8_t      apm_mav_system; 
static uint8_t      apm_mav_component;
static boolean      enable_mav_request = 0;
static boolean      blinker = 0;
static boolean      one_sec_timer_switch = 0;

static const uint8_t npanels = 2;
static uint8_t panel = 0; 


byte modeScreen = 0; //NTSC:0, PAL:1



// First 8 panels and their X,Y coordinate holders
point panCenter_XY; // = { 13,7,0 };
point panPitch_XY; // = { 11,1 };
point panRoll_XY; // = { 23,7 };
point panBatt_A_XY; // = { 23,1 };
//point panBatt_B_XY; // = { 23,3 };
point panGPSats_XY; // = { 2,12 };
point panCOG_XY; // = { 2,11 };
point panGPS_XY; // = { 2,13 };
point panBatteryPercent_XY;


//Second 8 set of panels and their X,Y coordinate holders
point panRose_XY; // = { 16,13 };
point panHeading_XY; // = { 16,12 };
//point panMavBeat_XY; // = { 2,10 };
point panHomeDir_XY; // = { 0,0 };
point panHomeDis_XY; // = { 0,0 };
point panWPDir_XY; // = { 27,12 };
point panWPDis_XY; // = { 23,11 };
point panTime_XY;


// Third set of panels and their X,Y coordinate holders
point panCur_A_XY; // = { 23,1 };
//point panCur_B_XY; // = { 23,3 };
point panAlt_XY; // = { 0,0 };
point panHomeAlt_XY; // = { 0,0 };
point panVel_XY; // = { 0,0 };
point panAirSpeed_XY; // = { 0,0 };
point panThr_XY; // = { 0,0 };
point panFMod_XY; // = { 0,0 };
point panHorizon_XY; // = {8,centercalc}

// Third set of panels and their X,Y coordinate holders
point panWarn_XY;
point panWindSpeed_XY;
point panClimb_XY;
//point panTune_XY;
point panRSSI_XY;
point panEff_XY;
point panCALLSIGN_XY;
//point panCh_XY;
point panTemp_XY;
point panDistance_XY;


//*************************************************************************************************************
//rssi varables
static uint8_t      rssipersent = 0;
static uint8_t      rssical = 0;
static uint8_t      osd_rssi = 0; //raw value from mavlink
static int16_t      rssi = -99; // scaled value 0-100%
static uint8_t      rssiraw_on = 0;
static uint8_t      rssi_warn_level = 0;

