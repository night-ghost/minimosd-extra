#include "compat.h"

#include <SingleSerial.h>

#include "Arduino.h"

#include "ArduCam_Max7456.h"
// Get the common arduino functions


#include "Spi.h"
#include "Config.h"

#include "prototypes.h"

extern Settings sets;
extern Flags flags;

uint8_t  OSD::col, OSD::row, OSD::video_mode;
uint8_t  OSD::osdbuf[16*30]; // основной буфер, куда выводится все-все и во время VSYNC переносится в OSD - 480 байт, четверть всей памяти
uint16_t OSD::bufpos;


OSD::OSD()
{
}

//------------------ init ---------------------------------------------------
void MAX_write(byte addr, byte data){
    register byte d=data;
    SPI::transfer(addr);
    SPI::transfer(d);
}

byte MAX_read(byte addr){
  SPI::transfer(addr);
  return SPI::transfer(0xff);
}


void OSD::adjust(){
  max7456_on();
  setBrightness();

//Serial.printf_P(PSTR("adjust bright=%d horiz=%d vert=%d\n"),sets.OSD_BRIGHTNESS,sets.horiz_offs, sets.vert_offs);

  MAX_write(MAX7456_HOS_reg, /* 0x20 + */  sets.horiz_offs); // 0x20 default - already shifted
  MAX_write(MAX7456_VOS_reg, /* 0x10 + */  sets.vert_offs); // 0x10 default

  max7456_off();
}

void OSD::hw_init(){
    max7456_on();

    //read black level register
    byte osdbl_r = MAX_read(MAX7456_OSDBL_reg_read); //black level read register
  
    MAX_write(MAX7456_VM0_reg, MAX7456_RESET | video_mode);
    delay_150();

    //set black level
    MAX_write(MAX7456_OSDBL_reg, (osdbl_r & 0xef)); //black level write register - Set bit 4 to zero 11101111 - Enable automatic OSD black level control

    MAX_write(MAX7456_OSDM_reg, 0b00010010); // 0x00011011 default

  // define sync (auto,int,ext)
    MAX_write(MAX7456_VM0_reg, (MAX7456_ENABLE_display_vert | video_mode) | MAX7456_SYNC_internal);  // first time on internal sync

    delay_150();

    MAX_write(MAX7456_VM0_reg, (MAX7456_ENABLE_display_vert | video_mode) | MAX7456_SYNC_autosync);  // and then switch to auto mode

 // max7456_off();

    adjust();
}



void OSD::init()
{
    pinMode(MAX7456_SELECT,OUTPUT);
    pinMode(MAX7456_VSYNC, INPUT_PULLUP);

    detectMode();

    hw_init();
}

void delay_15(){
    delay(15);
}

//------------------ Detect Mode (PAL/NTSC) ---------------------------------

void OSD::detectMode()
{
  //read STAT and auto detect Mode PAL/NTSC
    max7456_on();
    
    byte osdstat_r;

    if(!flags.mode_auto) {
	goto no_auto;
    }else {

        osdstat_r = MAX_read(MAX7456_STAT_reg_read);//status register

        if ((B00000001 & osdstat_r) != 0){ //PAL
            setMode(1);  
            flags.PAL_NTSC = 1; // remember in case of camera off
        }
        else if((B00000010 & osdstat_r) != 0){ //NTSC
            setMode(0);
            flags.PAL_NTSC = 0; // remember in case of camera off
        }
        else if((B00000100 & osdstat_r) != 0){ //loss of sync
//      setMode(1); // PAL without video 
no_auto:
          if (flags.PAL_NTSC) //NTSC
              setMode(1);
          else  //PAL
              setMode(0);
        }

    }

    max7456_off();
}

//------------------ Set Mode (PAL/NTSC) ------------------------------------

void OSD::setMode(uint8_t themode){
    uint8_t mode;

    switch(themode){
    case 0:
        mode = MAX7456_MODE_MASK_NTCS;
        break;
    case 1:
        mode = MAX7456_MODE_MASK_PAL;
        break;
    }
 
    if(video_mode != mode){
	video_mode = mode;
        max7456_on();
        MAX_write(MAX7456_VM0_reg, (MAX7456_ENABLE_display_vert | video_mode) | MAX7456_SYNC_autosync); 
        max7456_off();
    }
}

//------------------ Set Brightness  ---------------------------------
void OSD::setBrightness()
{

    static const uint8_t levels[] PROGMEM = {
	MAX7456_WHITE_level_80, // 0
	MAX7456_WHITE_level_90, // 1
	MAX7456_WHITE_level_100,// 2
	MAX7456_WHITE_level_120,// 3
    };

    uint8_t blevel = sets.OSD_BRIGHTNESS;

    if(blevel>3) blevel=0;
    blevel=pgm_read_byte(&levels[blevel]);

#ifdef DEBUG
//Serial.printf(PSTR("\n\nSet bright to %d\n"),blevel);
#endif

    // set all rows to same character white level
    for (byte x = 0x0, a= 0x10 /*  RB0 register */; x < 0x10; x++) 
        MAX_write(a++, blevel);

}


