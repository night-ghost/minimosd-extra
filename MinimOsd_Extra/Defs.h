#pragma once

#ifndef SLAVE_BUILD
#pragma pack(push,1)
#endif

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

struct Coords {
    float lat;
    float lon;
    long alt; // altitude GPS
};

#ifndef SLAVE_BUILD
#pragma pack(pop)
#endif

#pragma pack(push,1)

struct Att {
    int16_t             pitch;                  // pitch from DCM
    int16_t             roll;                   // roll from DCM
    int16_t             yaw;                    // yaw from DCM
};


struct loc_flags {
//    bool update_screen:1; 	// есть данные для показа
    bool got_data;		// флаг получения пакета
    bool need_redraw;         // надо перерисовать экран

    bool input_active;    // got ANY valid packet - flag forever
    bool data_mode;
    
    bool rotatePanel;
    bool last_sw_ch;
    bool one_sec_timer_switch;

    bool motor_armed;
    bool last_armed_status;
    bool was_armed:1;
    bool throttle_on;
    bool in_air:1;

    bool blinker;
    bool flgMessage:1;
    
    bool mode_switch:1;
    bool osd_got_home; // tels if got home position or not
    
    bool flag_05s; // sets each 0.5s for setup
    bool flag_01s;

    bool show_screnN:4;
    bool gps_active; // было что-то с GPS
    bool vs_ms; // vertical speed in m/s;
    bool was_mav_config; // was EEPROM write via MAVlink
    
    bool fdata;	// show FData screen

    bool autosw; // automatic screen switch

    bool mav_request_done;
    
    uint8_t mav_data_frozen;
    uint8_t mav_stream_overload;

    bool bad_config;
    bool got_date;
    
    bool battB_is_on;
    bool resetHome;
};

typedef void (*fptr)();

struct Params {
    PGM_P name; 	// наименование
    char type;	// тип (f-float, b - byte etc)
    void *value;	// адрес самой переменной
    byte fmt_mm;       // формат печати параметра (старш 4) и диапазон изменения параметра (младш 4)
};

struct Setup_screen {
    const Params * const ptr;	// описатель экрана
    byte size;		// его размер
    fptr tail;	// функция отображения остального
};


#pragma pack(pop)
