
void panLogo();

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
void panWaitMAVBeats(point p);
void panBatt_A(point p);
void panRose(point p);
void panGPSats(point p);
void panGPS(point p);
void panHeading(point p);

void panPitch(point p);
void panRoll(point p);
void panThr(point p);
void panBatteryPercent(point p);
void panTime(point p);
void panOff();
void panWarn(point p);
void panCOG(point p);
void panHomeDis(point p);
void panHorizon(point p);
void panWPDis(point p);
void panAlt(point p);
void panCur_A(point p);
void panCur_A(point p);
void showArrow(uint8_t rotate_arrow,uint8_t method);
void panCALLSIGN(point p);
void panDistance(point p);
void panTemp(point p);
void panEff(point p);
void panRSSI(point p);
void panWindSpeed(point p);
void panHomeDir(point p);
void panHomeAlt(point p);
void panVel(point p);
void panAirSpeed(point p);
void panFlightMode(point p);
void panClimb(point p);
void panTune(point p);
void showHorizon(byte start_col, byte start_row);

void uploadFont();

void On100ms();

void max7456_off();
int grad_to_sect(int grad);
//int grad_to_sect(float grad);