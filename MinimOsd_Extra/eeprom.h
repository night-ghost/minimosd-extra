// EEPROM Stepping, be careful not to overstep. 
// We reserved floats for just to be sure if some values needs to be
// changed in future.
// byte  = 1
// int   = 4
// float = 8

/* *********************************************** */
// EEPROM Storage addresses

#define OffsetBITpanel       128 // размер для одного экрана


	
	
#define EEPROM_MAX_ADDR 1024 // this is 328 chip


// #define    offsetof(type, mem) ((size_t) ((char *)&((type *) 0)->mem — (char *)((type *)    0)))
#define    EEPROM_offs(mem) offsetof(Eeprom, mem)

#define OSD_CALL_SIGN_TOTAL 8

#pragma pack(push,1)

struct Point {
    byte x;
    byte y;
};

typedef struct Point point;


// 


struct Panel {








    point center; 	// #define panCenter_XY = 0;
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

#define panCurrA_XY = 30;
#define panCurrB_XY = 32;
#define panAlt_XY = 34;
#define panVel_XY = 36;
#define panThr_XY = 38;
#define panFMod_XY = 40;
#define panHorizon_XY = 42;
#define panHomeAlt_XY = 44;
    point curr_A;
    point curr_B;
    point alt;
    point vel;
    point throttle; // panThr
    point FMod;
    point horizon;
    point homeAlt;

#define panAirSpeed_XY = 46;
#define panBatteryPercent_XY = 48;
#define panTime_XY = 50;
#define panWarn_XY = 52;
#define panWindSpeed_XY = 54;
#define panClimb_XY = 56;
#define panTune_XY = 58;
    point airSpeed;
    point batteryPercent;
    point time;
    point warn;
    point windSpeed;
    point climb;
    point tune;

#define panEff_XY = 60;
#define panCALLSIGN_XY = 62;
#define panCh_XY = 64;
#define panTemp_XY = 66;
#define panDistance_XY = 68;
#define panGPS2_XY = 70;

    point eff;
    point callSign;
    point ch;
    point temp;
    point distance;
    point GPS2;

    //point curr_B;
    //point tune;
    //point fdata;
};

union _Panel {
    byte pad[OffsetBITpanel];
    Panel panel;
};


struct Flags { // 4 байта

    bool OSD_BATT_SHOW_PERCENT:1;
    bool measure:1;
    bool RADIO_ON:1;
    bool PAL_NTSC:1;
    
// new!
    bool useExtVbattA:1;// 8
    bool useExtVbattB:1;// 9
    bool useExtCurr:1;	// 10

    bool radar_on:1;	// 11
    bool ils_on:1;	// 12
};

union _Flags {
    byte pad[4];
    Flags flags;
};


struct Settings {
    byte model_type; // 0 - plane 1-copter

    byte ch_toggle; //  9 - ext PWM!
    byte OSD_BRIGHTNESS;

    byte overspeed;
    byte stall;
    byte battv;
    byte switch_mode;
    byte auto_screen_switch;
    
    byte RSSI_high;
    byte RSSI_low; 
    byte RSSI_raw;
    
    byte batt_warn_level;
    byte rssi_warn_level;


    byte OSD_CALL_SIGN[OSD_CALL_SIGN_TOTAL+1];

    byte CHK1_VERSION;
    byte CHK2_VERSION;

// версия прошивки и символов, для отображения в конфигураторе - в прошивке не используется
    byte FW_VERSION[3];
    byte CS_VERSION[3];

// new!
    float evBattA_koef;  // коэффициенты внешних измерений
    float evBattB_koef;
    float eCurrent_koef;
    float eRSSI_koef;

    float horiz_kRoll; // коэффициенты горизонта
    float horiz_kPitch;

    float horiz_kRoll_a; // коэффициенты горизонта для NTSC
    float horiz_kPitch_a;
    
    byte battBv; // мин значение батареи B
};



struct Eeprom {
    _Panel panels[4];
//    byte panels[OffsetBITpanel * 4];
    _Flags flags;
    
    Settings sets;
};

#pragma pack(pop)

//#if sizeof(struct Eeprom) > 1024
//#error EEPROM overflow!
//#endif
