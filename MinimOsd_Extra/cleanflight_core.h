#include "cleanflight.h"
#include "cleanflight_const.h"
#include "cleanflight_types.h"

static  /*INLINE*/  inline uint8_t mwii_get_byte()  {
	return msg.mwii.buf[msg.mwii.read_idx++];
}

static inline uint8_t mwii_read_byte(byte pos)  {
	return msg.mwii.buf[msg.mwii.read_idx + pos];
}


static inline uint16_t mwii_read_uint(byte pos) {
	uint16_t t;
	
	memcpy(&t, &msg.mwii.buf[msg.mwii.read_idx]+pos, sizeof(uint16_t));

	return t;
}

static inline  uint32_t mwii_read_ulong(byte pos) {
	uint32_t t;
	
	memcpy(&t, &msg.mwii.buf[msg.mwii.read_idx] + pos, sizeof(uint32_t));
	return t;
}

static inline void mwii_read_len(void *dst, byte pos, byte sz) {
	
	memcpy(dst, &msg.mwii.buf[msg.mwii.read_idx] + pos, sz);
}


//void  r_struct(uint8_t *cb,uint8_t siz) {
//	while(siz--) *cb++ = mwii_get_byte();
//}

/*
void serialize8(uint8_t a) {
	Serial.write(a);
	msg.mwii.chk ^= a;
}
void serialize16(int16_t a) {
	serialize8(BYTE_OF(a, 0));
	serialize8(BYTE_OF(a, 1));
}
void serialize32(uint32_t a) {
	serialize8(BYTE_OF(a, 0));
	serialize8(BYTE_OF(a, 1));
	serialize8(BYTE_OF(a, 2));
	serialize8(BYTE_OF(a, 3));
}

void headSerialResponse(uint8_t err, uint8_t s) {
	serialize8('$');
	serialize8('M');
	serialize8(err ? '!' : '<');
	msg.mwii.chk = 0; // start calculating a new checksum
	serialize8(s);
	serialize8(msg.mwii.cmd);
}

void headSerialReply(uint8_t s) {
	headSerialResponse(0, s);
}

void inline headSerialError(uint8_t s) {
	headSerialResponse(1, s);
}

void tailSerialReply() {
	serialize8(msg.mwii.chk);
}

void  s_struct(uint8_t *cb,uint8_t siz) {
	headSerialReply(siz);
	while(siz--) serialize8(*cb++);
}

void s_struct_w(uint8_t *cb,uint8_t siz) {
	headSerialReply(0);
	while(siz--) *cb++ = mwii_get_byte();
}


int16_t nextCharToRequest() {
	if(msg.mwii.nextCharToRequest != msg.mwii.lastCharToRequest) {	// Not at last char
		if(msg.mwii.retransmitQueue & 0x02) {                // Missed char at curr-6. Need retransmit!
			return msg.mwii.nextCharToRequest-6;
		}

		if((msg.mwii.retransmitQueue & 0x11) == 0x10) {      // Missed char at curr-3. First chance retransmit
			msg.mwii.retransmitQueue |= 0x01;                // Mark first chance as used
			return msg.mwii.nextCharToRequest-3;
		}

		msg.mwii.retransmitQueue = (msg.mwii.retransmitQueue >> 1) | 0x80; // Add next to queue
		return msg.mwii.nextCharToRequest++;                      // Notice post-increment!
	}

	uint8_t temp1 = msg.mwii.retransmitQueue & ~0x01;
	uint8_t temp2 = msg.mwii.nextCharToRequest - 6;

	if(temp1 == 0) {
		fontMode = 0;                            // Exit font mode
		setMspRequests();
		return -1;
	}

	// Already at last char... check for missed characters.
	while(!(temp1 & 0x03)) {
		temp1 >>= 1;
		temp2++;
	}

	return temp2;
}


void fontSerialRequest() {
	int16_t cindex = nextCharToRequest();
	headSerialReply(3);
	serialize8(OSD_GET_FONT);
	serialize16(cindex);
	tailSerialReply();	
}


uint8_t safeMode() {
	return 1;	// XXX
}
*/



