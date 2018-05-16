#include "compat.h"
#include "Config.h"

#ifdef SLAVE_BUILD
namespace OSDns {

 extern void max7456_off();
 extern void max7456_on();



#else

 #if HARDWARE_TYPE == 0
  #include <SingleSerial.h> // MUST be first
 #elif HARDWARE_TYPE == 1
  #include <FastSerial.h> 
 #endif

 #include "Arduino.h"
 
 #define DIGITALIO_NO_MIX_ANALOGWRITE
 #include <fast_io.h>
 
 #include "compat.h"
 #include "Spi.h"
 #include "eeprom.h"

static void max7456_off();
static void max7456_on();

 static INLINE void max7456_off(){
    PORTD |= _BV(PD6);         //digitalWrite(MAX7456_SELECT,HIGH);
 }

 static INLINE void max7456_on(){
    PORTD &= ~_BV(PD6);         //digitalWrite(MAX7456_SELECT,LOW);
 }

#endif

void unplug_slaves() {
    max7456_off();
}

#include "OSD_Max7456.h"


#include "prototypes.h"

extern Settings sets;

uint8_t  OSD::col, OSD::row, OSD::video_mode;
uint8_t  OSD::osdbuf[16*30+1]; // основной буфер, куда выводится все-все и во время прерывания по VSYNC переносится в OSD - 480 байт, четверть всей памяти
                                // плюс байт "конец экрана"
uint16_t OSD::bufpos;


#ifdef SLAVE_BUILD

void OSD::printf(const char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    vprintf(fmt, ap);
    va_end(ap);
}

void OSD::vprintf(const char *fmt, va_list ap)
{
    print_vprintf(this, fmt, ap);
}

size_t OSD::printNumber(unsigned long n, uint8_t base)
{
  char buf[8 * sizeof(long) + 1]; // Assumes 8-bit chars plus zero byte.
  char *str = &buf[sizeof(buf) - 1];

  *str = '\0';
  
  // prevent crash if called with base == 1
  if (base < 2) base = 10;
    
  do {
    char c = n % base;
    n /= base;
  
    *--str = c < 10 ? c + '0' : c + 'A' - 10;
  } while(n);

  return write(str);
}

#endif


//------------------ init ---------------------------------------------------


void OSD::adjust(){
  max7456_on();
  setBrightness();

  MAX_write(MAX7456_HOS_reg, /* 0x20 + */  sets.horiz_offs); // 0x20 default - already shifted
  MAX_write(MAX7456_VOS_reg, /* 0x10 + */  sets.vert_offs); // 0x10 default

  max7456_off();
}


void MAX_mode(byte mode){
    MAX_write(MAX7456_VM0_reg,  mode);
}


void OSD::reset(){
    max7456_on();

    byte cnt=15;

    uint8_t sts;
    while(cnt-- && !(sts=(MAX_read(MAX7456_STAT_reg_read) & 0x7)) && sts!=7 ) {//read status register - sync to soft-only versions
        byte j=3;

        while(j--)  MAX_rw(0xff); // try to sync

        delay_15();
    }

    MAX_mode( MAX7456_RESET | video_mode );

    delay_15();

  // define sync (auto,int,ext)
    MAX_mode( MAX7456_ENABLE_display_vert | video_mode | MAX7456_SYNC_internal | MAX7456_CLEAR_display);  // first time on internal sync

    delay_150();

    hw_init();
}

void OSD::set_current_mode(){
//    MAX_mode( MAX7456_ENABLE_display_vert | video_mode | MAX7456_SYNC_autosync);  
    MAX_mode( MAX7456_ENABLE_display | video_mode | MAX7456_SYNC_autosync);  
}

void OSD::hw_init(){
    max7456_on();

//read black level register
    byte osdbl_r = MAX_read(MAX7456_OSDBL_reg_read); //black level read register
  
//set black level
    MAX_write(MAX7456_OSDBL_reg, (osdbl_r & 0xef)); //black level write register - Set bit 4 to zero 11101111 - Enable automatic OSD black level control

    MAX_write(MAX7456_OSDM_reg, 0b00010010); // 0x00011011 default

    set_current_mode(); // and then switch to auto mode

 // max7456_off(); - in adjust();

    adjust();
}



void OSD::init()
{
#ifndef SLAVE_BUILD
    pinModeFast(MAX7456_SELECT,OUTPUT);
    pinModeFast(MAX7456_VSYNC, INPUT_PULLUP);
    pinModeFast(MAX7456_RESET_PIN, OUTPUT);
    digitalWriteFast(MAX7456_RESET_PIN, HIGH);
#endif
    
    reset();

    detectMode();

    hw_init();
}


//------------------ Detect Mode (PAL/NTSC) ---------------------------------

void OSD::detectMode()
{
  //read STAT and auto detect Mode PAL/NTSC
    max7456_on();
    
    byte  osdstat_r;
    
    if(!FLAGS.mode_auto) {
	goto no_auto;
    }else {

        osdstat_r = MAX_read(MAX7456_STAT_reg_read);//status register

        if ((B00000001 & osdstat_r) != 0){ //PAL
            setMode(1);  
            FLAGS.PAL_NTSC = 1; // remember in case of camera off
        }
        else if((B00000010 & osdstat_r) != 0){ //NTSC
            setMode(0);
            FLAGS.PAL_NTSC = 0; // remember in case of camera off
        }
        else if((B00000100 & osdstat_r) != 0){ //loss of sync

no_auto:
          if (FLAGS.PAL_NTSC) //NTSC
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
    default:
        mode = MAX7456_MODE_MASK_PAL;
        break;
    }
 
    if(video_mode != mode){
	video_mode = mode;
        max7456_on();
        //MAX_mode( MAX7456_ENABLE_display_vert | video_mode | MAX7456_SYNC_autosync); 
        set_current_mode();
        max7456_off();
    }
}

//------------------ Set Brightness  ---------------------------------
void OSD::setBrightness()
{

    static const uint8_t levels[] PROGMEM = { // black level always 0
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



//------------------ set panel -----------------------------------------------

void NOINLINE OSD::calc_pos(){
  bufpos = row*30+col;
}


// screen size is 30 cols * 16 rows
void OSD::setPanel(uint8_t st_col, uint8_t st_row){
    col = st_col & 0x1f; // 30 cols - col,row нужны для отработки перевода строки с сохранением колонки
    row = st_row & 0x0f; // 16 rows - в старших битах флаги, размер экрана все равно мелкий


    if(getMode()==0 && row >6) // ntsc after middle - only once per panel
	row-=3;

    calc_pos();
}

// place character relative to panel's start point
void OSD::relPanel(uint8_t _col, uint8_t _row){
    byte c = col + _col; // left upper corner + shift
    byte r = row + _row;

    bufpos = r*30 + c;
}




//------------------ write ---------------------------------------------------
void NOINLINE OSD::write_raw(uint8_t c){ 
    if(bufpos < sizeof(osdbuf) /* && c!=0xff */ ){
        osdbuf[bufpos++] = c;
    }
}

/*
    sometimes this compiles to
    
00000fc8 <_ZN3OSD7write_SEc>:
     fc8:       e4 cf           rjmp    .-56            ; 0xf92 <_ZN3OSD9write_rawEh>
     fca:       08 95           ret

so all checks are moved out
*/

void OSD::write_S(uint8_t c){
    if(c == (uint8_t)0xff){
        row++;
        calc_pos();
        return;
    }
  
    if(c == 0x20){
        c=0;
    }
    write_raw(c);
}

size_t OSD::write(uint8_t c){
    write_S(c);
    return 1;
}

void OSD::write_xy(uint8_t x, uint8_t y, uint8_t c){
    relPanel(x,y);
    write_S(c);
}


void OSD::update() {
    uint8_t *b = osdbuf;
    uint8_t *end_b = b+sizeof(osdbuf);

    osdbuf[sizeof(osdbuf)-1] = MAX7456_END_string; // 0xFF - "end of screen" character
#ifdef SLAVE_BUILD 
//  internal Ardupilot build
    extern void update_max_buffer(const uint8_t *cp, uint16_t len);
    update_max_buffer(osdbuf, sizeof(osdbuf));
    memset(osdbuf, 0, sizeof(osdbuf)); // clean out screen
#else
    max7456_on(); 
/*
    we need to transfer 480 bytes, SPI speed set to 8 MHz (MAX requires min 100ns SCK period) so one byte goes in 1uS and all transfer will ends up in ~500uS
    time of VBI is 1600uS so we have a 3x 
*/

    MAX_write(MAX7456_DMAH_reg, 0);
    MAX_write(MAX7456_DMAL_reg, 0);
    MAX_write(MAX7456_DMM_reg,  1); // автоинкремент адреса

    max7456_off(); 
    for(; b < end_b;) {
        max7456_on(); // strobing each byte with CS is necessary - MAX7456 datasheet figure 21
        SPI::transfer(*b);
        max7456_off();        
        *b++=0;
    }
#endif
}


void  OSD::write_NVM(uint16_t font_count, uint8_t *character_bitmap)
{
  byte x;
  byte char_address_hi;
  byte screen_char;

  char_address_hi = font_count;

  max7456_on();

  MAX_mode( MAX7456_DISABLE_display); // required to access EEPROM

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
    if(!(MAX_read(MAX7456_STAT_reg_read) & STATUS_reg_nvr_busy)) break;
    extern void delay_telem();
    delay_telem(); // some delay
  }

  MAX_mode(MAX7456_ENABLE_display_vert);// turn on screen next vertical sync

  max7456_off();

}

//------------------ pure virtual ones (just overriding) ---------------------

byte_32  OSD::available(void) const {
	return 0;
}
byte_16  OSD::read(void){
	return 0;
}
byte  OSD::peek(void){
	return 0;
}
void OSD::flush(void){
}

#ifdef SLAVE_BUILD
} // namespace
#endif
