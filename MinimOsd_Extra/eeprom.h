#pragma once

// EEPROM Stepping,
/* *********************************************** */
// EEPROM Storage addresses

#define OffsetBITpanel       128 // размер для одного экрана

#define EEPROM_MAX_ADDR 1024 // this is 328 chip

#define    EEPROM_offs(mem) offsetof(Eeprom, mem)

#define    ID_of(mem) (offsetof(Panel, mem)/sizeof(Point))

#define OSD_CALL_SIGN_TOTAL 8

#define SENSOR_FORMAT_LENGTH 15// 4+4+15+1 = 24 bytes/sensor

#pragma pack(push,1)

struct Point { // упакованные данные одной панели - координаты и флаги
    byte x;
    byte y;
};

typedef struct Point point;



// Экранные флаги
#define scrFlg_russianHUD  (1<<0)
#define scrFlg_hideHorizon (1<<1)
#define scrFlg_Vario_MS    (1<<2)

// данные одного экрана
struct Panel {
//    point center; 	// #define panCenter_XY = 0; not used
    uint16_t screen_flags; // 0  дополнительные флаги панелей, не влезшие в доп биты самой панели. Пока надо только 1 для горизонта но для соблюдения размера 16 бит

    point pitch;  	// #define panPitch_XY = 2;
    point roll;	  	// #define panRoll_XY = 4;
    point batt_A; 	// #define panBatt_A_XY = 6;
    point batt_B; 	// #define panBatt_B_XY = 8;
    point GPS_sats;	// #define panGPSats_XY = 10;
    point COG;		//#define panCOG_XY = 12;
    point GPS;		//#define panGPS_XY = 14;

    point rose;		//#define panRose_XY = 16;
    point heading;	//#define panHeading_XY = 18;
    point homeDir;      //#define panHomeDir_XY = 20;
    point homeDist;     //#define panHomeDis_XY = 22;
    point WP_dir;       //#define panWPDir_XY = 24;
    point WP_dist;      //#define panWPDis_XY = 26;
    point RSSI;         //#define panRSSI_XY = 28;

    point curr_A;	//#define panCurrA_XY = 30;
    point curr_B;       //#define panCurrB_XY = 32;
    point alt;          //#define panAlt_XY = 34;
    point vel;          //#define panVel_XY = 36;
    point throttle;     //#define panThr_XY = 38;
    point FMod;         //#define panFMod_XY = 40;
    point horizon;      //#define panHorizon_XY = 42;
    point homeAlt;  	//#define panHomeAlt_XY = 44;

    point airSpeed;        //#define panAirSpeed_XY = 46;
    point batteryPercent;  //#define panBatteryPercent_XY = 48;
    point time;            //#define panTime_XY = 50;
    point warn;            //#define panWarn_XY = 52;
    point windSpeed;       //#define panWindSpeed_XY = 54;
    point climb;           //#define panClimb_XY = 56;
    point tune;            //#define panTune_XY = 58;

    point eff;   	//# define panEff_XY = 60;
    point callSign;     // #define panCALLSIGN_XY = 62;
    point ch;           // #define panCh_XY = 64;
    point temp;         // #define panTemp_XY = 66;
    point distance;     // #define panDistance_XY = 68;
    point fVibe;        // 70
    point RadarScale;	// 72
    point Fdata;	// 74
    point message;      // 76
    point sensor1;      // 78
    point sensor2;      // 80
    point sensor3;      // 82
    point sensor4;      // 84
    point Hdop;         // 86
    point State;        // 88
    point Scale;        // 90
    point Power;        // 92
    point CValue;       // 94
    point fDate;        // 96
    point dayTime;      // 98
    point fVario;       // 100
    point pMotor;       // 102
    point coordLat;     // 104
    point coordLon;     // 106
    point fADSB;        // 108
};

union _Panel {
    byte pad[OffsetBITpanel];
    Panel panel;
};