// Font upload queue implementation.
// Implement a window for curr + the previous 6 requests.
// First-chance to retransmit at curr-3 (msg.mwii.retransmitQueue & 0x10)
// First-chance retransmit marked as used at msg.mwii.retransmitQueue |= 0x01
// 2 to N-chance retransmit marked at curr-6 (msg.mwii.retransmitQueue & 0x02)
/*
void initFontMode() {
	if(armed || configMode || fontMode|| !safeMode())
	return;
	// queue first char for transmission.
	msg.mwii.retransmitQueue = 0x80;

	fontMode = 1;
	setMspRequests();
}

void fontCharacterReceived(uint8_t cindex) {
	if(!fontMode)
	return;

	uint8_t bit = (0x80 >> (msg.mwii.nextCharToRequest-cindex));

	// Just received a char..
	if(msg.mwii.retransmitQueue & bit) {
		// this char war requested and now received for the first time
		msg.mwii.retransmitQueue &= ~bit;  // mark as already received
		MAX7456_writeNVM(cindex);       // Write to MVRam
	}
}



void blankserialRequest(uint8_t requestMSP)
{
	if(requestMSP == MSP_OSD && fontMode) {
		fontSerialRequest();
		return;
	}
	serialize8('$');
	serialize8('M');
	serialize8('<');
	serialize8((uint8_t)0x00);
	serialize8(requestMSP);
	serialize8(requestMSP);
}

void configExit()
{
	configPage=1;
	ROW=10;
	COL=4;
	configMode=0;
	//waitStick=3;
	previousarmedstatus = 0;
	if (Settings[S_RESETSTATISTICS]){
		trip=0;
		distanceMAX=0;
		altitudeMAX=0;
		speedMAX=0;
		temperMAX =0;
		flyingTime=0;
	}
	setMspRequests();
}
*/

