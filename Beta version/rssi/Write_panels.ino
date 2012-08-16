void writePanels(){ 
  
  if (EEPROM.read(200) == 0){
  converts = 3.6;
  converth = 1;
  spe = 0x81;
  high = 0x8D;
  }
  else{
  converts = 2.23;
  converth = 3.28;
  spe = 0xfb;
  high = 0x66;
  }
  if(millis() < (lastMAVBeat + 2000)){
    panOff();
    panSetup();
  if (osd_off == 0){
    if(ISa(Cen_BIT)) panCenter(panCenter_XY[0], panCenter_XY[1]);   //4x2
    if(ISa(Pit_BIT)) panPitch(panPitch_XY[0], panPitch_XY[1]); //5x1
    if(ISa(Rol_BIT)) panRoll(panRoll_XY[0], panRoll_XY[1]); //5x1
    if(ISa(BatA_BIT)) panBatt_A(panBatt_A_XY[0], panBatt_A_XY[1]); //7x1
//  if(ISa(BatB_BIT)) panBatt_B(panBatt_B_XY[0], panBatt_B_XY[1]); //7x1
    if(ISa(GPSats_BIT)) panGPSats(panGPSats_XY[0], panGPSats_XY[1]); //5x1
    if(ISa(GPL_BIT)) panGPL(panGPL_XY[0], panGPL_XY[1]); //2x1
    if(ISa(GPS_BIT)) panGPS(panGPS_XY[0], panGPS_XY[1]); //12x3
    if(ISa(Bp_BIT)) panBatteryPercent(panBatteryPercent_XY[0], panBatteryPercent_XY[1]); 
    if(ISb(Rose_BIT)) panRose(panRose_XY[0], panRose_XY[1]);        //13x3
    if(ISb(Head_BIT)) panHeading(panHeading_XY[0], panHeading_XY[1]); //13x3
    //if(ISb(MavB_BIT)) panMavBeat(panMavBeat_XY[0], panMavBeat_XY[1]); //13x3
    if(osd_got_home == 1){
      if(ISb(HDis_BIT)) panHomeDis(panHomeDis_XY[0], panHomeDis_XY[1]); //13x3
      if(ISb(HDir_BIT)) panHomeDir(panHomeDir_XY[0], panHomeDir_XY[1]); //13x3 
    }
    if(ISb(Time_BIT)) panTime(panTime_XY[0], panTime_XY[1]);
//  if(ISb(WDir_BIT)) panWayPDir(panWayPDir_XY[0], panWayPDir_XY[1]); //??x??
//  if(ISb(WDis_BIT)) panWayPDis(panWayPDis_XY[0], panWayPDis_XY[1]); //??x??
//******************************************************************************************************
//RSSI is using the MavBeat screen varable temp
//******************************************************************************************************
//  if(ISb(WRSSI_BIT)) panRSSI(panRSSI_XY[0], panRSSI_XY[1]); //??x??
    if(ISb(MavB_BIT)) panRSSI(panMavBeat_XY[0], panMavBeat_XY[1]); //??x??
    if(ISc(Alt_BIT)) panAlt(panAlt_XY[0], panAlt_XY[1]); //
    if(ISc(Halt_BIT)) panHomeAlt(panHomeAlt_XY[0], panHomeAlt_XY[1]); //
    if(ISc(Vel_BIT)) panVel(panVel_XY[0], panVel_XY[1]); //
    if(ISc(As_BIT)) panAirSpeed(panAirSpeed_XY[0], panAirSpeed_XY[1]); //
    if(ISc(Thr_BIT)) panThr(panThr_XY[0], panThr_XY[1]); //
    if(ISc(FMod_BIT)) panFlightMode(panFMod_XY[0], panFMod_XY[1]);  //
    if(ISc(Hor_BIT)) panHorizon(panHorizon_XY[0], panHorizon_XY[1]); //14x5
    if(ISc(CurA_BIT)) panCur_A(panCur_A_XY[0], panCur_A_XY[1]);
    if(ISd(Warn_BIT)) panWarn(panWarn_XY[0], panWarn_XY[1]);
    if(ISd(WindS_BIT)) panWindSpeed(panWindSpeed_XY[0], panWindSpeed_XY[1]);
    if(ISd(Climb_BIT)) panClimb(panClimb_XY[0], panClimb_XY[1]);
//  if(ISd(Tune_BIT)) panTune(panTune_XY[0], panTune_XY[1]);
  }
 }
  else{
    osd.clear();
    waitingMAVBeats = 1;
    // Display our logo and wait... 
    panWaitMAVBeats(5,10); //Waiting for MAVBeats...
  }
}

