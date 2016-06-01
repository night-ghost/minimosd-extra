/* #################################################################################################################
* LightTelemetry protocol (LTM) https://github.com/stronnag/mwptools/blob/master/docs/ltm-definition.txt
*
* Ghettostation one way telemetry protocol for really low bitrates (1200/2400 bauds).
*
* Protocol details: 3 different frames, little endian.
*   G Frame (GPS position) (2hz @ 1200 bauds , 5hz >= 2400 bauds): 18BYTES
*    0x24 0x54 0x47 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF  0xFF   0xC0
*     $     T    G  --------LAT-------- -------LON---------  SPD --------ALT-------- SAT/FIX  CRC
*   A Frame (Attitude) (5hz @ 1200bauds , 10hz >= 2400bauds): 10BYTES
*     0x24 0x54 0x41 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xC0
*      $     T   A   --PITCH-- --ROLL--- -HEADING-  CRC
*   S Frame (Sensors) (2hz @ 1200bauds, 5hz >= 2400bauds): 11BYTES
*     0x24 0x54 0x53 0xFF 0xFF  0xFF 0xFF    0xFF    0xFF      0xFF       0xC0
*      $     T   S   VBAT(mv)  Current(ma)   RSSI  AIRSPEED  ARM/FS/FMOD   CRC
* ################################################################################################################# */


/*
static uint8_t LTMserialBuffer[LIGHTTELEMETRY_GFRAMELENGTH - 4];
static uint8_t LTMreceiverIndex;
static uint8_t LTMcmd;
static uint8_t LTMrcvChecksum;
static uint8_t LTMreadIndex;
static uint8_t LTMframelength;
static uint8_t LTMpassed = 0;
static uint8_t crlf_count = 0;
*/

/*
uint8_t ltmread_u8()  {
    return LTMserialBuffer[LTMreadIndex++];
}

uint16_t ltmread_u16() {
    uint16_t t = ltmread_u8();
    t |= (uint16_t)ltmread_u8() << 8;
    return t;
}

uint32_t ltmread_u32() {
    uint32_t t = ltmread_u16();
    t |= (uint32_t)ltmread_u16() << 16;
    return t;
}
*/

//static uint8_t msg.ltm.ok = 0;
//static uint32_t msg.ltm.last_packet;


static inline uint8_t ltm_read_byte(byte pos)  {
    return msg.ltm.serialBuffer[pos];
}


static inline uint16_t ltm_read_uint(byte pos) {
    uint16_t t;
    
    memcpy(&t, msg.ltm.serialBuffer+pos, sizeof(uint16_t));

    return t;
}

static inline  uint32_t ltm_read_ulong(byte pos) {
    uint32_t t;
    
    memcpy(&t, &msg.ltm.serialBuffer + pos, sizeof(uint32_t));
    return t;
}

static inline void ltm_read_len(void *dst, byte pos, byte sz) {
    memcpy(dst, &msg.ltm.serialBuffer + pos, sz);
}

