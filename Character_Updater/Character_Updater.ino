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

#undef PROGMEM 
#define PROGMEM __attribute__(( section(".progmem.data") )) 

#define HARDWARE_TYPE 0
#define USE_MAVLINK 1

#undef PSTR 
#define PSTR(s) (__extension__({static prog_char __c[] PROGMEM = (s); &__c[0];})) 

#define isPAL 1

/* **********************************************/
/* ***************** INCLUDES *******************/

#include "Config.h"
//#define membug 
//#define FORCEINIT  // You should never use this unless you know what you are doing 



// AVR Includes
#include <SingleSerial.h>
//#include <AP_Common.h>
//#include <AP_Math.h>
#include <math.h>
#include <inttypes.h>
#include <avr/pgmspace.h>
// Get the common arduino functions
#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "wiring.h"
#endif


#include "prototypes.h"

#include "Defs.h"

#include "Config_Func.h"

#include "protocols.h"

#include <GCS_MAVLink.h>

#include "OSD_Max7456.h"

#include "eeprom.h"


OSD osd; //OSD object

// Configurations
#include "Vars.h"
#include "Func.h"


//#undef OSD_VERSION
#define OSD_VERSION "MinimOSD-Extra " VERSION "|Character updater "

/* *************************************************/
/* ***************** DEFINITIONS *******************/

//OSD Hardware 
//#define ArduCAM328
#define MinimOSD

#define TELEMETRY_SPEED  57600  // How fast our MAVLink telemetry is coming to Serial port



// Objects and Serial definitions
SingleSerialPort(Serial);


BetterStream *mavlink_comm_0_port;

#include "Font.h"



void isr_VSYNC(){
    vsync_wait=0; // единственное что нам надо - отметить его наличие
}

/* **********************************************/
/* ***************** SETUP() *******************/

void setup() 
{
    pinMode(MAX7456_SELECT,  OUTPUT); // OSD CS

    Serial.begin(TELEMETRY_SPEED);
    // setup mavlink port
    mavlink_comm_0_port = &Serial;

    attachInterrupt(INT0, isr_VSYNC, FALLING);
    

    // Prepare OSD for displaying 
    unplugSlaves();
    osd.init();
    
    osd.setMode(1);

    OSD::setPanel(5, 5);
    osd.print_P(PSTR(OSD_VERSION));

    delay_150();

    OSD::update();// Show bootloader bar

    delay(2000);

    byte n=0;
    OSD::setPanel(0, 0);

    for(byte j=16; j!=0; j--) { // show full font
        for(byte i=16; i!=0; i--)   {
              osd.write(n=='\xFF'?' ':(byte)(n));
              n++;
        }
        osd.write('\xFF');

    }

    osd.update();

} // END of setup();



/* ***********************************************/
/* ***************** MAIN LOOP *******************/

// Mother of all happenings, The loop()
// As simple as possible.
void loop() 
{

    int crlf_count=0;

    while(Serial.available() > 0) {
        uint8_t c = Serial.read();

        /* allow CLI to be started by hitting enter 3 times, if no
        heartbeat packets have been received */
            if (c == '\n' || c == '\r') {
//osd.print_P(PSTR("cr|"));
                crlf_count++;
            } else {
//osd.printf_P(PSTR("no crlf! count was %d char=%d|"), crlf_count, c);
                crlf_count = 0;
            }
            if (crlf_count >= 3) {
//osd.print_P(PSTR("fonts!|"));
                uploadFont();
            }
    }
}