/*
void saveExit()
{
	//uint8_t txCheckSum;
	//uint8_t txSize;

	if (configPage==1){
		msg.mwii.cmd = MSP_SET_PID;
		s_struct((uint8_t*)&conf.pid[0].P8,3*PIDITEMS);
		tailSerialReply();
	}

	if (configPage==2){
		msg.mwii.cmd = MSP_SET_RC_TUNING;
		s_struct((uint8_t*)&conf.rcRate8,7);
		tailSerialReply();
	}
	if (configPage==3 || configPage==4 || configPage==6 || configPage==7 || configPage==8){
		writeEEPROM();
	}
	configExit();
}

void handleRawRC() {
	static uint8_t waitStick;
	static uint32_t stickTime;
	static uint32_t timeout;

	if(MwRcData[PITCHSTICK] > 1300 && MwRcData[PITCHSTICK] < 1700 &&
	MwRcData[ROLLSTICK] > 1300 && MwRcData[ROLLSTICK] < 1700 &&
	MwRcData[YAWSTICK] > 1300 && MwRcData[YAWSTICK] < 1700) {
		waitStick = 0;
		timeout = 1000;
	}
	else if(waitStick == 1) {
		if((millis() - stickTime) > timeout)
		waitStick = 0;
		timeout = 300;
	}

	if(!waitStick) {
		if((MwRcData[PITCHSTICK]>MAXSTICK)&&(MwRcData[YAWSTICK]>MAXSTICK)&&(MwRcData[THROTTLESTICK]>MINSTICK)&&!configMode&&(allSec>5)&&!armed)
		{
			// Enter config mode using stick combination
			waitStick =  2;	// Sticks must return to center before continue!
			configMode = 1;
			setMspRequests();
		}
		else if(configMode) {
			if(previousarmedstatus&&(MwRcData[THROTTLESTICK]>MINSTICK))
			{
				// EXIT from SHOW STATISTICS AFTER DISARM (push throttle up)
				waitStick = 2;
				configExit();
			}
			if(!previousarmedstatus&&configMode&&(MwRcData[THROTTLESTICK]<MINSTICK)) // EXIT
			{
				waitStick = 2;
				configExit();
			}
			else if(configMode&&(MwRcData[ROLLSTICK]>MAXSTICK)) // MOVE RIGHT
			{
				waitStick = 1;
				COL++;
				if(COL>4) COL=4;
			}
			else if(configMode&&(MwRcData[ROLLSTICK]<MINSTICK)) // MOVE LEFT
			{
				waitStick = 1;
				COL--;
				if(COL<1) COL=1;
			}
			else if(configMode&&(MwRcData[PITCHSTICK]>MAXSTICK)) // MOVE UP
			{
				waitStick = 1;
				ROW--;
				if(ROW<1)
				ROW=1;
			}
			else if(configMode&&(MwRcData[PITCHSTICK]<MINSTICK)) // MOVE DOWN
			{
				waitStick = 1;
				ROW++;
				if(ROW>10)
				ROW=10;
			}
			else if(!previousarmedstatus&&configMode&&(MwRcData[YAWSTICK]<MINSTICK)) // DECREASE
			{
				waitStick = 1;

				if(configPage == 1) {
					if(ROW >= 1 && ROW <= 5) {
						if(COL==1) conf.pid[ROW-1].P8--;
						if(COL==2) conf.pid[ROW-1].I8--;
						if(COL==3) conf.pid[ROW-1].D8--;
					}

					if(ROW == 6) {
						if(COL==1) conf.pid[7].P8--;
						if(COL==2) conf.pid[7].I8--;
						if(COL==3) conf.pid[7].D8--;
					}

					if((ROW==7)&&(COL==1)) conf.pid[8].P8--;
				}

				if(configPage == 2 && COL == 3) {
					if(ROW==1) conf.rcRate8--;
					if(ROW==2) conf.rcExpo8--;
					if(ROW==3) conf.rollPitchRate--;
					if(ROW==4) conf.yawRate--;
					if(ROW==5) conf.dynThrPID--;
				}

				if(configPage == 3 && COL == 3) {
					if(ROW==1) Settings[S_VOLTAGEMIN]--;
					//if(ROW==2) Settings[S_TEMPERATUREMAX]--;
					if(ROW==3) {
						Settings[S_BLINKINGHZ]--;
						if (Settings[S_BLINKINGHZ] <1) Settings[S_BLINKINGHZ]=1;
					}
				}

				if(configPage == 4 && COL == 3) {
					if(ROW==3) rssiTimer=15;
					if(ROW==4) Settings[S_RSSIMAX]=rssiADC;  // set MAX RSSI signal received (tx ON and rx near to tx)
				}

				if(configPage == 5 && COL == 3) {
					if(ROW==1) accCalibrationTimer=0;
					if(ROW==5) magCalibrationTimer=0;
					if(ROW==7) eepromWriteTimer=0;
				}

				if(configPage == 6 && COL == 3) {
					if(ROW==1) Settings[S_DISPLAYGPS]=!Settings[S_DISPLAYGPS];
					if(ROW==2) Settings[S_COORDINATES]=!Settings[S_COORDINATES];
					if(ROW==3) Settings[L_CALLSIGNPOSITIONDSPL]=!Settings[L_CALLSIGNPOSITIONDSPL];
				}

				if(configPage == 7 && COL == 3) {
					if(ROW==1) Settings[S_RESETSTATISTICS]=!Settings[S_RESETSTATISTICS];
					if(ROW==2) Settings[S_HEADING360]=!Settings[S_HEADING360];
					if(ROW==3) Settings[S_UNITSYSTEM]=!Settings[S_UNITSYSTEM];
					if(ROW==4) {
						Settings[S_VIDEOSIGNALTYPE]=!Settings[S_VIDEOSIGNALTYPE];
						MAX7456_Setup();
					}
				}

				//------------------------------ page for screen item change position
				if(configPage == 8) {
					if(ROW == 4) {
						if (COL==1) {
							screenitemselect--;  // Select previous Item
							screen_pos_item_pointer=screen_pos_item_pointer-3; // Point to previous item
							if (screenitemselect <0) {
								screenitemselect=MAXSCREENITEMS;
								screen_pos_item_pointer=EEPROM_ITEM_LOCATION-3; // Point to last item
							}
						}
						if (COL==2) Settings[screen_pos_item_pointer+2]=!Settings[screen_pos_item_pointer+2];  // Display/Hide
						if (COL==3) {
							if ((Settings[screen_pos_item_pointer] > 1) && (Settings[screen_pos_item_pointer] !=255)) Settings[screen_pos_item_pointer]--;  // subtract 1 line
						}
						if (COL==4) {
							if ((Settings[screen_pos_item_pointer+1] > 1) && (Settings[screen_pos_item_pointer+1] !=255)) Settings[screen_pos_item_pointer+1]--;  // subtract 1 column
						}
					}
					if((ROW==7)&&(COL==1)) {
						WriteScreenLayoutDefault(); // Back and save to all default positions
						configExit();  // Exit
					}
				}
				//--------------------------------------------------

				if((ROW==10)&&(COL==3)) configPage--;
				if(configPage<MINPAGE) configPage = MAXPAGE;
				if((ROW==10)&&(COL==1)) configExit();
				if((ROW==10)&&(COL==2)) saveExit();
			}
			else if(!previousarmedstatus&&configMode&&(MwRcData[YAWSTICK]>MAXSTICK)) // INCREASE
			{
				waitStick =1;

				if(configPage == 1) {
					if(ROW >= 1 && ROW <= 5) {
						if(COL==1) conf.pid[ROW-1].P8++;
						if(COL==2) conf.pid[ROW-1].I8++;
						if(COL==3) conf.pid[ROW-1].D8++;
					}

					if(ROW == 6) {
						if(COL==1) conf.pid[7].P8++;
						if(COL==2) conf.pid[7].I8++;
						if(COL==3) conf.pid[7].D8++;
					}

					if((ROW==7)&&(COL==1)) conf.pid[8].P8++;
				}

				if(configPage == 2 && COL == 3) {
					if(ROW==1) conf.rcRate8++;
					if(ROW==2) conf.rcExpo8++;
					if(ROW==3) conf.rollPitchRate++;
					if(ROW==4) conf.yawRate++;
					if(ROW==5) conf.dynThrPID++;
				}

				if(configPage == 3 && COL == 3) {
					if(ROW==1) Settings[S_VOLTAGEMIN]++;
					//if(ROW==2) Settings[S_TEMPERATUREMAX]++;
					if(ROW==3) {
						Settings[S_BLINKINGHZ]++;
						if (Settings[S_BLINKINGHZ] >10) Settings[S_BLINKINGHZ]=10;
					}
				}

				if(configPage == 4 && COL == 3) {
					if(ROW==3) rssiTimer=15;
					if(ROW==4) Settings[S_RSSIMAX]=rssiADC;  // set MAX RSSI signal received (tx ON and rx near to tx)
				}

				if(configPage == 5 && COL == 3) {
					if(ROW==1) accCalibrationTimer=CALIBRATION_DELAY;
					if(ROW==5) magCalibrationTimer=CALIBRATION_DELAY;
					if(ROW==7) eepromWriteTimer=EEPROM_WRITE_DELAY;
				}

				if(configPage == 6 && COL == 3) {
					if(ROW==1) Settings[S_DISPLAYGPS]=!Settings[S_DISPLAYGPS];
					if(ROW==2) Settings[S_COORDINATES]=!Settings[S_COORDINATES];
					if(ROW==3) Settings[L_CALLSIGNPOSITIONDSPL]=!Settings[L_CALLSIGNPOSITIONDSPL];
				}

				if(configPage == 7 && COL == 3) {
					if(ROW==1) Settings[S_RESETSTATISTICS]=!Settings[S_RESETSTATISTICS];
					if(ROW==2) Settings[S_HEADING360]=!Settings[S_HEADING360];
					if(ROW==3) Settings[S_UNITSYSTEM]=!Settings[S_UNITSYSTEM];
					if(ROW==4) {
						Settings[S_VIDEOSIGNALTYPE]=!Settings[S_VIDEOSIGNALTYPE];
						MAX7456_Setup();
					}
				}

				//------------------------------  page for screen item change position
				if(configPage == 8) {
					if(ROW == 4) {
						if (COL==1) {
							screenitemselect++;            // Select next Item
							screen_pos_item_pointer=screen_pos_item_pointer+3; // Point to next item
							if (screenitemselect >MAXSCREENITEMS) {
								screenitemselect=0;
								screen_pos_item_pointer=EEPROM_SETTINGS+1;  // Point to first item in enum
							}
						}
						if (COL==2) Settings[screen_pos_item_pointer+2]=!Settings[screen_pos_item_pointer+2];  // Display/Hide
						if (COL==3) {
							if(Settings[S_VIDEOSIGNALTYPE]){
								if (Settings[screen_pos_item_pointer]  < 15) Settings[screen_pos_item_pointer]++; // add 1 line (Max 15 for PAL)
							}
							else if(Settings[screen_pos_item_pointer]  < 13) Settings[screen_pos_item_pointer]++; // add 1 line (Max 13 for NTSC)
						}
						if (COL==4) {
							if (Settings[screen_pos_item_pointer+1] < 25) Settings[screen_pos_item_pointer+1]++;  // add 1 column
						}
					}
					if((ROW==7)&&(COL==1)) {
							WriteScreenLayoutDefault(); // Back and save to all default positions
							configExit();
					}
				}
				//--------------------------------------------------

				if((ROW==10)&&(COL==3)) configPage++;
				if(configPage>MAXPAGE) configPage = MINPAGE;
				if((ROW==10)&&(COL==1)) configExit();
				if((ROW==10)&&(COL==2)) saveExit();
			}
		}

		if(waitStick == 1)
		stickTime = millis();
	}
}
*/


