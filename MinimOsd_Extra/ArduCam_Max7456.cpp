#include "compat.h"

#include <FastSerial.h>

#include "ArduCam_Max7456.h"
// Get the common arduino functions
#if defined(ARDUINO) && ARDUINO >= 100
	#include "Arduino.h"
#else
	#include "wiring.h"
#endif

#include "Spi.h"
#include <EEPROM.h>
#include "OSD_Config.h"


extern Settings sets;
extern Flags flags;


OSD::OSD()
{
}

//------------------ init ---------------------------------------------------
void MAX_write(byte addr, byte data){
  Spi.transfer(addr);
  Spi.transfer(data);
}

byte MAX_read(byte addr){
  Spi.transfer(addr);
  return Spi.transfer(0xff);
}

void OSD::init()
{
  pinMode(MAX7456_SELECT,OUTPUT);
  pinMode(MAX7456_VSYNC, INPUT_PULLUP);
//  digitalWrite(MAX7456_VSYNC,HIGH); //enabling pull-up resistor

  detectMode();

  digitalWrite(MAX7456_SELECT,LOW);

  //read black level register
  byte osdbl_r = MAX_read(MAX7456_OSDBL_reg_read);//black level read register
  
  MAX_write(MAX7456_VM0_reg, MAX7456_RESET | video_mode);
  delay(150);

  //set black level
  MAX_write(MAX7456_OSDBL_reg, (osdbl_r & 0xef)); //black level write register - Set bit 4 to zero 11101111 - Enable automatic OSD black level control

// set position - may be EEPROM.read(OSD_SHIFT_X)
  MAX_write(MAX7456_HOS_reg, 0x20); // 0x20 default
  MAX_write(MAX7456_VOS_reg, 0x10); // 0x10 default

//  MAX_write(MAX7456_HOS_reg, sets.horiz_offs); // 0x20 default
//  MAX_write(MAX7456_VOS_reg, sets.vert_offs); // 0x10 default

  setBrightness();
  // define sync (auto,int,ext) and
  // making sure the Max7456 is enabled
  control(1);
}

//------------------ Detect Mode (PAL/NTSC) ---------------------------------

void OSD::detectMode()
{
  //read STAT and auto detect Mode PAL/NTSC
  digitalWrite(MAX7456_SELECT,LOW);

  byte osdstat_r = MAX_read(MAX7456_STAT_reg_read);//status register

  if ((B00000001 & osdstat_r) != 0){ //PAL
      setMode(1);  
  }
  else if((B00000010 & osdstat_r) != 0){ //NTSC
      setMode(0);
  }
  //If no signal was detected so it uses EEPROM config
  else{
      if (flags.PAL_NTSC) //NTSC
          setMode(0);
      else  //PAL
          setMode(1);
      
  }

  digitalWrite(MAX7456_SELECT,LOW);
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
    uint8_t x;

    if(blevel>3) blevel=0;
    blevel=levels[blevel];

    // set all rows to same character white level, 90%
    for (x = 0x0; x < 0x10; x++) 
        MAX_write(x + 0x10, blevel);

}

//------------------ Set Mode (PAL/NTSC) ------------------------------------

void OSD::setMode(uint8_t themode)
{
  switch(themode){
    case 0:
      video_mode = MAX7456_MODE_MASK_NTCS;
      video_center = MAX7456_CENTER_NTSC;
      break;
    case 1:
      video_mode = MAX7456_MODE_MASK_PAL;
      video_center = MAX7456_CENTER_PAL;
      break;
  }
}

//------------------ Get Mode (PAL 0/NTSC 1) --------------------------------

uint8_t OSD::getMode()
{
  switch(video_mode){
    case MAX7456_MODE_MASK_NTCS:
      return 0;
      break;
    case MAX7456_MODE_MASK_PAL:
      return 1;
      break;
  }
  return 0;
}

//------------------ Get Center (PAL/NTSC) ----------------------------------

uint8_t OSD::getCenter()
{
  return video_center; //first line for center panel
}

//------------------ plug ---------------------------------------------------

void OSD::plug()
{
  digitalWrite(MAX7456_SELECT,LOW);
}

//------------------ clear ---------------------------------------------------

