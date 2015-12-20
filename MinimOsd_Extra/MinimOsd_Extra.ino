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
//#include <FastSerial.h>
#include <SingleSerial.h>
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

//#include <EEPROM.h>
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

#define TELEMETRY_SPEED  57600  // How fast our MAVLink telemetry is coming to Serial port
#define BOOTTIME         2000   // Time in milliseconds that we show boot loading bar and wait user input

// #define LEDPIN AmperagePin



// Objects and Serial definitions
//FastSerialPort0(Serial);

SingleSerialPort_x(Serial);
SingleSerial Serial;

OSD osd; //OSD object 

struct loc_flags lflags = {1,1,0,0,0,0,0,0,0,0,0,0,0,0}; // все булевые флаги кучей

// all bools in lflags
volatile uint8_t vsync_wait = 0;
//extern uint8_t mavlink_got;
//extern uint8_t mavlink_on;
//byte update_stat = 1; // есть данные для показа

#define RX_SIZE 128
#define TX_SIZE 16
uint8_t rxBuf[RX_SIZE], txBuf[TX_SIZE];

/* **********************************************/

void isr_VSYNC(){
    vsync_wait=0;


}

volatile boolean       New_PWM_Frame = false; // Flag marker for new and changed PWM value
volatile int           PWM_IN;                // Value to hold PWM signal width. Exact value of it. Normally between 1000 - 2000ms while 1500 is center
volatile unsigned long int_Timer = 0;         // set in the INT1


				//Bat_1 Bat_2 Current RSSI
//const int PROGMEM alt_pins[]= { VoltagePin, VidvoltagePin, AmperagePin, RssiPin };
byte PWM_out_pin=0;


// PWM Measurement
void ReadINT_PIN() {

  // We will start to read when signal goes HIGH
  if(digitalRead(PWM_PIN) == HIGH) {

    // PWM Signal is HIGH, so measure it's length.
    int_Timer = micros();

  } else {

    // If PWM signal is getting LOW and timer is running, it must be falling edge and then we stop timer
    if(int_Timer && !New_PWM_Frame){
      PWM_IN = (int)(micros() - int_Timer);
      int_Timer = 0;

      New_PWM_Frame = true;
    }
  }
}


/* ***************** SETUP() *******************/

