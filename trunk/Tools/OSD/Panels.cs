using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSD
{
    // this is mainly copied from osd_panels.pde


    using uint16_t = System.UInt16;
    using uint8_t = System.Byte;
    using int8_t = System.SByte;
    using boolean = System.Byte;

    class Panels
    {
        OSD osd;

        public Panels(OSD os)
        {
            osd = os;
        }

        string PSTR(string input)
        {
            return input;
        }

        double abs(double input)
        {
            return Math.Abs(input);
        }

        int round(double input)
        {
            return (int)Math.Round(input, 0);
        }

        double tan(double input)
        {
            return Math.Tan(input);
        }

        /*Panels variables*/
        //Will come from APM telem port

        //Config vars
        public uint8_t model_type = 0; //0 - Plane; 1 - Copter
        public uint8_t fw_version1 = 0;
        public uint8_t fw_version2 = 0;
        public uint8_t fw_version3 = 0;
        public uint8_t cs_version1 = 0;
        public uint8_t cs_version2 = 0;
        public uint8_t cs_version3 = 0;
        
        public uint8_t sign_air_speed = 0;
        public uint8_t sign_ground_speed = 0;
        public uint8_t sign_home_altitude = 0;
        public uint8_t sign_msl_altitude = 0; 

        public uint8_t overspeed = 40;
        public uint8_t stall = 5;
        public uint8_t battv = 101;                //Batery warning voltage - units Volt *10 
        public uint8_t converts = 0;                //1- Imperial; 0- Metric

        private byte temperatureChar = 0x1B;
        private byte bigDistanceChar = 0x1B;
        private byte smallDistanceChar = 0x1B;
        private byte climbChar = 0x1A;
        private byte velocityChar = 0x10;
        private byte altitudeChar = 0x10;

        private float convertspeed = 3.6f;
        private float converth = 1.0f;
        private float tempconv = 10;
        private float tempconvAdd = 0;
        private float distconv = 1000;

        public void do_converts()
        {
            switch (converts)
            { 
                case 0:
                    convertspeed = 3.6f;
                    converth = 1.0f;
                    tempconv = 10;
                    tempconvAdd = 0;
                    distconv = 1000;

                    temperatureChar = 0xBA;
                    bigDistanceChar = 0x1B;
                    climbChar = 0x1A;
                    velocityChar = 0x10;
                    altitudeChar = 0x6D;
                    smallDistanceChar = 0x6D;
                    break;
                case 1:
                    convertspeed = 2.23f;
                    converth = 3.28f;
                    tempconv = 18;
                    tempconvAdd = 3200;
                    distconv = 5280;
                    temperatureChar = 0xBB;
                    bigDistanceChar = 0x1C;
                    climbChar = 0x1E;
                    velocityChar = 0x19;
                    altitudeChar = 0x66;
                    smallDistanceChar = 0x66;
                    break;
            }
        }


        static float osd_vbat = 11.61f;                   // voltage in milivolt
        static uint16_t osd_battery_remaining = 10;      // 0 to 100 <=> 0 to 1000
        public byte osd_battery_show_percentage = 1;      // use remaining % or used mAh
        static uint8_t osd_battery_pic = 0xb4;         // picture to show battery remaining

        static uint8_t spe = 0;
        static uint8_t high = 0;

        static uint16_t osd_mode = 100;                   // Navigation mode from RC AC2 = CH5, APM = CH8
        static uint8_t osd_nav_mode = 4;               // Navigation mode from RC AC2 = CH5, APM = CH8

        static float osd_lat = -35.020938f;                    // latidude
        static float osd_lon = 117.883419f;                    // longitude
        static uint8_t osd_satellites_visible = 7;     // number of satelites
        static uint8_t osd_fix_type = 3;               // GPS lock 0-1=no fix, 2=2D, 3=3D
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
        static float osd_heading = 0;                // ground course heading from GPS
        static float osd_alt = 200;                    // altitude
        static float osd_groundspeed = 9;            // ground speed
        static float osd_airspeed = 10;            // air speed
        static uint16_t osd_throttle = 100;               // throtle
        static float osd_curr_A = 453;
        static float osd_windspeed = 10;
        static float osd_windspeedz = 2;
        static float osd_climb = 2;
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
        static boolean mavbeat = 1;
        //static float lastMAVBeat = 0;
        //static boolean waitingMAVBeats = 1;
        static uint8_t apm_mav_type = 2;
        //static uint8_t apm_mav_system = 7;
        //static uint8_t apm_mav_component = 0;
        //static boolean enable_mav_request = 0;
        //rssi varables
        //public uint8_t rssi = 0;
        public uint8_t rssipersent = 0;
        public uint8_t rssical = 255;
        public uint8_t rssiraw_on = 0;
        static uint8_t osd_rssi = 2;
        public uint8_t radio_setup_flag = 0;
        public uint8_t ch_toggle = 8; //CH8
        public boolean switch_mode = 0;
        public boolean auto_screen_switch = 1;
        public boolean pal_ntsc = 1; //PAL 1 - NTSC 0
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

        /******* PANELS - DEFINITION *******/

        /* **************************************************************** */
        // Panel  : COG
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panCOG(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();

            osd.printf("%c%c%4i%c", 0x94, 0x95, tr, 0x05);

            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : ODO
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panDistance(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();

            osd.printf("%c%c%4.2f%c", 0x8F, 0x20, tdistance * converth, bigDistanceChar);
            
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : Temperature
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panTemp(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            {
                osd.printf("%5.1f%c", temperature * tempconv + tempconvAdd, temperatureChar);
            }
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : PanCh
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

 //       public int panCh(int first_col, int first_line)
 //       {
 //           osd.setPanel(first_col, first_line);
 //           osd.openPanel();
 //           {
 //               osd.printf("%c%c%5i|%c%c%5i|%c%c%5i|%c%c%5i|%c%c%5i|%c%c%5i|%c%c%5i|%c%c%5i|", 0x43, 0x31, chan1_raw, 0x43, 0x32, chan2_raw, 0x43, 0x33, chan3_raw, 0x43, 0x34, chan4_raw, 0x43, 0x35, chan5_raw, 0x43, 0x36, chan6_raw, 0x43, 0x37, chan7_raw, 0x43, 0x38, chan8_raw);
 //           }
 //           osd.closePanel();
 //           return 0;
 //       }

        /* **************************************************************** */
        // Panel  : efficiency
        // Needs  : X, Y locations
        // Output : 
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panEff(int first_col, int first_line)
        {
        osd.setPanel(first_col, first_line);
        osd.openPanel();
        {
        osd.printf("%c%4.0f%c", 0x16, eff, 0x01);
        }
        osd.closePanel();
         return 0;
        }

 	    /* **************************************************************** */
 	    // Panel  : panRSSI
 	    // Needs  : X, Y locations
 	    // Output : Alt symbol and altitude value in meters from MAVLink
 	    // Size   : 1 x 7Hea  (rows x chars)
  	    // Staus  : done

 	    public int panRSSI(int first_col, int first_line)
        {
 	        osd.setPanel(first_col, first_line);
 	        osd.openPanel();
 	        {
 	            osd.printf("%c%3i%c", 0x09, osd_rssi, 0x25);
 	        }
            osd.closePanel();
 	        return 0;
 	    }

        /* **************************************************************** */
        // Panel  : panCALLSIGN
        // Needs  : X, Y locations
        // Output : Call sign identification
        // Size   : 1 x 6Hea  (rows x chars)
        // Staus  : done

        public int panCALLSIGN(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf("%s", callsign_str);
            osd.closePanel();
            return 0;
        }
 
        /******* PANELS - DEFINITION *******/

        /* **************************************************************** */
        // Panel  : panTune
        // Needs  : X, Y locations
        // Output : Current symbol and altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panTune(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf("%c%2.0f%c|%c%2.0f%c", 0xb0, (alt_error * converth), high, 0xb1, ((aspd_error / 100.0) * converts), spe);           
 //           {
 //               osd.printf("%c%c%2.0f%c|%c%c%2.0f%c|%c%c%4.0i%c|%c%c%4.0i%c|%c%c%3.0f%c|%c%c%3.0f%c|%c%c%4.0f%c", 0x4E, 0x52, (nav_roll), 0xB0, 0x4E, 0x50, (nav_pitch), 0xB0, 0x4E, 0x48, (nav_bearing), 0xB0, 0x54, 0x42, (wp_target_bearing), 0xB0, 0x41, 0x45, (alt_error), 0x8D, 0x58, 0x45, (xtrack_error), 0x6D, 0x41, 0x45, ((aspd_error / 100.0) * converts), 0x88);
 //           }  
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panClimb
        // Needs  : X, Y locations
        // Output : Alt symbol and altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panClimb(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            
            {
                osd.printf("%c%3.0f%c", 0x15, (double)(osd_climb * converth), climbChar);
            }
            osd.closePanel();
            return 0;
        }
        
        /* **************************************************************** */
        // Panel  : pan wind speed
        // Needs  : X, Y locations
        // Output : Velocity value from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panWindSpeed(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            {
                osd.printf("%c%3.0f%c|%c%c%2.0f%c%2.0f%c", 0x1D, (double)(osd_windspeed * convertspeed), velocityChar, 0xA4, 0xA5, (double)(osd_windspeed * convertspeed), velocityChar);
            }
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panOff
        // Needs  : X, Y locations
        // Output : OSD off
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panOff(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            {
               // osd.printf("%c", 0x00);
            }
            osd.closePanel();
            return 0;
        }


        /* **************************************************************** */
        // Panel  : panCur_A
        // Needs  : X, Y locations
        // Output : Current symbol and altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panCur_A(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            {
                osd.printf("%c%5.2f%c%c", 0xBD, (osd_curr_A * .01), 0x0E);
            }
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panAlt
        // Needs  : X, Y locations
        // Output : Alt symbol and altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panAlt(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            //osd.printf("%c%5.0f%c",0x85, (double)(osd_alt - osd_home_alt), 0x8D);
            if (this.osd.mslAltSign)//ArduCopter
                osd.printf("%c%5.0f%c", 0x11, (double)(osd_alt * converth), altitudeChar);
            else
                osd.printf("%5.0f%c", (double)(osd_alt * converth), altitudeChar);

            osd.closePanel();
            return 0;
        }
        /* **************************************************************** */
        // Panel  : panWarning
        // Needs  : X, Y locations
        // Output : Warning panel
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done
         public int panWarn(int first_col, int first_line){
         osd.setPanel(first_col, first_line);
         osd.openPanel();
         osd.printf_P(PSTR("\x20\x4f\x76\x65\x72\x53\x70\x65\x65\x64\x21\x20"));
         osd.closePanel();
         return 0;
         }

        /* **************************************************************** */
        // Panel  : panHomeAlt
        // Needs  : X, Y locations
        // Output : Alt symbol and home altitude value in meters from MAVLink
        // Size   : 1 x 7Hea  (rows x chars)
        // Staus  : done

        public int panHomeAlt(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            //osd.printf("%c%5.0f%c",0x85, (double)(osd_alt - osd_home_alt), 0x8D);
            if (this.osd.homeAltSign)//ArduCopter
                osd.printf("%c%5.0f%c", 0x12, (double)((osd_alt - osd_home_alt) * converth), altitudeChar);
            else
                osd.printf("%5.0f%c", (double)((osd_alt - osd_home_alt) * converth), altitudeChar);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panVel
        // Needs  : X, Y locations
        // Output : Velocity value from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panVel(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            if (this.osd.groundSpeedSign)//ArduCopter
                osd.printf("%c%3.0f%c", 0x14, (double)(osd_groundspeed * convertspeed), velocityChar);
            else
                osd.printf("%3.0f%c", (double)(osd_groundspeed * convertspeed), velocityChar);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panAirSpeed
        // Needs  : X, Y locations
        // Output : Airspeed value from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panAirSpeed(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            if (this.osd.airSpeedSign)//ArduCopter
                osd.printf("%c%3.0f%c", 0x13, (double)(osd_airspeed * convertspeed), velocityChar);
            else
                osd.printf("%3.0f%c", (double)(osd_airspeed * convertspeed), velocityChar);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panBatteryPercent
        // Needs  : X, Y locations
        // Output : Battery state from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panBatteryPercent(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            if (Convert.ToBoolean(osd_battery_show_percentage))
            {
                osd.printf("%c%3.0i%c", 0x17, osd_battery_remaining, 0x25);
            }
            else
            {
                osd.printf("%c%4.0i%c", 0x17, osd_battery_remaining, 0x01);
            }
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panTime
        // Needs  : X, Y locations
        // Output : Time from start with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panTime(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf("%3i%c%02i", ((int)start_Time / 60), 0x3A, (int)start_Time % 60);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panThr
        // Needs  : X, Y locations
        // Output : Throttle value from MAVlink with symbols
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panThr(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf("%c%3.0i%c", 0x02, osd_throttle, 0x25);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panHomeDis
        // Needs  : X, Y locations
        // Output : Home Symbol with distance to home in meters
        // Size   : 1 x 7  (rows x chars)
        // Staus  : done

        public int panHomeDis(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf("%c%5.0f%c", 0x0B, (double)(osd_home_distance * converth), bigDistanceChar);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panCenter
        // Needs  : X, Y locations
        // Output : 2 row croshair symbol created by 2 x 4 chars
        // Size   : 2 x 4  (rows x chars)
        // Staus  : done

//        public int panCenter(int first_col, int first_line)
//        {
//            osd.setPanel(first_col, first_line);
//            osd.openPanel();
//            osd.printf_P(PSTR("\x05\x03\x04\x05|\x15\x13\x14\x15"));
//            osd.closePanel();
//            return 0;
//        }

        /* **************************************************************** */
        // Panel  : panHorizon
        // Needs  : X, Y locations
        // Output : 12 x 4 Horizon line surrounded by 2 cols (left/right rules)
        // Size   : 14 x 4  (rows x chars)
        // Staus  : done

        public int panHorizon(int first_col, int first_line)
        {
            //showHorizon((first_col + 1), first_line);
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|"));
            osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|"));
            osd.printf_P(PSTR("\xc6\xcb\xcb\xcb\xcb\xcb\xcb\xcb\xcb\xcb\xcb\xcb\xcb\xc5|"));
            osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20|"));
            osd.printf_P(PSTR("\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20"));
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panPitch
        // Needs  : X, Y locations
        // Output : -+ value of current Pitch from vehicle with degree symbols and pitch symbol
        // Size   : 1 x 6  (rows x chars)
        // Staus  : done

        public int panPitch(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf("%4i%c%c", osd_pitch, 0x05, 0x07);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panRoll
        // Needs  : X, Y locations
        // Output : -+ value of current Roll from vehicle with degree symbols and roll symbol
        // Size   : 1 x 6  (rows x chars)
        // Staus  : done

        public int panRoll(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf("%4i%c%c", osd_roll, 0x05, 0x06);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panBattery A (Voltage 1)
        // Needs  : X, Y locations
        // Output : Voltage value as in XX.X and symbol of over all battery status
        // Size   : 1 x 8  (rows x chars)
        // Staus  : done

        public int panBatt_A(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            //osd.printf("%c%5.2f%c%c", 0xE2,(double)osd_vbat, 0x8E, osd_battery_pic);
            osd.printf("%c%5.2f%c", 0xBC, (double)osd_vbat, 0x0D);
            osd.closePanel();
            return 0;
        }

        //------------------ Panel: Startup ArduCam OSD LOGO -------------------------------

        public int panLogo(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf_P(PSTR("\x20\x20\x20\x20\xba\xbb\xbc\xbd\xbe|\x20\x20\x20\x20\xca\xcb\xcc\xcd\xce|ArduCam OSD"));
            osd.closePanel();
            return 0;
        }

        //------------------ Panel: Waiting for MAVLink HeartBeats -------------------------------

        public int panWaitMAVBeats(int first_col, int first_line)
        {
            panLogo(10, 5);
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf_P(PSTR("Waiting for|MAVLink heartbeats..."));
            osd.closePanel();
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
            //osd.openPanel();
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
            //osd.closePanel();
            //return 0;
        //}

        /* **************************************************************** */
        // Panel  : panGPSats
        // Needs  : X, Y locations
        // Output : 1 symbol and number of locked satellites
        // Size   : 1 x 5  (rows x chars)
        // Staus  : done

        public int panGPSats(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            //osd.printf("%c%2i", 0x0f, osd_satellites_visible);
            osd.printf("%c%2i", 0x2a, osd_satellites_visible);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panGPS
        // Needs  : X, Y locations
        // Output : two row numeric value of current GPS location with LAT/LON symbols as on first char
        // Size   : 2 x 12  (rows x chars)
        // Staus  : done

        public int panGPS(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf("%c%10.6f%c|%c%10.6f", 0x03, (double)osd_lat, 0x20, 0x04, (double)osd_lon);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panHeading
        // Needs  : X, Y locations
        // Output : Symbols with numeric compass heading value
        // Size   : 1 x 5  (rows x chars)
        // Staus  : not ready

        public int panHeading(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            //osd.printf("%004.0f%c", (double)osd_heading, 0x05);
            osd.printf("%3i%c", (Int16)2, 0x05);
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panRose
        // Needs  : X, Y locations
        // Output : a dynamic compass rose that changes along the heading information
        // Size   : 2 x 13  (rows x chars)
        // Staus  : done

        public int panRose(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            //osd_heading  = osd_yaw;
            //if(osd_yaw < 0) osd_heading = 360 + osd_yaw;
            osd.printf_P(PSTR("\xc3\x80\x81\x80\x82\x80\x81\x80\x87"));
           
            osd.closePanel();
            return 0;
        }


        /* **************************************************************** */
        // Panel  : panBoot
        // Needs  : X, Y locations
        // Output : Booting up text and empty bar after that
        // Size   : 1 x 21  (rows x chars)
        // Staus  : done

        public int panBoot(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf_P(PSTR("Booting up:\xed\xf2\xf2\xf2\xf2\xf2\xf2\xf2\xf3"));
            osd.closePanel();
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
//            osd.openPanel();
//            if (mavbeat == 1)
//            {
//                osd.printf_P(PSTR("\xEA\xEC"));
//                mavbeat = 0;
//            }
//            else
//            {
//                osd.printf_P(PSTR("\xEA\xEB"));
//            }
//          osd.closePanel();
//            return 0;
//        }


        /* **************************************************************** */
        // Panel  : panWPDir
        // Needs  : X, Y locations
        // Output : 2 symbols that are combined as one arrow, shows direction to next waypoint
        // Size   : 1 x 2  (rows x chars)
        // Staus  : not ready

//        public int panWPDir(int first_col, int first_line)
//        {
//            osd.setPanel(first_col, first_line);
//            osd.openPanel();
//            {
//                osd.printf("%c%c",  0xA4, 0xA5);
//            }
//            osd.closePanel();
//            return 0;
//        }

        /* **************************************************************** */
        // Panel  : panWPDis
        // Needs  : X, Y locations
        // Output : W then distance in Km - Distance to next waypoint
        // Size   : 1 x 2  (rows x chars)
        // Staus  : not ready TODO - CHANGE the Waypoint symbol - Now only a W!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        public int panWPDis(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            osd.printf("%c%c%c%2i%c%4.0f%c|%c%c%c%c%c%5.0f%c", 0x57, 0x70, 0x0, wp_number, 0x0, (double)((float)(wp_dist * converth)), smallDistanceChar, 0xa4, 0xa5, 0x20, 0x58, 0x45, (xtrack_error), smallDistanceChar); //Print in Km 
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panHomeDir
        // Needs  : X, Y locations
        // Output : 2 symbols that are combined as one arrow, shows direction to home
        // Size   : 1 x 2  (rows x chars)
        // Status : not tested

        public int panHomeDir(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            showArrow();
            osd.closePanel();
            return 0;
        }

        /* **************************************************************** */
        // Panel  : panFlightMode 
        // Needs  : X, Y locations
        // Output : 2 symbols, one static name symbol and another that changes by flight modes
        // Size   : 1 x 2  (rows x chars)
        // Status : done

        public int panFlightMode(int first_col, int first_line)
        {
            osd.setPanel(first_col, first_line);
            osd.openPanel();
            if (this.osd.modelType == OSD.ModelType.Copter)//ArduCopter
            {
                osd.printf_P(PSTR("\x7Fstab\x86"));//Stabilize
                //if (osd_mode == 100) osd.printf_P(PSTR("\x7Fstab\x86"));//Stabilize
                //if (osd_mode == 101) osd.printf_P(PSTR("\x7Facro\x86"));//Acrobatic
                //if (osd_mode == 102) osd.printf_P(PSTR("\x7Falth\x86"));//Alt Hold
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_AUTO && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_WAYPOINT) osd.printf_P(PSTR("\x7Fauto\x86"));//Auto
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_GUIDED && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_WAYPOINT) osd.printf_P(PSTR("\x7Fguid\x86"));//Guided
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_AUTO && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_HOLD) osd.printf_P(PSTR("\x7Floit\x86"));//Loiter
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_AUTO && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_RETURNING) osd.printf_P(PSTR("\x7Fretl\x86"));//Return to Launch
                //if (osd_mode == 107) osd.printf_P(PSTR("\x7Fcirc\x86")); // Circle
                //if (osd_mode == 108) osd.printf_P(PSTR("\x7Fposi\x86")); // Position
                //if (osd_mode == 109) osd.printf_P(PSTR("\x7Fland\x86")); // Land
                //if (osd_mode == 110) osd.printf_P(PSTR("\x7Foflo\x86")); // OF_Loiter
            }
            else if (this.osd.modelType == OSD.ModelType.Plane) // arduplane
            {
                osd.printf_P(PSTR("manu"));//Stabilize
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_TEST1 && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_VECTOR) osd.printf_P(PSTR("\x7F\xE2"));//Stabilize
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_MANUAL && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_VECTOR) osd.printf_P(PSTR("\x7F\xE3"));//Manual
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_AUTO && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_LOITER) osd.printf_P(PSTR("\x7F\xE4"));//Loiter
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_AUTO && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_RETURNING) osd.printf_P(PSTR("\x7F\xE5"));//Return to Launch
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_TEST2 && osd_nav_mode == 1) osd.printf_P(PSTR("\x7F\xE6"));//FLY_BY_WIRE_A
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_TEST2 && osd_nav_mode == 2) osd.printf_P(PSTR("\x7F\xE7"));//FLY_BY_WIRE_B
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_GUIDED) osd.printf_P(PSTR("\x7F\xE7"));//GUIDED
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_AUTO && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_WAYPOINT) osd.printf_P(PSTR("\x7F\xE7"));//AUTO
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_AUTO && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_RETURNING) osd.printf_P(PSTR("\x7F\xE7"));//RTL
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_AUTO && osd_nav_mode == (byte)ArdupilotMega.MAVLink.MAV_NAV.MAV_NAV_LOITER) osd.printf_P(PSTR("\x7F\xE7"));//LOITER
                //if (osd_mode == (byte)ArdupilotMega.MAVLink.MAV_MODE.MAV_MODE_TEST3) osd.printf_P(PSTR("\x7F\xE7"));//CIRCLE
            }
            //    if(osd_mode == 3 && osd_nav_mode == 4) osd.printf_P(PSTR("\xD0\xD2"));
            osd.closePanel();
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
        public int showHorizon(int start_col, int start_row)
        {

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
        }



        //------------------ Heading and Compass ----------------------------------------

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

        //------------------ Battery Remaining Picture ----------------------------------

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

    }
}