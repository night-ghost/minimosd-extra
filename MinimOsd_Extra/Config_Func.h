#pragma once 

#include "Spi.h"

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


void MAX_write(byte addr, byte data){
    register byte d=data;
    SPI::transfer(addr);
    SPI::transfer(d);
}

byte MAX_read(byte addr){
  SPI::transfer(addr);
  return SPI::transfer(0xff);
}



