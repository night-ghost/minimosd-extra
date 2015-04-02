/*

Copyright (c) 2011.  All rights reserved.
An Open Source Arduino based OSD and Camera Control project.

Program  : ArduCAM-OSD (Supports the variant: minimOSD)
Version  : V2.1, 24 September 2012
Author(s): Sandro Benigno
Coauthor(s):
Jani Hirvinen   (All the EEPROM routines)
Michael Oborne  (OSD Configutator)
Mike Smith      (BetterStream and Fast Serial libraries)
Gábor Zoltán
Pedro Santos
Special Contribuitor:
Andrew Tridgell by all the support on MAVLink
Doug Weibel by his great orientation since the start of this project
Contributors: James Goppert, Max Levine, Burt Green, Eddie Furey
and all other members of DIY Drones Dev team
Thanks to: Chris Anderson, Jordi Munoz


This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>

*/

/* ************************************************************ */
/* **************** MAIN PROGRAM - MODULES ******************** */
/* ************************************************************ */

#define isPAL 1 // задает размер буфера экрана

/* **********************************************/
/* ***************** INCLUDES *******************/

//#define membug 
//#define FORCEINIT  // You should never use this unless you know what you are doing 


#include "compat.h"

// AVR Includes
#include <FastSerial.h>
#include <AP_Common.h>
#include <AP_Math.h>
#include <math.h>
#include <inttypes.h>
#include <avr/pgmspace.h>
//#include "OSD_Panels.h"
//#include "MAVLink.h"
//#include "Font.h"

// Get the common arduino functions
#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "wiring.h"
#endif

#include <EEPROM.h>
//#include <SimpleTimer.h> - no timer!
#include <GCS_MAVLink.h>

#ifdef membug
#include <MemoryFree.h>
#endif

// Configurations
#include "OSD_Config.h"

#include "ArduCam_Max7456.h"
#include "OSD_Vars.h"
#include "OSD_Func.h"


#include "prototypes.h"

/* *************************************************/
/* ***************** DEFINITIONS *******************/

//OSD Hardware 
//#define ArduCAM328
#define MinimOSD

#define TELEMETRY_SPEED  57600  // How fast our MAVLink telemetry is coming to Serial port
#define BOOTTIME         2000   // Time in milliseconds that we show boot loading bar and wait user input
#define LEDPIN AmperagePin

// Objects and Serial definitions
FastSerialPort0(Serial);
OSD osd; //OSD object 

//SimpleTimer  mavlinkTimer;

volatile uint8_t vsync_wait = 0;


extern uint8_t mavlink_got;

/* **********************************************/

void isr_VSYNC(){
    vsync_wait=0;
}

volatile boolean       New_PWM_Frame = false; // Flag marker for new and changed PWM value
volatile int           PWM_IN;                // Value to hold PWM signal width. Exact value of it. Normally between 1000 - 2000ms while 1500 is center
volatile unsigned long int_Timer = 0;         // set in the INT1

// PWM Measurement
void ReadINT_PIN() {

  // We will start to read when signal goes HIGH
  if(digitalRead(PWM_PIN) == HIGH) {

    // PWM Signal is HIGH, so measure it's length.
    int_Timer = micros();

  } else {

    // If PWM signal is getting LOW and timer is running, it must be falling edge and then we stop timer
    if(int_Timer && (New_PWM_Frame == false))
    {
      PWM_IN = (int)(micros() - int_Timer);
      int_Timer = 0;

      New_PWM_Frame = true;
    }
  }
}


/* ***************** SETUP() *******************/