//------------------ Get Mode (PAL 0/NTSC 1) --------------------------------

uint8_t OSD::getMode(){
  switch(video_mode){
//    case MAX7456_MODE_MASK_NTCS:
//      return 0;
//      break;

    case MAX7456_MODE_MASK_PAL:
      return 1;
      break;
  }
  return 0;
}

/*
void OSD::clear() {  // clear the screen
  max7456_on();
  MAX_write(MAX7456_DMM_reg, MAX7456_CLEAR_display);
  max7456_off();
}
*/

//------------------ set panel -----------------------------------------------

void NOINLINE OSD::calc_pos(){
  bufpos = row*30+col;
}

void OSD::setPanel(uint8_t st_col, uint8_t st_row){
    col = st_col & 0x3f; // col,row нужны для отработки перевода строки с сохранением колонки
    row = st_row & 0x0f; // в старших битах флаги, размер экрана все равно мелкий


    if(getMode()==0 && row >6) // ntsc after middle
	row-=3;

    calc_pos();
}



//------------------ write ---------------------------------------------------

void OSD::write_S(uint8_t c){
  
  if(c == '|'){
    row++;
    calc_pos();
  } else {
    //osdbuf[bufpos++] = c;
    write_raw(c);
  } 
}

void OSD::write_raw(uint8_t c){ // the only way to write 0x7c to memory
    osdbuf[bufpos++] = c;
}

size_t OSD::write(uint8_t c){
    write_S(c);
    return 1;
}

void OSD::write_xy(uint8_t x, uint8_t y, uint8_t c){
    setPanel(x,y);
    OSD::write_S(c);
}



/* для сравнения
uint8_t spi_transfer(uint8_t data) {
  SPDR = data;                    // Start the transmission
  while (!(SPSR & (1<<SPIF)))     // Wait the end of the transmission
    ;
  return SPDR;                    // return the received byte
}
*/

void OSD::update() {
    uint8_t *b = osdbuf;
    uint8_t *end_b = b+sizeof(osdbuf);
/*
    uint8_t bit = digitalPinToBitMask(MAX7456_SELECT); // move calculations from critical section
    uint8_t port = digitalPinToPort(MAX7456_SELECT);
    volatile uint8_t *out = portOutputRegister(port);

#define SET_LOW()   *out &= ~bit
#define SET_HIGH()  *out |= bit
*/

    PORTD &= ~_BV(PD6); //  digitalWrite(MAX7456_SELECT,LOW); 

    MAX_write(MAX7456_DMAH_reg, 0);
    MAX_write(MAX7456_DMAL_reg, 0);
    MAX_write(MAX7456_DMM_reg, 1); // автоинкремент адреса

    PORTD |= _BV(PD6); //  digitalWrite(MAX7456_SELECT, HIGH);

    for(; b < end_b;) {
        PORTD &= ~_BV(PD6);  //  digitalWrite(MAX7456_SELECT, HIGH);
        SPDR = *b;
        *b++=' ';		// обойдемся без memset
        while (!(SPSR & (1<<SPIF))) ;
        PORTD |= _BV(PD6);	//  digitalWrite(MAX7456_SELECT,LOW); 
    }
    PORTD &= ~_BV(PD6); // digitalWrite(MAX7456_SELECT,LOW);  /CS OSD

    Spi.transfer(MAX7456_END_string);

    PORTD |= _BV(PD6); //  digitalWrite(MAX7456_SELECT, HIGH);
}


//*
void  OSD::write_NVM(int font_count, uint8_t *character_bitmap)
{
  byte x;
  byte char_address_hi;
  byte screen_char;

  char_address_hi = font_count;
//  byte char_address_lo = 0;

//    cli();

  max7456_on();
  MAX_write(MAX7456_VM0_reg, MAX7456_DISABLE_display);

  MAX_write(MAX7456_CMAH_reg, char_address_hi);// set start address high

  for(x = 0; x < NVM_ram_size; x++) {// write out 54 (out of 64) bytes of character to shadow ram
    screen_char = *character_bitmap++;
    MAX_write(MAX7456_CMAL_reg, x);// set start address low
    MAX_write(MAX7456_CMDI_reg, screen_char);
  }

  // transfer a 54 bytes from shadow ram to NVM
  MAX_write(MAX7456_CMM_reg, WRITE_nvr);

  // wait until bit 5 in the status register returns to 0 (12ms)
  while (1) {
    Spi.transfer(MAX7456_STAT_reg_read);
    if(!(Spi.transfer(0xff) & STATUS_reg_nvr_busy)) break;
  }

//  sei();

  MAX_write(MAX7456_VM0_reg, MAX7456_ENABLE_display_vert);// turn on screen next vertical

  max7456_off();

}
//*/
//------------------ pure virtual ones (just overriding) ---------------------

byte  OSD::available(void){
	return 0;
}
byte  OSD::read(void){
	return 0;
}
byte  OSD::peek(void){
	return 0;
}
void OSD::flush(void){
}


