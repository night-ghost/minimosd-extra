using System;

namespace OSD {
	public partial class OSD {
		/* *********************************************** */
		// Version number, incrementing this will erase/upload factory settings.
		// Only devs should increment this
		public const int VER = 79;

		// EEPROM Storage addresses 

		
		//const int panCenter_XY = 0;  - not used
        const int screen_flags_XY = 0;
		const int panPitch_XY = 2;
		const int panRoll_XY = 4;
		const int panBatt_A_XY = 6;
		const int panBatt_B_XY = 8;
		const int panGPSats_XY = 10;
		const int panCOG_XY = 12;
		const int panGPS_XY = 14;

		const int panRose_XY = 16;
		const int panHeading_XY = 18;
		const int panHomeDir_XY = 20;
		const int panHomeDis_XY = 22;
		const int panWPDir_XY = 24;
		const int panWPDis_XY = 26;
		const int panRSSI_XY = 28;

		const int panCurrA_XY = 30;
		const int panCurrB_XY = 32; // not used
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
		const int panWindSpeed_XY = 54;
		const int panClimb_XY = 56;
		const int panTune_XY = 58;
		const int panEff_XY = 60;
		const int panCALLSIGN_XY = 62;
		const int panCh_XY = 64;
		const int panTemp_XY = 66;
		const int panDistance_XY = 68;
		const int panGPS2_XY = 70;
		const int panRadarScale_XY = 72;
		const int panFdata_XY = 74;
        const int panMessage_XY = 76;
        const int panSenor1_XY = 78;
        const int panSenor2_XY = 80;
        const int panSenor3_XY = 82;
        const int panSenor4_XY = 84;
        const int panHdop_XY = 86;
        const int panState_XY = 88;
        const int panScale_XY = 90;
        const int panPower_XY = 92;
        const int panCvalue_XY = 94;
        //const int   = 96;

    
		public const int OffsetBITpanel = 128; // размер памяти одного экрана

		public const int Settings_offset = 512; // 4 экрана всего
        public const int Strings_offst = Settings_offset + Config.Settings_size;
		//
		
		
	// флаги
/*		
	    bool OSD_BATT_SHOW_PERCENT:1;
	    bool measure:1;	    
	    
*/		
		public const int osd_switch_once 	    = 0;
		public const int converts 				= 1;
        public const int chkSwitch200           = 2;
		public const int pal_ntsc				= 3;
		
	// new!
		public const int useExtVbattA			= 4;
		public const int useExtVbattB			= 5;
    	public const int useExtCurr				= 6;
		public const int AutoScreenSwitch       = 7;
		public const int results_on     		= 8;
		public const int mode_auto              = 9;
        public const int flgHUD                 = 10;
        public const int flgTrack               = 11;


        // Экранные флаги
        public const int scrFlg_russianHUD = 0;
       	
	}
}