struct Mwii_bits {
    byte n;
    byte mode;
    uint32_t *v;
};


static const Mwii_bits PROGMEM bits[] ={
    { 0, 1,  &msg.mwii.mode.armed},
    { 1, 2, &msg.mwii.mode.stable},
    { 2, 3, &msg.mwii.mode.horizon},
    { 3, 4, &msg.mwii.mode.baro},
    { 5, 0, &msg.mwii.mode.mag},
    { 10,6, &msg.mwii.mode.gpshome},
    { 11,7, &msg.mwii.mode.gpshold},
    { 19,0, &msg.mwii.mode.osd_switch},
};

/*
        msg.mwii.sensorActive & mode_horizon -> HORIZON
        msg.mwii.sensorActive & mode_stable  -> angle
        else                        -> acro
*/
static void mwii_check_mode() {

    const  Mwii_bits *bp=bits;

    for(byte n = sizeof(bits)/sizeof(Mwii_bits);n!=0; n-- ){
	uint32_t *v;
	byte b = pgm_read_byte(&bp->mode);
	if(!b) continue; // пропускаем не-режимы
	
	v= (uint32_t *)pgm_read_word(&bp->v);

	if(*v & msg.mwii.sensorActive) osd_mode = b-1;
	
	
	bp++;
    }


}

