/*
	used some parts from  bobness09, Mail bobnessdev@gmail.com
	https://github.com/bobness09/Mavlink2Walkera

*/

#include "WalkeraTelemOut.h"

DevoMPacket WalkeraTelem::devoPacket = {DEVOM_SYNC_BYTE, 0};

SoftwareSerial WalkeraTelem::DevoSerial(0, WALKERA_TELEM); // only tx and no RSSI in DEVO

WalkeraTelem::WalkeraTelem(){
//    devoPacket.header = DEVOM_SYNC_BYTE;

    DevoSerial.begin(38400);
}



long WalkeraTelem::gpsDdToDmsFormat(float ddm){
    int deg = (int)ddm;
    float mm = (ddm - deg) * 60.0f;

    mm = ((float)deg * 100.0f + mm) /100.0;

    if ((mm < -180.0f) || (mm > 180.0f))
	mm = 0.0f;

    return mm * 10000000.0f;
}

void WalkeraTelem::sendTelemetry()
{
	devoPacket.lat = gpsDdToDmsFormat(osd_lat);
	devoPacket.lon = gpsDdToDmsFormat(osd_lon);


	devoPacket.alt   = (int)(osd_alt_gps / 100.0f); // is already cm!
	devoPacket.speed = (int)(osd_groundspeed * 0.0194384f * 100.0f);  // * 100 for cm
	devoPacket.volt = osd_vbat_A;
	devoPacket.temp = temperature;


	devoPacket.crc8 = 0; // Init Checksum with zero Byte
	byte *b = (byte *)&devoPacket;
    
	for (byte i = sizeof(devoPacket)-1; i !=0; i--) { // excluding CRC
		DevoSerial.write(*b);
		devoPacket.crc8 += *b++; // Add Checksum
	}
	DevoSerial.write(devoPacket.crc8); // Write Checksum to serial
}

