using System;

namespace OSD {
	public partial class OSD {
		/* *********************************************** */
		// Version number, incrementing this will erase/upload factory settings.
		// Only devs should increment this
		public const int VER = 79;

		// EEPROM Storage addresses

		// First of 8 panels
		public const int panCenter_XY = 0;
		const int panPitch_XY = 2;
		const int panRoll_XY = 4;
		const int panBatt_A_XY = 6;
		const int panBatt_B_XY = 8;
		const int panGPSats_XY = 10;
		const int panCOG_XY = 12;
		const int panGPS_XY = 14;

		// Second set of 8 panels
		const int panRose_XY = 16;
		const int panHeading_XY = 18;
		const int panHomeDir_XY = 20;
		const int panHomeDis_XY = 22;
		const int panWPDir_XY = 24;
		const int panWPDis_XY = 26;
		const int panRSSI_XY = 28;


		// Third set of 8 panels
		const int panCur_A_XY = 30;
		const int panCurB_XY = 32;
		const int panAlt_XY = 34;
		const int panVel_XY = 36;
		const int panThr_XY = 38;
		const int panFMod_XY = 40;
		const int panHorizon_XY = 42;
		const int panHomeAlt_XY = 44;
		const int panAirSpeed_XY = 46;
		const int panBatteryPercent_XY = 48;
		const int panTime_XY = 50;
		const int panWarn_XY = 52;
		const int panOff_XY = 54;
		const int panWindSpeed_XY = 56;
		const int panClimb_XY = 58;
		const int panTune_XY = 60;
		const int panEff_XY = 62;
		const int panCALLSIGN_XY = 64;
		const int panCh_XY = 66;
		const int panTemp_XY = 68;
		const int panDistance_XY = 70;
		const int panILS_XY = 72;
		//        const int panMavBeat_XY = 74;
    
		const int OffsetBITpanel = 128; // размер памяти одного экрана

		const int Settings_offset = 512; // 4 экрана всего
		//
		const int SIGN_MSL_ON_ADDR = 876;
		const int SIGN_HA_ON_ADDR = 878;
		const int SIGN_GS_ON_ADDR = 880;
		const int SIGN_AS_ON_ADDR = 882;
		const int MODEL_TYPE_ADD = 884;
		const int AUTO_SCREEN_SWITCH_ADD = 886;
		const int OSD_BATT_SHOW_PERCENT_ADDR = 888;
		const int measure_ADDR = 890;
		const int overspeed_ADDR = 892;
		const int stall_ADDR = 894;
		const int battv_ADDR = 896;
		//const int battp_ADDR = 898;
		const int OSD_RSSI_HIGH_ADDR = 900;
		const int OSD_RSSI_LOW_ADDR = 902;
		const int RADIO_ON_ADDR = 904;
		const int OSD_Toggle_ADDR = 906;
		const int OSD_RSSI_RAW_ADDR = 908;
		const int switch_mode_ADDR = 910;
		const int PAL_NTSC_ADDR = 912;
		const int OSD_BATT_WARN_ADDR = 914;
		const int OSD_RSSI_WARN_ADDR = 916;
		const int OSD_BRIGHTNESS_ADDR = 918;
		const int OSD_CALL_SIGN_ADDR = 920;
		const int OSD_CALL_SIGN_TOTAL = 8;
		const int FW_VERSION1_ADDR = 930;
		const int FW_VERSION2_ADDR = 932;
		const int FW_VERSION3_ADDR = 934;
		const int CS_VERSION1_ADDR = 936;
		const int CS_VERSION2_ADDR = 938;
		const int CS_VERSION3_ADDR = 940;
		const int CHK_VERSION = 1010;

	}
}

