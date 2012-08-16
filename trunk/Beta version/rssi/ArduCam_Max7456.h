
#ifndef ArduCam_Max7456_h
#define ArduCam_Max7456_h

/******* FROM DATASHEET *******/

#define MAX7456_SELECT 6//SS
#define MAX7456_VSYNC 2//INT0

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
#define MAX7456_DMM_reg   0x04
#define MAX7456_DMAH_reg  0x05
#define MAX7456_DMAL_reg  0x06
#define MAX7456_DMDI_reg  0x07
#define MAX7456_OSDM_reg  0x0c //not used. Is to set mix
#define MAX7456_OSDBL_reg 0x6c //black level

//MAX7456 reg write addresses to recording NVM process
#define MAX7456_CMM_reg   0x08
#define MAX7456_CMAH_reg  0x09
#define MAX7456_CMAL_reg  0x0a
#define MAX7456_CMDI_reg  0x0b

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
//VM1 command modifiers
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
  #define MAX7456_screen_rows 15
#else
  #define MAX7456_screen_size 390 //13x30
  #define MAX7456_screen_rows 12
#endif

//------------------ the OSD class -----------------------------------------------

class OSD: public BetterStream
{
  public:
    OSD(void);
    void init(void);
    void clear(void);
    void plug(void);
    void setPanel(uint8_t start_col, uint8_t start_row);
    void openPanel(void);
    void closePanel(void);
    void control(uint8_t ctrl);
    void detectMode(void);
    void setMode(int mode);
    void openSingle(uint8_t x, uint8_t y);
    int getMode(void);
    int getCenter(void);
    virtual int     available(void);
    virtual int     read(void);
    virtual int     peek(void);
    virtual void    flush(void);
    virtual size_t write(uint8_t c);
    void write_NVM(int font_count, uint8_t *character_bitmap);
    using BetterStream::write;
  private:
    uint8_t start_col, start_row, col, row, video_mode, video_center;
};

#endif

