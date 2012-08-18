/* **************************************************************** */
// Panel  : panOff
// Needs  : X, Y locations
// Output : OSD off
// Size   : 1 x 7Hea  (rows x chars)
// Staus  : done
//test file change
void panOff(){
if (((apm_mav_type == 1) && ((osd_mode != 11) && (osd_mode != 1))) || ((apm_mav_type == 2) && ((osd_mode != 6) && (osd_mode != 7)))){
  if (osd_off_switch != osd_mode){ 
      osd_off_switch = osd_mode;
      osd_switch_time = millis();
      if (osd_off_switch == osd_switch_last){
        if (osd_off == 1){
        osd_off = 0;
        osd_set = 0;
        osd.clear();
      }
      else {
        osd_off = 1;
        osd.clear();
        if (millis() <= 60000){
           osd_set = 1; 
        }
      }
    }
  }
    if ((millis() - osd_switch_time) > 2000){
      osd_switch_last = osd_mode;
    }
  }
  osd.closePanel();
}

