/* ******************************************************************/
/* *********************** BOOT UP FUNCTIONS ********************** */


///////////////////////////////////////////////////////
// Function: loadBar(void)
//
// On bootup time we will show loading bar for defined BOOTTIME seconds
// This is interesting to avoid writing to APM during bootup if OSD's TX is connected
// After that, it continue in normal mode eg starting to listen MAVLink commands

#define barX 5
#define barY 12

void loadBar() { //change name due we don't have CLI anymore
  int waitTimer;
  byte barStep = 0;

  // Write plain panel to let users know what to do
  panBoot(barX,barY);

  delay(500);    // To give small extra waittime to users
//  Serial.flush(); 
  
  // Our main loop to wait input from user.  
  for(waitTimer = 0; waitTimer <= BOOTTIME; waitTimer++) {

    // How often we update our progress bar is depending on modulo
    if(waitTimer % (BOOTTIME / 8) == 0) {
      barStep++;
      
      // Update bar it self
      osd.setPanel(barX + 12, barY);
      osd.openPanel();
      switch(barStep) {
        case 0:
         osd.printf_P(PSTR("\xf1\xf2\xf2\xf2\xf2\xf2\xf2"));
         break;
        case 1:
         osd.printf_P(PSTR("\xef\xf2\xf2\xf2\xf2\xf2\xf2"));
         break;
        case 2:
         osd.printf_P(PSTR("\xee\xf0\xf2\xf2\xf2\xf2\xf2"));
         break;
        case 3:
         osd.printf_P(PSTR("\xee\xee\xf0\xf2\xf2\xf2\xf2"));
         break;
        case 4:
         osd.printf_P(PSTR("\xee\xee\xee\xf0\xf2\xf2\xf2"));
         break;
        case 5:
         osd.printf_P(PSTR("\xee\xee\xee\xee\xf0\xf2\xf2"));
         break;
        case 6:
         osd.printf_P(PSTR("\xee\xee\xee\xee\xee\xf0\xf2"));
         break;
        case 7:
         osd.printf_P(PSTR("\xee\xee\xee\xee\xee\xee\xf0"));
         break;
        case 8:
         osd.printf_P(PSTR("\xee\xee\xee\xee\xee\xee\xee"));
         break;
        case 9:
         osd.printf_P(PSTR("\xee\xee\xee\xee\xee\xee\xee\xee"));
         break;
      }
      osd.closePanel();
    }
    
    delay(1);       // Minor delay to make sure that we stay here long enough
  }
}


