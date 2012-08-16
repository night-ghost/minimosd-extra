void panWindSpeed(int first_col, int first_line){
osd.setPanel(first_col, first_line);
osd.openPanel();

if (osd_airspeed > 4){
if (heding_check == -2){
heding_check = osd_heading;
}
if (millis() - wind_time > 60000){
wind_time = millis();
if (heding_check == -1){
osd_windspeed = osd_windspeed_check;
osd_winddirection = osd_winddirection_check;
osd_windspeed_check = 0;}
heding_check = osd_heading;
wind = 1;
}

if (heding_check > 180){
if (osd_heading >= (heding_check - 182.5) && osd_heading <= (heding_check - 177.5)){
heding_check = -1;
}}
else if (osd_heading >= (heding_check + 177.5) && osd_heading <= (heding_check + 182.5)){
heding_check = -1;
}

if (osd_airspeed > osd_groundspeed){
if ((osd_airspeed - osd_groundspeed) > osd_windspeed_check){
osd_windspeed_check = (osd_airspeed - osd_groundspeed);
if (osd_heading > 180){
osd_winddirection_check = (osd_heading - 180);}
else {
osd_winddirection_check = (osd_heading + 180);
}
}
}

else if (osd_groundspeed > osd_airspeed){
if ((osd_groundspeed - osd_airspeed) > osd_windspeed_check){
osd_windspeed_check = (osd_groundspeed - osd_airspeed);
osd_winddirection_check = osd_heading;
}
} 


osd_wind_arrow_rotate = osd_winddirection - osd_heading;
if (osd_winddirection - osd_heading < 0){
osd_wind_arrow_rotate = osd_wind_arrow_rotate + 360;
}






if (osd_wind_arrow_rotate <= 0 && osd_wind_arrow_rotate <= 11.25){
wind_arrow_set1 = 0x90;
wind_arrow_set2 = 0x91;}
else if (osd_wind_arrow_rotate >= 11.25 && osd_wind_arrow_rotate <= 33.75){
wind_arrow_set1 = 0x92;
wind_arrow_set2 = 0x93;}
else if (osd_wind_arrow_rotate >= 33.75 && osd_wind_arrow_rotate <= 56.25){
wind_arrow_set1 = 0x94;
wind_arrow_set2 = 0x95;}
else if (osd_wind_arrow_rotate >= 56.25 && osd_wind_arrow_rotate <= 78.75){
wind_arrow_set1 = 0x96;
wind_arrow_set2 = 0x97;} 
else if (osd_wind_arrow_rotate >= 78.75 && osd_wind_arrow_rotate <= 101.25){
wind_arrow_set1 = 0x98;
wind_arrow_set2 = 0x99;}
else if (osd_wind_arrow_rotate >= 101.25 && osd_wind_arrow_rotate <= 123.75){
wind_arrow_set1 = 0x9A;
wind_arrow_set2 = 0x9B;} 
else if (osd_wind_arrow_rotate >= 123.75 && osd_wind_arrow_rotate <= 146.25){
wind_arrow_set1 = 0x9C;
wind_arrow_set2 = 0x9D;}
else if (osd_wind_arrow_rotate >= 146.25 && osd_wind_arrow_rotate <= 168.75){
wind_arrow_set1 = 0x9E;
wind_arrow_set2 = 0x9F;} 
else if (osd_wind_arrow_rotate >= 168.75 && osd_wind_arrow_rotate <= 191.25){
wind_arrow_set1 = 0xA0;
wind_arrow_set2 = 0xA1;}
else if (osd_wind_arrow_rotate >= 191.25 && osd_wind_arrow_rotate <= 213.75){
wind_arrow_set1 = 0xA2;
wind_arrow_set2 = 0xA3;} 
else if (osd_wind_arrow_rotate >= 213.75 && osd_wind_arrow_rotate <= 236.25){
wind_arrow_set1 = 0xA4;
wind_arrow_set2 = 0xA5;}
else if (osd_wind_arrow_rotate >= 236.25 && osd_wind_arrow_rotate <= 258.75){
wind_arrow_set1 = 0xA6;
wind_arrow_set2 = 0xA7;}
else if (osd_wind_arrow_rotate >= 258.75 && osd_wind_arrow_rotate <= 281.25){
wind_arrow_set1 = 0xA8;
wind_arrow_set2 = 0xA9;}
else if (osd_wind_arrow_rotate >= 281.25 && osd_wind_arrow_rotate <= 303.75){
wind_arrow_set1 = 0xAA;
wind_arrow_set2 = 0xAB;}
else if (osd_wind_arrow_rotate >= 303.75 && osd_wind_arrow_rotate <= 326.25){
wind_arrow_set1 = 0xAC;
wind_arrow_set2 = 0xAd;}
else if (osd_wind_arrow_rotate >= 326.25 && osd_wind_arrow_rotate <= 348.75){
wind_arrow_set1 = 0xAE;
wind_arrow_set2 = 0xAF;}
else if (osd_wind_arrow_rotate >= 348.75 && osd_wind_arrow_rotate <= 360){
wind_arrow_set1 = 0x90;
wind_arrow_set2 = 0x91;}




}
if (wind == 1){
osd.printf("%c%3.0f%c|%c%c",0xFC,(double)(osd_windspeed * converts),spe, wind_arrow_set1, wind_arrow_set2);
}

osd.closePanel();
}

