#pragma once

/*Panels variables*/
//Will come from APM telem port


#pragma pack(push,1)

Settings sets;	// настройки из EEPROM

volatile byte garbage=0xf4;


static byte max7456_err_count=0;
static byte stream_rate=0; // divider to requested rates 
static byte mav_raw_imu_count=0;


static float        nor_osd_windspeed = 0; // calculated from osd_windspeed by LPF 1/100
static float        vertical_speed = 0; // calculated from osd_climb by LPF 1/10

static float        trip_distance = 0; // track distance
static float        mah_used = 0;  // consumed charge


//static const char strclear[] PROGMEM = "\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20";


static int          nav_roll = 0;  // Current desired roll in degrees, for panTune only
static int          nav_pitch = 0; // Current desired pitch in degrees, for panTune only
static int          nav_bearing = 0; // Current desired heading in degrees, for panTune only

static int16_t      wp_target_bearing = 0; // Bearing to current MISSION/target in degrees
static uint16_t     wp_dist = 0; 	// Distance to active MISSION in meters
static uint8_t      wp_number = 0; 	// Current waypoint number

#ifdef IS_PLANE
static float        alt_error = 0; // Current altitude error in meters *10
static float        aspd_error = 0; // Current airspeed error in meters/second
//static long         osd_home_alt = 0; 
static float        osd_alt_to_home = 0; 
static unsigned long landed = 0;

static int          takeoff_heading = -400;         // Calculated takeoff heading
#endif

static int /*float*/ xtrack_error = 0; // Current crosstrack error on x-y plane in meters

static uint16_t     eph = 0;

static uint16_t     chan_raw[8]={0,0,0,0,0,0,0,0}; // значение каналов управления


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
static uint8_t      osd_battery_remaining_A = 0;    // 0 to 100 <=> 0 to 1000
static uint8_t      osd_battery_remaining_B = 0;    // 0 to 100 <=> 0 to 1000

float power=0; 

static int8_t       max_battery_reading = 0;    // 0 to 100 <=> 0 to 1000
static int8_t       last_battery_reading = 0;    // 0 to 100 <=> 0 to 1000

static uint8_t      osd_battery_pic_A[2] = {0x8d, 0x8d};     // picture to show battery remaining
//static uint8_t      osd_battery_pic_B[2] = {0x8d, 0x8d};     // picture to show battery remaining

static uint16_t     temperature = 0;  // temp*100


static uint16_t      remaining_estimated_flight_time_seconds = 0;
static uint8_t       osd_mode = 0;                   // Navigation mode from RC AC2 = CH5, APM = CH8

static unsigned long timer_20ms = 0;
static unsigned long timer_100ms = 0;
static unsigned long timer_500ms = 0;

static unsigned long total_flight_time_milis = 0;
//static uint16_t      total_flight_time_seconds = 0;
unsigned long runtime = 0;


static uint8_t      osd_off_switch = 0;
static uint8_t      osd_switch_last = 100;

static unsigned long osd_switch_time = 0;

#ifdef IS_PLANE
static float        palt = 0;	// высота выключения газа
#endif

static float        osd_climb = 0;
Coords              osd_pos = {0,0,0};			// current coordinates

static uint8_t      osd_satellites_visible = 0;     // number of satelites
static uint8_t      osd_fix_type = 0;               // GPS lock 0=no GPS 1=no fix, 2=2D, 3=3D
static uint16_t     osd_cog=0;                      // Course over ground
static uint16_t     off_course=0;
Coords              osd_home = {0,0,0};             // home coordinates
static long         osd_home_distance = 0;          // distance from home
static uint8_t      osd_home_direction=0;           // Arrow direction pointing to home (1-16 to CW loop)
static int          dst_x=0,dst_y=0;    // расстояние по осям - для радара

struct Att osd_att = {0,0,0};

static int /* float*/  osd_heading = 0;                // ground course heading from GPS

static float        osd_alt_mav = 0;                    // altitude - float from MAVlink!
static float        home_alt_mav = 0;                    // home altitude fixed on arm

static float        osd_airspeed = 0;                   // airspeed
static float        osd_windspeed = 0;
//static float        osd_windspeedz = 0;
static int /*float*/  osd_winddirection = 0; // потеря точности мизерная - у нас всего 16 положений

static float        osd_groundspeed = 0;            // ground speed
static float        loc_speed=0;    // local speed

