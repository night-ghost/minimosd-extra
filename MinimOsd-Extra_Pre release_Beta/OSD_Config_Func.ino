/* ******************************************************************/
/* *********************** GENERAL FUNCTIONS ********************** */

//Extract functions (get bits from the positioning bytes
#define ISa(whichBit) getBit(panA_REG, whichBit)
#define ISb(whichBit) getBit(panB_REG, whichBit)
#define ISc(whichBit) getBit(panC_REG, whichBit)
#define ISd(whichBit) getBit(panD_REG, whichBit)

 

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

// EEPROM reader/writers
// Utilities for writing and reading from the EEPROM
byte readEEPROM(int address) {

  return EEPROM.read(address);
}

void writeEEPROM(byte value, int address) {
  EEPROM.write(address, value);
}


void InitializeOSD() {
  
  loadBar();
  delay(500);

  writeEEPROM(42, CHK1);
  writeEEPROM(VER-42,CHK2);
  writeSettings();
  
  osd.setPanel(4,9);
  osd.openPanel();
  osd.printf_P(PSTR("OSD Initialized, reboot")); 
  osd.closePanel();
 
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
 writeEEPROM(off, panCenter_en_ADDR);
 writeEEPROM(13, panCenter_x_ADDR);
 writeEEPROM(7,  panCenter_y_ADDR);
 writeEEPROM(on, panPitch_en_ADDR);
 writeEEPROM(22, panPitch_x_ADDR);
 writeEEPROM(9,  panPitch_y_ADDR);
 writeEEPROM(on, panRoll_en_ADDR);
 writeEEPROM(11, panRoll_x_ADDR);
 writeEEPROM(1,  panRoll_y_ADDR);
 writeEEPROM(on, panBatt_A_en_ADDR);
 writeEEPROM(21, panBatt_A_x_ADDR);
 writeEEPROM(1,  panBatt_A_y_ADDR);
 //writeEEPROM(on, panBatt_B_en_ADDR);
 //writeEEPROM(21, panBatt_B_x_ADDR);
 //writeEEPROM(3,  panBatt_B_y_ADDR);
 writeEEPROM(on, panGPSats_en_ADDR);
 writeEEPROM(2,  panGPSats_x_ADDR);
 writeEEPROM(13, panGPSats_y_ADDR);
 writeEEPROM(on, panGPL_en_ADDR);
 writeEEPROM(5,  panGPL_x_ADDR);
 writeEEPROM(13, panGPL_y_ADDR);
 writeEEPROM(on, panGPS_en_ADDR);
 writeEEPROM(2,  panGPS_x_ADDR);
 writeEEPROM(14, panGPS_y_ADDR);
 writeEEPROM(on, panRose_en_ADDR);
 writeEEPROM(16, panRose_x_ADDR);
 writeEEPROM(14, panRose_y_ADDR);
 writeEEPROM(on, panHeading_en_ADDR);
 writeEEPROM(24, panHeading_x_ADDR);
 writeEEPROM(13, panHeading_y_ADDR);
 writeEEPROM(on, panMavBeat_en_ADDR);
 writeEEPROM(2,  panMavBeat_x_ADDR);
 writeEEPROM(9, panMavBeat_y_ADDR);
 writeEEPROM(on, panHomeDir_en_ADDR);
 writeEEPROM(14, panHomeDir_x_ADDR);
 writeEEPROM(3,  panHomeDir_y_ADDR);
 writeEEPROM(on, panHomeDis_en_ADDR);
 writeEEPROM(2,  panHomeDis_x_ADDR);
 writeEEPROM(1,  panHomeDis_y_ADDR);
// writeEEPROM(off,panWPDir_en_ADDR);
// writeEEPROM(0,  panWPDir_x_ADDR);
// writeEEPROM(0,  panWPDir_y_ADDR);
// writeEEPROM(off,panWPDis_en_ADDR);
// writeEEPROM(0,  panWPDis_x_ADDR);
// writeEEPROM(0,  panWPDis_y_ADDR);
 writeEEPROM(on, panRSSI_en_ADDR);
 writeEEPROM(21, panRSSI_x_ADDR);
 writeEEPROM(5,  panRSSI_y_ADDR);
 
 writeEEPROM(on, panCur_A_en_ADDR);
 writeEEPROM(21, panCur_A_x_ADDR);
 writeEEPROM(2,  panCur_A_y_ADDR);
 //writeEEPROM(on, panCur_B_en_ADDR);
 //writeEEPROM(21, panCur_B_x_ADDR);
 //writeEEPROM(4,  panCur_B_y_ADDR);
 writeEEPROM(on, panAlt_en_ADDR);
 writeEEPROM(2,  panAlt_x_ADDR);
 writeEEPROM(2,  panAlt_y_ADDR);
 writeEEPROM(on, panHomeAlt_en_ADDR);
 writeEEPROM(2,  panHomeAlt_x_ADDR);
 writeEEPROM(5,  panHomeAlt_y_ADDR);
 writeEEPROM(on, panVel_en_ADDR);
 writeEEPROM(2,  panVel_x_ADDR);
 writeEEPROM(3,  panVel_y_ADDR);
 writeEEPROM(on, panAirSpeed_en_ADDR);
 writeEEPROM(2,  panAirSpeed_x_ADDR);
 writeEEPROM(3,  panAirSpeed_y_ADDR); 
 writeEEPROM(on, panBatteryPercent_en_ADDR);
 writeEEPROM(2,  panBatteryPercent_x_ADDR);
 writeEEPROM(3,  panBatteryPercent_y_ADDR); 
 writeEEPROM(on, panTime_en_ADDR);
 writeEEPROM(2,  panTime_x_ADDR);
 writeEEPROM(3,  panTime_y_ADDR);
 writeEEPROM(on, panThr_en_ADDR);
 writeEEPROM(2,  panThr_x_ADDR);
 writeEEPROM(4,  panThr_y_ADDR);
 writeEEPROM(on, panFMod_en_ADDR);
 writeEEPROM(17,  panFMod_x_ADDR);
 writeEEPROM(13, panFMod_y_ADDR);
 writeEEPROM(on, panHorizon_en_ADDR);
 writeEEPROM(8,  panHorizon_x_ADDR);
 writeEEPROM(7,  panHorizon_y_ADDR);
 writeEEPROM(on, panWarn_en_ADDR);
 writeEEPROM(10, panWarn_x_ADDR);
 writeEEPROM(4,  panWarn_y_ADDR);
 writeEEPROM(on, panOff_en_ADDR);
 //writeEEPROM(10, panOff_x_ADDR);
 //writeEEPROM(4,  panOff_y_ADDR);
 writeEEPROM(on, panWindSpeed_en_ADDR);
 writeEEPROM(10, panWindSpeed_x_ADDR);
 writeEEPROM(4,  panWindSpeed_y_ADDR);
 writeEEPROM(on, panClimb_en_ADDR);
 writeEEPROM(10, panClimb_x_ADDR);
 writeEEPROM(4,  panClimb_y_ADDR);
// writeEEPROM(on, panTune_en_ADDR);
// writeEEPROM(10, panTune_x_ADDR);
// writeEEPROM(4,  panTune_y_ADDR);
 writeEEPROM(on, panSetup_en_ADDR);
// writeEEPROM(10, panSetup_x_ADDR);
// writeEEPROM(4,  panSetup_y_ADDR);
}

