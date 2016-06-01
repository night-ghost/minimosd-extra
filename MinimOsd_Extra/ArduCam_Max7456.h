
#ifndef ArduCam_Max7456_h
#define ArduCam_Max7456_h

/******* FROM DATASHEET *******/

// pinout
#define MAX7456_SELECT 6//SS
#define MAX7456_VSYNC 2//INT0

#define DATAOUT 11              // MOSI
#define DATAIN  12              // MISO
#define SPICLOCK  13            // sck

#define NTSC 0
#define PAL 1
#define MAX7456_MODE_MASK_PAL 0x40 //PAL mask 01000000
#define MAX7456_CENTER_PAL 0x8

#define MAX7456_MODE_MASK_NTCS 0x00 //NTSC mask 00000000 ("|" will do nothing)
#define MAX7456_CENTER_NTSC 0x6

//MAX7456 reg read addresses
#define MAX7456_OSDBL_reg_read 0xec //black level
#define MAX7456_STAT_reg_read  0xa0 //0xa[X] Status

//MAX7456 reg write addresses
#define MAX7456_VM0_reg   0x00
#define MAX7456_VM1_reg   0x01

#define MAX7456_HOS_reg   0x02 // horisontal offset
#define MAX7456_VOS_reg   0x03 // vertical offset

#define MAX7456_DMM_reg   0x04
#define MAX7456_DMAH_reg  0x05
#define MAX7456_DMAL_reg  0x06
#define MAX7456_DMDI_reg  0x07

//MAX7456 reg write addresses to recording NVM process
#define MAX7456_CMM_reg   0x08
#define MAX7456_CMAH_reg  0x09
#define MAX7456_CMAL_reg  0x0a
#define MAX7456_CMDI_reg  0x0b
// sharpness
#define MAX7456_OSDM_reg  0x0c //not used. Is to set mix
#define MAX7456_OSDBL_reg 0x6c //black level


//DMM commands
#define MAX7456_CLEAR_display 0x04
#define MAX7456_CLEAR_display_vert 0x06

#define MAX7456_INCREMENT_auto 0x03
#define MAX7456_SETBG_local 0x20 //00100000 force local BG to defined brightness level VM1[6:4]

#define MAX7456_END_string 0xff

//VM0 commands mixed with mode NTSC or PAL mode
#define MAX7456_ENABLE_display_vert 0x0c //mask with NTSC/PAL
#define MAX7456_RESET 0x02 //mask with NTSC/PAL
#define MAX7456_DISABLE_display 0x00 //mask with NTSC/PAL

//VM0 command modifiers
#define MAX7456_SYNC_autosync 0x10
#define MAX7456_SYNC_internal 0x30
#define MAX7456_SYNC_external 0x20

//VM1 command modifiers - black level always 0
#define MAX7456_WHITE_level_80 0x03
#define MAX7456_WHITE_level_90 0x02
#define MAX7456_WHITE_level_100 0x01
#define MAX7456_WHITE_level_120 0x00

#define NVM_ram_size 0x36
#define WRITE_nvr 0xa0
#define STATUS_reg_nvr_busy 0x20

//If PAL
#ifdef isPAL
  #define MAX7456_screen_size 480 //16x30
  #define MAX7456_screen_rows 0x10
#else
  #define MAX7456_screen_size 390 //13x30
  #define MAX7456_screen_rows 0x0D
#endif



//------------------ the OSD class -----------------------------------------------

class OSD: public BetterStream
{
  public:
    OSD(void);
    static void init(void);
    static void hw_init(void);
    static void clear(void);
    static void setPanel(uint8_t start_col, uint8_t start_row);
    static void detectMode(void);
    static void setMode(uint8_t mode);
    static void setBrightness();
    static uint8_t getMode(void);
    static void update(void);
    static void write_S(uint8_t c);
    static void write_raw(uint8_t c);
    virtual byte     available(void);
    virtual byte     read(void);
    virtual byte     peek(void);
    virtual void    flush(void);
    virtual size_t write(uint8_t c);
    static void write_NVM(int font_count, uint8_t *character_bitmap);
    static void write_xy(uint8_t x, uint8_t y, uint8_t c);
    static void adjust();
    using BetterStream::write;

//  private:
    static uint8_t col, row, video_mode;
    static uint8_t osdbuf[16*30]; // основной буфер, куда выодится все-все и во время VSYNC переносится в OSD - 480 байт, четверть всей памяти
    static uint16_t bufpos;
    
    static void NOINLINE calc_pos();
};


static INLINE void max7456_off(){
    //gitalWrite(MAX7456_SELECT,HIGH);
    PORTD |= _BV(PD6);
}

static INLINE void max7456_on(){
    //gitalWrite(MAX7456_SELECT,LOW);
    PORTD &= ~_BV(PD6);
}

static INLINE void unplugSlaves(){   //Unplug list of SPI
    max7456_off();  //digitalWrite(MAX7456_SELECT,  HIGH); // unplug OSD
}



#endif