static uint8_t      osd_throttle = 0;               // throtle

static uint16_t     seconds; // это только для panCALLSIGN
static uint16_t     lastMavSeconds=0;
static uint32_t     lastMAVBeat = 0;


static uint8_t      apm_mav_system = 0;
static uint8_t      apm_mav_component=0;
static uint8_t      osd_autopilot=0;	// system type: 3 - apm 14 - autoquad
static byte         mav_fence_status = 0; // from mavlink_msg_fence_status_get_breach_type

#ifdef MAVLINK_CONFIG
static byte         mav_gcs_id=0;
static uint16_t     last_seq_n=0;
#endif

byte count05s=0;
byte count02s=0;

#define MAX_PANELS 4
static uint8_t panelN = STARTUP_SCREEN;

static Point trk[4] = {{0,0},{0,0},{0,0},{0,0}};

//*************************************************************************************************************
uint8_t      osd_rssi = 0; // raw value from mavlink
uint8_t      telem_rssi = 0; // telemetry modem RSSI raw value
uint16_t     rssi_in = 0;  // temp readed value after sliding average
uint16_t     rssi_norm = 0;     //normalized 0-100%, but in RAW mode can contain full PWM value


uint8_t  crlf_count = 0;

byte     mav_message[52]; // in MavLink max size is 50
uint16_t mav_msg_ttl=0;
byte     mav_msg_len=0;
byte     mav_msg_severity=0;
byte     mav_msg_shift=0;

byte mav_data_count=0; // how many GPS data packets comes between heartbeats

volatile byte update_screen=0;

#if defined(AUTOBAUD)
uint32_t serial_speed=0; // detected port speed
#endif

#ifdef DEBUG
uint16_t packet_drops = 0; // used only in debug
uint16_t packets_skip = 0;
uint16_t packets_got = 0;

long bytes_comes=0;
uint16_t max_dly=0;
volatile uint16_t lost_bytes =0;

long mavlink_time=0, mavlink_dt=0;
int  mavlink_cnt=0;
volatile uint16_t stack_bottom=0xffff; // check for stack size in interrupts
#endif

byte skip_inc=0;

struct   loc_flags lflags = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}; // все булевые флаги кучей

// all bools in lflags exclude volatile
volatile byte vsync_wait = 0;
volatile uint8_t vsync_count=0;
volatile uint32_t vsync_time=0;

uint16_t screen_flags;

#ifdef PWM_PIN
volatile boolean       New_PWM_Frame = false; // Flag marker for new and changed PWM value
volatile uint16_t      PWM_IN=0;              // Value to hold PWM signal width. Exact value of it. Normally between 1000 - 2000ms while 1500 is center
volatile unsigned long int_Timer = 0;         // set in the INT1
#endif

//byte   PWM_out_pin=0;
         byte   PWM_out_bit=0;
volatile byte * PWM_out_port=0;

//#if defined(USE_SENSORS)
unsigned int sensorData[4] = {0,0,0,0};
//#endif
#if defined(USE_SENSORS)
byte flgSensor[4]={0,0,0,0};
byte fPulseSensor[4]={0,0,0,0};
#endif

uint8_t fdata_screen=0;

float tmp_f; // temp float to get rid  of stack usage

// Setup screen 
static uint16_t chan_raw_middle[4]={0,0,0,0}; // запомненные при входе значения каналов

#ifdef USE_SETUP
static byte setup_menu=1; // номер строки меню
static byte setup_screen=0; // номер экрана меню

const Params *params; // указатель на текущий набор параметров
#endif

uint32_t autoswitch_time=0;

static uint16_t ch_raw_prev1=0;
static uint16_t ch_raw_prev2=0;

#define GPS_MUL 10000000.0f

static float        max_home_distance = 0;
static float        max_osd_airspeed = 0;
static float        max_osd_groundspeed = 0; 
static float        max_osd_home_alt = 0;
static float        max_osd_windspeed = 0;
static float        max_osd_curr_A = 0;                 // max Battery A current
static float        max_osd_climb=0;
static float        min_osd_climb=0;
static float        max_osd_power=0;

uint32_t sys_days;    // from unix epoch
uint32_t day_seconds; // from midnight

float vibration[3]; //< Vibration levels
uint16_t clipping[3];// < first accelerometer clipping count

uint16_t pwm_out[4]; // output values for motors

byte climb_filter=10; // 
