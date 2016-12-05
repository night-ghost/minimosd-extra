
/* ******************************************************************/


static boolean inline is_on(point p){
    //return p.x>=0 && p.y >=0 && p.y < 0x80;
    return p.y < 0x80;
}

static boolean inline has_sign(point p){
    return !(p.x & 0x80);
}


static boolean inline is_alt(point p){
    return (p.y & 0x40);
}

static point inline do_alt(point p){
    p.y |= 0x40;
    return p;
}

static boolean inline is_alt2(point p){
    return (p.y & 0x20);
}

static boolean inline is_alt3(point p){
    return (p.y & 0x10);
}

static boolean inline is_alt4(point p){
    return (p.x & 0x40);
}

byte get_alt_num(point p){
    return (is_alt2(p)?1:0) | (is_alt3(p)?2:0) | (is_alt4(p)?4:0);
}


byte get_alt_filter(point p){
    switch( (is_alt(p)?1:0) | (is_alt2(p)?2:0)) {
    
    case 1:
	return 10;
    case 2:
	return 30;
    case 3:
	return 100;
    default: 
	return 0;
    }
}

// чтение и запись мелких объектов
static void NOINLINE eeprom_read_len(byte *p, uint16_t e, uint16_t l){
    for(;l!=0; l--) {
	*p++ = (byte)eeprom_read_byte( (byte *)e++ );
    }
}

static NOINLINE void eeprom_write_len(byte *p, uint16_t e, uint16_t l){
    byte b;
    for(;  l!=0; l--, e++) {
        b = *p++;
        if(eeprom_read_byte((byte *)e) != b)
            eeprom_write_byte( (byte *)e, b);
    }

}

static inline void readSettings() {
//    eeprom_read_len((byte *)&flags, EEPROM_offs(flags), sizeof(Flags) );
    eeprom_read_len((byte *)&sets,  EEPROM_offs(sets),  sizeof(Settings) );

// сразу настроим системы измерения
    measure = FLAGS.measure ? &imper :  &metr;

}


// rean one point from current screen
static point NOINLINE readPanel(byte n) {
    point p; //                     shift to current screen     selected point
    eeprom_read_len((byte *)&p,  OffsetBITpanel * (int)panelN + n * sizeof(Point),  sizeof(Point) );
    return p;
}

static void print_eeprom_string(byte n){
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
	    OSD::write_S(c);
    }

}

#ifdef MAVLINK_CONFIG

struct Mav_conf { // needs to fit in 253 bytes
    byte magick[4]; // = 0xee 'O' 'S' 'D'
    byte cmd;		// command
    byte id;		// number of 128-bytes block
    byte len;		// real length
    byte data[128];
    byte crc; 		// may be
};

static void parse_osd_packet(byte *p){
    struct Mav_conf *c = (struct Mav_conf *)p;

    if(c->magick[0] == 0xEE && c->magick[1] == 'O' && c->magick[2] == 'S' && c->magick[3] == 'D') {
	switch(c->cmd){
	case 'w':
	    eeprom_write_len((byte *)&c->data, (uint16_t)(c->id) * 128,  c->len );
	    lflags.was_mav_config=1;
	    break;
	
	
	case 'b':
	    if(c->len==0 && lflags.was_mav_config) {
	        __asm__ __volatile__ (    // Jump to RST vector
	            "clr r30\n"
	            "clr r31\n"
	            "ijmp\n"
	        );
	    }
	    break;
	default:
	    break;
	}
    }

}
#endif


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

