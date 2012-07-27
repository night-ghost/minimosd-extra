
#define on 1
#define off 0

// Versio number, incrementing this will erase/upload factory settings.
// Only devs should increment this
#define VER 74

// EEPROM Stepping, be careful not to overstep. 
// We reserved floats for just to be sure if some values needs to be
// changed in future.
// byte  = 1
// int   = 4
// float = 8

// Panel 8bit REGISTER with BIT positions
// panA_REG Byte has:
#define Cen_BIT        0
#define Pit_BIT        1
#define Rol_BIT        2
#define BatA_BIT       3
#define Bp_BIT         4
#define GPSats_BIT     5
#define GPL_BIT        6
#define GPS_BIT        7

// panB_REG Byte has:
#define Rose_BIT       0
#define Head_BIT       1
#define MavB_BIT       2
#define HDir_BIT       3
#define HDis_BIT       4
#define WDir_BIT       5 //(!Not implemented)
#define WDis_BIT       6 //(!Not implemented)
#define Time_BIT       7 //(!Not implemented)

// panC_REG Byte has:
#define CurA_BIT       0
#define As_BIT         1
#define Alt_BIT        2
#define Vel_BIT        3
#define Thr_BIT        4
#define FMod_BIT       5
#define Hor_BIT        6
#define Halt_BIT       7

// panD_REG Byte has:
#define Warn_BIT       0
#define Off_BIT        1
#define WindS_BIT      2


/* *********************************************** */
// EEPROM Storage addresses

// First of 8 panels
#define panCenter_en_ADDR 0
#define panCenter_x_ADDR 2
#define panCenter_y_ADDR 4
#define panPitch_en_ADDR 6
#define panPitch_x_ADDR 8
#define panPitch_y_ADDR 10
#define panRoll_en_ADDR 12
#define panRoll_x_ADDR 14
#define panRoll_y_ADDR 16
#define panBatt_A_en_ADDR 18
#define panBatt_A_x_ADDR 20
#define panBatt_A_y_ADDR 22
#define panBatt_B_en_ADDR 24
#define panBatt_B_x_ADDR 26
#define panBatt_B_y_ADDR 28
#define panGPSats_en_ADDR 30
#define panGPSats_x_ADDR 32
#define panGPSats_y_ADDR 34
#define panGPL_en_ADDR 36
#define panGPL_x_ADDR 38
#define panGPL_y_ADDR 40
#define panGPS_en_ADDR 42
#define panGPS_x_ADDR 44
#define panGPS_y_ADDR 46

// Second set of 8 panels
#define panRose_en_ADDR 48
#define panRose_x_ADDR 50
#define panRose_y_ADDR 52
#define panHeading_en_ADDR 54
#define panHeading_x_ADDR 56
#define panHeading_y_ADDR 58
#define panMavBeat_en_ADDR 60
#define panMavBeat_x_ADDR 62
#define panMavBeat_y_ADDR 64
#define panHomeDir_en_ADDR 66
#define panHomeDir_x_ADDR 68
#define panHomeDir_y_ADDR 70
#define panHomeDis_en_ADDR 72
#define panHomeDis_x_ADDR 74
#define panHomeDis_y_ADDR 76
#define panWPDir_en_ADDR 80 //(!Not implemented)
#define panWPDir_x_ADDR 82  //
#define panWPDir_y_ADDR 84  //
#define panWPDis_en_ADDR 86 //(!Not implemented)
#define panWPDis_x_ADDR 88  //
#define panWPDis_y_ADDR 90  //
#define panRSSI_en_ADDR 92 //(!Not implemented)
#define panRSSI_x_ADDR 94  //
#define panRSSI_y_ADDR 96  //

// Third set of 8 panels
#define panCur_A_en_ADDR 98 //(!Not implemented)
#define panCur_A_x_ADDR 100 //
#define panCur_A_y_ADDR 102 //
#define panCurB_en_ADDR 104 //(!Not implemented)
#define panCurB_x_ADDR 106 //
#define panCurB_y_ADDR 108 //
#define panAlt_en_ADDR 110
#define panAlt_x_ADDR 112
#define panAlt_y_ADDR 114
#define panVel_en_ADDR 116
#define panVel_x_ADDR 118
#define panVel_y_ADDR 120
#define panThr_en_ADDR 122
#define panThr_x_ADDR 124
#define panThr_y_ADDR 126
#define panFMod_en_ADDR 128
#define panFMod_x_ADDR 130
#define panFMod_y_ADDR 132
#define panHorizon_en_ADDR 134
#define panHorizon_x_ADDR 136
#define panHorizon_y_ADDR 138
#define panHomeAlt_en_ADDR 140
#define panHomeAlt_x_ADDR 142
#define panHomeAlt_y_ADDR 144
#define panAirSpeed_en_ADDR 146
#define panAirSpeed_x_ADDR 148
#define panAirSpeed_y_ADDR 150
#define panBatteryPercent_en_ADDR 152
#define panBatteryPercent_x_ADDR 154
#define panBatteryPercent_y_ADDR 156
#define panTime_en_ADDR 158
#define panTime_x_ADDR 160
#define panTime_y_ADDR 162
#define panWarn_en_ADDR 164
#define panWarn_x_ADDR 166
#define panWarn_y_ADDR 168
#define panOff_en_ADDR 170
#define panOff_x_ADDR 172
#define panOff_y_ADDR 174
#define panWindSpeed_en_ADDR 176
#define panWindSpeed_x_ADDR 178
#define panWindSpeed_y_ADDR 180

#define CHK1 1000
#define CHK2 1006

#define EEPROM_MAX_ADDR 1024 // this is 328 chip