struct Flags { // 4 байта
    bool chkSwitchOnce:1;  		// 0 - instead of batt_percent
    bool measure:1;			// 1
    bool chkSwitch200:1;		// 2 
    bool PAL_NTSC:1;			// 3

// new!
    bool useExtVbattA:1;	// 4
    bool useExtVbattB:1;	// 5
    bool useExtCurr:1;		// 6
    bool AutoScreenSwitch:1;	// 7
    bool results_on:1;		// 8
    
    bool mode_auto:1; 		// 9
    bool xx:1;			// 10 - not used
    bool flgTrack:1;    	// 11 - not used, use panel.al2
    bool ref_5v:1;              // 12 - analog refrence 5v, 1.1 default
};

union _Flags {
    byte pad[4];
    Flags flags;
    uint32_t dw;
};


// общие настройки
struct Settings {
    _Flags flags; // 4 байта флагов

    byte model_type; // 0 - plane 1-copter

    byte ch_toggle; //  2 - ext PWM!
    
    byte OSD_BRIGHTNESS;

    byte overspeed; 
    byte stall;
    byte battv; // уровень предупреждения по напряжению
    
    byte switch_mode; // режим переключения: 0 значение, 1 по кругу TODO move to flags
    byte timeOffset;
    
    uint16_t autoswitch_times; // 4 bits per screen
    
    byte RSSI_raw;
    
    byte batt_warn_level; // уровень предупреждения по заряду
    byte rssi_warn_level;

    byte OSD_CALL_SIGN[OSD_CALL_SIGN_TOTAL+1];

    byte CHK1_VERSION;
    byte CHK2_VERSION;
//0x10
// версия прошивки и символов, для отображения в конфигураторе - в прошивке не используется
    byte FW_VERSION[3]; // TODO 4 bytes
    byte CS_VERSION[3];
//0x16
// new!
    float evBattA_koef;  // коэффициенты внешних измерений
    float evBattB_koef;
    float eCurrent_koef;
    float eRSSI_koef;

    float horiz_kRoll; // коэффициенты горизонта
    float horiz_kPitch;

    float horiz_kRoll_a; // коэффициенты горизонта для NTSC
    float horiz_kPitch_a;
// 0x36
    byte battBv; // мин значение батареи B по напряжению
    
    char vert_offs; // сдвиг экрана по вертикали и горизонтали
    char horiz_offs;

    byte pwm_src; // трансляция PWM на внешний вывод
    byte pwm_dst;
    
    byte n_screens;
    
    uint16_t RSSI_16_low;
    uint16_t RSSI_16_high;

//0x45
    byte pwm_mode; // 0-pwm 1-in/off
    byte hw_version; // written by firmware for CT

    byte halfThrottleCurrent;
    
};

union _Settings {
    Settings sets;
    byte _pad[128]; // место под расширение Settings, за вычетом флагов 
};


struct SensorInfo { // 24 bytes
    float K;				// коэффициент
    float A; 				// additional
    char format[SENSOR_FORMAT_LENGTH+1]; // формат печати
};



union _SensorInfo {
    SensorInfo sensors[4];
    byte _pad[128];
};


struct Strings {
    byte strings[256];
};

#define PANSTATE_STR_ID 0
#define PANSTATE_STR_NO 5



struct Eeprom {
    _Panel panels[4]; // сначала 4 экрана по 128 байт (64 панели возможно), читаются индивидуальные точки по мере необходимости

// 512
    
    _Settings sets; // и до 124 байт EEPROM под остальные настройки, считываемые в RAM при инициализации
    _SensorInfo sensors; // не считываемые настройки - читаются по необходимости

//768
    Strings strings; // strings from CT in one BLOB
    
};

#define FLAGS sets.flags.flags

#pragma pack(pop)

//#if sizeof(struct Eeprom) > 1024
//#error EEPROM overflow!
//#endif

