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

// Configurations
#include "Config.h"

// AVR Includes
#include <SingleSerial.h>

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

#ifdef membug
#include "MemoryFree.h"
#endif

#include "ArduCam_Max7456.h"
#include "Vars.h"


#include "prototypes.h"



// Objects and Serial definitions
SingleSerialPort(Serial);

OSD osd; //OSD object 

struct loc_flags lflags = {1,1,0,0,0,0,0,0,0,0,0,0,0,0}; // все булевые флаги кучей

// all bools in lflags
volatile uint8_t vsync_wait = 0;

volatile boolean       New_PWM_Frame = false; // Flag marker for new and changed PWM value
volatile int           PWM_IN;                // Value to hold PWM signal width. Exact value of it. Normally between 1000 - 2000ms while 1500 is center
volatile unsigned long int_Timer = 0;         // set in the INT1

				//Bat_1 Bat_2 Current RSSI
//const int PROGMEM alt_pins[]= { VoltagePin, VidvoltagePin, AmperagePin, RssiPin };
byte PWM_out_pin=0;


// program parts

#include "protocols.h"
#if defined(USE_UAVTALK)// TODO: let it compile
#include "UAVTalk_core.h"
#endif

#include "Func.h"
#include "Config_Func.h"
#include "Panels.h"
#include "MAVLink.h"
#include "Font.h"
#include "adc_setup.h"




// #define LEDPIN AmperagePin

#ifdef LEDPIN
 #define LED_BLINK digitalWrite(LEDPIN, !digitalRead(LEDPIN)) // Эта строка мигает светодиодом на плате. Удобно и прикольно :)
 #define LED_ON digitalWrite(LEDPIN, HIGH) 
 #define LED_OFF digitalWrite(LEDPIN, LOW) 
#else
 #define LED_BLINK {}
 #define LED_ON {} 
 #define LED_OFF {}
#endif



/* **********************************************/

void isr_VSYNC(){
    vsync_wait=0;
}

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


void delay_150(){
    delay(150);
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

    Serial.begin(TELEMETRY_SPEED);
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
    
    delay_150();

    osd.update();// Show bootloader bar

    delay(start_dly);
    Serial.flush();

#ifdef LEDPIN
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


} // END of setup();



/* ***********************************************/
/* ***************** MAIN LOOP *******************/


// Mother of all happenings, The loop()
// As simple as possible.
void loop() 
{
    long pt=millis();

    wdt_reset();

    if(pt > timer_20ms){
        timer_20ms = pt + 20;
        On20ms();

	if(++count_100ms>5) {
	    count_100ms=0;
	    On100ms();

	}
	if(++count_1s>25) {
	    count_1s=0;

            lflags.got_data=1; // каждые полсекунды принудительно

            lflags.blinker = !lflags.blinker;
            if(lflags.blinker) {
                seconds++;
	        lflags.one_sec_timer_switch = 1; // for warnings

#ifdef DEBUG    
		if(seconds % 60 == 30)
		Serial.printf_P(PSTR("loop time = %sms\n"),max_dly);
#endif
	    }
	}
    }

    getData(); // получить данные с контроллера

    pan_toggle(); // проверить переключение экранов

    if(lflags.got_data /* || (lastMAVBeat + 2500 < pt ) && lflags.mavlink_on */  ){ // были свежие данные - обработать, если данных не было давно - предупредить
        lflags.got_data=0;
        parseNewData();

	LED_BLINK;

        lflags.update_stat = 1; // пришли данные
        vsync_wait = 1;	      // надо перерисовать экран
//LED_ON;
    }

    if(lflags.update_stat) { // если надо перерисовать экран
	if(!vsync_wait){ // то делаем это только во время обратного хода
//LED_OFF;
	    osd.update();
	    lflags.update_stat = 0;
        }
    }

    if(New_PWM_Frame){
	New_PWM_Frame=false;

	// data is in PWM_IN
    }

#ifdef DEBUG    
    uint16_t dly=millis() - pt;
    
    if(dly>max_dly)
	max_dly=dly; // накопление максимального времени цикла
#endif
}

float avgRSSI(uint16_t d){
    static uint8_t ind = 0;
    static uint16_t RSSI_rawArray[8];

    RSSI_rawArray[(ind++)%8] = d;
    d=0;
    for (uint8_t i=0;i<8;i++)
        d += RSSI_rawArray[i];

    return d/8.0;
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
	lflags.got_data=1;
// 	вычислить osd_battery_remaining_A по напряжению!
	byte n=sets.battv/10 / 3; // количество элементов в батарее
	int v = (float(osd_vbat_A)/1000/n - 3.3) / (4.2 - 3.3) * 255;
	
	if(v<0) osd_battery_remaining_A  = 0;
	else if(v>255) osd_battery_remaining_A  = 255;
	else           osd_battery_remaining_A  = v;

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
	int v = (float(osd_vbat_B)/1000/n - 3.3) / (4.2 - 3.3) * 255;

	if(v<0) osd_battery_remaining_B  = 0;
	else if(v>255) osd_battery_remaining_B  = 255;
	else	osd_battery_remaining_B  = v;
	
	lflags.got_data=1;
    }

    if(flags.useExtCurr){ //аналоговый ввод - ток
        static uint8_t ind = 0;
        static uint16_t currentRawArray[8];
        uint16_t currentRaw = 0;

        currentRawArray[(ind++)%8] = analogRead(AmperagePin);
        for (uint8_t i=0;i<8;i++)
            currentRaw += currentRawArray[i];
        osd_curr_A = float(currentRaw) * sets.eCurrent_koef /1023 / 80 * 1000 / 10 * 20; // 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка
	lflags.got_data=1;
    }


    {
        byte ch = sets.RSSI_raw / 2;

        unsigned int d;

	switch(ch) {
        case 1:
    	    d = analogRead(RssiPin);
    	    goto case_2;

        case 2:
            d = pulseIn(RssiPin,HIGH, 20000);
case_2:
	    rssi_in = avgRSSI(d) * sets.eRSSI_koef; // 8 элементов

	    lflags.got_data=1;
	    break;

	case 0:
	    d=osd_rssi;	// mavlink
	    goto case_4;
	 
	case 4:
	    d = chan_raw[7]; // ch 8
case_4:
	    rssi_in = avgRSSI(d);
	    break;
	}
    }


// timers


}


void On20ms(){ // 50Hz

    if(PWM_out_pin) { // трансляция PWM на внешний вывод если заданы источник и приемник

	int pwm=chan_raw[sets.pwm_src-1 + 5];
	
        uint8_t bit = digitalPinToBitMask(PWM_out_pin); // move out calculations from critical section
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
void parseNewData(){
    setBatteryPic(osd_battery_remaining_A, osd_battery_pic_A);     // battery A remmaning picture
    setBatteryPic(osd_battery_remaining_B, osd_battery_pic_B);     // battery B remmaning picture

    setHomeVars(osd);   // calculate and set Distance from home and Direction to home

    setFdataVars(); // накопление статистики и рекордов
    writePanels();       // writing enabled panels (check OSD_Panels Tab)
}

inline void unplugSlaves(){   //Unplug list of SPI
    max7456_off();  //digitalWrite(MAX7456_SELECT,  HIGH); // unplug OSD
}


