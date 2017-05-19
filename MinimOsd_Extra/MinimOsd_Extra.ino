/*
Copyright (c) 2011.  All rights reserved.
An Open Source Arduino based OSD and Camera Control project.

Program  : Minim-OSD 

Version  : V9.14, 30 dec 2016
by Night Ghost

based on:

 minimOSD-extra by Sandro Benigno

Coauthor(s):
Jani Hirvinen   (All the EEPROM routines)
Michael Oborne  (OSD Configurator)
Mike Smith      (BetterStream and Fast Serial libraries)
Gábor Zoltán
Pedro Santos
Special Contribuitor:
Andrew Tridgell by all the support on MAVLink
Doug Weibel by his great orientation since the start of this project
Contributors: James Goppert, Max Levine, Burt Green, Eddie Furey
and all other members of DIY Drones Dev team
Thanks to: Chris Anderson, Jordi Munoz


Project received Donations from (in time order)
 Povl H Pedersen
 Richard Healey
 Lauri Andler
 Esteban Dozsa
 William Studley
 Tony Yeung 
 Marc J MERLIN 
 Сергей Сырескин
 Aleksandr Starostin
 Михаил Павлов
 Jimmy Alexander Castro Sanchez
 Damien Bellet
 Dmitry Yatsenko
 William Foster
 david albella
 SERGEY MAKOVSKIY
 Damir Pinezic
 John Van Brocklin
 Ahmad Ansari Md Repah
 Boris Tekaty
 Aldoir Ventura
 Dean Berg
 Gavin Williams
 Daniel Papst
 mai ruliang
 Dion Brewington
 Marchenko Nikolai
 Marc J MERLIN
 Dean Berg
 Robert Reynolds
 Roi Shriki
 Chan Lofland
 Eddi Maevski

Figures, harm the development of an idiotic question:
 MachVoluM
 brat002
 FyreSG
 Gygax
 lamenace
 Techdragonz


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

// Configurations
#include "Config.h"


#if HARDWARE_TYPE == 0
 #include <SingleSerial.h> // MUST be first
#elif HARDWARE_TYPE == 1
 #include <FastSerial.h> 
#endif


// Get the common arduino functions
#include "Arduino.h"

// AVR Includes
#include <math.h>
#include <inttypes.h>

#if HARDWARE_TYPE!=2 
#include <avr/pgmspace.h>
#include <avr/wdt.h>
#endif

#include "compat.h"
#include "Defs.h"

#include "eeprom.h"

#include "OSD_Max7456.h"
#include "Vars.h"

#include "prototypes.h"


OSD osd; //OSD object 


#if HARDWARE_TYPE == 0

// Objects and Serial definitions
SingleSerialPort(Serial);
#elif HARDWARE_TYPE == 1
FastSerialPort0(Serial);
FastSerialPort1(Serial1);
#endif


#if defined(SERIALDEBUG) && HARDWARE_TYPE == 0
#include "TimerSerial.h"
TimerSerial dbgSerial(0, SERIALDEBUG);
#endif

// program parts
#include "adc_setup.h"
#include "protocols.h"

#include "Config_Func.h"
#include "Func.h"


#if defined(USE_UAVTALK)
#include "protocols/UAVTalk_core.h"
#elif defined(USE_MWII)
#include "protocols/cleanflight_core.h"
#elif defined(USE_LTM)
#include "protocols/LTM_core.h"
#elif defined(USE_MAVLINK)
#include "protocols/MAVLink.h"
BetterStream *mavlink_comm_0_port;
mavlink_system_t mavlink_system = {12,1};  // sysid, compid
#elif defined(USE_NMEA)
#include "protocols/NMEA.h"
#else
#warning "No protocol defined, compiling for MAVlink"
#endif

#include "misc.h"

#if defined(FONT_UPLOAD)
#include "Font.h"
#endif

#include "Panels.h"



#ifdef WALKERA_TELEM
 #include  "WalkeraTelemOut.h"

 WalkeraTelem walkera;
#endif

#if defined(RADIOLINK_TELEM_SDA) && defined(RADIOLINK_TELEM_SCL) 
 #include "RadiolinkTelemOut.h"
#endif


#if ! defined(INTERNAL) && defined(INTERNAL1V1)
#define INTERNAL INTERNAL1V1
#endif
/* **********************************************/


