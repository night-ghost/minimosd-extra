/*

    used some parts from  bobness09, Mail bobnessdev@gmail.com
    https://github.com/bobness09/Mavlink2Walkera

*/

#ifndef walkeratelemout_h
#define walkeratelemout_h

#include "TimerSerial.h"
//#include "gSoftSerial.h"

/*
 * DEVO-M Dataframe
 * ----------------------------
 *
 * Length                : 20 Bytes
 * Syncbyte              : 0xAA
 * Payload with Checksum : 19 Bytes
 * Checksum              : crc8 accumulate uint8_t
 *
 * 0xAA : byte 01 : <sync header>
 * 0xD7 : byte 02 : <gps longitude int32_t lowest byte>
 * 0x60 : byte 03 : <gps longitude int32_t>
 * 0xF5 : byte 04 : <gps longitude int32_t>
 * 0x1E : byte 05 : <gps longitude int32_t highest byte>
 * 0x0A : byte 06 : <gps lattitude int32_t lowest byte>
 * 0x96 : byte 07 : <gps lattitude int32_t>
 * 0x89 : byte 08 : <gps lattitude int32_t>
 * 0x04 : byte 09 : <gps lattitude int32_t highest byte>
 * 0x76 : byte 10 : <gps altitude int32_t lowest byte>
 * 0x00 : byte 11 : <gps altitude int32_t>
 * 0x00 : byte 12 : <gps altitude int32_t>
 * 0x00 : byte 13 : <gps altitude int32_t highest byte>
 * 0x00 : byte 14 : <gps ground speed uint16_t lowest byte>
 * 0x00 : byte 15 : <gps ground speed uint16_t highest byte>
 * 0x00 : byte 16 : <unknown value uint16_t lowest byte>
 * 0x00 : byte 17 : <unknown value uint16_t highest byte>
 * 0x52 : byte 18 : <voltage in millivolts uint16_t lower byte>
 * 0x30 : byte 19 : <voltage in millivolts uint16_t upper byte>
 * 0x19 : byte 20 : <crc8 checksum over byte 1-19>
 *
 */

#define DEVOM_DATA_LENGTH	18
#define DEVOM_SYNC_BYTE		0xAA

#pragma pack(push, 1)
typedef struct {
	uint8_t	header;   //< 0xAA for a valid packet
	int32_t lon;
	int32_t lat;
	int32_t alt;
	int16_t speed;
	int16_t temp;
	int16_t volt;
	uint8_t crc8; ///< "CRC" - simple SUM
} DevoMPacket;
#pragma pack(pop)

class WalkeraTelem
{
	
public:
	WalkeraTelem();
	static void sendTelemetry();
	static long gpsDdToDmsFormat(float &ddm);
private:
	static DevoMPacket devoPacket;
	static TimerSerial DevoSerial;
};

#include "WalkeraTelemOut_core.h"

#endif

