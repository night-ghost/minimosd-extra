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

static  /*INLINE*/  inline uint8_t mwii_get_byte()  {
    return msg.mwii.buf[msg.mwii.read_idx++];
}

static inline uint8_t ltm_read_byte(byte pos)  {
    return msg.mwii.buf[msg.mwii.read_idx + pos];
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
void ltm_check() {
    uint32_t dummy;

    msg.ltm.readIndex = 0;
    msg.ltm.last_packet = millis();

    switch(msg.ltm.cmd) {
    case LIGHTTELEMETRY_GFRAME:
        uavData.gpsLatitude = (int32_t)ltmread_u32();
        uavData.gpsLongitude = (int32_t)ltmread_u32();
        uavData.gpsSpeed = ltmread_u8() * 100;            // LTM gives m/s, we expect cm/s
        uavData.altitude = ((int32_t)ltmread_u32());      // altitude from cm to m.
        uint8_t ltm_satsfix = ltmread_u8();

        uavData.gpsNumSat = (ltm_satsfix >> 2) & 0xFF;
        uavData.gpsFix    = ((ltm_satsfix & 0b00000011) <= 1) ? 0 : 1;

        // hpdate home distance and bearing
        if (uavData.gpsFixHome) {
            float rads = fabs((float)uavData.gpsHomeLatitude / 10000000.0f) * 0.0174532925f;
            float scaleLongDown = cos(rads);
            float dstlon, dstlat;

            //DST to Home
            dstlat = fabs(uavData.gpsHomeLatitude - uavData.gpsLatitude) * 1.113195f;
            dstlon = fabs(uavData.gpsHomeLongitude - uavData.gpsLongitude) * 1.113195f * scaleLongDown;
            uavData.gpsHomeDistance = sqrt(sq(dstlat) + sq(dstlon)) / 100.0;

            //DIR to Home
            dstlon = (uavData.gpsHomeLongitude - uavData.gpsLongitude); //OffSet_X
            dstlat = (uavData.gpsHomeLatitude - uavData.gpsLatitude) * (1.0f / scaleLongDown); //OffSet Y

            float bearing = 90 + (atan2(dstlat, -dstlon) * 57.295775); //absolut home direction
            if (bearing < 0) bearing += 360;//normalization
            bearing = bearing - 180;//absolut return direction
            if (bearing < 0) bearing += 360;//normalization
            uavData.gpsHomeBearing = bearing;
        }
        else {
            uavData.gpsHomeBearing = 0;
        }

        msg.ltm.passed = 1;
	break;

    case LIGHTTELEMETRY_AFRAME:
        uavData.anglePitch = (int16_t)ltmread_u16() * 10;
        uavData.angleRoll = (int16_t)ltmread_u16() * 10 ;
        uavData.heading = (int16_t)ltmread_u16();
        if (uavData.heading < 0 ) uavData.heading = uavData.heading + 360; //convert from -180/180 to 0/360°
        msg.ltm.passed = 1;
	break;
	
    case LIGHTTELEMETRY_SFRAME:
        uavData.batVoltage = ltmread_u16();
        uavData.batUsedCapacity = ltmread_u16();
        uavData.rssi = ltmread_u8();
        uavData.airspeed = ltmread_u8();

        uint8_t ltm_armfsmode = ltmread_u8();
        uavData.isArmed = (ltm_armfsmode & 0b00000001) ? 1 : 0;
        uavData.isFailsafe = (ltm_armfsmode >> 1) & 0b00000001;
        uavData.flightMode = (ltm_armfsmode >> 2) & 0b00111111;

        uavData.batCellVoltage = detectBatteryCellVoltage(uavData.batVoltage);  // LTM does not have this info, calculate ourselves
        uavData.batCurrent = calculateCurrentFromConsumedCapacity(uavData.batUsedCapacity);
        break;

    case LIGHTTELEMETRY_OFRAME:
        uavData.gpsHomeLatitude = (int32_t)ltmread_u32();
        uavData.gpsHomeLongitude = (int32_t)ltmread_u32();
        dummy = (int32_t)(ltmread_u32()) / 100.0f; // altitude from cm to m.
        dummy  = ltmread_u8();
        uavData.gpsFixHome = ltmread_u8();
        msg.ltm.passed = 1;
        break;

    case LIGHTTELEMETRY_NFRAME:
        break;
    }
}

void readTelemetry() {
    uint8_t c;


    uavData.flagTelemetryOk = ((millis() - msg.ltm.last_packet) < 500) ? 1 : 0;

    while (Serial.available()) {
        c = char(Serial.read());
again:
        if (msg.ltm.state == IDLE) {
            msg.ltm.state = (c == '$') ? HEADER_START1 : IDLE;
            //Serial.println("header $" );
        }
        else if (msg.ltm.state == HEADER_START1) {
            msg.ltm.state = (c == 'T') ? HEADER_START2 : IDLE;
            //Serial.println("header T" );
        }
        else if (msg.ltm.state == HEADER_START2) {
            switch (c) {
            case 'G':
                LTMframelength = LIGHTTELEMETRY_GFRAMELENGTH;
                msg.ltm.state = HEADER_MSGTYPE;
                break;
            case 'A':
                LTMframelength = LIGHTTELEMETRY_AFRAMELENGTH;
                msg.ltm.state = HEADER_MSGTYPE;
                break;
            case 'S':
                LTMframelength = LIGHTTELEMETRY_SFRAMELENGTH;
                msg.ltm.state = HEADER_MSGTYPE;
                break;
            case 'O':
                LTMframelength = LIGHTTELEMETRY_OFRAMELENGTH;
                msg.ltm.state = HEADER_MSGTYPE;
                break;
            case 'N':
                LTMframelength = LIGHTTELEMETRY_NFRAMELENGTH;
                msg.ltm.state = HEADER_MSGTYPE;
                break;
            default:
                msg.ltm.state = IDLE;
            }
            msg.ltm.statecmd = c;
            msg.ltm.statereceiverIndex = 0;
        }
        else if (msg.ltm.state == HEADER_MSGTYPE) {
            if (msg.ltm.statereceiverIndex == 0) {
                msg.ltm.statercvChecksum = c;
            }
            else {
                msg.ltm.statercvChecksum ^= c;
            }
            if (msg.ltm.statereceiverIndex == msg.ltm.stateframelength - 4) { // received checksum byte
                msg.ltm.state = IDLE;
                if (msg.ltm.statercvChecksum == 0) {
                    ltm_check();
                }
                else {                                                   // wrong checksum, drop packet
		    goto again;
                }
            }
            else msg.ltm.stateserialBuffer[msg.ltm.statereceiverIndex++] = c;
        }
    }
}