volatile byte vas_vsync=false;

// обработка прерывания по кадровому синхроимпульсу
#if 0 // nested interrupts cause hang on some cameras :(

volatile byte nested=0; 

#if defined(DEBUG)
volatile byte nest_count=0; // only for debugging
#endif

ISR(VSYNC_VECT) {
    vas_vsync=true;
    vsync_wait=0;	// отметить его наличие
    
    vsync_count++; // считаем кадровые прерывания
    vsync_time=millis(); // и отметим его время


    if(nested) {	// вложенное прерывание игнорируем
 #if defined(DEBUG)
       nest_count++;	// ... но запишем в тетрадочку
 #endif
    } else {
	byte tmp=SREG;
        if(update_screen) { // there is data for screen
            nested++;
            sei(); 			// enable other interrupts 
            OSD::update(); 		// do it in interrupt! execution time is ~500uS so without interrupts we will lose serial bytes
                                        //   on 115200 bit time=1/speed = ~87uS so byte time= ~870uS. ATmega's datasheet says that 
                                        //   receive buffer has 2 bytes, so we have time near 3*870uS = ~2500uS before character loss
            update_screen = 0;          
            nested--;
        }
 #if defined(PWM_IN_INTERRUPT) && !defined(SLAVE_BUILD)
        sei(); 			// enable other interrupts - jitter is small because no big calculations in ANOTHER interrupts
        generate_PWM(false);
 #endif
        SREG=tmp;
    }

 #if defined(DEBUG)
    byte sp;

    if(((uint16_t)&sp)<stack_bottom)
        stack_bottom=((uint16_t)&sp);
 #endif
}
#else
ISR(VSYNC_VECT) {
    vas_vsync=true;
    vsync_wait=0;	// отметить его наличие
    
    vsync_count++; // считаем кадровые прерывания
    vsync_time=millis(); // и отметим его время

    if(update_screen) { // there is data for screen
        OSD::update(); 		// do it in interrupt! execution time is ~500uS so without interrupts we will NOT lose serial bytes because:
                                    //   on 115200 bit time=1/speed = ~87uS so byte time= ~870uS. ATmega's datasheet says that 
                                    //   receive buffer has 2 bytes, so we have time near 3*870uS = ~2500uS before character loss
        update_screen = 0;          
    }

 #if defined(DEBUG)
    byte sp;

    if(((uint16_t)&sp)<stack_bottom)
        stack_bottom=((uint16_t)&sp);
 #endif
}
#endif


// PWM Measurement
#if defined(PWM_PIN)
void ReadINT_PIN() {	// прерывание по ноге внешнего PWM
    uint32_t time=micros(); // the 1st place to exclude jitter

    // We will start to read when signal goes HIGH
    if(digitalRead(PWM_PIN) == HIGH) {

        // PWM Signal is HIGH, so measure it's length.
        int_Timer = time;

    } else {        // If PWM signal is getting LOW and timer is running, it must be falling edge and then we stop timer
        uint32_t t= int_Timer; 
        if( t /* && !New_PWM_Frame */){
            time -= t;
            PWM_IN = (int)(time);
            int_Timer = 0;

            New_PWM_Frame = true;
        }
    }
}

ISR(INT1_vect) {
    ReadINT_PIN();
}
#endif



/* ***************** SETUP() *******************/






