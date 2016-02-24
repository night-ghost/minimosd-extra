#define IS_PLANE 1  // plane functions
#define IS_COPTER 1 // copter functions

#define USE_UAVTALK 1

// #define DEBUG

// sets.model_type plane=0 copter=1

// EEPROM Version number, incrementing this will erase/upload factory settings.
// Only devs should increment this
#define VER 79


#define VERSION "2.4"
#define RELEASE "r810 DV"


#define TELEMETRY_SPEED  57600  // How fast our MAVLink telemetry is coming to Serial port
//#define TELEMETRY_SPEED  19200  // How fast our MAVLink telemetry is coming to Serial port
#define BOOTTIME         2000   // Time in milliseconds that we show boot loading bar and wait user input


// additional pins
#define VoltagePin A2
#define VidvoltagePin A0
#define AmperagePin A1
#define RssiPin A3
#define PWMrssiPin A3           // PWM RSSI uses same pin of analog RSSI A3
 
//AnalogShift=14

// PD3 Int1 - перемычка PAL
// оно может читать PWM по прерываниям!
#define PWM_PIN PD3 

/////////////////////////////////////////////////

#ifdef IS_COPTER
 #ifdef IS_PLANE
  #define OSD_VERSION "MinimOSD-Extra " VERSION "|uni " RELEASE
 #else
  #define OSD_VERSION "MinimOSD-Extra " VERSION "|Copter " RELEASE
 #endif
#else
 #ifdef IS_PLANE
  #define OSD_VERSION "MinimOSD-Extra " VERSION "|Plane " RELEASE
 #else
  #define OSD_VERSION "MinimOSD-Extra " VERSION "|" RELEASE
 #endif
#endif


#define on 1
#define off 0



#define RC_NEUTRAL 1500     // PWM pulse width for center stick


#include "eeprom.h"

