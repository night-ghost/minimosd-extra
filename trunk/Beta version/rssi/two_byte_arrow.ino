// ---------------- EXTRA FUNCTIONS ----------------------
// Show those fancy 2 char arrows
void showArrow(int switchvarable) {  

  switch(switchvarable) {
    case 0: 
      osd.printf_P(PSTR("\x90\x91"));
      break;
    case 1: 
      osd.printf_P(PSTR("\x90\x91"));
      break;
    case 2: 
      osd.printf_P(PSTR("\x92\x93"));
      break;
    case 3: 
      osd.printf_P(PSTR("\x94\x95"));
      break;
    case 4: 
      osd.printf_P(PSTR("\x96\x97"));
      break;
    case 5: 
      osd.printf_P(PSTR("\x98\x99"));
      break;
    case 6: 
      osd.printf_P(PSTR("\x9A\x9B"));
      break;
    case 7: 
      osd.printf_P(PSTR("\x9C\x9D"));
      break;
    case 8: 
      osd.printf_P(PSTR("\x9E\x9F"));
      break;
    case 9: 
      osd.printf_P(PSTR("\xA0\xA1"));
      break;
    case 10: 
      osd.printf_P(PSTR("\xA2\xA3"));
      break;
    case 11: 
      osd.printf_P(PSTR("\xA4\xA5"));
      break;
    case 12: 
      osd.printf_P(PSTR("\xA6\xA7"));
      break;
    case 13: 
      osd.printf_P(PSTR("\xA8\xA9"));
      break;
    case 14: 
      osd.printf_P(PSTR("\xAA\xAB"));
      break;
    case 15: 
      osd.printf_P(PSTR("\xAC\xAD"));
      break;
    case 16: 
      osd.printf_P(PSTR("\xAE\xAF"));
      break;
  }  

}

