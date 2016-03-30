/*
Copyright (c) 2011.  All rights reserved.
An Open Source Arduino based OSD and Camera Control project.

Program  : Minim-OSD 

Version  : V8.15, 26 feb 2016

based on: minimOSD-extra by Sandro Benigno
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

// AVR Includes
#include <SingleSerial.h> // MUST be first

#include "compat.h"

// Configurations
#include "Config.h"

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

#include "ArduCam_Max7456.h"
#include "Vars.h"

#include "prototypes.h"


// Objects and Serial definitions
SingleSerialPort(Serial);

OSD osd; //OSD object 


// program parts
#include "Func.h"

#include "protocols.h"
#if defined(USE_UAVTALK)
#include "UAVTalk_core.h"
#endif

#if defined(USE_MWII)
#include "cleanflight_core.h"
#endif

#include "Config_Func.h"
#include "Panels.h"
#include "MAVLink.h"
#include "Font.h"
#include "adc_setup.h"

#ifdef WALKERA_TELEM
 #include  "WalkeraTelemOut.h"
 
 WalkeraTelem walkera;
#endif

/* **********************************************/

// обработка прерывания по кадровому синхроимпульсу
void isr_VSYNC(){
    vsync_wait=0;	// единственное что нам надо - отметить его наличие
}

// PWM Measurement
#if defined(PWM_PIN)
void ReadINT_PIN() {	// прерывание по ноге внешнего PWM
    uint32_t time=micros(); // the 1st place to exclude jitter

    // We will start to read when signal goes HIGH
    if(digitalRead(PWM_PIN) == HIGH) {

        // PWM Signal is HIGH, so measure it's length.
        int_Timer = time;

    } else {

        // If PWM signal is getting LOW and timer is running, it must be falling edge and then we stop timer
        uint32_t t= int_Timer; 
        if( t /* && !New_PWM_Frame */){
    	    time -= t;
            PWM_IN = (int)(time);
            int_Timer = 0;

            New_PWM_Frame = true;
        }
    }
}
#endif


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

#if defined(PWM_PIN)
    pinMode(PWM_PIN, INPUT_PULLUP);
    attachInterrupt(INT1, ReadINT_PIN, CHANGE);  // Attach Reading function to INTERRUPT
#endif

    // wiring настраивает таймер в режим 3 (FastPWM), в котором регистры компаратора буферизованы. Выключим, пусть будет NORMAL
    TCCR0A &= ~( (1<<WGM01) | (1<<WGM00) );

    analogReference(INTERNAL);  // INTERNAL: a built-in reference, equal to 1.1 volts on the ATmega168 or ATmega328

//    wdt_enable(WDTO_2S); - bootloader don't supports WDT
    
    adc_setup(); // do it some faster

    OSD::update();// clear memory

//    pinMode(MAX7456_VSYNC,INPUT_PULLUP); - in MAX7456.cpp
    attachInterrupt(INT0, isr_VSYNC, FALLING);

    Serial.begin(TELEMETRY_SPEED);
    
    mavlink_comm_0_port = &Serial; // setup mavlink port

    // Prepare OSD for displaying 
    unplugSlaves();
    OSD::update();// clear memory

    OSD::setPanel(5, 5);
    osd.print_P(PSTR(OSD_VERSION));
    
    // Get correct settings from EEPROM
    readSettings();

    // Check EEPROM to see if we have initialized it already or not
    // also checks if we have new version that needs EEPROM reset
    if( sets.CHK1_VERSION != VER || sets.CHK2_VERSION != (VER ^ 0x55)) {
        OSD::setPanel(1,1);
        osd.printf_P(PSTR("Missing/Old Config: %d my %d" /* "|vers %x sets %x"*/ ), sets.CHK1_VERSION, VER); 
/*
        osd.printf_P(PSTR("|vers %x sets %x"), (offsetof(Settings,CHK1_VERSION)), EEPROM_offs(sets) ); 
        hex_dump((byte *)&sets,64);
*/

//        InitializeOSD(); нечего дефолтным значениям тут делать
	start_dly=10000; // предупреждение кажем подольше
    }
    
