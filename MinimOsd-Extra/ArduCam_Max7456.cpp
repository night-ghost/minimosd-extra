
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

volatile int x;
volatile int font_count;
volatile byte character_bitmap[0x40];

OSD::OSD()
{
}

//------------------ init ---------------------------------------------------

void OSD::init()
{
  pinMode(MAX7456_SELECT,OUTPUT);
  pinMode(MAX7456_VSYNC, INPUT);
  digitalWrite(MAX7456_VSYNC,HIGH); //enabling pull-up resistor

  detectMode();

  digitalWrite(MAX7456_SELECT,LOW);
  //read black level register
  Spi.transfer(MAX7456_OSDBL_reg_read);//black level read register
  byte osdbl_r = Spi.transfer(0xff);
  Spi.transfer(MAX7456_VM0_reg);
  Spi.transfer(MAX7456_RESET | video_mode);
  delay(50);
  //set black level
  byte osdbl_w = (osdbl_r & 0xef); //Set bit 4 to zero 11101111
  Spi.transfer(MAX7456_OSDBL_reg); //black level write register
  Spi.transfer(osdbl_w);

  // set all rows to same charactor white level, 90%
  for (x = 0; x < MAX7456_screen_rows; x++)
  {
    Spi.transfer(x + 0x10);
    Spi.transfer(MAX7456_WHITE_level_120);
  }
  // define sync (auto,int,ext) and
  // making sure the Max7456 is enabled
  control(1);
}

//------------------ Detect Mode (PAL/NTSC) ---------------------------------

void OSD::detectMode()
{
//    digitalWrite(MAX7456_SELECT,LOW);
    //read STAT and auto detect Mode PAL/NTSC
//    Spi.transfer(MAX7456_STAT_reg_read);//status register
//    byte osdstat_r = Spi.transfer(0xff);

//    if ((B00000001 & osdstat_r) == 1){
//        setMode(1);  
//    }
//    else if((B00000010 & osdstat_r) == 1){
        setMode(0);
//    }
//#ifdef MinimOSD
//    else if (digitalRead(3) == 1){
//        setMode(1);
//    }
//#endif

    if (EEPROM.read(PAL_NTSC_ADDR) == 1){
        setMode(1);
        digitalWrite(MAX7456_SELECT,LOW);
    } 
    else setMode(0);
    digitalWrite(MAX7456_SELECT,LOW);
}

//------------------ Set Mode (PAL/NTSC) ------------------------------------

void OSD::setMode(int themode)
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

int OSD::getMode()
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

int OSD::getCenter()
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
  Spi.transfer(MAX7456_DMM_reg);
  Spi.transfer(MAX7456_CLEAR_display);
  digitalWrite(MAX7456_SELECT,HIGH);
}

//------------------ set panel -----------------------------------------------

void
OSD::setPanel(uint8_t st_col, uint8_t st_row){
  start_col = st_col;
  start_row = st_row;
  col = st_col;
  row = st_row;
}

//------------------ open panel ----------------------------------------------

void
OSD::openPanel(void){
  unsigned int linepos;
  byte settings, char_address_hi, char_address_lo;
 
  //find [start address] position
  linepos = row*30+col;
  
  // divide 16 bits into hi & lo byte
  char_address_hi = linepos >> 8;
  char_address_lo = linepos;

  //Auto increment turn writing fast (less SPI commands).
  //No need to set next char address. Just send them
  settings = MAX7456_INCREMENT_auto; //To Enable DMM Auto Increment
  digitalWrite(MAX7456_SELECT,LOW);
  Spi.transfer(MAX7456_DMM_reg); //dmm
  Spi.transfer(settings);

  Spi.transfer(MAX7456_DMAH_reg); // set start address high
  Spi.transfer(char_address_hi);

  Spi.transfer(MAX7456_DMAL_reg); // set start address low
  Spi.transfer(char_address_lo);
  //Serial.printf("setPos -> %d %d\n", col, row);
}

//------------------ close panel ---------------------------------------------

void
OSD::closePanel(void){  
  Spi.transfer(MAX7456_DMDI_reg);
  Spi.transfer(MAX7456_END_string); //This is needed "trick" to finish auto increment
  digitalWrite(MAX7456_SELECT,HIGH);
  //Serial.println("close");
  row++; //only after finish the auto increment the new row will really act as desired
}

//------------------ write single char ---------------------------------------------

void
OSD::openSingle(uint8_t x, uint8_t y){
  unsigned int linepos;
  byte char_address_hi, char_address_lo;
 
  //find [start address] position
  linepos = y*30+x;
  
  // divide 16 bits into hi & lo byte
  char_address_hi = linepos >> 8;
  char_address_lo = linepos;
  
  digitalWrite(MAX7456_SELECT,LOW);
  
  Spi.transfer(MAX7456_DMAH_reg); // set start address high
  Spi.transfer(char_address_hi);

  Spi.transfer(MAX7456_DMAL_reg); // set start address low
  Spi.transfer(char_address_lo);
  //Serial.printf("setPos -> %d %d\n", col, row);
}

//------------------ write ---------------------------------------------------

size_t
OSD::write(uint8_t c){
  if(c == '|'){
    closePanel(); //It does all needed to finish auto increment and change current row
    openPanel(); //It does all needed to re-enable auto increment
  }
  else{
    Spi.transfer(MAX7456_DMDI_reg);
    Spi.transfer(c);
  }
  return 1;
}

//---------------------------------

void
OSD::control(uint8_t ctrl){
  digitalWrite(MAX7456_SELECT,LOW);
  Spi.transfer(MAX7456_VM0_reg);
  switch(ctrl){
    case 0:
      Spi.transfer(MAX7456_DISABLE_display | video_mode);
      break;
    case 1:
      //Spi.transfer((MAX7456_ENABLE_display_vert | video_mode) | MAX7456_SYNC_internal);
      //Spi.transfer((MAX7456_ENABLE_display_vert | video_mode) | MAX7456_SYNC_external);
      Spi.transfer((MAX7456_ENABLE_display_vert | video_mode) | MAX7456_SYNC_autosync); 
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
 //Serial.println("write_new_screen");   

  // disable display
  digitalWrite(MAX7456_SELECT,LOW);
  Spi.transfer(MAX7456_VM0_reg); 
  Spi.transfer(MAX7456_DISABLE_display);

  Spi.transfer(MAX7456_CMAH_reg); // set start address high
  Spi.transfer(char_address_hi);

  for(x = 0; x < NVM_ram_size; x++) // write out 54 (out of 64) bytes of character to shadow ram
  {
    screen_char = character_bitmap[x];
    Spi.transfer(MAX7456_CMAL_reg); // set start address low
    Spi.transfer(x);
    Spi.transfer(MAX7456_CMDI_reg);
    Spi.transfer(screen_char);
  }

  // transfer a 54 bytes from shadow ram to NVM
  Spi.transfer(MAX7456_CMM_reg);
  Spi.transfer(WRITE_nvr);
  
  // wait until bit 5 in the status register returns to 0 (12ms)
  while ((Spi.transfer(MAX7456_STAT_reg_read) & STATUS_reg_nvr_busy) != 0x00);

  Spi.transfer(MAX7456_VM0_reg); // turn on screen next vertical
  Spi.transfer(MAX7456_ENABLE_display_vert);
  digitalWrite(MAX7456_SELECT,HIGH);  
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