void setup()     {
    wdt_disable(); 

#ifdef LEDPIN
    pinMode(LEDPIN,OUTPUT); // led
    LED_ON; 		    // turn on for full light
#endif
    Serial.begin(TELEMETRY_SPEED);

#if defined(SERIALDEBUG)
    dbgSerial.begin(38400);
#endif


//    serial_hex_dump((byte *)0x100, 2048);    // memory 2k, user's from &flags to stack

    // Get correct settings from EEPROM
    readSettings();

    if( sets.CHK1_VERSION != VER || sets.CHK2_VERSION != (VER ^ 0x55)) { // wrong version
        lflags.bad_config=1;
    }


//    serial_hex_dump((byte *)0x100, 2048);    // memory 2k, user's from &flags to stack

    // wiring настраивает таймер в режим 3 (FastPWM), в котором регистры компаратора буферизованы. Выключим, пусть будет NORMAL
    TCCR0A &= ~( (1<<WGM01) | (1<<WGM00) );

    if(FLAGS.ref_5v) {
        analogReference(DEFAULT);  // VCC as refrence
    } else {
        analogReference(INTERNAL);  // INTERNAL: a built-in reference, equal to 1.1 volts on the ATmega168 or ATmega328
    }

//    wdt_enable(WDTO_2S); - bootloader don't supports WDT
    
    adc_setup(); // do it some faster

//    attachInterrupt(INT0, isr_VSYNC, FALLING); // 78 bytes
    EICRA = (EICRA & ~((1 << ISC00) | (1 << ISC01))) | (FALLING << ISC00);
    EIMSK |= (1 << INT0);

#if defined(PWM_PIN)
    if(sets.ch_toggle == 1) { // only if used
	pinMode(PWM_PIN, INPUT_PULLUP);
	//attachInterrupt(INT1, ReadINT_PIN, CHANGE);  // Attach Reading function to INTERRUPT
	EICRA = (EICRA & ~((1 << ISC10) | (1 << ISC11))) | (CHANGE << ISC10);
        EIMSK |= (1 << INT1);
    }
#endif

#if defined(USE_MAVLINK)
    mavlink_comm_0_port = &Serial; // setup mavlink port
#endif

Serial.print_P(PSTR("#1zzzzz\n"));


    // Prepare OSD for displaying 
    extern  void unplugSlaves();
    unplugSlaves();
    OSD::update();// clear memory

    sei();



    
#define REL_1 int(RELEASE_NUM/100)
#define REL_2 int((RELEASE_NUM - REL_1*100 )/10) 
#define REL_3 int((RELEASE_NUM - REL_1*100 - REL_2*10  )) 

    if(sets.FW_VERSION[0]!=(REL_1 + '0') || sets.FW_VERSION[1]!=(REL_2 + '0') || sets.FW_VERSION[2]!=(REL_3 + '0') ){
	sets.FW_VERSION[0]=REL_1 + '0';
	sets.FW_VERSION[1]=REL_2 + '0';
	sets.FW_VERSION[2]=REL_3 + '0';
    
	eeprom_write_len( sets.FW_VERSION,  EEPROM_offs(sets) + ((byte *)sets.FW_VERSION - (byte *)&sets),  sizeof(sets.FW_VERSION) );
    }

    if(sets.hw_version!=HARDWARE_TYPE){
        sets.hw_version=HARDWARE_TYPE;

	eeprom_write_len( &sets.hw_version,  EEPROM_offs(sets) + ((byte *)&sets.hw_version - (byte *)&sets),  sizeof(sets.hw_version) );    
    }


    static const byte PROGMEM alt_pins[]= { VoltagePin, VidvoltagePin, AmperagePin, RssiPin };

    if(sets.pwm_src && sets.pwm_dst) { // трансляция PWM на внешний вывод если заданы источник и приемник

	byte PWM_out_pin = pgm_read_byte(&alt_pins[sets.pwm_dst-1]);

        uint8_t port = digitalPinToPort(PWM_out_pin);
        PWM_out_bit  = digitalPinToBitMask(PWM_out_pin); // move out calculations from critical section
        PWM_out_port = portOutputRegister(port);

#if !defined(SLAVE_BUILD)
        generate_PWM(0); // set pin to initial state
	pinMode(PWM_out_pin,  OUTPUT);
#endif
    }

//Serial.print_P(PSTR("#2\n"));

    osd.init();    // Start display

    logo();

//Serial.print_P(PSTR("#after logo\n"));

    LED_OFF;  // turn off on init done

#ifdef DEBUG
/*    OSD::setPanel(0,0);
    hex_dump((byte *)&panel,0x70);
    OSD::update();
    delay(10000); 
*/
/*
    eeprom_read_len((byte *)&msg,  768,  128 );

    OSD::setPanel(0,0);
    hex_dump((byte *)&msg,0x70);
    OSD::update();
    delay(10000); 
*/

#endif

#if defined(RADIOLINK_TELEM_SDA) && defined(RADIOLINK_TELEM_SCL) 
    wire.begin(4, NULL, sendRadiolinkTelemetry ); // slave with address 4
//  Wire.onRequest(onRequestRLTelemetry);
 
#endif

    doScreenSwitch(); // set vars for startup screen
    
//    Serial.print_P(PSTR("#setup done\n"));
    

} // END of setup();



