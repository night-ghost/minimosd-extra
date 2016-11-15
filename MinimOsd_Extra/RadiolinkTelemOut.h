#include <i2c_soft.h>

// from https://github.com/cleanflight/cleanflight/issues/1690#issuecomment-234575579

// Wire.begin(4); - slave with address 4
//  Wire.onRequest(onRequestRLTelemetry);

void set1() {

  int  alt = MwAltitude / 10;

  int  yaw = MwHeading * 100;

  uint16_t  speed2 =  GPS_speed * 1000;

  int  roll =  MwAngle[0];

  int  pitch =  MwAngle[1];

  int distance = GPS_distanceToHome * 10;

  byte buffer[16] = {
    0x89, 0xAB, 
    GPS_numSat, 
    BYTE_OF(alt, 1), BYTE_OF(alt, 0),
    BYTE_OF(yaw, 1), BYTE_OF(yaw, 0),
    BYTE_OF(speed, 1), BYTE_OF(speed, 0),
    BYTE_OF(roll, 1), BYTE_OF(roll, 0),
    BYTE_OF(pitch, 1), BYTE_OF(pitch, 0),
    BYTE_OF(distance, 1), BYTE_OF(distance, 0),
    0x00
  };
  Wire.write(buffer, 16);
}

void set2() {

  union u32_tag  {
    byte         b[4];
    uint32_t    ui32;
  } latit, longt;

  int  rise = 10;
  byte  riseHi = highByte(rise);
  byte  riseLo =  lowByte(rise);

  int battVoltage = voltage * 100; //15000; // 15V
  byte voltesHi = highByte(battVoltage);
  byte voltesLo = lowByte(battVoltage);

  longt.ui32 = GPS_longitude;
  latit.ui32 = GPS_latitude;

  byte buffer[16] = {
    0x89, 0xCD, 
    GPS_numSat, 
    BYTE_OF(rise, 1), BYTE_OF(rise, 0),
    BYTE_OF(voltes, 1), BYTE_OF(voltes, 0),
    BYTE_OF(lon, 3), BYTE_OF(lon, 2), BYTE_OF(lon, 1), BYTE_OF(lon, 0),
    BYTE_OF(lat, 3), BYTE_OF(lat, 2), BYTE_OF(lat, 1), BYTE_OF(lat, 0),
    0x00
  };
  
  Wire.write(buffer, 16);
}


void sendRadiolinkTelemetry(bool f) {
  if (f) {
    set1();
  } else {
    set2();
  }
}


