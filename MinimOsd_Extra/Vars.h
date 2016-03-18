
/*Panels variables*/
//Will come from APM telem port


#pragma pack(push,1)

 Flags flags; // битовые флаги из EEPROM
 Settings sets;	// настройки из EEPROM
 Panel panel; // элементы экрана из EEPROM


static float        max_home_distance = 0;
static float        max_osd_airspeed = 0;
static float        max_osd_groundspeed = 0; 
static float        max_osd_home_alt = 0;
static float        max_osd_windspeed = 0;
static float        nor_osd_windspeed = 0;
static float        vs = 0;

static float  tdistance = 0;

//static const char strclear[] PROGMEM ="\x20\x20\x20\x20\x20\x20\x20\x20";
static const char strclear[] PROGMEM = "\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20";


static float        nav_roll = 0; // Current desired roll in degrees
static float        nav_pitch = 0; // Current desired pitch in degrees
static int /* float */   nav_bearing = 0; // Current desired heading in degrees

static int16_t      wp_target_bearing = 0; // Bearing to current MISSION/target in degrees
static uint16_t     wp_dist = 0; // Distance to active MISSION in meters
static uint8_t      wp_number = 0; // Current waypoint number
#ifdef IS_PLANE
static float	    alt_error = 0; // Current altitude error in meters
static float        aspd_error = 0; // Current airspeed error in meters/second
static long         osd_home_alt = 0; 
static float        osd_alt_to_home = 0; 
static unsigned long landed = 4294967295;

static int          takeoff_heading = -400;         // Calculated takeoff heading
#endif

static int /*float*/ xtrack_error = 0; // Current crosstrack error on x-y plane in meters

static uint16_t     eph = 0;

static uint8_t      currentAutoPanel=255; //0 - Normal OSD; 1 - Flight summary; 2 - No mavlink data (pre-set = 255 to force osd.clear() after boot screen


//static uint16_t     ch_raw = 0;

static uint16_t     chan_raw[8]; // значение каналов управления

static uint8_t      check_warning = 1;

/* [ все переменные, связанные с метрикой, сделать PROGMEM и переключать указатель !
static float        converts = 0; 
static float        converth = 0;
static uint16_t     distconv = 0;

static uint8_t      spe = 0;
static uint8_t      high = 0;
static int16_t      temps = 0;

static uint8_t      tempconv = 1;
static uint16_t     tempconvAdd = 0;
static byte         distchar = 0;
static byte         climbchar = 0;
*///]

struct Measure {
    float        converts;
    float        converth;
    uint8_t      spe;
    uint8_t      high;
    int16_t      temps;
    uint8_t      tempconv;
    uint16_t     tempconvAdd;
    byte         distchar;
    uint16_t     distconv;
    byte         climbchar;
};


const struct Measure PROGMEM 
    metr={
        3.6, //  converts 
        1.0,  //converth
        0x10, //spe
        0x0c, //high 
        0xba, //temps
        10,  // tempconv
        0,   //tempconvAdd
        0x1b, //distchar
        1000, //distconv
        0x1a  //climbchar
    },
    imper = {
        2.23,
        3.28,
        0x19,
        0x66,
        0xbb,
        18,
        3200,
        0x1c,
        5280,
        0x1e
     };


static const struct Measure *measure; // переключаемая ссылка


static uint16_t     osd_vbat_A = 0;                 // Battery A voltage in milivolt
static uint16_t     osd_vbat_B = 0;                 // voltage in milivolt
static int16_t      osd_curr_A = 0;                 // Battery A current
static float        mah_used = 0;
static uint8_t      osd_battery_remaining_A = 0;    // 0 to 100 <=> 0 to 1000
static uint8_t      osd_battery_remaining_B = 0;    // 0 to 100 <=> 0 to 1000

static int8_t       max_battery_reading = 0;    // 0 to 100 <=> 0 to 1000
static int8_t       last_battery_reading = 0;    // 0 to 100 <=> 0 to 1000

static uint8_t      osd_battery_pic_A[2] = {0x8d, 0x8d};     // picture to show battery remaining
//static uint8_t      osd_battery_pic_B[2] = {0x8d, 0x8d};     // picture to show battery remaining

static uint16_t     temperature = 0;



static uint16_t      remaining_estimated_flight_time_seconds = 0;
static uint8_t       osd_mode = 0;                   // Navigation mode from RC AC2 = CH5, APM = CH8
//static unsigned long one_sec_timer = 0;
//static unsigned long timer_100ms = 0;
static unsigned long timer_20ms = 0;
byte count_100ms;
byte count_1s;

static unsigned long total_flight_time_milis = 0;
//static uint16_t      total_flight_time_seconds = 0;
static unsigned long runt = 0;


static uint8_t      osd_off_switch = 0;
static uint8_t      osd_switch_last = 100;
static uint8_t      rotation = 0;
static unsigned long osd_switch_time = 0;

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
//static uint8_t      osd_got_home = 0;               // tels if got home position or not
static float        osd_home_lat = 0;               // home latidude
static float        osd_home_lon = 0;               // home longitude
static long         osd_home_distance = 0;          // distance from home
static uint8_t      osd_home_direction;             // Arrow direction pointing to home (1-16 to CW loop)
static int dst_x,dst_y; // расстояние по осям - для радара

int16_t                osd_roll = 0;                   // roll from DCM
volatile int16_t       osd_pitch = 0;                  // pitch from DCM
int16_t                osd_yaw = 0;                    // yaw from DCM

static int /* float*/  osd_heading = 0;                // ground course heading from GPS

static float        osd_alt_rel = 0;                    // altitude - float from MAVlink!
static long         osd_alt_gps = 0;                    // altitude GPS
static float        osd_airspeed = 0;              // airspeed
static float        osd_windspeed = 0;
//static float        osd_windspeedz = 0;
static int /*float*/        osd_winddirection = 0; // потеря точности мизерная - у нас всего 16 положений

static float        osd_groundspeed = 0;            // ground speed

static uint8_t      osd_throttle = 0;               // throtle

static byte          seconds; // это только для panCALLSIGN
static uint32_t     lastMAVBeat = 0;

static uint8_t      apm_mav_system; 
static uint8_t      apm_mav_component;

#define MAX_PANELS 4
static uint8_t panelN = 0; 


//*************************************************************************************************************
static uint8_t      osd_rssi = 0; // raw value from mavlink
static uint16_t     rssi_in = 0;  // temp readed value after sliding average
static uint16_t     rssi = 0;     //normalized 0-100%

uint8_t crlf_count = 0;

struct loc_flags {
    bool update_stat:1; 		// есть данные для показа
    bool canswitch:1;

    bool got_data:1;		// флаг получения пакета
    bool mavlink_on:1;		// флаг активности (сбрасывается по таймауту)
    bool mavlink_active:1; 	// флаг активности (навсегда)
    bool rotatePanel:1;
    bool osd_clear:1;
    bool one_sec_timer_switch:1;

//MAVLink session control
//    bool mavbeat:1;

    bool motor_armed:1;
    bool last_armed_status:1;
    bool ma:1;
    bool takeofftime:1;

    bool blinker:1;

    bool uavtalk_active:1; // got valid UAVtalk packet - flag forever
    bool mode_switch:1;
    bool sw_state:1;
    bool osd_got_home:1;
//    bool modeScreen:1; //NTSC:0, PAL:1
//    bool warning_found:1;

};

#ifdef DEBUG
int packet_drops = 0; // unused
long bytes_comes=0;
uint16_t max_dly=0;
#endif


#define GPS_MUL 10000000.0f
