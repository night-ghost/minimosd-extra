using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSD
{
    // this is mainly copied from panels.h


    using uint16_t = System.UInt16;
    using uint8_t = System.Byte;
    using int8_t = System.SByte;
    using boolean = System.Byte;

    class Panels
    {
        public OSD osd;

        public Panels(OSD os) {
			osd = os;
		}
		

        string PSTR (string input) {
			return input;
		}
		

        double abs (double input) {
			return Math.Abs(input);
		}
		

        int round (double input) {
			return (int)Math.Round(input, 0);
		}
		

        double tan (double input) {
			return Math.Tan(input);
		}
		

        /*Panels variables*/
        //Will come from APM telem port

        //Config vars
        public uint8_t model_type = 0; //0 - Plane; 1 - Copter
		
        public string fw_version = "";
        public string cs_version = "";
        
//        public byte  sign_air_speed = 0;
//        public byte sign_ground_speed = 0 ;
//        public byte sign_home_altitude = 0 ;
//        public byte sign_msl_altitude = 0 ; 

        public uint8_t overspeed = 40;
        public uint8_t stall = 5;
        public uint8_t battv = 101;                //Batery warning voltage - units Volt *10 
        public bool converts = false;                //1- Imperial; 0- Metric
		
// new!
		public float rssi_koef=1;
		public float Curr_koef=1;
		public float battA_koef=1;
		public float battB_koef=1;
		
		public bool flgBattA=false ;
		public bool flgBattB=false ;
        public bool battB_used = false;
		
		public bool flgCurrent=false;
		public bool flgILS=true;
		public bool flgTimedSwitch=true;
        public bool flgHUD = true;
        public bool flgTrack = false;
		
		public byte battBv=101;
		
		public float roll_k=1;
		public float pitch_k=1;
		public float roll_k_ntsc=1;
		public float pitch_k_ntsc=1;
		
		public byte vert_offs=0x10; // сдвиг экрана по вертикали и горизонтали 0...1f
    	public byte horiz_offs=0x20;// 0...3f
		
		public byte pwm_src=0;
		public byte pwm_dst=0;
		
		public byte n_screens=4;
		
//*************************		
        private byte temperatureChar = 0xBA;
        private byte bigDistanceChar = 0x1B;
        
        private byte climbChar = 0x1A;
        private byte velocityChar = 0x10;
        private byte altitudeChar = 0xc;

        private float convertspeed = 3.6f;
        private float converth = 1.0f;
        private float tempconv = 10;
        private float tempconvAdd = 0;
//        private float distconv = 1000;
		
        private int vs_ms=0;

        public void do_converts () {
			switch(converts) { 
			case false:
				convertspeed = 3.6f;
				converth = 1.0f;
				tempconv = 10;
				tempconvAdd = 0;
//				distconv = 1000;

				temperatureChar = 0xBA;
				bigDistanceChar = 0x1B;
				climbChar = 0x1A;
				velocityChar = 0x10;
				altitudeChar = 0x6D;
				//smallDistanceChar = 0x6D;
				chrHigh =0x0c;
				chrSpe = 0x10;
				break;
				
			case true:
				convertspeed = 2.23f;
				converth = 3.28f;
				tempconv = 18;
				tempconvAdd = 3200;
				//distconv = 5280;
				temperatureChar = 0xBB;
				bigDistanceChar = 0x1C;
				climbChar = 0x1E;
				velocityChar = 0x19;
				altitudeChar = 0x66;
				//smallDistanceChar = 0x66;
				chrHigh =0x66;
				chrSpe = 0x19;
				break;
			}
		}
		


        static float osd_vbat = 11.61f;                   // voltage in milivolt
        static uint16_t osd_battery_remaining = 10;      // 0 to 100 <=> 0 to 1000
       // public bool  osd_battery_show_percentage = true;      // use remaining % or used mAh
        //static uint8_t osd_battery_pic = 0xb4;         // picture to show battery remaining

        static uint8_t chrSpe = 0;
        static uint8_t chrHigh = 0;

        //static uint16_t osd_mode = 100;                   // Navigation mode from RC AC2 = CH5, APM = CH8
        //static uint8_t osd_nav_mode = 4;               // Navigation mode from RC AC2 = CH5, APM = CH8

        static float osd_lat = -35.020938f;                    // latidude
        static float osd_lon = 117.883419f;                    // longitude
        static uint8_t osd_satellites_visible = 7;     // number of satelites
        //static uint8_t osd_fix_type = 3;               // GPS lock 0-1=no fix, 2=2D, 3=3D
        static int start_Time = 3785; 

        //static uint8_t osd_got_home = 0;               // tels if got home position or not
        //static float osd_home_lat = 0;               // home latidude
        //static float osd_home_lon = 0;               // home longitude
        static float osd_home_alt = 100;              //Home altitude
        static long osd_home_distance = 0;          // distance from home
        static uint8_t osd_home_direction = 0;             // Arrow direction pointing to home (1-16 to CW loop)

        static int8_t osd_pitch = 0;                  // pitch form DCM
        static int8_t osd_roll = 0;                   // roll form DCM
        //static uint8_t osd_yaw = 0;                    // relative heading form DCM
        //static float osd_heading = 0;                // ground course heading from GPS
        static float osd_alt = 200;                    // altitude
        static float osd_groundspeed = 9;            // ground speed
        static float osd_airspeed = 10;            // air speed
        static uint16_t osd_throttle = 100;               // throtle
        static float osd_curr_A = 453;
        static float osd_windspeed = 10;
  //      static float osd_windspeedz = 2;
        static float osd_climb = 21;
        static float nav_roll = 0;
        static float nav_pitch = 0;
        static float tdistance = 1.27f;
        static uint16_t nav_bearing = 0; // Current desired heading in degrees
        static uint16_t wp_target_bearing = 0; // Bearing to current MISSION/target in degrees
        static uint16_t wp_dist = 9000; // Distance to active MISSION in meters
        static uint16_t wp_number = 99; // Distance to active MISSION in meters
        static float alt_error = 0; // Current altitude error in meters
        static float aspd_error = 0; // Current airspeed error in meters/second
        static float xtrack_error = 0; // Current crosstrack error on x-y plane in meters
        static float eff = 10;

        //MAVLink session control
    //    static boolean mavbeat = 1;
        //static float lastMAVBeat = 0;
        //static boolean waitingMAVBeats = 1;
    //    static uint8_t apm_mav_type = 2;
        //static uint8_t apm_mav_system = 7;
        //static uint8_t apm_mav_component = 0;
        //static boolean enable_mav_request = 0;
        //rssi varables
        //public uint8_t rssi = 0;
        public uint16_t rssipersent = 0;
        public uint16_t rssical = 255;
		
        public uint8_t rssiraw_on = 0;
        static uint8_t osd_rssi = 2;
        public uint8_t radio_setup_flag = 0;
        public uint8_t ch_toggle = 8; //CH8
        public byte  switch_mode = 1;
        public byte   auto_screen_switch = 1;
        public bool  pal_ntsc = true; //PAL 1 - NTSC 0
		public bool mode_auto = false;
        public uint8_t osd_brightness = 0; // low bright
        
        public uint8_t rssi_warn_level = 5;
        public uint8_t batt_warn_level = 10;

        public string callsign_str = "a1b2c3d4";
        //public uint8_t[] call_sign_parse = new uint8_t[6];

        public uint8_t chan1_raw = 0;
        public uint8_t chan2_raw = 0;
        public uint8_t chan3_raw = 0;
        public uint8_t chan4_raw = 0;
        public uint8_t chan5_raw = 0;
        public uint8_t chan6_raw = 0;
        public uint8_t chan7_raw = 0;
        public uint8_t chan8_raw = 0;
        public uint8_t tr = 0;
        static float temperature = 23.5f;

        public bool is_alt(int f){
            return (f & 1)!=0;
        }

        public bool is_alt2(int f) {
            return (f & 2) != 0;
        }

        public bool is_alt3(int f) {
            return (f & 4) != 0;
        }

        public bool is_alt4(int f) {
            return (f & 8) != 0;
        }

        /******* PANELS - DEFINITION *******/

        /* **************************************************************** */
        // Panel  : COG
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panCOG(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            

            osd.printf("%c%c%4i%c", 0x94, 0x95, tr, 0x05);

            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : ODO
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panDistance(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
			if(sign==1)
            osd.printf("%c%c%4.2f%c", 0x8F, 0x20, tdistance * converth, bigDistanceChar);
			else
			osd.printf("%4.2f%c", tdistance * converth, bigDistanceChar);
            
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : Temperature
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panTemp(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            
            osd.printf("%5.1f%c", temperature * tempconv + tempconvAdd, temperatureChar);
            
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : PanCh
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panCh(int first_col, int first_line, int sign, int fAlt, Panel p)
       {
           osd.setPanel(first_col, first_line);
           
    	   osd.printf_P(PSTR("C1%5i|C2%5i|C3%5i|C4%5i|C5%5i|C6%5i|C7%5i|C8%5i"),
			             	//chan1_raw, chan2_raw, chan3_raw, chan4_raw, chan5_raw, chan6_raw);
			             1550, 1302, 1640, 1456, 1100, 1940, 1111, 1954);
			
           
           return 0;
       }

        /* **************************************************************** */
        // Panel  : efficiency
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panEff(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
        osd.setPanel(first_col, first_line);

        

        if(is_alt(fAlt)){
            if (sign == 1)
                osd.printf("\x16");
            osd.printf(" 124\x01");
            return 0;
        }
        
        if(model_type ==0) {// palne
            if (sign == 1)
                osd.printf("\x16");
            osd.printf(" 176\x01");
        } else {
            if (sign == 1)
                osd.printf("\x17");
            osd.printf(" 30:05");
        }
        
        
         return 0;
        }

 	    /* **************************************************************** */
 	    // Panel  : panRSSI
 	    // Needs  : X, Y locations
 	    // Output : Alt symbol and altitude value in meters from MAVLink
 	    // Size   : 1 x 7Hea  (rows x chars)
  	    // Staus  : done

        public int panRSSI(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
 	        osd.setPanel(first_col, first_line);
 	        
 	        if(sign==1)
 	            osd.printf("%c%3i", 0x09, osd_rssi);
 	        else
            	osd.printf("%3i", osd_rssi);
            if(is_alt(fAlt)) osd.write('%');
 	        return 0;
 	    }

        /* **************************************************************** */
        // Panel  : panCALLSIGN
        // Needs  : X, Y locations
        // Output : Call sign identification
        // Size   : 1 x 6Hea  (rows x chars)
        // Staus  : done

        public int panCALLSIGN(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            osd.printf("%s", callsign_str);
            
            return 0;
        }
 
        /******* PANELS - DEFINITION *******/

        /* **************************************************************** */
        // Panel  : panTune
        // Needs  : X, Y locations
        // Output : Current symbol and altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panTune(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
			if((OSD.ModelType)model_type==OSD.ModelType.Copter){
				osd.printf_P(PSTR("NR%3.0f\x05|NP%3.0f\x05|NB%3.0i\x05|TB%5.1f\x05|AE%5.1f%c|XE%4.0f\x6D|AsE%5.1f%c"), 
				                   (nav_roll),
                                               (nav_pitch),
                                                          (nav_bearing),
                                                                      (wp_target_bearing),
                                                                                   ((int)alt_error * converth), chrHigh,
                                                                                             ((int)xtrack_error),
																			               	              ((aspd_error / 100.0) * 1), chrSpe);
			}else {
				if(sign==1)
            		osd.printf("%c%3.0f%c|%c%3.0f%c", 0x11, (alt_error * converth), chrHigh, 0x13, ((aspd_error / 100.0) * (converts?1:0) ), chrSpe);           
				else			
					osd.printf("%3.0f%c|%3.0f%c", (alt_error * converth), chrHigh, ((aspd_error / 100.0) * (converts?1:0) ), chrSpe);           
			}				
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panClimb
        // Needs  : X, Y locations
        // Output : Alt symbol and altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panClimb(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            
            if(sign==1){
                if(is_alt3(fAlt)) {
                    vs_ms=1;
                    if(is_alt4(fAlt))
                        osd.printf("%c% 4.1f%c", 0x15, (double)(osd_climb * converth / 60), 0x18);
                    else
                        osd.printf("%c% 4.2f%c", 0x15, (double)(osd_climb * converth/60), 0x18);
                } else {
                    vs_ms = 0;
                    osd.printf("%c%4.0f%c", 0x15, (double)(osd_climb * converth), climbChar);
                }
			}else{
                if (is_alt3(fAlt)) {
                    vs_ms = 1;
                    if (is_alt4(fAlt))
                        osd.printf("% 4.1f%c", (double)(osd_climb * converth / 60), 0x18);
                    else 
                        osd.printf("% 4.2f%c",  (double)(osd_climb * converth/60), 0x18);
                } else {
                    vs_ms = 0;
                    osd.printf("%4.0f%c", (double)(osd_climb * converth), climbChar);
                }
            }
            
            return 0;
        }
        
        /* **************************************************************** */
        // Panel  : pan wind speed
        // Needs  : X, Y locations
        // Output : Velocity value from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panWindSpeed(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            byte c;
            float k;

            if (is_alt(fAlt)) {
                c = 0x18; //m/s
                k = 3.6f;
            } else {
                c = velocityChar;
                k = 1.0f;
            }      
            int arrow=0xA4;
            if(is_alt2 (fAlt)){
                arrow=0x94;
            }
            if(sign==1)
                osd.printf("%c%3.0f%c|%c%c%2.0f%c", 0x1D, (double)(osd_windspeed * convertspeed/3 / k), c,
                                      arrow, arrow+1, (double)(osd_windspeed * convertspeed / k), c);
            else
				osd.printf("%3.0f%c|%c%c%2.0f%c", (double)(osd_windspeed * convertspeed/3 /k), c,
                                      arrow, arrow+1, (double)(osd_windspeed * convertspeed / k), c);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panOff
        // Needs  : X, Y locations
        // Output : OSD off
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panOff(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            {
               // osd.printf("%c", 0x00);
            }
            
            return 0;
        }


        /* **************************************************************** */
        // Panel  : panCur_A
        // Needs  : X, Y locations
        // Output : Current symbol and altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panCur_A(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            if(sign==1)
                osd.write(0xBD);
            
            if (is_alt3(fAlt))
                osd.printf("%4.1f%c", (osd_curr_A * .01), 0x0E);
            else
				osd.printf("%5.2f%c", (osd_curr_A * .01), 0x0E);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panAlt
        // Needs  : X, Y locations
        // Output : Alt symbol and altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panAlt(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            //osd.printf("%c%5.0f%c",0x85, (double)(osd_alt - osd_home_alt), 0x8D);
            if (sign==1)//ArduCopter
                osd.printf("%c%4.0f%c", 0x11, (double)(osd_alt * converth), altitudeChar);
            else
                osd.printf("%4.0f%c", (double)(osd_alt * converth), altitudeChar);

            
            return 0;
        }
        /* **************************************************************** */
        // Panel  : panWarning
        // Needs  : X, Y locations
        // Output : Warning panel
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done
        public int panWarn(int first_col, int first_line, int sign, int fAlt, Panel p) {
         osd.setPanel(first_col, first_line);
         
         osd.printf_P(PSTR("\x20\x4f\x76\x65\x72\x53\x70\x65\x65\x64\x21\x20"));
         
         return 0;
         }

        /* **************************************************************** */
        // Panel  : panHomeAlt
        // Needs  : X, Y locations
        // Output : Alt symbol and home altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panHomeAlt(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            //osd.printf("%c%5.0f%c",0x85, (double)(osd_alt - osd_home_alt), 0x8D);
            if (sign==1)//ArduCopter
                osd.printf("%c%4.0f%c", 0x12, (double)((osd_alt - osd_home_alt) * converth), altitudeChar);
            else
                osd.printf("%4.0f%c", (double)((osd_alt - osd_home_alt) * converth), altitudeChar);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panVel
        // Needs  : X, Y locations
        // Output : Velocity value from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panVel(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);

            byte c;
            float k;

            if (is_alt(fAlt)) {
                c = 0x18; //m/s
                k = 3.6f;
            } else {
                c = velocityChar;
                k = 1.0f;
            }
            
            if (sign==1)//ArduCopter
                osd.printf("%c%3.0f%c", 0x14, (double)(osd_groundspeed * convertspeed/k), c);
            else
                osd.printf("%3.0f%c", (double)(osd_groundspeed * convertspeed/k), c);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panAirSpeed
        // Needs  : X, Y locations
        // Output : Airspeed value from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panAirSpeed(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);

            byte c;
            float k;

            if (is_alt(fAlt)) {
                c = 0x18; //m/s
                k=3.6f;                
            }else{
                c=velocityChar;
                k=1.0f;
            }
            
            if (sign==1)//ArduCopter
                osd.printf("%c%3.0f%c", 0x13, (double)(osd_airspeed * convertspeed/k), c);
            else
                osd.printf("%3.0f%c", (double)(osd_airspeed * convertspeed/k), c);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panBatteryPercent
        // Needs  : X, Y locations
        // Output : Battery state from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panBatteryPercent(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);

            if (is_alt(fAlt))
            {
				if(sign==1)
                  osd.printf("\x88%c%c\x8e%2.0i%%", 0x89, 0x89, 99);
				else
					osd.printf("%3.0i%c",  osd_battery_remaining, 0x25);
            }
            else
            {
				if(sign==1)
                  osd.printf("\x88%c%c\x8e%4.0f\x01", 0x89,0x89, 99);
				else
                   osd.printf("%4.0f\x01", 978);
            }
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panTime
        // Needs  : X, Y locations
        // Output : Time from start with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panTime(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            osd.printf("%3i%c%02i", ((int)start_Time / 60), 0x3A, (int)start_Time % 60);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panThr
        // Needs  : X, Y locations
        // Output : Throttle value from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panThr(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
			if(sign==1)
            	osd.printf("%c%3.0i%c", 0x02, osd_throttle, 0x25);
			else
				osd.printf("%3.0i%c", osd_throttle, 0x25);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panHomeDis
        // Needs  : X, Y locations
        // Output : Home Symbol with distance to home in meters
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panHomeDis(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            osd_home_distance=123;

			if(sign==1)
                osd.write(0x0B);
            
            osd.printf("%4.1f%c", (double)(osd_home_distance * converth)/100, bigDistanceChar);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panCenter
        // Needs  : X, Y locations
        // Output : 2 row croshair symbol created by 2 x 4 chars
        // Size   : 2 x 4  (rows x chars)
        // Staus  : done

        public int panCenter(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            osd.printf_P(PSTR("\x05\x03\x04\x05|\x15\x13\x14\x15"));
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panHorizon
        // Needs  : X, Y locations
        // Output : 12 x 4 Horizon line surrounded by 2 cols (left/right rules)
        // Size   : 14 x 4  (rows x chars)
        // Staus  : done

        public int panHorizon(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);

            if (is_alt(fAlt))
            {
                osd.printf_P(PSTR("\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3|" +
                                  "\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3|" +
                                  "\xC6\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xC5|" +
                                  "\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3|" +
                      "\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3"));
            }
            else {
                osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|" +
                                  "\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|" +
                                  "\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|" +
                                  "\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|" +
                                  "\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20"));
            
            }

//			if(osd.conf.eeprom.flags[OSD.radar_on]) {
			if(is_alt3(fAlt)) {
				osd.setPanel(first_col+7, first_line+3);
				osd.printf_P(PSTR("\xb7"));

                if (is_alt4(fAlt)) {
                    osd.setPanel(first_col + 8, first_line + 3);
                    osd.printf_P(PSTR("\x24"));
                    osd.setPanel(first_col + 9, first_line + 3);
                    osd.printf_P(PSTR("\x24"));
                    osd.setPanel(first_col + 9, first_line + 4);
                    osd.printf_P(PSTR("\x24"));


                }
			}				
			
            if(is_alt2(fAlt)) { // ILS
                if ((OSD.ModelType)model_type == OSD.ModelType.Copter) {
                    osd.setPanel(first_col + 6, first_line + 3);
                    osd.printf_P(PSTR("\xc8"));
                } else {
                    osd.setPanel(first_col+1, first_line + 3);
                    osd.printf_P(PSTR("\xc8"));
                    osd.setPanel(first_col + 12, first_line + 3);
                    osd.printf_P(PSTR("\xc8"));

                    osd.setPanel(first_col + 6, first_line );
                    osd.printf_P(PSTR("\xc0"));
                    osd.setPanel(first_col + 6, first_line+4);
                    osd.printf_P(PSTR("\xc0"));
                }

            }

			osd_roll=10;
			osd_pitch=-6;

            if ((osd.scr[osd.screen_number].screen_flags & (1 << OSD.scrFlg_hideHorizon))==0)
			    showHorizon(first_col+1, first_line, sign );
			
			osd.setPanel(first_col+6, first_line+2);
			if(sign==1)
    			osd.printf_P(PSTR("\xb8\xb9"));
            return 0;
        }

		
        /* **************************************************************** */
        // Panel  : panPitch
        // Needs  : X, Y locations
        // Output : -+ value of current Pitch from vehicle with degree symbols and pitch symbol
        // Size   : 1 x 6  (rows x chars)
        // Staus  : done

        public int panPitch(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            osd.printf("%4i%c%c", osd_pitch, 0x05, 0x07);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panRoll
        // Needs  : X, Y locations
        // Output : -+ value of current Roll from vehicle with degree symbols and roll symbol
        // Size   : 1 x 6  (rows x chars)
        // Staus  : done

        public int panRoll(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            osd.printf("%4i%c%c", osd_roll, 0x05, 0x06);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panBattery A (Voltage 1)
        // Needs  : X, Y locations
        // Output : Voltage value as in XX.X and symbol of over all battery status
        // Size   : 1 x 8  (rows x chars)
        // Staus  : done

        public int panBatt_A(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            

            
			if(sign==1)
                osd.write(0xBC);

            if(is_alt3(fAlt))
                osd.printf("%4.1f%c", (double)osd_vbat, 0x0D);
            else
				osd.printf("%5.2f%c",  (double)osd_vbat, 0x0D);
            
            return 0;
        }

		
        /* **************************************************************** */
        // Panel  : panBattery B (Voltage 2)
        // Needs  : X, Y locations
        // Output : Voltage value as in XX.X and symbol of over all battery status
        // Size   : 1 x 8  (rows x chars)
        // Staus  : done

        public int panBatt_B(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            if(sign==1)
                osd.write(0x26);

            if(is_alt3(fAlt))
                osd.printf("%4.1f%c", (double)osd_vbat, 0x0D);
            else
            	osd.printf("%5.2f%c", (double)osd_vbat, 0x0D);
            
            return 0;
        }

        //------------------ Panel: Startup ArduCam OSD LOGO -------------------------------

        public int panLogo(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            osd.printf_P(PSTR("\x20\x20\x20\x20\xba\xbb\xbc\xbd\xbe|\x20\x20\x20\x20\xca\xcb\xcc\xcd\xce|ArduCam OSD"));
            
            return 0;
        }

        //------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

        public int panWaitMAVBeats(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            //panLogo(10, 5, 0, 0);
            osd.setPanel(first_col, first_line);
            
            osd.printf_P(PSTR("Waiting for|MAVLink heartbeats..."));
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panGPL
        // Needs  : X, Y locations
        // Output : 1 static symbol with changing FIX symbol
        // Size   : 1 x 2  (rows x chars)
        // Staus  : done

        //public int panGPL(int first_col, int first_line)
        //{
          //  osd.setPanel(first_col, first_line);
            //
            //switch (osd_fix_type)
            //{
             //   case 0:
              //      osd.printf_P(PSTR("\x10\x20"));
               //     break;
               // case 1:
               //     osd.printf_P(PSTR("\x10\x20"));
                //    break;
                //case 2:
                  //  osd.printf_P(PSTR("\x11\x20"));//If not APM, x01 would show 2D fix
                   // break;
                //case 3:
                  //  osd.printf_P(PSTR("\x11\x20"));//If not APM, x02 would show 3D fix
                    //break;
            //}

            /*  if(osd_fix_type <= 1) {
            osd.printf_P(PSTR("\x10"));
          } else {
            osd.printf_P(PSTR("\x11"));
          }  */
            //
            //return 0;
        //}

        /* **************************************************************** */
        // Panel  : panGPSats
        // Needs  : X, Y locations
        // Output : 1 symbol and number of locked satellites
        // Size   : 1 x 5  (rows x chars)
        // Staus  : done

        public int panGPSats(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            if(sign==1)
                if (is_alt(fAlt))
                    osd.printf("%2i\x2a", osd_satellites_visible);
                else
            	    osd.printf("%c%2i", 0x2a, osd_satellites_visible);
			else 
				osd.printf("%2i",  osd_satellites_visible);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panGPS
        // Needs  : X, Y locations
        // Output : two row numeric value of current GPS location with LAT/LON symbols as on first char
        // Size   : 2 x 12  (rows x chars)
        // Staus  : done

        public int panGPS(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);

            char div = is_alt3(fAlt)?' ':'|';

			if(sign==1) {
                if (is_alt2(fAlt)){
                    int i;
                    double lat = abs(osd_lat), lon = abs(osd_lon);
                    i = (int)lat; lat -=i;
                    i = (int)lon; lon -= i;

                    if (is_alt(fAlt))
                        osd.printf("%c%05d%c%c%05d", 0x03, (int)(lat * 100000.0),div, 0x04, (int)(lon * 100000.0));
                    else
                        osd.printf("%c%06d%c%c%06d", 0x03, (int)(lat * 1000000.0), div, 0x04, (int)(lon * 1000000.0));
                }else if (is_alt(fAlt))
                    osd.printf("%c%9.5f%c%c%9.5f", 0x03, (double)osd_lat, div, 0x04, (double)osd_lon);
                else
                    osd.printf("%c%10.6f%c%c%10.6f", 0x03, (double)osd_lat, div, 0x04, (double)osd_lon);
			} else {
                if (is_alt2(fAlt)){
                    int i;
                    double lat = abs(osd_lat), lon = abs(osd_lon);
                    i = (int)lat; lat -= i;
                    i = (int)lon; lon -= i;
                    

                    if (is_alt(fAlt))
                        osd.printf("%05d%c%05d", (int)(lat * 100000.0), div, (int)(lon * 100000.0));
                    else
                        osd.printf("%06d%c%06d", (int)(lat * 1000000.0), div, (int)(lon * 1000000.0));

                } else if (is_alt(fAlt))
                    osd.printf("%9.5f%c%9.5f", (double)osd_lat, div, (double)osd_lon);
                else
                    osd.printf("%10.6f%c%10.6f", (double)osd_lat, div, (double)osd_lon);
            }
            return 0;
        }


        public int panGPS_lat(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);
           

            if (sign == 1) {
                if (is_alt2(fAlt)) {
                    int i;
                    double lat = abs(osd_lat), lon = abs(osd_lon);
                    i = (int)lat; lat -= i;

                    if (is_alt(fAlt))
                        osd.printf("%c%05d", 0x03, (int)(lat * 100000.0));
                    else
                        osd.printf("%c%06d", 0x03, (int)(lat * 1000000.0));
                } else if (is_alt(fAlt))
                    osd.printf("%c%9.5f", 0x03, (double)osd_lat);
                else
                    osd.printf("%c%10.6f", 0x03, (double)osd_lat);
            } else {
                if (is_alt2(fAlt)) {
                    int i;
                    double lat = abs(osd_lat), lon = abs(osd_lon);
                    i = (int)lat; lat -= i;
                    i = (int)lon; lon -= i;


                    if (is_alt(fAlt))
                        osd.printf("%05d", (int)(lat * 100000.0));
                    else
                        osd.printf("%06d", (int)(lat * 1000000.0));

                } else if (is_alt(fAlt))
                    osd.printf("%9.5f", (double)osd_lat);
                else
                    osd.printf("%10.6f", (double)osd_lat);
            }
            return 0;
        }

        public int panGPS_lon(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);
            

            if (sign == 1) {
                if (is_alt2(fAlt)) {
                    int i;
                    double lon = abs(osd_lon);
                    i = (int)lon; lon -= i;

                    if (is_alt(fAlt))
                        osd.printf("%c%05d", 0x04, (int)(lon * 100000.0));
                    else
                        osd.printf("%c%06d", 0x04, (int)(lon * 1000000.0));
                } else if (is_alt(fAlt))
                    osd.printf("%c%9.5f", 0x04, (double)osd_lon);
                else
                    osd.printf("%c%10.6f", 0x04, (double)osd_lon);
            } else {
                if (is_alt2(fAlt)) {
                    int i;
                    double lon = abs(osd_lon);
                    i = (int)lon; lon -= i;
                    


                    if (is_alt(fAlt))
                        osd.printf("%05d", (int)(lon * 100000.0));
                    else
                        osd.printf("%06d", (int)(lon * 1000000.0));

                } else if (is_alt(fAlt))
                    osd.printf("%9.5f", (double)osd_lon);
                else
                    osd.printf("%10.6f", (double)osd_lon);
            }
            return 0;
        }


        /* **************************************************************** */
        // Panel  : panHeading
        // Needs  : X, Y locations
        // Output : Symbols with numeric compass heading value
        // Size   : 1 x 5  (rows x chars)
        // Staus  : not ready

        public int panHeading(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);

            if(sign!=0) osd.write(0xb0);
            //osd.printf("%004.0f%c", (double)osd_heading, 0x05);
            osd.printf("%3i%c", (Int16)2, 0x05);
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panRose
        // Needs  : X, Y locations
        // Output : a dynamic compass rose that changes along the heading information
        // Size   : 2 x 13  (rows x chars)
        // Staus  : done

        public int panRose(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            //osd_heading  = osd_yaw;
            //if(osd_yaw < 0) osd_heading = 360 + osd_yaw;
			if(sign==1 && !is_alt(fAlt))
                if (is_alt2(fAlt))
                    osd.printf_P(PSTR("\x20\x20\x20\x24\xcb\xb8\xb9\xcb\x24\x20\x20\x20|"));
                else
				    osd.printf_P(PSTR( "\x20\xc8\xc8\xc8\xc8\x7e\xc8\xc8\xc8\xc8\x20|"));

            if (is_alt2(fAlt))
                osd.printf_P(PSTR("\xc3\x80\x81\x80\x82\x80\x81\x80\x81\x80\x81\x87"));
            else
                osd.printf_P(PSTR("\xc3\x80\x81\x80\x82\x80\x81\x80\x81\x80\x87"));
            if (sign == 1 && is_alt(fAlt))
                if (is_alt2(fAlt)) {
                    osd.printf_P(PSTR("|\x20\x20\x20\x24\xcb"));
                    osd.write_raw(0x7c);                    
                    osd.printf_P(PSTR("\x40\xcb\x24\x20\x20\x20|"));
                }
                else
                    osd.printf_P(PSTR("|\x20\xce\xce\xce\xce\x60\xce\xce\xce\xce\x20|"));
           
            
            return 0;
        }

		
        /* **************************************************************** */
        // Panel  : panMavBeat
        // Needs  : X, Y locations
        // Output : 2 symbols, one static and one that blinks on every 50th received 
        //          mavlink packet.
        // Size   : 1 x 2  (rows x chars)
        // Staus  : done

//        public int panMavBeat(int first_col, int first_line)
//        {
//            osd.setPanel(first_col, first_line);
//            
//            if (mavbeat == 1)
//            {
//                osd.printf_P(PSTR("\xEA\xEC"));
//                mavbeat = 0;
//            }
//            else
//            {
//                osd.printf_P(PSTR("\xEA\xEB"));
//            }
//          
//            return 0;
//        }


        /* **************************************************************** */
        // Panel  : panWPDir
        // Needs  : X, Y locations
        // Output : 2 symbols that are combined as one arrow, shows direction to next waypoint
        // Size   : 1 x 2  (rows x chars)
        // Staus  : not ready

        public int panWPDir(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            
            osd.printf("%c%c",  0xA4, 0xA5);
            
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panWPDis
        // Needs  : X, Y locations
        // Output : W then distance in Km - Distance to next waypoint
        // Size   : 1 x 2  (rows x chars)
        // Staus  : not ready TODO - CHANGE the Waypoint symbol - Now only a Wp!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        public int panWPDis(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            //osd.printf("%c%c%c%2i%c%4.0f%c|%c%c%c%c%c%5.0f%c", 0x57, 0x70, 0x0, 
//     											           wp_number, 0x0, (double)((float)(wp_dist * converth)), smallDistanceChar, 0xa4, 0xa5, 0x20, 0x58, 0x45, (xtrack_error), smallDistanceChar); //Print in Km 
			if(sign==1)			
				osd.printf_P(PSTR("\x5C%2i %4.0f%c|"), wp_number,(double)((float)(wp_dist) * converth),chrHigh);
			else 
				osd.printf_P(PSTR("%2i %4.0f%c|"), wp_number,(double)((float)(wp_dist) * converth),chrHigh);
			
			xtrack_error=777;
            osd.printf_P(PSTR("\x20\x58\x65%4.0f%c"), (xtrack_error* converth), chrHigh);
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panHomeDir
        // Needs  : X, Y locations
        // Output : 2 symbols that are combined as one arrow, shows direction to home
        // Size   : 1 x 2  (rows x chars)
        // Status : not tested

        public int panHomeDir(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            showArrow();

            if (is_alt(fAlt)) osd.printf_P(PSTR("161"));
            
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panFlightMode 
        // Needs  : X, Y locations
        // Output : 2 symbols, one static name symbol and another that changes by flight modes
        // Size   : 1 x 2  (rows x chars)
        // Status : done

        public int panFlightMode(int first_col, int first_line, int sign, int fAlt, Panel p)
        {
            osd.setPanel(first_col, first_line);
            
            if (this.osd.modelType == OSD.ModelType.Copter)//ArduCopter
            {
				if(sign==1)
                	osd.printf_P(PSTR("\x7Fstab\x86"));//Stabilize
				else
					osd.printf_P(PSTR("stab\x86"));//Stabilize
                
            }
            else if (this.osd.modelType == OSD.ModelType.Plane) // arduplane
            {
				if(sign==1)			
				    osd.printf_P(PSTR("\x7Fmanu"));//Stabilize
				else 
					osd.printf_P(PSTR("manu"));//Stabilize
			}            
            return 0;
        }


        // ---------------- EXTRA FUNCTIONS ----------------------
        // Show those fancy 2 char arrows
        public int showArrow()
        {
            switch (osd_home_direction)
            {
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
            return 0;
        }

// Calculate and shows Artificial Horizon
// Smooth horizon by Jörg Rothfuchs
                                                        // with different factors we can adapt do different cam optics
const double  AH_PITCH_FACTOR =      0.010471976   ;           // conversion factor for pitch
const double  AH_ROLL_FACTOR =       0.017453293  ;            // conversion factor for roll
const int  AH_COLS       =         12         ;             // number of artificial horizon columns
const int  AH_ROWS      =          5        ;              // number of artificial horizon rows
const int  CHAR_COLS     =         12       ;               // number of MAX7456 char columns
const int  CHAR_ROWS     =         18       ;               // number of MAX7456 char rows
const int  CHAR_SPECIAL =             9     ;                 // number of MAX7456 special chars for the artificial horizon
const int  AH_TOTAL_LINES=        AH_ROWS * CHAR_ROWS ;     // helper define


const int  LINE_SET_STRAIGHT__  =    0xC7 - 1;              // code of the first MAX7456 straight char -1
const int  LINE_SET_STRAIGHT_O  =    0xD0 - 3;              // code of the first MAX7456 straight overflow char -3
const int  LINE_SET_P___STAG_1  =    0xD1 - 1;              // code of the first MAX7456 positive staggered set 1 char -1
const int  LINE_SET_P___STAG_2  =    0xDA - 1;              // code of the first MAX7456 positive staggered set 2 char -1
const int  LINE_SET_N___STAG_1  =    0xE3 - 1;              // code of the first MAX7456 negative staggered set 1 char -1
const int  LINE_SET_N___STAG_2  =    0xEC - 1;              // code of the first MAX7456 negative staggered set 2 char -1
const int  LINE_SET_P_O_STAG_1  =    0xF5 - 2;              // code of the first MAX7456 positive overflow staggered set 1 char -2
const int  LINE_SET_P_O_STAG_2  =    0xF9 - 1;              // code of the first MAX7456 positive overflow staggered set 2 char -1
const int  LINE_SET_N_O_STAG_1  =    0xF7 - 2;              // code of the first MAX7456 negative overflow staggered set 1 char -2
const int  LINE_SET_N_O_STAG_2  =    0xFC - 1;              // code of the first MAX7456 negative overflow staggered set 2 char -1


const int  OVERFLOW_CHAR_OFFSET   =   6 ;                     // offset for the overflow subvals


const int  ANGLE_1=                9     ;                 // angle above we switch to line set 1
const int  ANGLE_2=                25     ;                 // angle above we switch to line set 2		
		
        // Calculate and shows Artificial Horizon
        public void showHorizon(int start_col, int start_row,int sign)
        {


    int  col, row;
    int pitch_line, middle, hit, subval;
    double roll, a_roll;
    int line_set = LINE_SET_STRAIGHT__;
    int line_set_overflow = LINE_SET_STRAIGHT_O;
    int subval_overflow = 9;
    
    double K_roll, K_pitch;

    // NTSC: osd.getMode() == 0
    if(!pal_ntsc ) { // ntsc
        K_pitch = pitch_k_ntsc;
        K_roll = roll_k_ntsc;
    } else {
        K_pitch = pitch_k;
        K_roll = roll_k;
    }

    
    // preset the line char attributes
    a_roll = osd_roll * K_roll;
                
    //if(flgRusHUD) roll = -roll;
    if ((osd.scr[osd.screen_number].screen_flags & (1<<OSD.scrFlg_russianHUD)) != 0) a_roll = -a_roll;

    roll=a_roll;

    if ((roll >= 0 && roll < 90) || (roll >= -179 && roll < -90)) {      // positive angle line chars
        roll = roll < 0 ? roll + 179 : roll;
        if (abs(roll) > ANGLE_2) {
            line_set = LINE_SET_P___STAG_2;
            line_set_overflow = LINE_SET_P_O_STAG_2;
            subval_overflow = 7;
        } else if (abs(roll) > ANGLE_1) {
            line_set = LINE_SET_P___STAG_1;
            line_set_overflow = LINE_SET_P_O_STAG_1;
            subval_overflow = 8;
        }
    } else {                                                              // negative angle line chars
        roll = roll > 90 ? roll - 179 : roll;
        if (abs(roll) > ANGLE_2) {
            line_set = LINE_SET_N___STAG_2;
            line_set_overflow = LINE_SET_N_O_STAG_2;
            subval_overflow = 7;
        } else if (abs(roll) > ANGLE_1) {
            line_set = LINE_SET_N___STAG_1;
            line_set_overflow = LINE_SET_N_O_STAG_1;
            subval_overflow = 8;
        }			
	}

    double dRoll = a_roll * AH_ROLL_FACTOR;
	
			
    pitch_line = round(tan(-AH_PITCH_FACTOR * osd_pitch * K_pitch) * AH_TOTAL_LINES) + AH_TOTAL_LINES/2;  // 90 total lines
    for (col=1; col<=AH_COLS; col++) {
        middle = col * CHAR_COLS - (AH_COLS/2 * CHAR_COLS) - CHAR_COLS/2;        // -66 to +66>center X point at middle of each column
        hit = (int)(tan(dRoll) * middle + pitch_line);                // 1 to 90      calculating hit point on Y plus offset
//			Console.Write ("col="+col+" hit="+hit + "\n");				
        if (hit >= 1 && hit <= AH_TOTAL_LINES) {
            row = (hit-1) / CHAR_ROWS;                                            // 0 to 4 bottom-up
            subval = (hit - (row * CHAR_ROWS) + 1) / (CHAR_ROWS / CHAR_SPECIAL);  // 1 to 9
        
            // print the line char
            osd.openSingle(start_col + col - 1, start_row + AH_ROWS - row - 1);
            osd.write(line_set + subval);
        
            // check if we have to print an overflow line char
            if (subval >= subval_overflow && row < 4) { // only if it is a char which needs overflow and if it is not the upper most row
                osd.openSingle(start_col + col - 1, start_row + AH_ROWS - row - 2);
                osd.write( line_set_overflow + subval - OVERFLOW_CHAR_OFFSET);
            }
        }
    }			

	
			
	/*
            int x, nose, row, minval, hit, subval = 0;
            int cols = 12;
            int rows = 5;
            int[] col_hit = new int[cols];
            double pitch, roll;

            if (abs(osd_pitch) == 90) { pitch = 89.99 * (90 / osd_pitch) * -0.017453293; } else { pitch = osd_pitch * -0.017453293; }
            if (abs(osd_roll) == 90) { roll = 89.99 * (90 / osd_roll) * 0.017453293; } else { roll = osd_roll * 0.017453293; }

            nose = round(tan(pitch) * (rows * 9));
            for (int col = 1; col <= cols; col++)
            {
                x = (col * 12) - (cols * 6) - 6;//center X point at middle of each col
                col_hit[col - 1] = (int)(tan(roll) * x) + nose + (rows * 9) - 1;//calculating hit point on Y plus offset to eliminate negative values
                //col_hit[(col-1)] = nose + (rows * 9);
            }

            for (int col = 0; col < cols; col++)
            {
                hit = col_hit[col];
                if (hit > 0 && hit < (rows * 18))
                {
                    row = rows - ((hit - 1) / 18);
                    minval = rows * 18 - row * 18 + 1;
                    subval = hit - minval;
                    subval = round((subval * 9) / 18);
                    if (subval == 0) subval = 1;
                    printHit((byte)(start_col + col), (byte)(start_row + row - 1), (byte)subval);
                }
            }
            return 0;
        }

        public int printHit(byte col, byte row, byte subval)
        {
            osd.openSingle(col, row);
            switch (subval)
            {
                case 1:
                    osd.printf_P(PSTR("\x06"));
                    break;
                case 2:
                    osd.printf_P(PSTR("\x07"));
                    break;
                case 3:
                    osd.printf_P(PSTR("\x08"));
                    break;
                case 4:
                    osd.printf_P(PSTR("\x09"));
                    break;
                case 5:
                    osd.printf_P(PSTR("\x0a"));
                    break;
                case 6:
                    osd.printf_P(PSTR("\x0b"));
                    break;
                case 7:
                    osd.printf_P(PSTR("\x0c"));
                    break;
                case 8:
                    osd.printf_P(PSTR("\x0d"));
                    break;
                case 9:
                    osd.printf_P(PSTR("\x0e"));
                    break;
            }
            return 0;
  */
       }



        //------------------ Heading and Compass ----------------------------------------
/* not used
        byte[] buf_show = new byte[11];
        byte[] buf_Rule = {0xc2,0xc0,0xc0,0xc1,0xc0,0xc0,0xc1,0xc0,0xc0,
                           0xc4,0xc0,0xc0,0xc1,0xc0,0xc0,0xc1,0xc0,0xc0,
                           0xc3,0xc0,0xc0,0xc1,0xc0,0xc0,0xc1,0xc0,0xc0,
                           0xc5,0xc0,0xc0,0xc1,0xc0,0xc0,0xc1,0xc0,0xc0};
        public void setHeadingPatern()
        {
            int start;
            start = round((osd_heading * 36) / 360);
            start -= 5;
            if (start < 0) start += 36;
            for (int x = 0; x <= 10; x++)
            {
                buf_show[x] = buf_Rule[start];
                if (++start > 35) start = 0;
            }
            // buf_show[11] = (byte)'\0';
        }
*/
        //------------------ Battery Remaining Picture ----------------------------------
/*
        public void setBatteryPic()
        {
            if (osd_battery_remaining <= 270)
            {
                osd_battery_pic = 0xb4;
            }
            else if (osd_battery_remaining <= 300)
            {
                osd_battery_pic = 0xb5;
            }
            else if (osd_battery_remaining <= 400)
            {
                osd_battery_pic = 0xb6;
            }
            else if (osd_battery_remaining <= 500)
            {
                osd_battery_pic = 0xb7;
            }
            else if (osd_battery_remaining <= 800)
            {
                osd_battery_pic = 0xb8;
            }
            else osd_battery_pic = 0xb9;
        }
*/
        public int panRadarScale(int first_col, int first_line, int sign, int fAlt, Panel p) {

	    	osd.setPanel(first_col, first_line);
 			
			if(sign==1)
				osd.write(0x1f);
		    osd.printf_P(PSTR("%4i%c"), (int)(250), chrHigh);
	
			return 0;
		}

        public int panFData(int first_col, int first_line, int sign, int fAlt, Panel p) {
			
              double total_flight_time_seconds = 12345,
                  max_home_distance = 3457,
                  tdistance = 623.66,
                  max_osd_groundspeed = 5938.45,
                  max_osd_home_alt = 24.7,
                  osd_lat = 45.45,
                  osd_lon = 46.46;

              byte ch_climb = (vs_ms != 0 ? (byte)(0x18) : (byte)climbChar);
			osd.setPanel(first_col, first_line);
			
	   osd.printf_P(PSTR("\x08%3i\x3a%02u|\x0B%5i%c|\x8F%5i%c|\x14%5i%c|\x1d%5i%c|\x12%5i%c|\x90\x91%7.2f%c|\xA0\xA1%7.2f%c|\xBD%6.1fA|W160.0|"),
              ((int)total_flight_time_seconds/60)%60,(int)total_flight_time_seconds%60,
                                      (int)((max_home_distance) * converth), chrHigh,
                                                 (int)(tdistance * converth), chrHigh,
                                                        (int)(max_osd_groundspeed * convertspeed),chrSpe,
                                                                        12, chrSpe,
                                                                                 (int)(max_osd_home_alt * converth), chrHigh,
                                                                                       54.3,ch_climb,
                                                                                                24.7,ch_climb,
                                                                                                                47);
            
            if(is_alt(fAlt)) osd.setPanel(first_col+10, first_line);

            osd.printf_P("\x03%10.6f|\x04%10.6f",osd_lat, osd_lon);
			
            return 0;
		}

        public int panBaroAlt(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            if (sign == 1)//ArduCopter
                osd.printf("%c%4.0f%c", 0x11, (double)(osd_alt * converth), altitudeChar);
            else
                osd.printf("%4.0f%c", (double)(osd_alt * converth), altitudeChar);
            return 0;
        }

        public int panMessage(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            if(sign==1)osd.printf("!");
            osd.printf("This a message via MavLink");
            return 0;
        }

        public int panSenor1(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            string fmt;

            fmt = osd.convertChars(osd.txtFormat1.Text);
            try {
                fmt = fmt.Substring(0, Config.OSD_SENSOR_FORMAT_TOTAL);
            } catch{
            }

            
            osd.printf(fmt,  3.21);
            

            return 0;
        }

        public int panSenor2(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            string fmt;

            fmt = osd.convertChars(osd.txtFormat2.Text);
            try {
                fmt = fmt.Substring(0, Config.OSD_SENSOR_FORMAT_TOTAL);
            } catch {
            }

            osd.printf(fmt, 78.9);

            return 0;
        }

        public int panSenor3(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            string fmt;

            fmt = osd.convertChars(osd.txtFormat3.Text);
            try {
                fmt = fmt.Substring(0, Config.OSD_SENSOR_FORMAT_TOTAL);
            } catch {
            }

            osd.printf(fmt, 4.56);

            return 0;
        }

        public int panSenor4(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);
            string fmt;

            fmt = osd.convertChars(osd.txtFormat4.Text);
            try {
                fmt = fmt.Substring(0, Config.OSD_SENSOR_FORMAT_TOTAL);
            } catch {
            }

            osd.printf(fmt, 9.87);

            return 0;
        }

        public int panHdop(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);
            if (sign == 1) osd.write(0x1f);

            osd.printf("%4.2f", 1.24);

            return 0;
        }

        public int[] state_values = new int[4];

        public int panState(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            // fAlt  - напрямую номер канала
            // значения 
            // Off
            // Low
            // Mid
            // Hi!
            // On!

            if (sign == 1) osd.printf("C%d ",fAlt/2 + 5);
            int id=p.string_id ;
            int n=p.string_count;
            string s=osd.StringArray[id];
            for(int i=1;i<n;i++){
                string s1 = osd.StringArray[id+i];
                if(s1.Length > s.Length) s=s1;
            }
            osd.printf("%s",s);
            return 0;
        }

        public int panScale(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            
            if (sign == 1) osd.printf("%d",fAlt/2 + 5);
            osd.printf("\x80\x81\x80\x80\x80");
            return 0;
        }

        public int panCvlaue(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            if (sign == 1) osd.printf("C%d ", fAlt / 2 + 5);
            osd.printf("1513");
            return 0;
        }

        public int panPower(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            if (sign == 1) osd.printf("W");
            osd.printf("160");
            return 0;
        }

        public int panDate(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            //if (sign == 1) 
            if(is_alt(fAlt))
                osd.printf("19.10.2016");
            else
                osd.printf("2016.10.19");
            return 0;
        }

        public int panDayTime(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            //if (sign == 1) 
            if (is_alt2(fAlt))
                osd.printf("16:06:15");
            else
                osd.printf("16:06");
            return 0;
        }

        public int panMotor(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            if (is_alt(fAlt))
             osd.printf("1530 1545|1430 1467");
            else
            osd.printf("67 68|66 67");
  
            return 0;
        }

        public int panVibe(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            //if (sign == 1) 
            //if (is_alt(fAlt))
            if (sign == 1)
                osd.printf(" x  y  z|");
                osd.printf("19 13 44| 0  0  1");
            //else
              //  osd.printf("2016.10.19");
            return 0;
        }


        public int panVario(int first_col, int first_line, int sign, int fAlt, Panel p) {
            osd.setPanel(first_col, first_line);

            //if (sign == 1) 
            //if (is_alt(fAlt))
            if (sign == 1){
/*
"\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3|" +
"\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3|" +
"\xC6\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xC5|" +
"\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3|" +
"\xb2\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\xb3"));
*/
                if (!is_alt(fAlt)) {
                    osd.printf("\xb2 |\xb2 |\xc6\xc7|\xb2 |\xb2 ");                    
                } else {
                    osd.printf(" \xb3| \xb3|\xc7\xc5| \xb3| \xb3");                                
                }
            } else {

                osd.printf(" | |\xc7| | ");
            }
            return 0;
        }
        

    }
}