/* ***********************************************/
/* ***************** MAIN LOOP *******************/


// Mother of all happenings, The loop()
// As simple as possible.
void loop() 
{
    unsigned long pt;

    wdt_reset();
    sei(); // на случай если глючит

    pt=millis();     //millis_plus(&pt, 0); much larger

    seconds = pt / 1000;
    
    if(pt < BOOTTIME || lflags.bad_config){ // startup delay for fonts or EEPROM error
//if((pt & 0xf0) == 0)   { Serial.printf_P(PSTR("boot time=%ld\n"),pt); Serial.wait(); }
#if defined(FONT_UPLOAD)
            while(Serial.available_S()) {
                byte c=Serial.read_S();

                if (c == '\n' /* || c == '\r'*/) {
                    crlf_count++;
//DBG_PRINTF("crlf=%d c=%d\n", (int)crlf_count, (int)c);
                } else {
                    crlf_count = 0;
                }

                if (crlf_count > 3) {
/*                    OSD::setPanel(5, 5);
                    osd_print_S(PSTR("font uploading"));
                    OSD::update();// Show it
                    delay_150();
*/
                    uploadFont();
                    return;
                }
            }
#endif
            logo();
            LED_BLINK;
            return;
    }

    
    LED_OFF;  // turn off on init done

//if((pt & 0xf8) == 0)  DBG_PRINTF("time=%ld\n",pt);

#if defined(MAV_REQUEST) && defined(USE_MAVLINK)
    if(apm_mav_system && !lflags.mav_request_done){ // we got HEARTBEAT packet and still don't send requests
        for(byte n = 3; n >0; n--){
            request_mavlink_rates();//Three times to certify it will be readed
            delay_150();
        }
        lflags.mav_request_done=1;
    }
#endif



    getData(); // получить данные с контроллера

    if(lflags.got_data){ // были свежие данные - обработать

	pan_toggle(); // проверить переключение экранов

	if(!lflags.need_redraw) {
	    lflags.need_redraw=1;
	    vsync_wait=1; // будем ждать прерывания
	}

        lflags.got_data=0; // данные обработаны
    }

    if( lflags.need_redraw &&  !vsync_wait) { // сразу после прерывания дабы успеть закончить расчет к следующему
        lflags.need_redraw=0; // экран перерисован

        setHomeVars();   // calculate and set Distance from home and Direction to home

        setFdataVars();  // накопление статистики и рекордов

        writePanels(pt);   // writing enabled panels (check OSD_Panels Tab)

//	LED_BLINK;

//LED_ON; // свечение диода во время ожидания перерисовки экрана
	update_screen = 1; // пришли данные, надо перерисовать экран
    }


/* not used, let PWM data will be ALWAYS actual
    if(New_PWM_Frame){
	New_PWM_Frame=false;

	// data is in PWM_IN
    }
*/

//LED_BLINK;

    if(pt > timer_20ms){
        long_plus(&timer_20ms, 20);
        On20ms();

        if(update_screen && vsync_wait && time_since((uint32_t *)&vsync_time)>50){ // прерывания остановились - с последнего прошло более 50мс
            vsync_wait=0; // хватит ждать
        
            OSD::update(); // обновим принудительно (и далее будем обновлять каждые 20мс)
            update_screen = 0;
        }


    }
    if(pt > timer_100ms){
        long_plus(&timer_100ms, 100);
	On100ms();
	
	lflags.flag_01s = !lflags.flag_01s;
	
	if(lflags.flag_01s) {
	
	    if(skip_inc) {
	        skip_inc++;
	
		if(skip_inc >=3){
		    count02s++;
		    skip_inc=0; // we go again
		}
	        
	    } else 
		count02s++;
	}
//	count01s++;
    }
    if(pt > timer_500ms){
	long_plus(&timer_500ms, 500);
        lflags.got_data=1; // каждые полсекунды принудительно
	
	lflags.flag_05s = 1;

	count05s++;

#ifdef WALKERA_TELEM
        walkera.sendTelemetry(); // 2 times in second
#endif

        lflags.blinker = !lflags.blinker;
        if(lflags.blinker) {
    //        seconds++;
            lflags.one_sec_timer_switch = 1; // for warnings
            
            if(lflags.got_date) day_seconds++; // if we has GPS time - let it ticks

	    if( vas_vsync && vsync_count < 5) { // при частоте кадров их должно быть 25 или 50
	                                            // но есть платы где эта нога не подключена. Китай...
	        max7456_err_count++;
                if(max7456_err_count>3) { // 3 seconds bad sync
#ifdef DEBUG   
                    Serial.printf_P(PSTR("restart MAX! vsync_count=%d\n"),vsync_count);
#endif
                    osd.reset();    // restart MAX7456
                }
	    } else  max7456_err_count=0;

	    vsync_count=0;
            
            heartBeat();

#ifdef DEBUG
	    if(seconds % 30 == 0) {
		extern volatile uint16_t lost_bytes;
	        Serial.printf_P(PSTR("loop time = %dms lost bytes=%d\n"),max_dly, lost_bytes);
	        Serial.printf_P(PSTR("stack bottom = %x\n"),stack_bottom);
//    serial_hex_dump((byte *)0x100, 2048);    // memory 2k, user's from &flags to stack
	    }
#endif
	}
    }


#ifdef DEBUG    
    uint16_t dly=millis() - pt;
    
    if(dly>max_dly)
	max_dly=dly; // накопление максимального времени цикла
#endif

// measured max loop time = ~75ms

}

