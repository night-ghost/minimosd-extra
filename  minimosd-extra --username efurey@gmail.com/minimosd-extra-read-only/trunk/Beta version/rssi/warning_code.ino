/* **************************************************************** */
// Panel  : panWarn
// Needs  : X, Y locations
// Output : Airspeed value from MAVlink with symbols
// Size   : 1 x 7  (rows x chars)
// Staus  : done
/******* PANELS - POSITION *******/
  void panWarn(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
if (osd_set == 0){
if ((start_Time - text_blink) > 0){
if (warning_type == 1){
  warning_type = 0;}
      else{
    if (warning_type > 1){ }
      else{
      if ((osd_fix_type) < 2){ 
      warning_type = 1;
text_blink = start_Time + 1;
      goto Warning;}
    }
  }
  
if (warning_type == 2){
  warning_type = 0;}
      else{
    if (warning_type > 2){}
      else{
      if ((osd_airspeed * converts) < stall && (osd_airspeed) > 1.12){
      warning_type = 2;
text_blink = start_Time + 1;
      goto Warning;}
      if ((osd_groundspeed * converts) < stall && (osd_groundspeed) > 1.12){
      warning_type = 2;
text_blink = start_Time + 1;
      goto Warning;}
    }
}
if (warning_type == 3){
  warning_type = 0; }
      else{
    if (warning_type > 3){}
      else {
      if ((osd_airspeed * converts) > overspeed ||(osd_groundspeed * converts) > overspeed){
      warning_type = 3;
text_blink = start_Time + 1;
      goto Warning;}
    }
}

if (warning_type == 4){
  warning_type = 0; }
      else{
    if (warning_type > 4){}
      else {
      if (osd_vbat_A < battv){
      warning_type = 4;
text_blink = start_Time + 1;
      goto Warning;}
    }
}

if (warning_type == 5){
  warning_type = 0; }
      else{
    if (warning_type > 5){}
      else {
      if (osd_battery_remaining_A < 10){
      warning_type = 5;
text_blink = start_Time + 1;
      goto Warning;}
    }
}
//if (warning_type == 6){
//  warning_type = 0; }
//      else{
//    if (warning_type > 6){}
//      else {
//      if ((osd_alt - osd_home_alt) < 10 && (osd_alt - osd_home_alt) > 0){
//      warning_type = 6;
//      text_blink = start_Time + 1;
//      goto Warning;}
//    }
//}
}
Warning:


switch(warning_type){
  case 0:
      osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20"));
    break;   
  case 1:  
      osd_off = 0;
      osd.printf_P(PSTR("\x20\x4E\x6F\x20\x47\x50\x53\x20\x66\x69\x78\x21"));
    break;
  case 2:
    osd_off = 0;
    osd.printf_P(PSTR("\x20\x20\x20\x53\x74\x61\x6c\x6c\x21\x20\x20\x20"));
    break;
  case 3:
    osd_off = 0;
    osd.printf_P(PSTR("\x20\x4f\x76\x65\x72\x53\x70\x65\x65\x64\x21\x20"));
    break;
  case 4:
    osd_off = 0;
    osd.printf_P(PSTR("\x42\x61\x74\x74\x65\x72\x79\x20\x4c\x6f\x77\x21"));
    break;
  case 5:
    osd_off = 0;
    osd.printf_P(PSTR("\x42\x61\x74\x74\x65\x72\x79\x20\x4c\x6f\x77\x21"));
    break;
//  case 6:
//    osd_off = 0;
//    osd.printf_P(PSTR("\x20\x20\x50\x75\x6c\x6c\x20\x55\x70\x21\x20\x20"));
//    break;
}
   
}
  osd.closePanel();
  }
