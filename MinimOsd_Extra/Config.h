#pragma once

#define IS_PLANE 1  // plane functions
#define IS_COPTER 1 // copter functions
// sets.model_type plane=0 copter=1


// EEPROM Version number, incrementing this will erase/upload factory settings. Only devs should increment this
#define VER 79


#define VERSION "2.4" 

// **************************
//#define DEBUG


/*
    0 - usual minimOSD/microMinimOSD board
    1 - board on ATmega644 and AB7456

*/

#ifndef HARDWARE_TYPE
#define HARDWARE_TYPE 0 // for 328 by default
#endif

#define STARTUP_SCREEN 0

#define TELEMETRY_SPEED  57600  // initial speed of Serial port for CT

#define BOOTTIME         1500   // Time in milliseconds that we show boot loading bar and wait user input


#define MAVLINK_CONFIG 1
#define MAVLINK_READ_EEPROM 1

#if HARDWARE_TYPE == 0


#define MAX7456_SELECT 6        // SS PD6
#define MAX7456_VSYNC 2         // INT0
#define MAX7456_RESET_PIN 10    // RESET

#define DATAOUT 11              // MOSI
#define DATAIN  12              // MISO
#define SPICLOCK  13            // sck


#ifndef DEBUG // don't fit
//#define FONT_UPLOAD 1
#define USE_SETUP 1
#define AUTOBAUD 1
#define USE_SENSORS 1
#endif

//#define PWM_IN_INTERRUPT 1
//#define PWM_BY_INTERRUPT 1 not work :(

#define MAV_REQUEST 1
//#define USE_MAVLINK 1
//#define USE_UAVTALK 1
//#define USE_MWII 1
//#define USE_LTM 1
//#define USE_NMEA 1


#define VSYNC_VECT INT0_vect


// additional pins
#define VoltagePin A2
#define VidvoltagePin A0
#define AmperagePin A1
#define RssiPin A3
#define PWMrssiPin A3           // PWM RSSI uses same pin of analog RSSI A3

// PD3 Int1 - перемычка PAL
// оно может читать PWM по прерываниям!
#define PWM_PIN PD3 

//#define RADIOLINK_TELEM_SDA RssiPin
//#define RADIOLINK_TELEM_SCL AmperagePin

//#define WALKERA_TELEM RssiPin // telemetry output

//#define SERIALDEBUG RssiPin // debug output, conflicts with PWM_BY_INTERRUPT

#if defined(WALKERA_TELEM) || defined(SERIALDEBUG) // don't fit to flash
 #undef MAVLINK_CONFIG
 #undef USE_SENSORS
#endif

#if defined(RADIOLINK_TELEM_SDA) && defined(RADIOLINK_TELEM_SCL) 
 #undef MAVLINK_CONFIG // don't fit :(
 #undef USE_SENSORS
 #undef USE_SETUP
#endif

//#define LEDPIN AmperagePin

#elif HARDWARE_TYPE == 1 // ----------------------      settings for 644 board


/* 644 pinout

         (D 5)    B5     1 /\ 44     B4 (D 4)
         (D 6)    B6    2 /O \ 43    B3 (D 3)
         (D 7)    B7   3 /    \ 42   B2 (D 2)
              /Reset  4 /      \ 41  B1 (D 1)
              Vcc    5 /        \ 40 B0 (D 0)
              Gnd   6 /          \ 39  GND
              Xt1  7 /            \ 38 Vcc
              Xt2 8 /              \ 37    A0  (A0 / D24)
 (D 8)    D0     9 /                \ 36   A1  (A1 / D25)
 (D 9)    D1   10 /                  \ 35  A2  (A2 / D26)
 (D 10)   D2  11 /   TQFP-44          \ 34 A3  (A3 / D27)
 (D 11)   D3  12 \                    / 33 A4  (A4 / D28)
 (D 12)   D4   13 \                  / 32  A5  (A5 / D29)
 (D 13)   D5    14 \                / 31   A6  (A6 / D30)
 (D 14)   D6     15 \              / 30    A7  (A7 / D31)
 (D 15)   D7      16 \            / 29 ARef
              Vcc  17 \          / 28  AGND
              GND   18 \        / 27   AVcc
         (D 16)   C0 19 \      / 26 C7 (D 23)
         (D 17)   C1  20 \    / 25  C6 (D 22)
         (D 18)   C2   21 \  / 24   C5 (D 21)
         (D 19)   C3    22 \/ 23    C4 (D 20)

*/
#define MAX7456_SELECT 14      // SS PD6
#define MAX7456_VSYNC 2        // INT0
#define MAX7456_RESET_PIN 3    // RESET

