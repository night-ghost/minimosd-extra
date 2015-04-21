
/* ******************************************************************/
/* *********************** GENERAL FUNCTIONS ********************** */


boolean inline is_on(point p){
    //return p.x>=0 && p.y >=0 && p.y < 0x80;
    return p.y < 0x80;
}


void readSettings() {

// считаем все кучно

    for(byte i=0; i<sizeof(Flags); i++)
	((byte *)&flags)[i] = EEPROM.read(EEPROM_offs(flags) +i );


    for(byte i=0; i<sizeof(Settings); i++)
	((byte *)&sets)[i] = EEPROM.read(EEPROM_offs(sets) + i );

/*
    overspeed = EEPROM.read(overspeed_ADDR);
    stall = EEPROM.read(stall_ADDR);
    battv = EEPROM.read(battv_ADDR);
    switch_mode = EEPROM.read(switch_mode_ADDR);
    panel_auto_switch = EEPROM.read(AUTO_SCREEN_SWITC_ADD);
    ch_toggle = EEPROM.read(ch_toggle_ADDR);

    //  battp = EEPROM.read(battp_ADDR);
    rssical = EEPROM.read(OSD_RSSI_HIGH_ADDR);
    rssipersent = EEPROM.read(OSD_RSSI_LOW_ADDR);
    rssiraw_on = EEPROM.read(OSD_RSSI_RAW_ADDR);

    batt_warn_level = EEPROM.read(OSD_BATT_WARN_ADDR);
    rssi_warn_level = EEPROM.read(OSD_RSSI_WARN_ADDR);

    uint8_t i;
    
    for(i=0;i < OSD_CALL_SIGN_TOTAL;i++)  {
        char_call[i] = EEPROM.read(OSD_CALL_SIGN_ADDR + i);
        if(char_call[i] == 0) break;
    }
    char_call[i+1] ='\0'; //null terminate the string 
*/
}
/*
point read_one(uint16_t addr){
    point p;
    byte en;

    addr += OffsetBITpanel * panelN; // offset

    en=readEEPROM(addr);
    if(!en)
	return {0xff,0xff};

//    p.x=         readEEPROM(addr+1);
//    p.y=checkPAL(readEEPROM(addr+2));

// почему-то сейчас оффсет 2 байта
    p.x=         readEEPROM(addr+2);
    p.y=checkPAL(readEEPROM(addr+4));
    return p;
}
*/

// cчитать настройки текущей панели из EEPROM
void readPanelSettings() {

    static uint8_t currentPanel=255;
    
    if(panelN==currentPanel) return;
    if(panelN>npanels) return; // не читаем мусор при переключении на служебные панели с верхними номерами
    currentPanel=panelN;


    for(byte i=0; i<sizeof(Panel); i++)
	((byte *)&panel)[i] = EEPROM.read( OffsetBITpanel * panelN + i );


/*
    все располагается стандартно, так что можно читать унифицированно все параметры
*/
/*
//   panCenter_XY=read_one(panCenter_en_ADDR);

    panBatteryPercent_XY=read_one(panBatteryPercent_en_ADDR);

    panPitch_XY=read_one(panPitch_en_ADDR);

    panRoll_XY=read_one(panRoll_en_ADDR);

    panBatt_A_XY=read_one(panBatt_A_en_ADDR);

    panBatt_B_XY=read_one(panBatt_B_en_ADDR);

    panGPSats_XY=read_one(panGPSats_en_ADDR);

    panCOG_XY=read_one(panCOG_en_ADDR);

    panGPS_XY=read_one(panGPS_en_ADDR);

    //****** Second set of 8 Panels ******

    panRose_XY=read_one(panRose_en_ADDR);

    panHeading_XY=read_one(panHeading_en_ADDR);

//    panMavBeat_XY=read_one(panMavBeat_en_ADDR);

    panHomeDis_XY=read_one(panHomeDis_en_ADDR);
    
    panHomeDir_XY=read_one(panHomeDir_en_ADDR);

    panWPDir_XY=read_one(panWPDir_en_ADDR);

    panWPDis_XY=read_one(panWPDis_en_ADDR);

    panTime_XY=read_one(panTime_en_ADDR);

    panRSSI_XY=read_one(panRSSI_en_ADDR);

    //****** Third set of 8 Panels ******

    panCur_A_XY=read_one(panCur_A_en_ADDR);

//     panCur_B_XY=read_one(panCur_B_en_ADDR);

    panAlt_XY=read_one(panAlt_en_ADDR);

    panHomeAlt_XY=read_one(panHomeAlt_en_ADDR);

    panAirSpeed_XY=read_one(panAirSpeed_en_ADDR);

    panVel_XY=read_one(panVel_en_ADDR);

    panThr_XY=read_one(panThr_en_ADDR);

    panFMod_XY=read_one(panFMod_en_ADDR);

    panHorizon_XY=read_one(panHorizon_en_ADDR);

    panWarn_XY=read_one(panWarn_en_ADDR);

    panWindSpeed_XY=read_one(panWindSpeed_en_ADDR);

    panClimb_XY=read_one(panClimb_en_ADDR);

#ifdef IS_PLANE
    panTune_XY=read_one(panTune_en_ADDR);
#endif

    panRSSI_XY=read_one(panRSSI_en_ADDR);
    
    panEff_XY=read_one(panEff_en_ADDR);

    panCALLSIGN_XY=read_one(panCALLSIGN_en_ADDR);

//    panCh_XY=read_one(panCh_en_ADDR);

    panTemp_XY=read_one(panTemp_en_ADDR);

    panDistance_XY=read_one(panDistance_en_ADDR);
*/
}