void setup()     {
    wdt_disable(); 

    int start_dly=BOOTTIME;

    pinMode(MAX7456_SELECT,  OUTPUT); // OSD CS

#ifdef LEDPIN
    pinMode(LEDPIN,OUTPUT); // led
    digitalWrite(LEDPIN, 1);  // turn on for full light
#endif

    pinMode(PWM_PIN,INPUT_PULLUP);

//    pinMode(RssiPin, OUTPUT); // доп вывод - выход

    //analogReference(DEFAULT);	// для работы с аналоговыми входами на полный диапазон питания
    analogReference(INTERNAL);  // INTERNAL: a built-in reference, equal to 1.1 volts on the ATmega168 or ATmega328

//    wdt_enable(WDTO_2S);
    
    adc_setup(); // do it some faster

//    pinMode(MAX7456_VSYNC,INPUT_PULLUP); - in MAX7456.cpp
    attachInterrupt(INT0, isr_VSYNC, FALLING);

    attachInterrupt(INT1, ReadINT_PIN, CHANGE);  // Attach Reading function to INTERRUPT

//    Serial.begin(TELEMETRY_SPEED);
    Serial.begin(TELEMETRY_SPEED, rxBuf, RX_SIZE, txBuf, TX_SIZE);
    // setup mavlink port
    mavlink_comm_0_port = &Serial;


    // Prepare OSD for displaying 
    unplugSlaves();

    OSD::setPanel(5, 5);
    osd.print_P(PSTR(OSD_VERSION));
    
    // Get correct settings from EEPROM
    readSettings();

    // Check EEPROM to see if we have initialized it already or not
    // also checks if we have new version that needs EEPROM reset
    if( sets.CHK1_VERSION != VER || sets.CHK2_VERSION != (VER ^ 0x55)) {
        OSD::setPanel(1,1);
        osd.printf_P(PSTR("Missing/Old Config: %d my %d |vers %x sets %x"), sets.CHK1_VERSION, VER); 
/*
        osd.printf_P(PSTR("|vers %x sets %x"), (offsetof(Settings,CHK1_VERSION)), EEPROM_offs(sets) ); 
        hex_dump((byte *)&sets,64);
*/

//        InitializeOSD(); нечего дефолтным значениям тут делать
	start_dly=10000; // предупреждение кажем подольше
    }

    const int PROGMEM alt_pins[]= { VoltagePin, VidvoltagePin, AmperagePin, RssiPin };


    if(sets.pwm_src && sets.pwm_dst) { // трансляция PWM на внешний вывод если заданы источник и приемник

	PWM_out_pin = pgm_read_word(&alt_pins[sets.pwm_dst-1]);

	if(PWM_out_pin) {
	    pinMode(PWM_out_pin,  OUTPUT);
	    digitalWrite(PWM_out_pin, 0);
	}
    }

    panelN = 0; //set panel to 0 to start in the first navigation screen
    readPanelSettings(); // Для первой панели. Для остальных - при переключении

    osd.init();    // Start 
    
    delay(100);

    osd.update();// Show bootloader bar

    delay(start_dly);
    Serial.flush();

#ifdef LEDPIN
    pinMode(LEDPIN,OUTPUT); // led
    digitalWrite(LEDPIN, 0);  // turn off on init done
#endif

#ifdef DEBUG
/*    OSD::setPanel(0,0);
    hex_dump((byte *)&panel,0x70);
    osd.update();
    delay(10000); 
*/

/*
    OSD::setPanel(0,0);

    osd.printf_P(PSTR("sets.pwm_src=%d sets.pwm_dst=%d pin=%d VoltagePin=%d"),sets.pwm_src, sets.pwm_dst, PWM_out_pin, VoltagePin);
//    hex_dump((byte *)alt_pins, 8);

    osd.update();
    delay(10000); 
*/    
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


// Mother of all happenings, The loop()
// As simple as possible.
void loop() 
{
    long pt=millis();

    wdt_reset();

    if(pt > timer_100ms + 100){
      timer_100ms = pt;
        On100ms();
    } else if(pt < timer_100ms){
	timer_100ms = pt;
    }

    if(pt > timer_20ms + 20){
      timer_20ms = pt;
        On20ms();
    } else if(pt < timer_20ms){
	timer_20ms = pt;
    }



    read_mavlink();

    if(lflags.mavlink_got || (lastMAVBeat + 2500 < pt) && lflags.mavlink_on  ){ // были свежие данные - обработать, если данных не было давно - предупредить

      OnMavlinkTimer();
      lflags.update_stat = 1; // пришли данные
      vsync_wait = 1;	      // надо перерисовать экран
      lflags.mavlink_on  = lflags.mavlink_got;
    }

    if(lflags.update_stat) {
#ifdef LEDPIN
digitalWrite(LEDPIN, 1); 
#endif
	if(!vsync_wait){ // только во время обратного хода

#ifdef LEDPIN
//digitalWrite(LEDPIN, !digitalRead(LEDPIN)); // Эта строка мигает светодиодом на плате. Удобно и прикольно :)
digitalWrite(LEDPIN, 0); 
#endif
	    osd.update();
	    lflags.update_stat = 0;
        }
    }

    if(New_PWM_Frame){
	New_PWM_Frame=false;

	// data in PWM_IN
#ifdef LEDPIN
//digitalWrite(LEDPIN, !digitalRead(LEDPIN)); // Эта строка мигает светодиодом на плате. Удобно и прикольно :)
#endif
    }
    
}

void On100ms(){ // периодические события, не связанные с поступлением данных MAVLINK

    if(flags.useExtVbattA){ //аналоговый ввод - основное напряжение 
        static uint8_t ind = 0;
        static uint16_t voltageRawArray[8];
        uint16_t voltageRaw = 0;

        voltageRawArray[(ind++)%8] = analogRead(VoltagePin);
        for (uint8_t i=0;i<8;i++)
            voltageRaw += voltageRawArray[i];
        voltageRaw = float(voltageRaw) * sets.evBattA_koef /1023 / 8 * 1000 * 5.115/0.29; // 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка
	if(osd_vbat_A ==0) osd_vbat_A = voltageRaw;
	else               osd_vbat_A = (osd_vbat_A*3 +  voltageRaw)/4;
	lflags.mavlink_got=1;
// 	вычислить osd_battery_remaining_A по напряжению!
	byte n=sets.battv/10 / 3; // количество элементов в батарее
	int v = (float(osd_vbat_A)/1000/n - 2.9) / (4.2 - 2.9) * 255;
	
	if(v<0) osd_battery_remaining_A  = 0;
	else if(v>255) osd_battery_remaining_A  = 255;
	else   osd_battery_remaining_A  = v;

    }

    if(flags.useExtVbattB){ //аналоговый ввод - напряжение видео
        static uint8_t ind = 0;
        static uint16_t voltageBRawArray[8];
        uint16_t voltageRaw = 0;

        voltageBRawArray[(ind++)%8] = analogRead(VidvoltagePin);
        for (uint8_t i=0;i<8;i++)
            voltageRaw += voltageBRawArray[i];
        voltageRaw = float(voltageRaw) * sets.evBattB_koef /1023 / 8 * 1000 * 5.11/0.292113; // 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка

	if(osd_vbat_B ==0) osd_vbat_B = voltageRaw;
	else               osd_vbat_B = (osd_vbat_B *3 +  voltageRaw)/4;
    
// 	вычислить osd_battery_remaining_B по напряжению!
	byte n=sets.battBv/10 / 3; // количество элементов в батарее
	int v = (float(osd_vbat_B)/1000/n - 2.9) / (4.2 - 2.9) * 255;

	if(v<0) osd_battery_remaining_B  = 0;
	else if(v>255) osd_battery_remaining_B  = 255;
	else	osd_battery_remaining_B  = v;
	
	lflags.mavlink_got=1;
    }

    if(flags.useExtCurr){ //аналоговый ввод - ток
        static uint8_t ind = 0;
        static uint16_t currentRawArray[8];
        uint16_t currentRaw = 0;

        currentRawArray[(ind++)%8] = analogRead(AmperagePin);
        for (uint8_t i=0;i<8;i++)
            currentRaw += currentRawArray[i];
        osd_curr_A = float(currentRaw) * sets.eCurrent_koef /1023 / 80 * 1000 / 10 * 20; // 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка
	lflags.mavlink_got=1;
    }


    {
        byte ch = sets.RSSI_raw / 2;

        static uint8_t ind = 0;
        static uint16_t RSSI_rawArray[8];
        int d;

        if(ch == 1 || ch == 2) {
            if(ch == 1) d = analogRead(RssiPin);
            else        d = pulseIn(RssiPin,HIGH, 20000);
            
            RSSI_rawArray[(ind++)%8] = d;
	    
	    d=0;
            for (uint8_t i=0;i<8;i++)
                d += RSSI_rawArray[i];
            rssi_in = (float)d/8 * sets.eRSSI_koef; // 8 элементов
	    lflags.mavlink_got=1;
	}
    }
    
}


void On20ms(){ // 50Hz

    if(PWM_out_pin) { // трансляция PWM на внешний вывод если заданы источник и приемник

	int pwm=chan_raw[sets.pwm_src-1 + 5];
	
        uint8_t bit = digitalPinToBitMask(PWM_out_pin); // move calculations from critical section
        uint8_t port = digitalPinToPort(PWM_out_pin);
        volatile uint8_t *out = portOutputRegister(port);

//#define OUT_PORT(val) if (val == LOW) { *out &= ~bit; } else { *out |= bit; }
#define SET_LOW()   *out &= ~bit
#define SET_HIGH()  *out |= bit

	noInterrupts();		// pulse widh disabled interrups for accuracy
	SET_HIGH(); 		//digitalWrite(PWM_out_pin,1);
	delayMicroseconds(pwm);
	SET_LOW();		//digitalWrite(PWM_out_pin,0);
	interrupts();

    }


}


/* *********************************************** */
/* ******** functions used in main loop() ******** */
void OnMavlinkTimer()
{
    setBatteryPic(osd_battery_remaining_A, osd_battery_pic_A);     // battery A remmaning picture
    setBatteryPic(osd_battery_remaining_B, osd_battery_pic_B);     // battery B remmaning picture

    setHomeVars(osd);   // calculate and set Distance from home and Direction to home

    setFdataVars(); // накопление статистики и рекордов

    writePanels();       // writing enabled panels (check OSD_Panels Tab)
}

inline void unplugSlaves(){   //Unplug list of SPI
    max7456_off();  //digitalWrite(MAX7456_SELECT,  HIGH); // unplug OSD
}