#define REL_1 int(RELEASE_NUM/100)
#define REL_2 int((RELEASE_NUM - REL_1*100 )/10) 
#define REL_3 int((RELEASE_NUM - REL_1*100 - REL_2*10  )) 

    if(sets.FW_VERSION[0]!=(REL_1 + '0') || sets.FW_VERSION[1]!=(REL_2 + '0') || sets.FW_VERSION[2]!=(REL_3 + '0') ){
	sets.FW_VERSION[0]=REL_1 + '0';
	sets.FW_VERSION[1]=REL_2 + '0';
	sets.FW_VERSION[2]=REL_3 + '0';
    
	eeprom_write_len( sets.FW_VERSION,  EEPROM_offs(sets) + ((byte *)sets.FW_VERSION - (byte *)&sets),  sizeof(sets.FW_VERSION) );
    }


    static const int PROGMEM alt_pins[]= { VoltagePin, VidvoltagePin, AmperagePin, RssiPin };

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

    OSD::update();// Show bootloader bar

//    delay(start_dly);
//    Serial.flush();

#ifdef LEDPIN
    digitalWrite(LEDPIN, 0);  // turn off on init done
#endif

#ifdef DEBUG
/*    OSD::setPanel(0,0);
    hex_dump((byte *)&panel,0x70);
    OSD::update();
    delay(10000); 
*/

/*
    OSD::setPanel(0,0);

    osd.printf_P(PSTR("sets.pwm_src=%d sets.pwm_dst=%d pin=%d VoltagePin=%d"),sets.pwm_src, sets.pwm_dst, PWM_out_pin, VoltagePin);
//    hex_dump((byte *)alt_pins, 8);

    OSD::update();
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
    unsigned long pt;
    pt=millis();     //millis_plus(&pt, 0); much larger

    wdt_reset();

//LED_BLINK;

    if(pt > timer_20ms){
        //timer_20ms = pt + 20;
        millis_plus(&timer_20ms, 20);
        On20ms();
    }
    if(pt > timer_100ms){
        millis_plus(&timer_100ms, 100);
	On100ms();

    }
    if(pt > timer_500ms){
	millis_plus(&timer_500ms, 500);
        lflags.got_data=1; // каждые полсекунды принудительно

#ifdef WALKERA_TELEM
        walkera.sendTelemetry();
#endif

        lflags.blinker = !lflags.blinker;
        if(lflags.blinker) {
            seconds++;
            lflags.one_sec_timer_switch = 1; // for warnings


#ifdef DEBUG    
	    if(seconds % 60 == 30)
	        Serial.printf_P(PSTR("loop time = %dms\n"),max_dly);
#endif
	}
    }

    getData(); // получить данные с контроллера


    if(lflags.update_stat) { // если надо перерисовать экран
	if(!vsync_wait){ // то делаем это только во время обратного хода
//LED_OFF;
	    OSD::update();
	    lflags.update_stat = 0;
        }
    }

/* not used, let PWM data will be ALWAYS actual
    if(New_PWM_Frame){
	New_PWM_Frame=false;

	// data is in PWM_IN
    }
*/

#ifdef DEBUG    
    uint16_t dly=millis() - pt;
    
    if(dly>max_dly)
	max_dly=dly; // накопление максимального времени цикла
#endif

// measured max loop time = ~75ms

}

float avgRSSI(uint16_t d){
    static uint8_t ind = -1;
    static uint16_t RSSI_rawArray[8];

    RSSI_rawArray[(++ind)%8] = d;
    d=0;
    for (uint8_t i=8;i!=0;)
        d += RSSI_rawArray[--i];

    return d/8.0;
}


