
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

// чтение и запись мелких объектов
static void eeprom_read_len(byte *p, uint16_t e, uint16_t l){
    for(;l!=0; l--, e++) {
	*p++ = (byte)eeprom_read_byte( (byte *)e );
    }
}

static void eeprom_write_len(byte *p, uint16_t e, uint16_t l){
    for(;  l!=0; l--, e++)
	eeprom_write_byte( (byte *)e, *p++ );

}

static void readSettings() {
    eeprom_read_len((byte *)&flags, EEPROM_offs(flags), sizeof(Flags) );
    eeprom_read_len((byte *)&sets,  EEPROM_offs(sets),  sizeof(Settings) );

// сразу настроим системы измерения
    measure = flags.measure ? &imper :  &metr;

}

// cчитать настройки текущей панели из EEPROM
static void readPanelSettings() {

    static uint8_t currentPanel=255;
    
    if(panelN==currentPanel) return;
    if(panelN>=MAX_PANELS) return; // не читаем мусор при переключении на служебные панели с верхними номерами

    currentPanel=panelN;

//    eeprom_read_len((byte *)&panel,  OffsetBITpanel * (int)panelN,  sizeof(Panel) );

}

// rean one point from current screen
static point readPanel(byte n) {
    point p; //                     shift to current screen     selected point
    eeprom_read_len((byte *)&p,  OffsetBITpanel * (int)panelN + n * sizeof(Point),  sizeof(Point) );
    return p;
}

static uint8_t checkPAL(uint8_t line){
    if(line >= osd.getCenter() && osd.getMode() == 0){
        line -= 3;	//Cutting lines offset after center if NTSC
    }
    return line;
}




#ifdef DEBUG
/* prints hex numbers with leading zeroes */
// copyright, Peter H Anderson, Baltimore, MD, Nov, '07
// source: http://www.phanderson.com/arduino/arduino_display.html
void print_hex(int v, int num_places)
{
  int mask=0, n, num_nibbles, digit;
 
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

void hex_dump(byte *p, int len) {
 int i=0; 
 int j;
 
 for(j=0;j<len; j+=8){
    OSD::writeb('|');
    print_hex(j,8);
    OSD::writeb(' ');
    for(i=0; i<8; i++){
	OSD::writeb(' ');
	print_hex(p[i+j],8);
    }
 }
}
#endif