#define DATAOUT 5              // MOSI
#define DATAIN  6              // MISO
#define SPICLOCK  7            // sck



#define FONT_UPLOAD 1
#define USE_SETUP 1
#define AUTOBAUD 1
#define USE_SENSORS 1

//#define PWM_IN_INTERRUPT 1
//#define PWM_BY_INTERRUPT 1 not work :(

#define MAV_REQUEST 1

//#define USE_MAVLINK 1
//#define USE_UAVTALK 1
//#define USE_MWII 1
//#define USE_LTM 1
//#define USE_NMEA 1

#define VSYNC_VECT INT2_vect



// additional pins
#define VoltagePin A2
#define VidvoltagePin A0
#define AmperagePin A1
#define RssiPin A3
#define PWMrssiPin A3           // PWM RSSI uses same pin of analog RSSI A3

// #define PWM_PIN PD3 - АТМЕЛ враги, совместили выводы int0-int1 и UART2, так что прерывание только одно :(


//********   board has hardware UART2 and I2C


//#define RADIOLINK_TELEM_SDA RssiPin
//#define RADIOLINK_TELEM_SCL AmperagePin

//#define WALKERA_TELEM RssiPin // telemetry output

//#define SERIALDEBUG RssiPin // debug output, conflicts with PWM_BY_INTERRUPT


//#define LEDPIN AmperagePin


#endif


/*****************      END of configuration ******************************************************/

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

#include "compat.h"
#include "eeprom.h"
#include "version.h"


#ifdef DEBUG
  #define DBG_PRINTLN(x)     { Serial.print_P(PSTR(x)); Serial.println();  Serial.wait();  }
  #define DBG_PRINTVARLN(x)  { Serial.print_P(PSTR(#x)); Serial.print_P(PSTR(": ")); Serial.println(x);  Serial.wait(); }
  #define DBG_PRINTVAR(x)    { Serial.print_P(PSTR(#x)); Serial.print_P(PSTR(": ")); Serial.print(x); Serial.print(" "); Serial.wait();  }
  #define DBG_PRINTF(x,...)  { Serial.printf_P(PSTR(x),## __VA_ARGS__); Serial.wait();  }
#elif defined(SERIALDEBUG)
  #define DBG_PRINTLN(x)     { dbgSerial.print_P(PSTR(x)); dbgSerial.println();  dbgSerial.wait();  }
  #define DBG_PRINTVARLN(x)  { dbgSerial.print_P(PSTR(#x)); dbgSerial.print_P(PSTR(": ")); dbgSerial.println(x);  dbgSerial.wait(); }
  #define DBG_PRINTVAR(x)    { dbgSerial.print_P(PSTR(#x)); dbgSerial.print_P(PSTR(": ")); dbgSerial.print(x); dbgSerial.print(" "); dbgSerial.wait();  }
  #define DBG_PRINTF(x,...)  { dbgSerial.printf_P(PSTR(x),## __VA_ARGS__); dbgSerial.wait();  }
#else
  #define DBG_PRINTLN(x)     {}
  #define DBG_PRINTVAR(x)    {}
  #define DBG_PRINTVARLN(x)  {}
  #define DBG_PRINTF(x,...) {}
#endif



static INLINE void max7456_off(){
    PORTD |= _BV(PD6);         //digitalWrite(MAX7456_SELECT,HIGH);
}

static INLINE void max7456_on(){
    PORTD &= ~_BV(PD6);         //digitalWrite(MAX7456_SELECT,LOW);
}


typedef byte byte_32;
typedef byte byte_16;