uint8_t checkPAL(uint8_t line){
    if(line >= osd.getCenter() && osd.getMode() == 0){
        line -= 3;//Cutting lines offset after center if NTSC
    }
    return line;
}

void updateSettings(byte panelu, byte panel_x, byte panel_y, byte panel_s ) {
    if(panelN >= 1 && panelN <= 32) {

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


/* not use defaults - use config tool!

void InitializeOSD() {

    writeEEPROM(42, CHK1);
    writeEEPROM(VER-42,CHK2);
    for(panel = 0; panel < npanels; panel++) 
	writeSettings();

    osd.setPanel(4,9);
    osd.printf_P(PSTR("OSD Initialized, reboot")); 

    // run for ever so user resets 
    for(;;) {}

}


// Write our latest FACTORY settings to EEPROM
void writeSettings() {
    // Writing all default parameters to EEPROM, ON = panel enabled  
    // All panels have 3 values:
    //  - Enable/Disable
    //  - X coordinate on screen
    //  - Y coordinate on screen
    uint16_t offset = OffsetBITpanel * panelN;

//    writeEEPROM(off, panCenter_en_ADDR + offset);
//    writeEEPROM(13, panCenter_x_ADDR + offset);
//    writeEEPROM(7,  panCenter_y_ADDR + offset);
    writeEEPROM(on, panPitch_en_ADDR + offset);
    writeEEPROM(23, panPitch_x_ADDR + offset);
    writeEEPROM(11, panPitch_y_ADDR + offset);
    writeEEPROM(on, panRoll_en_ADDR + offset);
    writeEEPROM(12, panRoll_x_ADDR + offset);
    writeEEPROM(1,  panRoll_y_ADDR + offset);
    writeEEPROM(on, panBatt_A_en_ADDR + offset);
    writeEEPROM(14, panBatt_A_x_ADDR + offset);
    writeEEPROM(14,  panBatt_A_y_ADDR + offset);
    writeEEPROM(on, panBatt_B_en_ADDR);
    writeEEPROM(21, panBatt_B_x_ADDR);
    writeEEPROM(3,  panBatt_B_y_ADDR);
    writeEEPROM(on, panGPSats_en_ADDR + offset);
    writeEEPROM(1,  panGPSats_x_ADDR + offset);
    writeEEPROM(11, panGPSats_y_ADDR + offset);
    writeEEPROM(on, panCOG_en_ADDR + offset);
    writeEEPROM(5,  panCOG_x_ADDR + offset);
    writeEEPROM(11, panCOG_y_ADDR + offset);
    writeEEPROM(on, panGPS_en_ADDR + offset);
    writeEEPROM(1,  panGPS_x_ADDR + offset);
    writeEEPROM(14, panGPS_y_ADDR + offset);
    writeEEPROM(on, panRose_en_ADDR + offset);
    writeEEPROM(21, panRose_x_ADDR + offset);
    writeEEPROM(15, panRose_y_ADDR + offset);
    writeEEPROM(on, panHeading_en_ADDR + offset);
    writeEEPROM(24, panHeading_x_ADDR + offset);
    writeEEPROM(14, panHeading_y_ADDR + offset);
//    writeEEPROM(on, panMavBeat_en_ADDR + offset);
//    writeEEPROM(2,  panMavBeat_x_ADDR + offset);
//    writeEEPROM(9, panMavBeat_y_ADDR + offset);
    writeEEPROM(on, panHomeDir_en_ADDR + offset);
    writeEEPROM(14, panHomeDir_x_ADDR + offset);
    writeEEPROM(3,  panHomeDir_y_ADDR + offset);
    writeEEPROM(on, panHomeDis_en_ADDR + offset);
    writeEEPROM(22, panHomeDis_x_ADDR + offset);
    writeEEPROM(1,  panHomeDis_y_ADDR + offset);
    writeEEPROM(off,panWPDir_en_ADDR);
    writeEEPROM(27,  panWPDir_x_ADDR);
    writeEEPROM(12,  panWPDir_y_ADDR);
    writeEEPROM(off, panWPDis_en_ADDR);
    writeEEPROM(9,  panWPDis_x_ADDR);
    writeEEPROM(14, panWPDis_y_ADDR);
    writeEEPROM(on, panRSSI_en_ADDR + offset);
    writeEEPROM(8,  panRSSI_x_ADDR + offset);
    writeEEPROM(13, panRSSI_y_ADDR + offset);
    writeEEPROM(on, panCur_A_en_ADDR + offset);
    writeEEPROM(14, panCur_A_x_ADDR + offset);
    writeEEPROM(15, panCur_A_y_ADDR + offset);
    writeEEPROM(on, panCur_B_en_ADDR);
    writeEEPROM(21, panCur_B_x_ADDR);
    writeEEPROM(4,  panCur_B_y_ADDR);
    writeEEPROM(on, panAlt_en_ADDR + offset);
    writeEEPROM(22, panAlt_x_ADDR + offset);
    writeEEPROM(3,  panAlt_y_ADDR + offset);
    writeEEPROM(on, panHomeAlt_en_ADDR + offset);
    writeEEPROM(22, panHomeAlt_x_ADDR + offset);
    writeEEPROM(2,  panHomeAlt_y_ADDR + offset);
    writeEEPROM(on, panVel_en_ADDR + offset);
    writeEEPROM(1,  panVel_x_ADDR + offset);
    writeEEPROM(2,  panVel_y_ADDR + offset);
    writeEEPROM(on, panAirSpeed_en_ADDR + offset);
    writeEEPROM(1,  panAirSpeed_x_ADDR + offset);
    writeEEPROM(1,  panAirSpeed_y_ADDR + offset); 
    writeEEPROM(on, panBatteryPercent_en_ADDR + offset);
    writeEEPROM(1,  panBatteryPercent_x_ADDR + offset);
    writeEEPROM(4,  panBatteryPercent_y_ADDR + offset); 
    writeEEPROM(on, panTime_en_ADDR + offset);
    writeEEPROM(23, panTime_x_ADDR + offset);
    writeEEPROM(13, panTime_y_ADDR + offset);
    writeEEPROM(on, panThr_en_ADDR + offset);
    writeEEPROM(1,  panThr_x_ADDR + offset);
    writeEEPROM(3,  panThr_y_ADDR + offset);
    writeEEPROM(on, panFMod_en_ADDR + offset);
    writeEEPROM(1,  panFMod_x_ADDR + offset);
    writeEEPROM(13, panFMod_y_ADDR + offset);
    writeEEPROM(on, panHorizon_en_ADDR + offset);
    writeEEPROM(8,  panHorizon_x_ADDR + offset);
    writeEEPROM(6,  panHorizon_y_ADDR + offset);
    writeEEPROM(on, panWarn_en_ADDR + offset);
    writeEEPROM(9,  panWarn_x_ADDR + offset);
    writeEEPROM(4,  panWarn_y_ADDR + offset);
    writeEEPROM(on, panOff_en_ADDR + offset);
//    writeEEPROM(10, panOff_x_ADDR + offset);
//    writeEEPROM(4,  panOff_y_ADDR + offset);
    writeEEPROM(on, panWindSpeed_en_ADDR + offset);
    writeEEPROM(24, panWindSpeed_x_ADDR + offset);
    writeEEPROM(7,  panWindSpeed_y_ADDR + offset);
    writeEEPROM(on, panClimb_en_ADDR + offset);
    writeEEPROM(1,  panClimb_x_ADDR + offset);
    writeEEPROM(8,  panClimb_y_ADDR + offset);
    writeEEPROM(on, panTune_en_ADDR + offset);
    writeEEPROM(10, panTune_x_ADDR + offset);
    writeEEPROM(4,  panTune_y_ADDR + offset);
    writeEEPROM(on, panEff_en_ADDR + offset);
    writeEEPROM(14, panEff_x_ADDR + offset);
    writeEEPROM(13, panEff_y_ADDR + offset);
 //   writeEEPROM(on, panCh_en_ADDR + offset);
 //   writeEEPROM(10, panCh_x_ADDR + offset);
 //   writeEEPROM(4,  panCh_y_ADDR + offset);
    writeEEPROM(off, panTemp_en_ADDR + offset);
    writeEEPROM(22, panTemp_x_ADDR + offset);
    writeEEPROM(14, panTemp_y_ADDR + offset);
    
//    writeEEPROM(on, panFata_en_ADDR + offset);
//    writeEEPROM(10, panFdata_x_ADDR + offset);
//    writeEEPROM(4,  panFdata_y_ADDR + offset);

    writeEEPROM(off, panDistance_en_ADDR + offset);
    writeEEPROM(22, panDistance_x_ADDR + offset);
    writeEEPROM(2,  panDistance_y_ADDR + offset);
 
    writeEEPROM(30,overspeed_ADDR);
    writeEEPROM(0,stall_ADDR);
    writeEEPROM(100,battv_ADDR); //10Volts
    writeEEPROM(6,ch_toggle_ADDR);

}

*/



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
