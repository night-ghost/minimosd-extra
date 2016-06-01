/*

adaptaion of MWII/CleanFlight/BaseFlight protocol

all protocol files from KV_Team_OSD project

here is a lots of garbage but I don't want to waste the time for cleaning

*/



#ifndef CLEANFLIGHT_H_
#define CLEANFLIGHT_H_
#include "Arduino.h"
// ---------------------------------------------------------------------------------------
// Defines imported from Multiwii Serial Protocol MultiWii_shared svn r1337
#define MSP_VERSION              0
#define SERIALBUFFERSIZE 128

//to multiwii developpers/committers : do not add new MSP messages without a proper argumentation/agreement on the forum
#define MSP_IDENT                100   //out message         multitype + multiwii version + protocol version + capability variable
#define MSP_STATUS               101   //out message         cycletime & errors_count & sensor present & box activation & current setting number
#define MSP_RAW_IMU              102   //out message         9 DOF
#define MSP_SERVO                103   //out message         8 servos
#define MSP_MOTOR                104   //out message         8 motors
#define MSP_RC                   105   //out message         8 rc chan and more
#define MSP_RAW_GPS              106   //out message         fix, numsat, lat, lon, alt, speed, ground course
#define MSP_COMP_GPS             107   //out message         distance home, direction home
#define MSP_ATTITUDE             108   //out message         2 angles 1 heading
#define MSP_ALTITUDE             109   //out message         altitude, variometer
#define MSP_ANALOG               110   //out message         vbat, powermetersum, rssi if available on RX
#define MSP_RC_TUNING            111   //out message         rc rate, rc expo, rollpitch rate, yaw rate, dyn throttle PID
#define MSP_PID                  112   //out message         P I D coeff (9 are used currently)
#define MSP_BOX                  113   //out message         BOX setup (number is dependant of your setup)
#define MSP_MISC                 114   //out message         powermeter trig
#define MSP_MOTOR_PINS           115   //out message         which pins are in use for motors & servos, for GUI
#define MSP_BOXNAMES             116   //out message         the aux switch names
#define MSP_PIDNAMES             117   //out message         the PID names
#define MSP_WP                   118   //out message         get a WP, WP# is in the payload, returns (WP#, lat, lon, alt, flags) WP#0-home, WP#16-poshold
#define MSP_BOXIDS               119   //out message         get the permanent IDs associated to BOXes

#define MSP_SET_RAW_RC           200   //in message          8 rc chan
#define MSP_SET_RAW_GPS          201   //in message          fix, numsat, lat, lon, alt, speed
#define MSP_SET_PID              202   //in message          P I D coeff (9 are used currently)
#define MSP_SET_BOX              203   //in message          BOX setup (number is dependant of your setup)
#define MSP_SET_RC_TUNING        204   //in message          rc rate, rc expo, rollpitch rate, yaw rate, dyn throttle PID
#define MSP_ACC_CALIBRATION      205   //in message          no param
#define MSP_MAG_CALIBRATION      206   //in message          no param
#define MSP_SET_MISC             207   //in message          powermeter trig + 8 free for future use
#define MSP_RESET_CONF           208   //in message          no param
#define MSP_SET_WP               209   //in message          sets a given WP (WP#,lat, lon, alt, flags)
#define MSP_SELECT_SETTING       210   //in message          Select Setting Number (0-2)
#define MSP_SET_HEAD             211   //in message          define a new heading hold direction

#define MSP_BIND                 240   //in message          no param

#define MSP_EEPROM_WRITE         250   //in message          no param

#define MSP_DEBUGMSG             253   //out message         debug string buffer
#define MSP_DEBUG                254   //out message         debug1,debug2,debug3,debug4
// End of imported defines from Multiwii Serial Protocol MultiWii_shared svn r1333
// ---------------------------------------------------------------------------------------

#define MSP_NONE 0

// Private MSP for use with the GUI
#define MSP_OSD                  220   //in message          starts epprom send to OSD GUI
// Subcommands
#define OSD_NULL                 0
#define OSD_READ_CMD             1
#define OSD_WRITE_CMD            2
#define OSD_GET_FONT             3
#define OSD_SERIAL_SPEED         4
#define OSD_RESET                5
// End private MSP for use with the GUI

#define REQ_MSP_IDENT     (1 <<  0)
#define REQ_MSP_STATUS    (1 <<  1)
#define REQ_MSP_RAW_IMU   (1 <<  2)
#define REQ_MSP_RC        (1 <<  3)
#define REQ_MSP_RAW_GPS   (1 <<  4)
#define REQ_MSP_COMP_GPS  (1 <<  5)
#define REQ_MSP_ATTITUDE  (1 <<  6)
#define REQ_MSP_ALTITUDE  (1 <<  7)
#define REQ_MSP_ANALOG    (1 <<  8)
#define REQ_MSP_RC_TUNING (1 <<  9)
#define REQ_MSP_PID       (1 << 10)
#define REQ_MSP_BOX       (1 << 11)
#define REQ_MSP_FONT      (1 << 12)


	void setMspRequests();
	void blankserialRequest(uint8_t requestMSP);
	void serialMSPreceive();
	void resetFunc();



// crazy MWII vars in free space of MAVlink buffer

struct MWII_mode {
        uint32_t armed;
        uint32_t stable;
        uint32_t horizon;
        uint32_t baro;
        uint32_t mag;
        uint32_t gpshome;
        uint32_t gpshold;
        uint32_t osd_switch;
};

struct MWII_buffer {
        char buf[SERIALBUFFERSIZE];
        byte idx;
        byte crc;
        byte size;
        byte state;
        byte cmd;
        byte read_idx;
        byte chk;
//
        uint32_t modeMSPRequests;
        uint32_t queuedMSPRequests;
        uint32_t sensorActive;

	MWII_mode mode;

        uint8_t nextCharToRequest;
        uint8_t lastCharToRequest;
        uint8_t retransmitQueue;
};




#endif /* PROTOCOL_H_ */