void OSD::clear()
{
  // clear the screen
  digitalWrite(MAX7456_SELECT,LOW);
  MAX_write(MAX7456_DMM_reg, MAX7456_CLEAR_display);
  digitalWrite(MAX7456_SELECT,HIGH);
}

//------------------ set panel -----------------------------------------------

void
OSD::setPanel(uint8_t st_col, uint8_t st_row){
  col = st_col & 0x7f; // col,row нужны для отработки перевода строки с сохранением колонки
  row = st_row & 0x7f; // в старших битах флаги, размер экрана все равно мелкий
  bufpos = row*30+col;
}


//------------------ write single char ---------------------------------------------

void
OSD::openSingle(uint8_t x, uint8_t y){
  bufpos = (y & 0x7f)*30+(x & 0x7f);
}

//------------------ write ---------------------------------------------------

size_t
OSD::write(uint8_t c){
  
  if(c == '|'){
    row++;
    bufpos = row*30+col;
  } else
    osdbuf[bufpos++] = c;
  return 1;
}

/* для сравнения
uint8_t spi_transfer(uint8_t data)
{
  SPDR = data;                    // Start the transmission
  while (!(SPSR & (1<<SPIF)))     // Wait the end of the transmission
    ;
  return SPDR;                    // return the received byte
}
*/

void
OSD::update() {
 uint8_t *b = osdbuf;
 uint8_t *end_b = b+sizeof(osdbuf);

 PORTD &= ~_BV(PD6); //  digitalWrite(MAX7456_SELECT,LOW); 

  MAX_write(MAX7456_DMAH_reg, 0);
  MAX_write(MAX7456_DMAL_reg, 0);
  MAX_write(MAX7456_DMM_reg, 1);


 PORTD |= _BV(PD6); //  digitalWrite(MAX7456_SELECT, HIGH);

 for(; b < end_b; b++) {
  PORTD &= ~_BV(PD6);  //  digitalWrite(MAX7456_SELECT, HIGH);
  SPDR = *b;
  *b=' ';		// обойдемся без memset
  while (!(SPSR & (1<<SPIF))) ;
  PORTD |= _BV(PD6);	//  digitalWrite(MAX7456_SELECT,LOW); 
 }
 PORTD &= ~_BV(PD6); // digitalWrite(MAX7456_SELECT,LOW);  /CS OSD

 Spi.transfer(MAX7456_END_string);
 
 PORTD |= _BV(PD6); //  digitalWrite(MAX7456_SELECT, HIGH);
// memset(osdbuf, ' ', sizeof(osdbuf));
}


void
OSD::control(uint8_t ctrl){
  digitalWrite(MAX7456_SELECT,LOW);
  switch(ctrl){
    case 0:
      MAX_write(MAX7456_VM0_reg, MAX7456_DISABLE_display | video_mode);
      break;
    case 1:
      MAX_write(MAX7456_VM0_reg, (MAX7456_ENABLE_display_vert | video_mode) | MAX7456_SYNC_autosync);
      break;
  }
  digitalWrite(MAX7456_SELECT,HIGH);
}

void 
OSD::write_NVM(int font_count, uint8_t *character_bitmap)
{
  byte x;
  byte char_address_hi, char_address_lo;
  byte screen_char;

  char_address_hi = font_count;
  char_address_lo = 0;
    cli();

  // disable display
  digitalWrite(MAX7456_SELECT,LOW);

  MAX_write(MAX7456_VM0_reg, MAX7456_DISABLE_display);
  MAX_write(MAX7456_CMAH_reg, char_address_hi);// set start address high

  for(x = 0; x < NVM_ram_size; x++) {// write out 54 (out of 64) bytes of character to shadow ram
    screen_char = character_bitmap[x];
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

  MAX_write(MAX7456_VM0_reg, MAX7456_ENABLE_display_vert);// turn on screen next vertical

  digitalWrite(MAX7456_SELECT,HIGH);  
  sei();
}

//------------------ pure virtual ones (just overriding) ---------------------

int  OSD::available(void){
	return 0;
}
int  OSD::read(void){
	return 0;
}
int  OSD::peek(void){
	return 0;
}
void OSD::flush(void){
}

