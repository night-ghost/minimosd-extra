#define IS_PLANE 1  // plane functions
#define IS_COPTER 1 // copter functions
// sets.model_type plane=0 copter=1




// EEPROM Version number, incrementing this will erase/upload factory settings. Only devs should increment this
#define VER 79


#define VERSION "2.4"


//#define DEBUG
#define STARTUP_SCREEN 2

#define USE_UAVTALK 1
#define USE_MWII 1
#define USE_LTM 1
#define AUTOBAUD 1
#define USE_SENSORS 1

#define TELEMETRY_SPEED  57600  // initial speed of Serial port for CT

#define BOOTTIME         1300   // Time in milliseconds that we show boot loading bar and wait user input


// additional pins
#define VoltagePin A2
#define VidvoltagePin A0
#define AmperagePin A1
#define RssiPin A3
#define PWMrssiPin A3           // PWM RSSI uses same pin of analog RSSI A3

// PD3 Int1 - перемычка PAL
// оно может читать PWM по прерываниям!
#define PWM_PIN PD3 

//#define WALKERA_TELEM RssiPin // telemetry output


//#define LEDPIN AmperagePin

/*      END of configuration */

#ifdef LEDPIN
 #define LED_BLINK digitalWrite(LEDPIN, !digitalRead(LEDPIN)) // Эта строка мигает светодиодом на плате. Удобно и прикольно :)
 #define LED_ON digitalWrite(LEDPIN, HIGH)
 #define LED_OFF digitalWrite(LEDPIN, LOW)
#else
 #define LED_BLINK {}
 #define LED_ON {}
 #define LED_OFF {}
#endif

/////////////////////////////////////////////////

#ifdef IS_COPTER
 #ifdef IS_PLANE
  #define OSD_MODEL "uni"
 #else
  #define OSD_MODEL "Copter"
 #endif
#else
 #ifdef IS_PLANE
  #define OSD_MODEL  "Plane"
 #else
  #define OSD_MODEL  "" 
 #endif
#endif


#define on 1
#define off 0


#define RC_NEUTRAL 1500     // PWM pulse width for center stick


#include "eeprom.h"
#include "version.h"

