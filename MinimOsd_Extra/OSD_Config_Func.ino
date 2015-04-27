
/* ******************************************************************/
/* *********************** GENERAL FUNCTIONS ********************** */


boolean inline is_on(point p){
    //return p.x>=0 && p.y >=0 && p.y < 0x80;
    return p.y < 0x80;
}

boolean inline has_sign(point p){
    return !(p.x & 0x80);
}


void readSettings() {

// считаем все кучно

    for(byte i=0; i<sizeof(Flags); i++)
	((byte *)&flags)[i] = EEPROM.read(EEPROM_offs(flags) +i );


    for(int i=0; i<sizeof(Settings); i++) // 512 размер остатка EEPROM так что байта для адреса мало
	((byte *)&sets)[i] = EEPROM.read(EEPROM_offs(sets) + i );



// сразу настроим системы измерения
    if (!flags.measure) { // метрическая система
        converts = 3.6; 
        converth = 1.0;
        spe = 0x10;
        high = 0x0c;
        temps = 0xba;
        tempconv = 10;
        tempconvAdd = 0;
        distchar = 0x1b;
        distconv = 1000;
        climbchar = 0x1a;
    } else {
        converts = 2.23;
        converth = 3.28;
        spe = 0x19;
        high = 0x66;
        temps = 0xbb;
        tempconv = 18;
        tempconvAdd = 3200;
        distchar = 0x1c;
        distconv = 5280;
        climbchar = 0x1e;
    }


}

// cчитать настройки текущей панели из EEPROM
void readPanelSettings() {

    static uint8_t currentPanel=255;
    
    if(panelN==currentPanel) return;
    if(panelN>npanels) return; // не читаем мусор при переключении на служебные панели с верхними номерами
    currentPanel=panelN;


    for(byte i=0; i<sizeof(Panel); i++) // читаем в пределах одного экрана - 128 байт, так что байтного цикла достаточно
	((byte *)&panel)[i] = EEPROM.read( OffsetBITpanel * (int)panelN + i );
}

uint8_t checkPAL(uint8_t line){
    if(line >= osd.getCenter() && osd.getMode() == 0){
        line -= 3;//Cutting lines offset after center if NTSC
    }
    return line;
}


/*
void updateSettings(byte panelu, byte panel_x, byte panel_y, byte panel_s ) {
    if(panelN >= 1 && panelN <= npanel) {

        writeEEPROM(panel_s, (6 * panelu) - 6 + 0);
        if(panel_s != 0) {
            writeEEPROM(panel_x, (6 * panelu) - 6 + 2);
            writeEEPROM(panel_y, (6 * panelu) - 6 + 4);
        }
        osd.clear();
        readSettings();

	readPanelSettings();
    } 
}
*/

/* not use defaults - use config tool!

void InitializeOSD() {


}

*/


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
    osd.write('|');
    print_hex(j,8);
    osd.write(' ');
    for(i=0; i<8; i++){
	osd.write(' ');
	print_hex(p[i+j],8);
    }
 }
}
#endif