#if defined(USE_SENSORS)
 #define SENSOR1_ON flgSensor[0]
 #define SENSOR2_ON flgSensor[1]
 #define SENSOR3_ON flgSensor[2]
 #define SENSOR4_ON flgSensor[3]
#else
 #define SENSOR1_ON 0
 #define SENSOR2_ON 0
 #define SENSOR3_ON 0
 #define SENSOR4_ON 0
#endif

float avgRSSI(uint16_t d){
    static uint8_t ind = -1;
    static uint16_t RSSI_rawArray[8];

    RSSI_rawArray[(++ind)%8] = d;
    d=0;
    for (uint8_t i=8;i!=0;)
        d += RSSI_rawArray[--i];

    return d/8.0;
}

byte NOINLINE normalize_voltage(int v){
    if(v<0)        return 0;
    else if(v>255) return 255;
    else           return (byte)v;
}

void On100ms(){ // периодические события, не связанные с поступлением данных MAVLINK

    if(FLAGS.useExtVbattA || SENSOR1_ON){ //аналоговый ввод - основное напряжение 
        static uint8_t ind = -1;
        static uint16_t voltageRawArray[8];
        uint16_t voltageRaw = 0;


        voltageRawArray[(++ind)%8] = analogRead(VoltagePin);
        for (uint8_t i=8;i!=0;)
            voltageRaw += voltageRawArray[--i];

#if defined(USE_SENSORS)
        sensorData[0] =  (sensorData[0]*7 + voltageRaw) /8;
#endif
        if( FLAGS.useExtVbattA ) {
        
            voltageRaw = float(voltageRaw) * sets.evBattA_koef  * ( 1000.0 * 5.115/0.29 /1023.0 / 8.0); // 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка
	    if(osd_vbat_A ==0) osd_vbat_A = voltageRaw;
	    else               osd_vbat_A = (osd_vbat_A*3 +  voltageRaw +2)/4; // комплиментарный фильтр 1/4
	    lflags.got_data=1;
// 	вычислить osd_battery_remaining_A по напряжению!
	    byte n=sets.battv / 33; //( 10* 3.3) number of elements in battery - limit assumed as 3.3v/cell. 10s=35v will not produce error
	     //             voltage above limit in 0.1              max voltage above limit
	    int v = ( (osd_vbat_A+50)/100 - sets.battv  ) * 255L / (42 * n - sets.battv);
	
	    osd_battery_remaining_A=normalize_voltage(v);
	}
    }

//  аналоговый ввод - напряжение видео
    if((FLAGS.useExtVbattB && lflags.battB_is_on) || SENSOR2_ON){ // меряем если есть панель или warning 
        static uint8_t ind = -1;
        static uint16_t voltageBRawArray[8];
        uint16_t voltageRaw = 0;

        voltageBRawArray[(++ind)%8] = analogRead(VidvoltagePin);
        for (uint8_t i=8;i!=0;)
            voltageRaw += voltageBRawArray[--i];

#if defined(USE_SENSORS)
        sensorData[1] = (sensorData[1]*7 + voltageRaw) /8;
#endif
	if(FLAGS.useExtVbattB){
            voltageRaw = float(voltageRaw) * sets.evBattB_koef * (1000.0 * 5.11/0.292113 /1023.0 / 8.0) ; // in mv - 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка

	    if(osd_vbat_B ==0) osd_vbat_B = voltageRaw;
	    else               osd_vbat_B = (osd_vbat_B *3 +  voltageRaw +2)/4;
    
// 		вычислить osd_battery_remaining_B по напряжению!
	    byte n=sets.battBv / 33;  // 3.3*10 количество элементов в батарее
//          int v = (float(osd_vbat_B)/1000/n - 3.3)* ( 255.0 / (4.2 - 3.3) );
	    int v = ( (osd_vbat_B+50)/100 - sets.battBv ) * 255L / (42 * n - sets.battBv);

	    osd_battery_remaining_B=normalize_voltage(v);
	}
    }

    if(FLAGS.useExtCurr || SENSOR3_ON){ //аналоговый ввод - ток
        static uint8_t ind = -1;
        static uint16_t currentRawArray[8];
        uint16_t currentRaw = 0;

	uint16_t d;

#if defined(USE_SENSORS)
	if(fPulseSensor[2])
	    d=pulseIn(AmperagePin,HIGH,10000);
	else
#endif
	    d=analogRead(AmperagePin);
        currentRawArray[(++ind)%8] = d;
        for (uint8_t i=8;i!=0;)
            currentRaw += currentRawArray[--i];
#if defined(USE_SENSORS)
        sensorData[2] = (sensorData[2]*7 + currentRaw) /8;
#endif
        if(FLAGS.useExtCurr) {
            currentRaw = float(currentRaw) * sets.eCurrent_koef  * (1000.0 / 10.0 * 20.0 /1023.0 / 80.0); // 8 элементов, коэффициент домножен на 10, 10 бит АЦП + калибровка

	    if(osd_curr_A ==0) osd_curr_A = currentRaw;
	    else               osd_curr_A = (osd_curr_A *3 + currentRaw +2)/4;
	}

    }


    {
        byte ch = sets.RSSI_raw / 2;

        uint16_t d;


//DBG_PRINTF("\n RSSI ch=%d ", ch);

        switch(ch) {
        case 1:
            d = analogRead(RssiPin);
//DBG_PRINTF("analog_rssi=%d\n", d );
            goto case_2;

        case 2:
            d = pulseIn(RssiPin,HIGH, 20000);
//DBG_PRINTF("pulse_rssi=%d\n", d );


case_2:
	    rssi_in = avgRSSI(d) * sets.eRSSI_koef; // 8 элементов

	    lflags.got_data=1;
	    break;

	case 0:
	    d=osd_rssi;	// mavlink
//DBG_PRINTF("osd_rssi=%d\n", osd_rssi );
	    goto case_4;
	
	case 3: // 3dr modem rssi
	    d=telem_rssi;
//DBG_PRINTF("telem_rssi=%d\n", telem_rssi );
//Serial.printf_P(PSTR("telem_rssi=%d\n"), d); Serial.wait(); << without this RSSI not works
	    goto case_4;
	
	case 4:
	default:
	    d = chan_raw[7]; // ch 8

//DBG_PRINTF("ch8_rssi=%d\n", d );

case_4:
	    rssi_in = avgRSSI(d);

// RSSI source is not pin so we can read it for sensor
#if defined(USE_SENSORS)
	    if(SENSOR4_ON) {
		if(fPulseSensor[3])
		    d=pulseIn(RssiPin,HIGH,10000);
		else
		    d=analogRead(RssiPin);
		    
		sensorData[3] = (sensorData[3]*7 + d) /8;
	    }
#endif
	    break;
	}
    }
}

// loop time can be up to 75ms so 20ms is too optimistic 8)
// but mean looptime is 8..12ms so...
void On20ms(){ // 50Hz
#if !defined(PWM_IN_INTERRUPT) && !defined(SLAVE_BUILD)
    generate_PWM(true);
#endif

#if defined(USE_MWII)
    doMSPrequests();
#endif
}


