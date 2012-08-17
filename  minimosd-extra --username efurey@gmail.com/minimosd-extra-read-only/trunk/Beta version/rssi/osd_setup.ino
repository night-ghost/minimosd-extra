/* **************************************************************** */
// Panel  : panSetup
void panSetup(){
  osd.setPanel(1, 3);
  osd.openPanel(); 
  if (chan1_raw_middle == 0 && chan2_raw_middle == 0){
  chan1_raw_middle = chan1_raw;
  chan2_raw_middle = chan2_raw;
  }
  if (osd_set == 1){
   if (millis() - a > 500){
     a = millis();
   if ((chan2_raw - 100) > chan2_raw_middle ){
   setup_menu = setup_menu + 1;
   }
   if ((chan2_raw + 100) < chan2_raw_middle ){
   setup_menu = setup_menu - 1;
   }
   if (setup_menu < 0){
   setup_menu = 0;
   }
   if (setup_menu > 5){
   setup_menu = 5;}
   
}
    switch (setup_menu){
      case 0:
        if (millis() - b > 500){
        b = millis();
        if (EEPROM.read(200) == 0){
        osd.printf_P(PSTR("Set metric system  "));
        overwritedisplay();
        if ((chan1_raw - 100) > chan1_raw_middle || (chan1_raw + 100) < chan1_raw_middle ){
        EEPROM.write(200, 1);
        
        }
        }
        else {
        osd.printf_P(PSTR("Set US system     "));
        overwritedisplay();
        if ((chan1_raw - 100) > chan1_raw_middle || (chan1_raw + 100) < chan1_raw_middle){
        EEPROM.write(200, 0);
        
        }
        }
        }
        break;
      case 1:
        osd.printf_P(PSTR("Set Overspeed "));
        osd.printf("%3.0i%c", overspeed, spe);
        osd.printf_P(PSTR("           "));
        overwritedisplay();
        if ((chan1_raw - 100) > chan1_raw_middle ){
        overspeed = overspeed - 1;}
        if ((chan1_raw + 100) < chan1_raw_middle ){
        overspeed = overspeed + 1;} 
        EEPROM.write(202, overspeed);
        break;
      case 2:
        osd.printf_P(PSTR("Set Stall Speed "));
        osd.printf("%3.0i%c", stall , spe);
        osd.printf_P(PSTR("           "));
        overwritedisplay();
        if ((chan1_raw - 100) > chan1_raw_middle ){
        stall = stall - 1;}
        if ((chan1_raw + 100) < chan1_raw_middle ){
        stall = stall + 1;} 
        EEPROM.write(204, stall);
        break;
       case 3:
        osd.setPanel(1, 2);
        osd.printf_P(PSTR("|set RSSI good value       "));
        osd.printf_P(PSTR("|RSSI strong value ="));
        osd.printf("%3.0i", rssi);
        osd.printf_P(PSTR("     |epromm value ="));
        rssical = EEPROM.read(OSD_HIGH_ADDR);
        osd.printf("%3.0i", rssical);
        if ((chan1_raw - 100) > chan1_raw_middle ){
        rssical = rssical - 1;}
        if ((chan1_raw + 100) < chan1_raw_middle ){
        rssical = rssical + 1;} 
        EEPROM.write(OSD_HIGH_ADDR, rssical);
        break;
       case 4:
        osd.setPanel(1, 2);
        osd.printf_P(PSTR("|set RSSI low value      "));
        osd.printf_P(PSTR("|RSSI transmitter off ="));
        osd.printf("%3.0i", rssi);
        rssical = EEPROM.read(OSD_LOW_ADDR);
        osd.printf_P(PSTR("       |epromm value ="));
        osd.printf("%3.0i", rssical);
        if ((chan1_raw - 100) > chan1_raw_middle ){
        rssical = rssical - 1;}
        if ((chan1_raw + 100) < chan1_raw_middle ){
        rssical = rssical + 1;} 
        EEPROM.write(OSD_LOW_ADDR, rssical);
        break;
       case 5:
        osd.printf_P(PSTR("Battery warning "));
        osd.printf("%3.1f%c", battv , 0x76, 0x20);
         if ((chan1_raw - 100) > chan1_raw_middle ){
            battv = battv - 0.1;}
            if ((chan1_raw + 100) < chan1_raw_middle ){
                battv = battv + 0.1;} 
        EEPROM.write(206, battv);
        break;
//   case 6:
//     osd.printf_P(PSTR("Battery warning "));
//     osd.printf("%3.0i%c", battp , 0x25);
//     if ((chan1_raw - 100) > chan1_raw_middle ){
//     battp = battp - 1;}
//     if ((chan1_raw + 100) < chan1_raw_middle ){
//     battp = battp + 1;} 
//     EEPROM.write(208, battp);
//     break;

 }
  }
  osd.closePanel();
}

void overwritedisplay(){
     osd.printf_P(PSTR("|                                "));
     osd.printf_P(PSTR("|                                "));
}

