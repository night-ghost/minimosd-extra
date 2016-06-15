
/*Panels variables*/
//Will come from APM telem port


#pragma pack(push,1)

 Flags flags; // битовые флаги из EEPROM
 Settings sets;	// настройки из EEPROM


static float        max_home_distance = 0;
static float        max_osd_airspeed = 0;
static float        max_osd_groundspeed = 0; 
static float        max_osd_home_alt = 0;
static float        max_osd_windspeed = 0;
static float        max_osd_curr_A = 0;                 // max Battery A current
static float        max_osd_climb=0;
static float        min_osd_climb=0;

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
static long         osd_home_alt = 0; 
static float        osd_alt_to_home = 0; 
static unsigned long landed = 4294967295;

static int          takeoff_heading = -400;         // Calculated takeoff heading
#endif

static int /*float*/ xtrack_error = 0; // Current crosstrack error on x-y plane in meters

static uint16_t     eph = 0;

static uint16_t     chan_raw[8]; // значение каналов управления

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
static uint8_t      osd_battery_remaining_A = 0;    // 0 to 100 <=> 0 to 1000
static uint8_t      osd_battery_remaining_B = 0;    // 0 to 100 <=> 0 to 1000

static int8_t       max_battery_reading = 0;    // 0 to 100 <=> 0 to 1000
static int8_t       last_battery_reading = 0;    // 0 to 100 <=> 0 to 1000

static uint8_t      osd_battery_pic_A[2] = {0x8d, 0x8d};     // picture to show battery remaining
//static uint8_t      osd_battery_pic_B[2] = {0x8d, 0x8d};     // picture to show battery remaining

static uint16_t     temperature = 0;


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

struct Coords {
    float lat;
    float lon;
    long alt; // altitude GPS
};

//long osd_baro_alt; // altitude baro 

static float        osd_climb = 0;
Coords              osd_pos = {0,0,0};			// current coordinates

static uint8_t      osd_satellites_visible = 0;     // number of satelites
static uint8_t      osd_fix_type = 0;               // GPS lock 0-1=no fix, 2=2D, 3=3D
static uint16_t     osd_cog;                        // Course over ground
static uint16_t     off_course;
Coords              osd_home = {0,0,0};             // home coordinates
static long         osd_home_distance = 0;          // distance from home
static uint8_t      osd_home_direction;             // Arrow direction pointing to home (1-16 to CW loop)
static int          dst_x,dst_y; // расстояние по осям - для радара

struct Att {
    int16_t             pitch;                  // pitch from DCM
    int16_t             roll;                   // roll from DCM
    int16_t             yaw;                    // yaw from DCM
} osd_att = {0,0,0};

static int /* float*/  osd_heading = 0;                // ground course heading from GPS

static float        osd_alt_mav = 0;                    // altitude - float from MAVlink!

static int /* float */        osd_airspeed = 0;                   // airspeed
static float        osd_windspeed = 0;
//static float        osd_windspeedz = 0;
static int /*float*/  osd_winddirection = 0; // потеря точности мизерная - у нас всего 16 положений

static float        osd_groundspeed = 0;            // ground speed
static float        loc_speed=0;    // local speed

static uint8_t      osd_throttle = 0;               // throtle

static byte         seconds; // это только для panCALLSIGN
static uint32_t     lastMAVBeat = 0;

static uint8_t      apm_mav_system = 0;
static uint8_t      apm_mav_component;
static uint8_t      osd_autopilot;	// system type: 3 - apm 14 - autoquad
static byte         mav_fence_status = 0; // from mavlink_msg_fence_status_get_breach_type

#ifdef MAVLINK_CONFIG
static byte         mav_gcs_id=0;
static uint16_t     last_seq_n=0;
#endif

byte count05s=0;
byte count02s=0;

#define MAX_PANELS 4
static uint8_t panelN = STARTUP_SCREEN;