void On100ms(){ // периодические события, не связанные с поступлением данных MAVLINK

//Serial.printf_P(PSTR("on100ms pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();

    if(flags.useExtVbattA){ //аналоговый ввод - основное напряжение 
        static uint8_t ind = -1;
        static uint16_t voltageRawArray[8];
        uint16_t voltageRaw = 0;

        voltageRawArray[(++ind)%8] = analogRead(VoltagePin);
        for (uint8_t i=8;i!=0;)
            voltageRaw += voltageRawArray[--i];
            
        voltageRaw = float(voltageRaw) * sets.evBattA_koef  * ( 1000.0 * 5.115/0.29 /1023.0 / 8.0); // 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка
	if(osd_vbat_A ==0) osd_vbat_A = voltageRaw;
	else               osd_vbat_A = (osd_vbat_A*3 +  voltageRaw +2)/4; // комплиментарный фильтр 1/4
	lflags.got_data=1;
// 	вычислить osd_battery_remaining_A по напряжению!
	byte n=sets.battv / 33; //( 10* 3.3) number of elements in battery - limit assumed as 3.3v/cell. 10s=35v will not produce error
	 //             voltage above limit in 0.1              max voltage above limit
	int v = ( (osd_vbat_A+50)/100 - sets.battv  ) * 255L / (42 * n - sets.battv);
	
	if(v<0)        osd_battery_remaining_A  = 0;
	else if(v>255) osd_battery_remaining_A  = 255;
	else           osd_battery_remaining_A  = v;

    }

    if(flags.useExtVbattB){ //аналоговый ввод - напряжение видео
        static uint8_t ind = -1;
        static uint16_t voltageBRawArray[8];
        uint16_t voltageRaw = 0;

        voltageBRawArray[(++ind)%8] = analogRead(VidvoltagePin);
        for (uint8_t i=8;i!=0;)
            voltageRaw += voltageBRawArray[--i];
        voltageRaw = float(voltageRaw) * sets.evBattB_koef * (1000.0 * 5.11/0.292113 /1023.0 / 8.0) ; // 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка

	if(osd_vbat_B ==0) osd_vbat_B = voltageRaw;
	else               osd_vbat_B = (osd_vbat_B *3 +  voltageRaw +2)/4;
    
// 	вычислить osd_battery_remaining_B по напряжению!
	byte n=sets.battBv / 33;  // 3.3*10 количество элементов в батарее
//	int v = (float(osd_vbat_B)/1000/n - 3.3)* ( 255.0 / (4.2 - 3.3) );

	int v = ( (osd_vbat_B+50)/100 - sets.battBv ) * 255L / (42 * n - sets.battBv);

	if(v<0)        osd_battery_remaining_B  = 0;
	else if(v>255) osd_battery_remaining_B  = 255;
	else           osd_battery_remaining_B  = v;
	
	lflags.got_data=1;
    }

    if(flags.useExtCurr){ //аналоговый ввод - ток
        static uint8_t ind = -1;
        static uint16_t currentRawArray[8];
        uint16_t currentRaw = 0;

        currentRawArray[(++ind)%8] = analogRead(AmperagePin);
        for (uint8_t i=8;i!=0;)
            currentRaw += currentRawArray[--i];
        currentRaw = float(currentRaw) * sets.eCurrent_koef  * (1000.0 / 10.0 * 20.0 /1023.0 / 80.0); // 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка

	if(osd_curr_A ==0) osd_curr_A = currentRaw;
	else               osd_curr_A = (osd_curr_A *3 + currentRaw +2)/4;

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

//Serial.printf_P(PSTR("on100ms e pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();


}

// loop time can be up to 75ms so 20ms is too optimistic 8)
void On20ms(){ // 50Hz

    if(PWM_out_pin) { // трансляция PWM на внешний вывод если заданы источник и приемник
//Serial.printf_P(PSTR("on20ms pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();

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

//Serial.printf_P(PSTR("on20ms e pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();
}


/* *********************************************** */
/* ******** functions used in main loop() ******** */
void parseNewData(){

//Serial.printf_P(PSTR("parseNewData pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();

    setHomeVars();   // calculate and set Distance from home and Direction to home

    setFdataVars(); // накопление статистики и рекордов

    writePanels();       // writing enabled panels (check OSD_Panels Tab)

//Serial.printf_P(PSTR("parseNewData e pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();

}