// --------------------------------------------------------------------------------------
// Decoded received commands
static void ltm_check() {

    lflags.ltm_active = true;
    set_data_got();

    switch(msg.ltm.cmd) {
    case LIGHTTELEMETRY_GFRAME:{
        gps_norm(osd_pos.lat,ltm_read_ulong(offsetof(LTM_G, lat) ) );
        gps_norm(osd_pos.lon,ltm_read_ulong(offsetof(LTM_G, lon) ) );
        osd_pos.alt = ltm_read_ulong(offsetof(LTM_G, alt) );       // altitude from cm to m.
        
        osd_groundspeed  = ltm_read_byte(offsetof(LTM_G, speed) ) * 100; // LTM gives m/s, we expect cm/s
        
	uint8_t ltm_satsfix  = ltm_read_byte(offsetof(LTM_G, satsfix) );

        osd_satellites_visible = (ltm_satsfix >> 2) & 0x3F;
        osd_fix_type    = ltm_satsfix & 0b00000011;

	} break;

    case LIGHTTELEMETRY_AFRAME:{
        osd_att.roll  = (int)(ltm_read_uint(offsetof(LTM_A, roll) )) * 10;
        osd_att.pitch = (int)(ltm_read_uint(offsetof(LTM_A, pitch))) * 10;
        osd_att.yaw   = (int)(ltm_read_uint(offsetof(LTM_A, heading)));
        if (osd_att.yaw < 0 ) osd_att.yaw += 360; //convert from -180/180 to 0/360°
        
        if (*((long *)&osd_pos.lat) == 0) { // if no GPS use yaw as heading
            osd_heading = osd_att.yaw;
        }
        
	}break;
	
    case LIGHTTELEMETRY_SFRAME: {
        if(!flags.useExtVbattA){
            osd_vbat_A = ltm_read_uint(offsetof(LTM_S, volt) );
            osd_battery_remaining_A = ltm_read_uint(offsetof(LTM_S, batUsedCapacity) );
        }

	osd_rssi = ltm_read_byte(offsetof(LTM_S, rssi) );
        osd_airspeed = ltm_read_byte(offsetof(LTM_S, airspeed) );

        uint8_t ltm_armfsmode = ltm_read_byte(offsetof(LTM_S, armfsmode) );
        
        lflags.motor_armed = (ltm_armfsmode & 0b00000001) ? 1 : 0;
        //uavData.isFailsafe = (ltm_armfsmode >> 1) & 0b00000001;
        osd_mode = (ltm_armfsmode >> 2) & 0b00111111;

    //    uavData.batCellVoltage = detectBatteryCellVoltage(uavData.batVoltage);  // LTM does not have this info, calculate ourselves
    //    uavData.batCurrent = calculateCurrentFromConsumedCapacity(uavData.batUsedCapacity);
        } break;

    case LIGHTTELEMETRY_OFRAME:
    /* we don't needs this
        uavData.gpsHomeLatitude = (int32_t)ltmread_u32();
        uavData.gpsHomeLongitude = (int32_t)ltmread_u32();
        dummy = (int32_t)(ltmread_u32()) / 100.0f; // altitude from cm to m.
        dummy  = ltmread_u8();
        uavData.gpsFixHome = ltmread_u8();
    */
        break;

    case LIGHTTELEMETRY_NFRAME:
/*
struct LTM_N {
    byte gps_mode; //        None        PosHold       RTH       Mission
    byte nav_mode;
        "None",                 // 0
        "RTH Start",            // 1
        "RTH Enroute",          // 2
        "PosHold infinite",     // 3
        "PosHold timed",        // 4
        "WP Enroute",           // 5
        "Process next",         // 6
        "Jump",                 // 7
        "Start Land",           // 8
        "Land in Progress",     // 9
        "Landed",               // 10
        "Settling before land", // 11
        "Start descent",        // 12
        "Critical GPS failure"  // 15(?)
    byte action;
        UNASSIGNED=0,
        WAYPOINT,
        POSHOLD_UNLIM,
        POSHOLD_TIME,
        RTH,
        SET_POI,
        JUMP,
        SET_HEAD,
        LAND
    byte wpn;	target waypoint N
    byte nav_error;
        "Navigation system is working", // 0
        "Next waypoint distance is more than the safety limit, aborting mission", //1
        "GPS reception is compromised - pausing mission, COPTER IS ADRIFT!", //2
        "Error while reading next waypoint from memory, aborting mission", //3
        "Mission Finished" , //4
        "Waiting for timed position hold", //5
        "Invalid Jump target detected, aborting mission", //6
        "Invalid Mission Step Action code detected, aborting mission", //7
        "Waiting to reach return to home altitude", //8
        "GPS fix lost, mission aborted - COPTER IS ADRIFT!", //9
        "Copter is disarmed, navigation engine disabled", //10
        "Landing is in progress, check attitude if possible" //11
    byte flags;
};
*/
	byte mode = ltm_read_byte(offsetof(LTM_N, gps_mode) );

        break;
    }
}

void read_ltm() {
    uint8_t c;

    enum LTM_serial_state state;

//    uavData.flagTelemetryOk = ((millis() - msg.ltm.last_packet) < 500) ? 1 : 0;

    while (Serial.available()) {
        state=msg.ltm.state;
        c = Serial.read();

again:
        switch(state) {
        case IDLE:
            if(c == '$') state = HEADER_START1;
            //Serial.println("header $" );
            break;
            
        case HEADER_START1:
            if(c == 'T') state = HEADER_START2;
            else goto retry;
            //Serial.println("header T" );
            break;
            
        case HEADER_START2:
    	    byte l;
            switch (c) {
            case 'G':
                l = LIGHTTELEMETRY_GFRAMELENGTH;
                break;
            case 'A':
                l = LIGHTTELEMETRY_AFRAMELENGTH;
                break;
            case 'S':
                l = LIGHTTELEMETRY_SFRAMELENGTH;
                break;
            case 'O':
                l = LIGHTTELEMETRY_OFRAMELENGTH;
                break;
            case 'N':
                l = LIGHTTELEMETRY_NFRAMELENGTH;
                break;
            default:
                goto retry;
            }
            msg.ltm.framelength=l;
            state = HEADER_MSGTYPE;
            msg.ltm.cmd = c;
            msg.ltm.receiverIndex = 0;
            msg.ltm.rcvChecksum = 0;
            break;
        
        case HEADER_MSGTYPE:
            msg.ltm.rcvChecksum ^= c;

            if (msg.ltm.receiverIndex == msg.ltm.framelength - 4) { // received checksum byte
                if (msg.ltm.rcvChecksum == 0) {
                    ltm_check();       // packet got OK
                    if(timeToScreen())  // если надо перерисовать экран
                        return;
                } else {
retry:
            	    state=IDLE;
            	    goto again;                                                   // wrong checksum, drop packet
            	}
            }else  {
        	msg.ltm.serialBuffer[msg.ltm.receiverIndex++] = c;
    	    }
            break;
        }
    }
    msg.ltm.state = state;
}


