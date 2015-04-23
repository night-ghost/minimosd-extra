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
#include <avr/wdt.h>

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
#define MinimOSD

#define TELEMETRY_SPEED  57600  // How fast our MAVLink telemetry is coming to Serial port
#define BOOTTIME         2000   // Time in milliseconds that we show boot loading bar and wait user input
#define LEDPIN AmperagePin



// Objects and Serial definitions
FastSerialPort0(Serial);
OSD osd; //OSD object 

//SimpleTimer  mavilnk_timer;

volatile uint8_t vsync_wait = 0;


extern uint8_t mavlink_got;
extern uint8_t mavlink_on;

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

void setup()     {

    int start_dly=2000;

    pinMode(MAX7456_SELECT,  OUTPUT); // OSD CS

    pinMode(LEDPIN,OUTPUT); // led
    digitalWrite(LEDPIN, 1);  // turn on for full light

//    pinMode(RssiPin, OUTPUT); // доп вывод - выход

    //analogReference(DEFAULT);	// для работы с аналоговыми входами на полный диапазон питания
    analogReference(INTERNAL);  // INTERNAL: a built-in reference, equal to 1.1 volts on the ATmega168 or ATmega328

    wdt_disable();
    
    adc_setup();

//    pinMode(MAX7456_VSYNC,INPUT_PULLUP); - in MAX7456.cpp
    attachInterrupt(INT0, isr_VSYNC, FALLING);

    attachInterrupt(INT1, ReadINT_PIN, CHANGE);  // Attach Reading function to INTERRUPT

    Serial.begin(TELEMETRY_SPEED);
    // setup mavlink port
    mavlink_comm_0_port = &Serial;


    // Prepare OSD for displaying 
    unplugSlaves();

    osd.setPanel(5, 5);
    osd.printf_P(PSTR(OSD_VERSION));
    
    // Get correct settings from EEPROM
    readSettings();

    // Check EEPROM to see if we have initialized it already or not
    // also checks if we have new version that needs EEPROM reset
    if( sets.CHK1_VERSION != VER || sets.CHK2_VERSION != (VER ^ 0x55)) {
        osd.setPanel(1,1);
        osd.printf_P(PSTR("Missing/Old Config: %d my %d |vers %x sets %x"), sets.CHK1_VERSION, VER); 
/*
        osd.printf_P(PSTR("|vers %x sets %x"), (offsetof(Settings,CHK1_VERSION)), EEPROM_offs(sets) ); 
        hex_dump((byte *)&sets,64);
*/

//        InitializeOSD(); нечего дефолтным значениям тут делать
	start_dly=10000;
    }


    panelN = 0; //set panel to 0 to start in the first navigation screen
    readPanelSettings(); // Для первой панели. Для остальных - при переключении

    osd.init();    // Start 
    
    delay(300);

    osd.update();// Show bootloader bar

    delay(start_dly);
    Serial.flush();

#ifdef DEBUG
/*    osd.setPanel(0,0);
    hex_dump((byte *)&panel,0x70);
    osd.update();
    delay(10000); */
#endif

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

byte update_stat = 1; // есть данные для показа

// Mother of all happenings, The loop()
// As simple as possible.
void loop() 
{

    if(millis() > last_timer + 100){ // таймер переименовать надо но и так сойдет
      last_timer = millis();
        On100ms();
    } else if(millis() < last_timer){
	last_timer = millis();
    }


    read_mavlink();

    if(mavlink_got || (lastMAVBeat + 2500 < millis()) && mavlink_on  ){ // были свежие данные - обработать, если данных не было давно - предупредить
      OnMavlinkTimer();
      update_stat = vsync_wait = 1;	// и перерисовать экран
      mavlink_on = mavlink_got;
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

    if(flags.useExtVbattA){ //аналоговый ввод - основное напряжение 
        static uint8_t ind = 0;
        static uint16_t voltageRawArray[8];
        uint16_t voltageRaw = 0;

        voltageRawArray[(ind++)%8] = analogRead(VidvoltagePin);
        for (uint8_t i=0;i<8;i++)
            voltageRaw += voltageRawArray[i];
        osd_vbat_A = float(voltageRaw) * sets.evBattA_koef /1023 / 80; // 8 элементов, коэффициент домножен на 10, 10 бит АЦП

	mavlink_got=1;
// 	вычислить osd_battery_remaining_A по напряжению!
    }

    if(flags.useExtVbattB){ //аналоговый ввод - напряжение видео
        static uint8_t ind = 0;
        static uint16_t voltageRawArray[8];
        uint16_t voltageRaw = 0;

        voltageRawArray[(ind++)%8] = analogRead(VidvoltagePin);
        for (uint8_t i=0;i<8;i++)
            voltageRaw += voltageRawArray[i];
        osd_vbat_B = float(voltageRaw) * sets.evBattB_koef /1023 / 80; // 8 элементов, коэффициент домножен на 10, 10 бит АЦП

// 	вычислить osd_battery_remaining_B по напряжению!

	mavlink_got=1;
    }

    if(flags.useExtCurr){ //аналоговый ввод - ток
        static uint8_t ind = 0;
        static uint16_t currentRawArray[8];
        uint16_t currentRaw = 0;

        currentRawArray[(ind++)%8] = analogRead(AmperagePin);
        for (uint8_t i=0;i<8;i++)
            currentRaw += currentRawArray[i];
        osd_curr_A = float(currentRaw) * sets.eCurrent_koef /1023 / 80; // 8 элементов, коэффициент домножен на 10, 10 бит АЦП
	mavlink_got=1;
    }


    {
        byte ch = sets.RSSI_raw / 2;

        static uint8_t ind = 0;
        static uint16_t RSSI_rawArray[8];

        if(ch == 1 || ch == 2) {
            if(ch == 1) RSSI_rawArray[(ind++)%8] = analogRead(RssiPin);
             else
            if(ch == 2) RSSI_rawArray[(ind++)%8] = pulseIn(RssiPin,HIGH, 15000);

            for (uint8_t i=0;i<8;i++)
                rssi_in += RSSI_rawArray[i];
            rssi_in /= 8; // 8 элементов
	    mavlink_got=1;
	}
    }
}


/* *********************************************** */
/* ******** functions used in main loop() ******** */
void OnMavlinkTimer()
{

    osd_battery_pic_A = setBatteryPic(osd_battery_remaining_A);     // battery A remmaning picture
    osd_battery_pic_B = setBatteryPic(osd_battery_remaining_B);     // battery B remmaning picture

    setHomeVars(osd);   // calculate and set Distance from home and Direction to home
    
    setFdataVars(); // накопление статистики и рекордов

    writePanels();       // writing enabled panels (check OSD_Panels Tab)

}

void unplugSlaves(){
    //Unplug list of SPI
    digitalWrite(MAX7456_SELECT,  HIGH); // unplug OSD
}