// --------------------------------------------------------------------------------------
// Here are decoded received commands from MultiWii
static inline void mwii_parse_data() {
    msg.mwii.read_idx = 0;

    lflags.mwii_active = true;
    set_data_got(); 


    switch(msg.mwii.cmd) {
  

    case MSP_IDENT:
        apm_mav_system = mwii_get_byte();                                  // MultiWii Firmware version
        msg.mwii.modeMSPRequests &=~ REQ_MSP_IDENT;
	break;

    case MSP_STATUS:
/*
typedef struct {
<------>uint16_t cycleTime;
<------>int16_t I2CError;
<------>uint16_t  sensorPresent;
<------>uint32_t  sensorActive;
<------>uint8_t version;
} MW_status_t;
*/
	//r_struct((uint8_t*)&MW_STATUS,10);
	msg.mwii.sensorActive = mwii_read_ulong(offsetof(MW_status_t, sensorActive) );
	lflags.motor_armed = (msg.mwii.sensorActive & msg.mwii.mode.armed) != 0;
	break;

#if 0 // only in setup
    case MSP_RAW_IMU:
/*
typedef struct {
<------>int16_t  accSmooth[3];
<------>int16_t  gyroData[3];
<------>int16_t  magADC[3];
<------>//int16_t  gyroADC[3];
<------>//int16_t  accADC[3];
} MW_imu_t;
*/
//  	r_struct((uint8_t*)&MW_IMU,18);
	break;
#endif

    case MSP_RC:
/*
uint16_t MwRcData[8]
*/
//	r_struct((uint8_t*)&MwRcData,16);
//	handleRawRC();
	mwii_read_len(chan_raw,0, sizeof(chan_raw));

	break;

    case MSP_RAW_GPS:
/*
typedef struct {
<------>uint8_t fix;
<------>uint8_t numSat;
<------>int32_t latitude;
<------>int32_t longitude;
<------>int16_t altitude;
<------>uint16_t speed;
<------>int16_t ground_course;
<------>//int32_t distanceToHome;
<------>int16_t distanceToHome;
<------>int16_t directionToHome;
} GPS_t;
*/
//	r_struct((uint8_t*)&GPS,16);

	osd_fix_type       = mwii_read_byte(offsetof(GPS_t, fix) );
	osd_satellites_visible = mwii_read_byte(offsetof(GPS_t, numSat) );
	gps_norm(osd_pos.lat,mwii_read_ulong(offsetof(GPS_t, latitude) ));
	gps_norm(osd_pos.lon,mwii_read_ulong(offsetof(GPS_t, longitude) ));
	osd_pos.alt        = mwii_read_uint(offsetof(GPS_t, altitude) );
	osd_groundspeed    = mwii_read_uint(offsetof(GPS_t, speed) );
	osd_cog            = mwii_read_uint(offsetof(GPS_t, ground_course) );
	break;

    case MSP_COMP_GPS:
	//r_struct((uint8_t*)&GPS.distanceToHome,4);
	osd_home_distance  = mwii_read_uint(0 );
	osd_home_direction = grad_to_sect(mwii_read_uint(2) );
	break;

    case MSP_ATTITUDE:
/*
typedef struct {
<------>int16_t Angle[2];
<------>int16_t Heading;
} MW_ATTITUDE_t;
*/
//	r_struct((uint8_t*)&MW_ATT,6);
	osd_heading = mwii_read_uint(offsetof(MW_ATTITUDE_t, Heading) );
//	osd_pitch = mwii_read_uint(offsetof(MW_ATTITUDE_t, Angle[0]) );
//	osd_roll  = mwii_read_uint(offsetof(MW_ATTITUDE_t, Angle[1]) );
//	osd_yaw   = mwii_read_uint(offsetof(MW_ATTITUDE_t, Angle[2]) );
	mwii_read_len(&osd_att,offsetof(MW_ATTITUDE_t, Angle), sizeof(osd_att));
	break;


    case MSP_ALTITUDE:
/*
typedef struct {
   int32_t Altitude;
   int16_t Vario;
   int16_t SonarAlt;
} MW_ALTTITUDE_t;
*/
//	r_struct((uint8_t*)&MW_ALT,8);
	osd_alt_mav = mwii_read_ulong(offsetof(MW_ALTTITUDE_t, Altitude) );
	osd_climb   = mwii_read_uint(offsetof(MW_ALTTITUDE_t,  Vario) );
	break;

    case MSP_ANALOG:
/*
typedef struct {
<------>uint8_t VBat;
<------>uint16_t pMeterSum;
<------>uint16_t Rssi;
<------>uint16_t Amperage;
} MW_ANALOG_t;
*/
//	r_struct((uint8_t*)&MW_ANALOG,7);
	if(!flags.useExtVbattA){
	    osd_vbat_A              = mwii_read_uint(offsetof(MW_ANALOG_t, VBat) );
	    osd_battery_remaining_A = mwii_read_uint(offsetof(MW_ANALOG_t, pMeterSum) );
	}
	if (!flags.useExtCurr)
	    osd_curr_A = mwii_read_uint(offsetof(MW_ANALOG_t, Amperage) );

	osd_rssi       = mwii_read_uint(offsetof(MW_ANALOG_t, Rssi) );
	break;

    case MSP_RC_TUNING:
/*
typedef struct {
<------>pid_    pid[PIDITEMS];
<------>uint8_t rcRate8;
<------>uint8_t rcExpo8;
<------>uint8_t rollPitchRate;
<------>uint8_t yawRate;
<------>uint8_t dynThrPID;
<------>uint8_t thrMid8;
<------>uint8_t thrExpo8;
}conf_t;
*/
//	r_struct((uint8_t*)&conf.rcRate8,7);
        msg.mwii.modeMSPRequests &=~ REQ_MSP_RC_TUNING;
	break;

    case MSP_PID:
/*    
struct pid_ {
<------>uint8_t P8;
<------>uint8_t I8;
<------>uint8_t D8;
};
*/
//	r_struct((uint8_t*)&conf.pid[0].P8,3*PIDITEMS);
	msg.mwii.modeMSPRequests &=~ REQ_MSP_PID;
	break;


// use MSP_BOXIDS
    case MSP_BOXIDS:
        uint32_t bit = 1;
        uint8_t remaining = msg.mwii.size;
        //byte bc = 0;

	/*
        msg.mwii.mode.armed = 0;
        msg.mwii.mode.stable = 0;
        msg.mwii.mode.horizon = 0;
        msg.mwii.mode.baro = 0;
        msg.mwii.mode.mag = 0;
        msg.mwii.mode.gpshome = 0;
        msg.mwii.mode.gpshold = 0;
        msg.mwii.mode.osd_switch = 0;
        */
        memset(&msg.mwii.mode, 0, sizeof(msg.mwii.mode));


        while(remaining > 0) {
          char c = mwii_get_byte();
          
          const  Mwii_bits *bp=bits;
          for(byte n = sizeof(bits)/sizeof(Mwii_bits);n!=0; n-- ){
        	uint32_t *v;
        	byte b = pgm_read_byte(&bp->n);

        	if(c == b) {
        	    v= (uint32_t *)pgm_read_word(&bp->v);
        	    *v |= bit;
        	}
        	
        	bp++;
          }

         bit <<= 1;
          --remaining;
        }
        msg.mwii.modeMSPRequests &=~ REQ_MSP_BOX;
        
/*        
        msg.mwii.sensorActive & mode_horizon -> HORIZON
        msg.mwii.sensorActive & mode_stable  -> angle
        else                        -> acro
*/

    }

}

