
void panLogo();
void do_converts();
void panFdata();

//void writeSettings();

void readPanelSettings();
uint8_t checkPAL(uint8_t line);
void updateSettings(byte panelu, byte panel_x, byte panel_y, byte panel_s );
void unplugSlaves();
void startPanels();
void writePanels();
void readSettings();
void OnMavlinkTimer();
void read_mavlink();
void panWaitMAVBeats(byte first_col, byte first_line);
void panBatt_A(byte first_col, byte first_line);
void panRose(byte first_col, byte first_line);
void panGPSats(byte first_col, byte first_line);
void panGPS(byte first_col, byte first_line);
void panHeading(byte first_col, byte first_line);

void panPitch(byte first_col, byte first_line);
void panRoll(byte first_col, byte first_line);
void panThr(byte first_col, byte first_line);
void panBatteryPercent(byte first_col, byte first_line);
void panTime(byte first_col, byte first_line);
void panOff();
void panWarn(byte first_col, byte first_line);
void panCOG(byte first_col, byte first_line);
void panHomeDis(byte first_col, byte first_line);
void panHorizon(byte first_col, byte first_line);
void panWPDis(byte first_col, byte first_line);
void panAlt(byte first_col, byte first_line);
void panCur_A(byte first_col, byte first_line);
void panCur_A(byte first_col, byte first_line);
void showArrow(uint8_t rotate_arrow,uint8_t method);
void timers();
void panCALLSIGN(byte first_col, byte first_line);
void panDistance(byte first_col, byte first_line);
void panTemp(byte first_col, byte first_line);
void panEff(byte first_col, byte first_line);
void panRSSI(byte first_col, byte first_line);
void panWindSpeed(byte first_col, byte first_line);
void panHomeDir(byte first_col, byte first_line);
void panHomeAlt(byte first_col, byte first_line);
void panVel(byte first_col, byte first_line);
void panAirSpeed(byte first_col, byte first_line);
void panFlightMode(byte first_col, byte first_line);
void panClimb(byte first_col, byte first_line);
void panTune(byte first_col, byte first_line);
void showHorizon(byte start_col, byte start_row);

void uploadFont();

void On100ms();

