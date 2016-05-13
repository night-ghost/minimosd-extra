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

#ifndef LTM_h
#define LTM_h

#define LIGHTTELEMETRY_START1 0x24 //$
#define LIGHTTELEMETRY_START2 0x54 //T
#define LIGHTTELEMETRY_GFRAME 0x47 //G GPS + Baro altitude data ( Lat, Lon, Speed, Alt, Sats, Sat fix)
#define LIGHTTELEMETRY_AFRAME 0x41 //A Attitude data ( Roll,Pitch, Heading )
#define LIGHTTELEMETRY_SFRAME 0x53 //S Sensors/Status data ( VBat, Consumed current, Rssi, Airspeed, Arm status, Failsafe status, Flight mode )
#define LIGHTTELEMETRY_OFRAME 0x4F  //O OSD additionals data ( home pos, home alt, ddirection to home )
#define LIGHTTELEMETRY_NFRAME 0x4E  //N Navigation frame (see INAV)
#define LIGHTTELEMETRY_GFRAMELENGTH 18 // 4 byte header + payload
#define LIGHTTELEMETRY_AFRAMELENGTH 10
#define LIGHTTELEMETRY_SFRAMELENGTH 11
#define LIGHTTELEMETRY_OFRAMELENGTH 18
#define LIGHTTELEMETRY_NFRAMELENGTH 10


enum LTM_serial_state {
    IDLE,
    HEADER_START1,
    HEADER_START2,
    HEADER_MSGTYPE,
    HEADER_DATA
};

typedef struct _LTM {
    uint8_t serialBuffer[LIGHTTELEMETRY_GFRAMELENGTH - 4];
    uint8_t receiverIndex;
    uint8_t cmd;
    uint8_t rcvChecksum;
    uint8_t readIndex;
    uint8_t framelength;
    enum LTM_serial_state state;
} LTM;


struct LTM_G {
    long lat;
    long lon;
    byte speed;    // LTM gives m/s
    long alt;      // altitude from cm to m.
    byte satsfix;
};


struct LTM_A {
    int pitch;
    int roll;
    int heading;
};

struct LTM_S {
    uint16_t volt;
    uint16_t batUsedCapacity;
    byte rssi;
    byte airspeed;
    byte armfsmode;
};

struct LTM_O {
    long homeLat;
    long homeLon;
    long homeAlt;
    byte dummy;
    byte homeFix;
};


/*
Navigation Frame (N)
~~~~~~~~~~~~~~~~~~~~

Payload: 6 bytes

GPS mode, uchar
       None
       PosHold
       RTH
       Mission

Nav mode, uchar
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


Nav Action, uchar (not all used in inav)
    UNASSIGNED=0,
    WAYPOINT,
    POSHOLD_UNLIM,
    POSHOLD_TIME,
    RTH,
    SET_POI,
    JUMP,
    SET_HEAD,
    LAND

Waypoint number, uchar, target waypoint

Nav Error, uchar
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

Flags, uchar ???
*/

struct LTM_N {
    byte gps_mode;
    byte nav_mode;
    byte action;
    byte wpn;
    byte nav_error;
    byte flags;
};


#endif