// End of decoded received commands from MultiWii
// --------------------------------------------------------------------------------------



bool mwii_read() {
	uint8_t c;

	enum _serial_state {
	    IDLE = 0,
	    HEADER_START,
	    HEADER_M,
	    HEADER_ARROW,
	    HEADER_SIZE,
	    HEADER_CMD,
	};

	while(Serial.available_S()) {
		c = Serial.read_S();

#ifdef DEBUG
	        bytes_comes+=1;
#endif

		byte state = msg.mwii.state;

		switch(state++) {
		case IDLE:
again:			if(c!='$') state = IDLE;
			break;
			
		case HEADER_START:
			if(c!='M') state =  IDLE;
			break;
			
		case HEADER_M:
			if(c!='>') state = IDLE;
			break;
			
		case HEADER_ARROW:
			if (c > SERIALBUFFERSIZE) {  // now we are expecting the payload size
				state = IDLE;
			} else {
				//state = HEADER_SIZE;
				msg.mwii.size = c;
				msg.mwii.crc = c;
			}
			break;
			
		case HEADER_SIZE:
			//state = HEADER_CMD;
			msg.mwii.cmd = c;
			msg.mwii.crc ^= c;
			msg.mwii.idx=0;
			break;
			
		case HEADER_CMD:
			msg.mwii.crc ^= c;
			state = HEADER_CMD;
			
			if(msg.mwii.idx == msg.mwii.size) {// received checksum byte
			    if(msg.mwii.crc == 0) {
				mwii_parse_data(); // HERE!!!
				
				if(timeToScreen())  // если надо перерисовать экран
				    return true;
			    } else {
#ifdef DEBUG
		    // Update global packet drops counter
			        packet_drops += 1;
#endif
				if(c=='$') goto again;
			    }
			    
			    state = IDLE;
			} else {
			    msg.mwii.buf[msg.mwii.idx++]=c;
			    
			}
			
			break;
		}

		msg.mwii.state = state;
		delay_byte();
	}
	
	return false;
}