void setup() 
{
#ifdef ArduCAM328
    pinMode(10, OUTPUT); // USB ArduCam Only
#endif
    pinMode(MAX7456_SELECT,  OUTPUT); // OSD CS

    pinMode(LEDPIN,OUTPUT); // led
    digitalWrite(LEDPIN, 1);  // turn on for full light

    pinMode(RssiPin, OUTPUT); // доп вывод

    analogReference(DEFAULT);	// для работы с аналоговыми входами


//    pinMode(MAX7456_VSYNC,INPUT_PULLUP); - in MAX7456.cpp
    attachInterrupt(INT0, isr_VSYNC, FALLING);

    attachInterrupt(INT1, ReadINT_PIN, CHANGE);  // Attach Reading function to INTERRUPT

    Serial.begin(TELEMETRY_SPEED);
    // setup mavlink port
    mavlink_comm_0_port = &Serial;

#ifdef membug
    Serial.println(freeMem());
#endif

    // Prepare OSD for displaying 
    unplugSlaves();
    osd.init();

    // Start 
    startPanels();
    delay(300);

    // OSD debug for development (Shown at start)
#ifdef membug
    osd.setPanel(1,1);
    osd.printf("%i",freeMem()); 
#endif

    // Just to easy up development things
#ifdef FORCEINIT
    InitializeOSD();
#endif


    // Check EEPROM to see if we have initialized it already or not
    // also checks if we have new version that needs EEPROM reset
    if(readEEPROM(CHK1) + readEEPROM(CHK2) != VER) {
        osd.setPanel(6,9);
        osd.printf_P(PSTR("Missing/Old Config")); 
//        InitializeOSD(); нечего дефолтным значениям тут делать
	writeEEPROM(42, CHK1);
	writeEEPROM(VER-42,CHK2); // но номер версии прописАть таки да
    }

    // Get correct panel settings from EEPROM
    readSettings();

    panel = 0; //set panel to 0 to start in the first navigation screen
    readPanelSettings(); // Для первой панели. Для остальных - при переключении

    osd.update();// Show bootloader bar
    
    delay(2000);
    Serial.flush();

/* no other tasks - get rid of timer!
    // Startup MAVLink timers  
    mavlinkTimer.Set(&OnMavlinkTimer, 120);

    // House cleaning, clear display and enable timers
    osd.clear();
    mavlinkTimer.Enable();
*/


} // END of setup();



/* ***********************************************/
/* ***************** MAIN LOOP *******************/

byte update_stat = 1;

// Mother of all happenings, The loop()
// As simple as possible.
void loop() 
{
/*    //Run "timer" every 100 miliseconds
    if(millis() > mavLinkTimer + 100){
      mavLinkTimer = millis();
      OnMavlinkTimer();
      update_stat = 1;
      vsync_wait = 1;
    }
*/

    if(millis() > mavLinkTimer + 100){ // таймер переименовать надо но и так сойдет
      mavLinkTimer = millis();
      On100ms();
    }


    read_mavlink();

    if(mavlink_got){ // были свежие данные - обработать
      OnMavlinkTimer();
      update_stat =  vsync_wait = 1;	// и перерисовать экран
    }

    if(update_stat) {
	if(!vsync_wait){
	    osd.update();
	    update_stat = 0;
digitalWrite(LEDPIN, !digitalRead(LEDPIN)); // Эта строка мигает светодиодом на плате. Удобно и прикольно :)
        }
    }


    if(New_PWM_Frame){
	New_PWM_Frame=false;

	// data in PWM_IN
    }
    
}

void On100ms(){ // периодические события, не связанные с поступлением данных MAVLINK

// или так
// rssiADC = pulseIn(PWMrssiPin, HIGH,15000)/Settings[S_PWMRSSIDIVIDER]; // Reading W/time out (microseconds to wait for pulse to start: 15000=0.015sec)


    { //аналоговый ввод - напряжение видео
        static uint8_t ind = 0;
        static uint16_t voltageRawArray[8];
        uint16_t voltageRaw = 0;

        voltageRawArray[(ind++)%8] = analogRead(VidvoltagePin);
        for (uint8_t i=0;i<8;i++)
            voltageRaw += voltageRawArray[i];
        osd_vbat_B = float(voltageRaw) * VOLTAGE_RATIO /1023;

	osd_battery_pic_B = setBatteryPic(osd_battery_remaining_B);     // battery B remmaning picture

    }

}


/* *********************************************** */
/* ******** functions used in main loop() ******** */
void OnMavlinkTimer()
{

    osd_battery_pic_A = setBatteryPic(osd_battery_remaining_A);     // battery A remmaning picture

    setHomeVars(osd);   // calculate and set Distance from home and Direction to home
    
    writePanels();       // writing enabled panels (check OSD_Panels Tab)
    
    setFdataVars(); // накопление статистики и рекордов
    
}

void unplugSlaves(){
    //Unplug list of SPI
#ifdef ArduCAM328
    digitalWrite(10,  HIGH); // unplug USB HOST: ArduCam Only
#endif
    digitalWrite(MAX7456_SELECT,  HIGH); // unplug OSD
}

