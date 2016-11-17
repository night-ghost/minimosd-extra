#include "I2c_soft_slave.h"


Soft_I2C wire(RADIOLINK_TELEM_SCL, RADIOLINK_TELEM_SDA);


// from https://github.com/cleanflight/cleanflight/issues/1690#issuecomment-234575579

// Wire.begin(4); - slave with address 4
//  Wire.onRequest(onRequestRLTelemetry);

void set1() {

  int  alt = osd_pos.alt / 10;

  uint16_t  speed =  osd_groundspeed * 1000;

  byte buffer[16] = {
    0x89, 0xAB, 
    osd_satellites_visible, 
    BYTE_OF(alt, 1), BYTE_OF(alt, 0),
    BYTE_OF(osd_heading, 1), BYTE_OF(osd_heading, 0),
    BYTE_OF(speed, 1), BYTE_OF(speed, 0),
    BYTE_OF(osd_att.roll, 1), BYTE_OF(osd_att.roll, 0),
    BYTE_OF(osd_att.pitch, 1), BYTE_OF(osd_att.pitch, 0),
    BYTE_OF(osd_home_distance, 1), BYTE_OF(osd_home_distance, 0),
    0x00
  };
  wire.write(buffer, 16);
}

void set2() {


  int  rise = osd_climb*1000;

  byte buffer[16] = {
    0x89, 0xCD, 
    osd_satellites_visible, 
    BYTE_OF(rise, 1), BYTE_OF(rise, 0),
    BYTE_OF(osd_vbat_A, 1), BYTE_OF(osd_vbat_A, 0),
    BYTE_OF(osd_pos.lon, 3), BYTE_OF(osd_pos.lon, 2), BYTE_OF(osd_pos.lon, 1), BYTE_OF(osd_pos.lon, 0),
    BYTE_OF(osd_pos.lat, 3), BYTE_OF(osd_pos.lat, 2), BYTE_OF(osd_pos.lat, 1), BYTE_OF(osd_pos.lat, 0),
    0x00
  };
  
  wire.write(buffer, 16);
}


void sendRadiolinkTelemetry() {
    static bool f=false;
  if (f) {
    set1();
  } else {
    set2();
  }
  f=!f;
}


