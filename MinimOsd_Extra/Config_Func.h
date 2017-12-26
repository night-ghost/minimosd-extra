#pragma once 

#include "Spi.h"
#include <avr/eeprom.h>
#include "prototypes.h"

/* ******************************************************************/
// чтение и запись мелких объектов
void NOINLINE eeprom_read_len(byte *p, uint16_t e, uint16_t l){
    for(;l!=0; l--) {
	*p++ = (byte)eeprom_read_byte( (byte *)e++ );
    }
}

NOINLINE void eeprom_write_len(byte *p, uint16_t e, uint16_t l){
    byte b;
    for(;  l!=0; l--, e++) {
        b = *p++;
        if(eeprom_read_byte((byte *)e) != b)
            eeprom_write_byte( (byte *)e, b);
    }

}


void print_eeprom_string(byte n, cb_putc cb){
    for(byte i=0;i<128;i++){
	byte c=eeprom_read_byte( (byte *)( EEPROM_offs(strings) + i) );
	if(c==0xFF) {
	    break; // clear EEPROM
	}
	if(c==0){ // end of string
	    if(n==0) {  // we now printing?
		return; //   if yes then string is over
	    }
	    n--; // strings to skip
	}
	if(n==0) // our string!
	    cb(c);
    }

}

void NOINLINE millis_plus(uint32_t *dst, uint16_t inc) {
    *dst = millis() + inc;
}


void NOINLINE long_plus(uint32_t *dst, uint16_t inc) {
    *dst +=  inc;
}

int NOINLINE long_diff(uint32_t *l1, uint32_t *l2) {
    return (int)(l1-l2);
}
float NOINLINE get_converth(){
    return pgm_read_float(&measure->converth);
}


float NOINLINE mul_converth(float f){
    return get_converth() * f;
}


float NOINLINE get_converts(){
    return pgm_read_float(&measure->converts);
}

float NOINLINE mul_converts(float &f){
    return f * get_converts();
}

float NOINLINE f_div1000(float f){
    return f/1000;
}
uint16_t NOINLINE time_since(uint32_t *t){
    return (uint16_t)(millis() - *t); // loop time no more 1000 ms

}

void NOINLINE osd_print_S(PGM_P f){
    osd.print_P(f);
}

void MAX_write(byte addr, byte data){
    register byte d=data;
    SPI::transfer(addr);
    SPI::transfer(d);
}

byte MAX_read(byte addr){
  SPI::transfer(addr);
  return SPI::transfer(0xff);
}

byte MAX_rw(byte b){
    return SPI::transfer(b);
}

void NOINLINE delay_telem(){
        delayMicroseconds((1000000/TELEMETRY_SPEED*10)); //время приема 1 байта
}

void NOINLINE delay_byte(){
    if(!Serial.available_S())
        delay_telem();
}

#ifdef DEBUG
/* prints hex numbers with leading zeroes */
// copyright, Peter H Anderson, Baltimore, MD, Nov, '07
// source: http://www.phanderson.com/arduino/arduino_display.html
void print_hex(uint16_t v, byte num_places)
{
  uint16_t mask=0;
  byte num_nibbles, digit, n;
 
  for (n=1; n<=num_places; n++) {
    mask = (mask << 1) | 0x0001;
  }
  v = v & mask; // truncate v to specified number of places
 
  num_nibbles = num_places / 4;
  if ((num_places % 4) != 0) {
    ++num_nibbles;
  }
  do {
    digit = ((v >> (num_nibbles-1) * 4)) & 0x0f;
    osd.print(digit, HEX);
  } 
  while(--num_nibbles);
}

void hex_dump(byte *p, uint16_t len) {
 byte i; 
 uint16_t j;
 
 for(j=0;j<len; j+=8){
    OSD::write_S(0xFF);
    print_hex(j,8);
    OSD::write_S(' ');
    for(i=0; i<8; i++){
	OSD::write_S(' ');
	print_hex(p[i+j],8);
    }
 }
}

void serial_print_hex(uint16_t v, byte num_places)
{
  uint16_t mask=0;
  byte num_nibbles, digit, n;
 
  for (n=1; n<=num_places; n++) {
    mask = (mask << 1) | 0x0001;
  }
  v = v & mask; // truncate v to specified number of places
 
  num_nibbles = num_places / 4;
  if ((num_places % 4) != 0) {
    ++num_nibbles;
  }
  do {
    digit = ((v >> (num_nibbles-1) * 4)) & 0x0f;
    Serial.print(digit, HEX);
  } 
  while(--num_nibbles);
}

void serial_hex_dump(byte *p, uint16_t len) {
 uint8_t i; 
 uint16_t j;
 
 for(j=0;j<len; j+=16){
    Serial.write_S('\n'); Serial.wait();
    serial_print_hex(j,16);
    Serial.write_S(' ');
    for(i=0; i<16; i++){
	Serial.write_S(' ');
	serial_print_hex(p[i+j],8);
	Serial.wait();
    }
 }
}
#else
void serial_hex_dump(byte *p, uint16_t len) {}
#endif

void NOINLINE move4(void *_dst, void *_src){
    uint8_t *dst = (uint8_t *)_dst;
    uint8_t *src = (uint8_t *)_src;
    uint8_t i=4;
    do {
        *dst++ = *src++;
    } while(--i);
}

void NOINLINE float_add(float &dst, float val){
    dst+=val;
}
void NOINLINE calc_max(float &dst, float src){
    if (dst < src) dst = src;

}
void NOINLINE gps_norm(float &dst, long f){
    dst = f / GPS_MUL;
}
bool NOINLINE timeToScreen(){ // we should renew screen 
    return lflags.need_redraw && !vsync_wait;
}
