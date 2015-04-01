
/* ******************************************************************/
/* *********************** GENERAL FUNCTIONS ********************** */


boolean inline is_on(point p){
    //return p.x>=0 && p.y >=0 && p.y < 0x80;
    return p.y < 0x80;
}
/*
boolean getBit(byte Reg, byte whichBit) {
    boolean State;
    State = Reg & (1 << whichBit);
    return State;
}

byte setBit(byte &Reg, byte whichBit, boolean stat) {
    if (stat) {
        Reg = Reg | (1 << whichBit);
    } 
    else {
        Reg = Reg & ~(1 << whichBit);
    }
    return Reg;
}
*/




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
    uint16_t offset = OffsetBITpanel * panel;

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
    //writeEEPROM(on, panBatt_B_en_ADDR);
    //writeEEPROM(21, panBatt_B_x_ADDR);
    //writeEEPROM(3,  panBatt_B_y_ADDR);
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
    //writeEEPROM(on, panCur_B_en_ADDR);
    //writeEEPROM(21, panCur_B_x_ADDR);
    //writeEEPROM(4,  panCur_B_y_ADDR);
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
//    writeEEPROM(on, panTune_en_ADDR + offset);
//    writeEEPROM(10, panTune_x_ADDR + offset);
//    writeEEPROM(4,  panTune_y_ADDR + offset);
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
void readSettings() {
    overspeed = EEPROM.read(overspeed_ADDR);
    stall = EEPROM.read(stall_ADDR);
    battv = EEPROM.read(battv_ADDR);
    switch_mode = EEPROM.read(switch_mode_ADDR);
    panel_auto_switch = EEPROM.read(AUTO_SCREEN_SWITC_ADD);
    ch_toggle = EEPROM.read(ch_toggle_ADDR);

//    if (ch_toggle < 6 || ch_toggle > 8){
//     	EEPROM.write(ch_toggle_ADDR, ch_toggle=6);
//	}

    //  battp = EEPROM.read(battp_ADDR);
    rssical = EEPROM.read(OSD_RSSI_HIGH_ADDR);
    rssipersent = EEPROM.read(OSD_RSSI_LOW_ADDR);
    rssiraw_on = EEPROM.read(OSD_RSSI_RAW_ADDR);

    batt_warn_level = EEPROM.read(OSD_BATT_WARN_ADDR);
    rssi_warn_level = EEPROM.read(OSD_RSSI_WARN_ADDR);

/*    int i;
    for(i=0;i < OSD_CALL_SIGN_TOTAL;i++) 
    {
        char_call[i] = EEPROM.read(OSD_CALL_SIGN_ADDR + i);
        if(char_call[i] == 0) break;
    }
    char_call[i+1] ='\0'; //null terminate the string 
*/
}

point read_one(uint16_t addr){
    point p;
    byte en;

    en=readEEPROM(addr);
    if(!en)
	return {-1,-1};

//    p.x=         readEEPROM(addr+1);
//    p.y=checkPAL(readEEPROM(addr+2));

// почему-то сейчас оффсет 2 байта
    p.x=         readEEPROM(addr+2);
    p.y=checkPAL(readEEPROM(addr+4));
    return p;
}

// cчитать настройки текущей панели из EEPROM
void readPanelSettings() {

    static uint16_t currentPanel=255;
    
    if(panel==currentPanel) return;
    if(panel>npanels) return; // не читаем мусор при переключении на служебные панели с верхними номерами
    
    currentPanel=panel;
    
    //****** First set of 8 Panels ******
    uint16_t offset = OffsetBITpanel * panel;

/*
    все располагается стандартно, так что можно читать унифицированно все параметры
*/


 //   setBit(panA_REG, Cen_BIT, readEEPROM(panCenter_en_ADDR + offset));
 //   panCenter_XY[0] = readEEPROM(panCenter_x_ADDR + offset);
 //   panCenter_XY[1] = checkPAL(readEEPROM(panCenter_y_ADDR + offset));

 //   panCenter_XY=read_one(panCenter_en_ADDR + offset);

    panBatteryPercent_XY=read_one(panBatteryPercent_en_ADDR + offset);

    panPitch_XY=read_one(panPitch_en_ADDR + offset);

    panRoll_XY=read_one(panRoll_en_ADDR + offset);

    panBatt_A_XY=read_one(panBatt_A_en_ADDR + offset);

//  panBatt_B_XY=read_one(panBatt_B_en_ADDR);

    panGPSats_XY=read_one(panGPSats_en_ADDR + offset);

    panCOG_XY=read_one(panCOG_en_ADDR + offset);

    panGPS_XY=read_one(panGPS_en_ADDR + offset);

    //****** Second set of 8 Panels ******

    panRose_XY=read_one(panRose_en_ADDR + offset);

    panHeading_XY=read_one(panHeading_en_ADDR + offset);

//    panMavBeat_XY=read_one(panMavBeat_en_ADDR + offset);

    panHomeDis_XY=read_one(panHomeDis_en_ADDR + offset);
    
    panHomeDir_XY=read_one(panHomeDir_en_ADDR + offset);

    panWPDir_XY=read_one(panWPDir_en_ADDR + offset);

    panWPDis_XY=read_one(panWPDis_en_ADDR + offset);

    panTime_XY=read_one(panTime_en_ADDR + offset);

    panRSSI_XY=read_one(panRSSI_en_ADDR);

    //****** Third set of 8 Panels ******

    panCur_A_XY=read_one(panCur_A_en_ADDR + offset);

//     panCur_B_XY=read_one(panCur_B_en_ADDR);

    panAlt_XY=read_one(panAlt_en_ADDR + offset);

    panHomeAlt_XY=read_one(panHomeAlt_en_ADDR + offset);

    panAirSpeed_XY=read_one(panAirSpeed_en_ADDR + offset);

    panVel_XY=read_one(panVel_en_ADDR + offset);

    panThr_XY=read_one(panThr_en_ADDR + offset);

    panFMod_XY=read_one(panFMod_en_ADDR + offset);

    panHorizon_XY=read_one(panHorizon_en_ADDR + offset);

    panWarn_XY=read_one(panWarn_en_ADDR + offset);

    panWindSpeed_XY=read_one(panWindSpeed_en_ADDR + offset);

    panClimb_XY=read_one(panClimb_en_ADDR + offset);

//    panTune_XY=read_one(panTune_en_ADDR + offset);

    panRSSI_XY=read_one(panRSSI_en_ADDR + offset);
    
    panEff_XY=read_one(panEff_en_ADDR + offset);

    panCALLSIGN_XY=read_one(panCALLSIGN_en_ADDR + offset);

//    panCh_XY=read_one(panCh_en_ADDR + offset);

    panTemp_XY=read_one(panTemp_en_ADDR + offset);

    panDistance_XY=read_one(panDistance_en_ADDR + offset);
}

int checkPAL(int line){
    if(line >= osd.getCenter() && osd.getMode() == 0){
        line -= 3;//Cutting lines offset after center if NTSC
    }
    return line;
}

void updateSettings(byte panelu, byte panel_x, byte panel_y, byte panel_s ) {
    if(panel >= 1 && panel <= 32) {

        writeEEPROM(panel_s, (6 * panelu) - 6 + 0);
        if(panel_s != 0) {
            writeEEPROM(panel_x, (6 * panelu) - 6 + 2);
            writeEEPROM(panel_y, (6 * panelu) - 6 + 4);
        }
        osd.clear();
        readSettings();
//        for(panel = 0; panel < npanels; panel++) readPanelSettings();
	readPanelSettings();
    } 
}