void readSettings() {
  
  overspeed = EEPROM.read(overspeed_ADDR);
  stall = EEPROM.read(stall_ADDR);
  battv = EEPROM.read(battv_ADDR);
  ch_off = EEPROM.read(ch_off_ADDR);
  //ch_off = 8;
//  battp = EEPROM.read(battp_ADDR);
//  if (EEPROM.read(194) != 1 || EEPROM.read(196) != 5 || EEPROM.read(198) != 7){
  if (EEPROM.read(panSetup_en_ADDR) != 1){
      EEPROM.write(panSetup_en_ADDR, 1);
  }
  rssical = EEPROM.read(OSD_RSSI_HIGH_ADDR);
  rssipersent = EEPROM.read(OSD_RSSI_LOW_ADDR);
  //****** First set of 8 Panels ******
  
  setBit(panA_REG, Cen_BIT, readEEPROM(panCenter_en_ADDR));
  panCenter_XY[0] = readEEPROM(panCenter_x_ADDR);
  panCenter_XY[1] = checkPAL(readEEPROM(panCenter_y_ADDR));
  
  setBit(panA_REG, Bp_BIT, readEEPROM(panBatteryPercent_en_ADDR));
  panBatteryPercent_XY[0] = readEEPROM(panBatteryPercent_x_ADDR);
  panBatteryPercent_XY[1] = checkPAL(readEEPROM(panBatteryPercent_y_ADDR));
  
  setBit(panA_REG, Pit_BIT, readEEPROM(panPitch_en_ADDR));
  panPitch_XY[0] = readEEPROM(panPitch_x_ADDR);
  panPitch_XY[1] = checkPAL(readEEPROM(panPitch_y_ADDR));
  
  setBit(panA_REG, Rol_BIT, readEEPROM(panRoll_en_ADDR));
  panRoll_XY[0] = readEEPROM(panRoll_x_ADDR);
  panRoll_XY[1] = checkPAL(readEEPROM(panRoll_y_ADDR));
  
  setBit(panA_REG, BatA_BIT, readEEPROM(panBatt_A_en_ADDR));
  panBatt_A_XY[0] = readEEPROM(panBatt_A_x_ADDR);
  panBatt_A_XY[1] = checkPAL(readEEPROM(panBatt_A_y_ADDR));

  //setBit(panA_REG, BatB_BIT, readEEPROM(panBatt_B_en_ADDR));
  //panBatt_B_XY[0] = readEEPROM(panBatt_B_x_ADDR);
  //panBatt_B_XY[1] = checkPAL(readEEPROM(panBatt_B_y_ADDR));
  
  setBit(panA_REG, GPSats_BIT, readEEPROM(panGPSats_en_ADDR));
  panGPSats_XY[0] = readEEPROM(panGPSats_x_ADDR);
  panGPSats_XY[1] = checkPAL(readEEPROM(panGPSats_y_ADDR));

  setBit(panA_REG, GPL_BIT, readEEPROM(panGPL_en_ADDR));
  panGPL_XY[0] = readEEPROM(panGPL_x_ADDR);
  panGPL_XY[1] = checkPAL(readEEPROM(panGPL_y_ADDR));
  
  setBit(panA_REG, GPS_BIT, readEEPROM(panGPS_en_ADDR));
  panGPS_XY[0] = readEEPROM(panGPS_x_ADDR);
  panGPS_XY[1] = checkPAL(readEEPROM(panGPS_y_ADDR));

  //****** Second set of 8 Panels ******
  
  setBit(panB_REG, Rose_BIT, readEEPROM(panRose_en_ADDR));
  panRose_XY[0] = readEEPROM(panRose_x_ADDR);
  panRose_XY[1] = checkPAL(readEEPROM(panRose_y_ADDR));

  setBit(panB_REG, Head_BIT, readEEPROM(panHeading_en_ADDR));
  panHeading_XY[0] = readEEPROM(panHeading_x_ADDR);
  panHeading_XY[1] = checkPAL(readEEPROM(panHeading_y_ADDR));

  setBit(panB_REG, MavB_BIT, readEEPROM(panMavBeat_en_ADDR));
  panMavBeat_XY[0] = readEEPROM(panMavBeat_x_ADDR);
  panMavBeat_XY[1] = checkPAL(readEEPROM(panMavBeat_y_ADDR));

  setBit(panB_REG, HDis_BIT, readEEPROM(panHomeDis_en_ADDR));
  panHomeDis_XY[0] = readEEPROM(panHomeDis_x_ADDR);
  panHomeDis_XY[1] = checkPAL(readEEPROM(panHomeDis_y_ADDR));

  setBit(panB_REG, HDir_BIT, readEEPROM(panHomeDir_en_ADDR));
  panHomeDir_XY[0] = readEEPROM(panHomeDir_x_ADDR);
  panHomeDir_XY[1] = checkPAL(readEEPROM(panHomeDir_y_ADDR));

  setBit(panB_REG, Time_BIT, readEEPROM(panTime_en_ADDR));
  panTime_XY[0] = readEEPROM(panTime_x_ADDR);
  panTime_XY[1] = checkPAL(readEEPROM(panTime_y_ADDR));

  //****** Third set of 8 Panels ******

  setBit(panC_REG, CurA_BIT, readEEPROM(panCur_A_en_ADDR));
  panCur_A_XY[0] = readEEPROM(panCur_A_x_ADDR);
  panCur_A_XY[1] = checkPAL(readEEPROM(panCur_A_y_ADDR));

  //setBit(panC_REG, CurB_BIT, readEEPROM(panCur_B_en_ADDR));
  //panCur_B_XY[0] = readEEPROM(panCur_B_x_ADDR);
  //panCur_B_XY[1] = checkPAL(readEEPROM(panCur_B_y_ADDR));

  setBit(panC_REG, Alt_BIT, readEEPROM(panAlt_en_ADDR));
  panAlt_XY[0] = readEEPROM(panAlt_x_ADDR);
  panAlt_XY[1] = checkPAL(readEEPROM(panAlt_y_ADDR));

  setBit(panC_REG, Halt_BIT, readEEPROM(panHomeAlt_en_ADDR));
  panHomeAlt_XY[0] = readEEPROM(panHomeAlt_x_ADDR);
  panHomeAlt_XY[1] = checkPAL(readEEPROM(panHomeAlt_y_ADDR));
  
  setBit(panC_REG, As_BIT, readEEPROM(panAirSpeed_en_ADDR));
  panAirSpeed_XY[0] = readEEPROM(panAirSpeed_x_ADDR);
  panAirSpeed_XY[1] = checkPAL(readEEPROM(panAirSpeed_y_ADDR));

  setBit(panC_REG, Vel_BIT, readEEPROM(panVel_en_ADDR));
  panVel_XY[0] = readEEPROM(panVel_x_ADDR);
  panVel_XY[1] = checkPAL(readEEPROM(panVel_y_ADDR));

  setBit(panC_REG, Thr_BIT, readEEPROM(panThr_en_ADDR));
  panThr_XY[0] = readEEPROM(panThr_x_ADDR);
  panThr_XY[1] = checkPAL(readEEPROM(panThr_y_ADDR));

  setBit(panC_REG, FMod_BIT, readEEPROM(panFMod_en_ADDR));
  panFMod_XY[0] = readEEPROM(panFMod_x_ADDR);
  panFMod_XY[1] = checkPAL(readEEPROM(panFMod_y_ADDR));

  setBit(panC_REG, Hor_BIT, readEEPROM(panHorizon_en_ADDR));
  panHorizon_XY[0] = readEEPROM(panHorizon_x_ADDR);
  panHorizon_XY[1] = checkPAL(readEEPROM(panHorizon_y_ADDR));

  setBit(panD_REG, Warn_BIT, readEEPROM(panWarn_en_ADDR));
  panWarn_XY[0] = readEEPROM(panWarn_x_ADDR);
  panWarn_XY[1] = checkPAL(readEEPROM(panWarn_y_ADDR));
  
  setBit(panD_REG, Off_BIT, readEEPROM(panOff_en_ADDR));
  //panOff_XY[0] = readEEPROM(panOff_x_ADDR);
  //panOff_XY[1] = checkPAL(readEEPROM(panOff_y_ADDR));
  
  setBit(panD_REG, WindS_BIT, readEEPROM(panWindSpeed_en_ADDR));
  panWindSpeed_XY[0] = readEEPROM(panWindSpeed_x_ADDR);
  panWindSpeed_XY[1] = checkPAL(readEEPROM(panWindSpeed_y_ADDR));
  
  setBit(panD_REG, Climb_BIT, readEEPROM(panClimb_en_ADDR));
  panClimb_XY[0] = readEEPROM(panClimb_x_ADDR);
  panClimb_XY[1] = checkPAL(readEEPROM(panClimb_y_ADDR));
  
//  setBit(panD_REG, Tune_BIT, readEEPROM(panTune_en_ADDR));
//  panTune_XY[0] = readEEPROM(panTune_x_ADDR);
//  panTune_XY[1] = checkPAL(readEEPROM(panTune_y_ADDR));
  
  setBit(panD_REG, Setup_BIT, readEEPROM(panSetup_en_ADDR));
//  panSetup_XY[0] = readEEPROM(panSetup_x_ADDR);
//  panSetup_XY[1] = checkPAL(readEEPROM(panSetup_y_ADDR));

  setBit(panD_REG, RSSI_BIT, readEEPROM(panRSSI_en_ADDR));
  panRSSI_XY[0] = readEEPROM(panRSSI_x_ADDR);
  panRSSI_XY[1] = checkPAL(readEEPROM(panRSSI_y_ADDR));
}

int checkPAL(int line){
  if(line >= osd.getCenter() && osd.getMode() == 0){
    line -= 3;//Cutting lines offset after center if NTSC
  }
  return line;
}

void updateSettings(byte panel, byte panel_x, byte panel_y, byte panel_s ) {
  if(panel >= 1 && panel <= 32) {
    
    writeEEPROM(panel_s, (6 * panel) - 6 + 0);
    if(panel_s != 0) {
      writeEEPROM(panel_x, (6 * panel) - 6 + 2);
      writeEEPROM(panel_y, (6 * panel) - 6 + 4);
    }
    osd.clear();
    readSettings();
  } 
}

