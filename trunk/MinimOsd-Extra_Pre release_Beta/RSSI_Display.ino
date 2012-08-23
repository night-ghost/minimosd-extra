void panRSSI(int first_col, int first_line){
  osd.setPanel(first_col, first_line);
  osd.openPanel();
  //rssical = EEPROM.read(OSD_HIGH_ADDR);
  //rssipersent = EEPROM.read(OSD_LOW_ADDR);
  osd_rssi = rssi;
  if (osd_rssi > rssical){
    osd_rssi = rssical;
  }
  if (osd_rssi < rssipersent){
    osd_rssi = rssipersent;
  }
  osd_rssi = osd_rssi - rssipersent;
  osd_rssi = (osd_rssi * 100)/rssipersent;
  if(osd_rssi >100){
    osd_rssi = 100;
  }
  osd.printf("rssi ");
  osd.printf("%3i%c",osd_rssi,0x25); 
  osd.closePanel();
}

