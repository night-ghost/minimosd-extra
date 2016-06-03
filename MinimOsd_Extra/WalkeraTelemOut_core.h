/*
	used some parts from  bobness09, Mail bobnessdev@gmail.com
	https://github.com/bobness09/Mavlink2Walkera

*/

#include "WalkeraTelemOut.h"

DevoMPacket WalkeraTelem::devoPacket = {DEVOM_SYNC_BYTE, 0};

TimerSerial WalkeraTelem::DevoSerial(0, WALKERA_TELEM); // only tx and no RSSI in DEVO

WalkeraTelem::WalkeraTelem(){
    DevoSerial.begin(38400);
}



long WalkeraTelem::gpsDdToDmsFormat(float &ddm){
    int deg = (int)ddm;
    float mm = (ddm - deg) * 60.0f;

    mm = ((float)deg * 100.0f + mm) /100.0;

    deg = (int) mm;

    if ((deg < -180) || (deg > 180))
	mm = 0.0f;

    return mm * GPS_MUL;
}

void WalkeraTelem::sendTelemetry(){

//  byte n=  DevoSerial._tx_delay;

//  DevoSerial._tx_delay ++; // 132
//  if(DevoSerial._tx_delay == 512) DevoSerial._tx_delay = 100;
//  DevoSerial.printf_P(PSTR("devo test v1234567890 i=%d\n"), DevoSerial._tx_delay);

//  DevoSerial._tx_delay = 214;
//  DevoSerial.printf_P(PSTR("\ndevo 2  test v1234567890 tx=%d\n"), n);

// return;

//    DevoSerial.print_P(PSTR("devo-m telem\n"));

	devoPacket.lat = gpsDdToDmsFormat(osd_pos.lat);
	devoPacket.lon = gpsDdToDmsFormat(osd_pos.lon);

	devoPacket.alt   = (int)(osd_pos.alt / 10.0f); // mm -> cm
	devoPacket.speed = (int)(osd_groundspeed * (0.0194384f * 100.0f));  // * 100 for cm
	devoPacket.volt = osd_vbat_A;
	devoPacket.temp = temperature;

	devoPacket.cs = 0; // Init Checksum with zero Byte

//Serial.printf_P(PSTR("devo start "));

	byte *b = (byte *)&devoPacket;
	for (byte i = sizeof(devoPacket)-1; i !=0; i--) { // excluding CRC
		DevoSerial.write_S(*b);
		devoPacket.cs += *b++; // Add Checksum
	}
	DevoSerial.write_S(devoPacket.cs); // Write Checksum to serial
//Serial.printf_P(PSTR(" crc=%02x\n"), devoPacket.cs);
}