//*************************************************************************************************************
static uint8_t      osd_rssi = 0; // raw value from mavlink
static uint8_t      telem_rssi = 0; // telemetry modem RSSI raw value
static uint16_t     rssi_in = 0;  // temp readed value after sliding average
static uint16_t     rssi = 0;     //normalized 0-100%


uint8_t crlf_count = 0;

byte mav_message[52]; // in MavLink max isize is 50
byte mav_msg_ttl;
byte mav_msg_len;
byte mav_msg_severity;
byte mav_msg_shift;

volatile byte update_stat=0;

struct loc_flags {
//    bool update_stat:1; 		// есть данные для показа
    bool got_data:1;		// флаг получения пакета
    bool need_redraw:1;         // надо перерисовать экран
    bool mavlink_active:1; 	// флаг активности (навсегда)
    bool uavtalk_active:1; // got valid UAVtalk packet - flag forever
    bool mwii_active:1;    // got valid MWII packet - flag forever
    bool ltm_active:1;     // got valid LTM packet - flag forever
    bool input_active:1;    // got ANY valid packet - flag forever
    
    bool rotatePanel:1;
    bool last_sw_ch:1;
    bool one_sec_timer_switch:1;

    bool motor_armed:1;
    bool last_armed_status:1;
    bool was_armed:1;
    bool throttle_on:1;
    bool in_air:1;

    bool blinker:1;
    bool flgMessage:1;
    
    bool mode_switch:1;
    bool osd_got_home:1; // tels if got home position or not
    
    bool flag_05s:1; // sets each 0.5s for setup
    bool flag_01s:1;

    bool flgSensor1:1;
    bool flgSensor2:1;
    bool flgSensor3:1;
    bool flgSensor4:1;

    bool fPulseSensor3:1;
    bool fPulseSensor4:1;

    bool show_screnN:1;
    bool gps_active:1; // было что-то с GPS
    bool vs_ms:1; // vertical speed in m/s;
    bool was_mav_config:1; // was EEPROM write via MAVlink
    
//    bool osd_clear:1;
//MAVLink session control
//    bool mavbeat:1;
//    bool sw_state:1;
//    bool got_baud:1;
//    bool got_protocol:1;
};

#ifdef DEBUG
uint16_t packet_drops = 0; // used only in debug
uint16_t packets_skip = 0;
uint16_t packets_got = 0;

long bytes_comes=0;
uint16_t max_dly=0;
volatile uint16_t lost_bytes;

long mavlink_time=0, mavlink_dt=0;
int mavlink_cnt=0;
#endif

byte skip_inc;

struct loc_flags lflags = {0,0,0,0,0,0,0,0,0,0,0,0,0,0}; // все булевые флаги кучей

// all bools in lflags exclude volatile
volatile byte vsync_wait = 0;

#ifdef PWM_PIN
volatile boolean       New_PWM_Frame = false; // Flag marker for new and changed PWM value
volatile uint16_t      PWM_IN;                // Value to hold PWM signal width. Exact value of it. Normally between 1000 - 2000ms while 1500 is center
volatile unsigned long int_Timer = 0;         // set in the INT1
#endif

byte PWM_out_pin=0;

#if defined(USE_SENSORS)
unsigned int sensorData[4];
#endif

// Setup screen 

typedef void (*fptr)();

struct Params {
    PGM_P name; 	// наименование
    char type;	// тип (f-float, b - byte etc)
    byte k;		// коэффициент сдвига запятой
    void *value;	// адрес самой переменной
    fptr cb;	// callback для применения параметра
    PGM_P fmt;	// формат печати параметра
    int min;		// диапазон изменения параметра
    int max;
};

struct Setup_screen {
    const Params * const ptr;	// описатель экрана
    byte size;		// его размер
    fptr tail;	// функция отображения остального
};

static byte setup_menu=1; // номер строки меню
static byte setup_screen=0; // номер экрана меню
static uint16_t chan_raw_middle[3]; // запомненные при входе значения каналов

const Params *params; // указатель на текущий набор параметров

volatile static uint16_t vsync_count;

#define GPS_MUL 10000000.0f

