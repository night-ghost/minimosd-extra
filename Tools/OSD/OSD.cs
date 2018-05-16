



using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.IO.Ports;
using System.IO;
using ArdupilotMega;
using System.Xml;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Net;
using System.Diagnostics;
using System.Threading;



namespace OSD {

    using uint32_t = System.UInt32;
    using uint16_t = System.UInt16;
    using uint8_t = System.Byte;
    using int8_t = System.SByte;
    //using boolean = System.Byte;

    public partial class OSD : Form {

        public const int PORT_SPEED = 57600; 
        //*****************************************/		
        public const string VERSION = "r941aDV";

        //max 7456 datasheet pg 10
        //pal  = 16r 30 char
        //ntsc = 13r 30 char
        public const int CHAR_W = 12;
        public const int CHAR_H = 18;

        public const int SCREEN_W = 30;
        public const int SCREEN_H = 16;
        public const int SCREEN_H_NTSC = 13;

        public const int MAVLINK_MAX_PAYLOAD_LEN =255;
        public const int MAVLINK_NUM_CHECKSUM_BYTES =2;
        public const int MAVLINK_STX =254;
        public const int X25_INIT_CRC = 0xffff;

        public const int NUM_PWM_Channels = 8;

        public enum ModelType {
            Plane = 0,
            Copter = 1,
            Unknown = 9
        };

        public struct mavlink_message {
            public uint16_t checksum; /// sent at end of packet
            public uint8_t magic;   /// protocol magic marker
            public uint8_t len;     /// Length of payload
            public uint8_t seq;     /// Sequence of packet
            public uint8_t sysid;   /// ID of message sender system/aircraft
            public uint8_t compid;  /// ID of the message sender component
            public uint8_t msgid;   /// ID of message in payload
            public uint8_t[] payload; // MAVLINK_MAX_PAYLOAD_LEN + MAVLINK_NUM_CHECKSUM_BYTES
        };

        public enum mavlink_parse_state_t {
            MAVLINK_PARSE_STATE_UNINIT=0,
            MAVLINK_PARSE_STATE_IDLE,
            MAVLINK_PARSE_STATE_GOT_STX,
            MAVLINK_PARSE_STATE_GOT_SEQ,
            MAVLINK_PARSE_STATE_GOT_LENGTH,
            MAVLINK_PARSE_STATE_GOT_SYSID,
            MAVLINK_PARSE_STATE_GOT_COMPID,
            MAVLINK_PARSE_STATE_GOT_MSGID,
            MAVLINK_PARSE_STATE_GOT_PAYLOAD,
            MAVLINK_PARSE_STATE_GOT_CRC1,
            MAVLINK_PARSE_STATE_BAD_CRC1
        }; ///< The state machine for the comm parser

        public struct mavlink_status {
            public uint8_t msg_received;               /// Number of received messages
            public uint8_t msg_error;                  /// Number of error messages
            public uint8_t buffer_overrun;             /// Number of buffer overruns
            public uint8_t parse_error;                /// Number of parse errors
            public mavlink_parse_state_t parse_state;  /// Parsing state machine
            public uint8_t packet_idx;                 /// Index in current packet
            public uint8_t current_rx_seq;             /// Sequence number of last packet received
            public uint8_t current_tx_seq;             /// Sequence number of last packet sent
            public uint16_t packet_rx_success_count;   /// Received packets
            public uint16_t packet_rx_drop_count;      /// Number of packet drops
        };

        public mavlink_status status = new mavlink_status() { msg_received = 0, msg_error=0, buffer_overrun = 0, parse_error = 0, parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE, packet_idx = 0, current_rx_seq = 0, current_tx_seq = 0, packet_rx_success_count = 0, packet_rx_drop_count = 0 };

        public mavlink_message rxmsg;

        public const int npanel = 4; // количество панелей 

        /*------------------------------------------------*/
        public int screen_number = 0;

        const Int16 toggle_offset = 2;
        public Size basesize = new Size(OSD.SCREEN_W, SCREEN_H);
        /// <summary>
        /// the un-scaled font render image
        /// </summary>
        public Bitmap screen = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H * CHAR_H);
        /// <summary>
        /// the scaled to size background control
        /// </summary>
        Bitmap image = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H * CHAR_H);
        Graphics gr;

        /// <summary>
        /// Bitmaps of all the chars created from the mcm
        /// </summary>
        Bitmap[] chars;
        /// <summary>
        /// record of what panel is using what squares
        /// </summary>
        public string[][] usedPostion = new string[SCREEN_W][];
        /// <summary>
        /// used to track currently selected panel across calls
        /// </summary>
        public string currentlyselected;
        /// <summary>
        /// used to track current processing panel across calls (because i maintained the original code for panel drawing)
        /// </summary>
        string processingpanel = "";
        /// <summary>
        /// use to draw the red outline box is currentlyselected matchs
        /// </summary>
        bool selectedrectangle = false;
        /// <summary>
        /// use to as a invalidator
        /// </summary>
        bool startup = false;

        /// <summary>
        /// background image
        /// </summary>
        Image bgpicture;
        public osd_screen[] scr = new osd_screen[npanel];


        public SerialPort comPort = new SerialPort();

        Panels pan; // там в основном статика так что работает без создания экземпляра

        int osd_functions_N = 0;

        public int panel_num = 0;

        internal Config conf;

        int print_x; // текущие координаты вывода
        int print_y;

        Boolean fwWasRead = false;
        private bool tlog_run = false;
        public byte[] tlog_data;
        private bool need_stop_tlog=false;

        System.Threading.Thread tlog_thread;
        public System.Threading.Thread com_thread;
        public bool com_run=false;

        bool RSSI_used = false; //  использование дополнительных ног
        bool curr_used = false;
        bool batt1_used = false;
        bool batt2_used = false;

        bool flag_EEPROM_read=false;
        private bool[] mav_blocks = new bool[512]; // 32 for EEPROM and 512 for charset
        bool got_osd_packet=false;

        string CurrentCOM;

        public string[] StringArray = new string[128];

        public OSD osdx;

        private int MAV_packetcount=0;
        volatile object objlock = new object();

        bool fDone=false;
        bool comBusy=false;

        float logOffset;

        public OSD() {

            conf = new Config(this); // конфиг по умолчанию
            osdx=this;

            for (int i = 0; i < npanel; i++) {
                var s = new osd_screen(i, this);
                scr[i] = s;
            }

            rxmsg.payload = new Byte[MAVLINK_MAX_PAYLOAD_LEN + MAVLINK_NUM_CHECKSUM_BYTES];
            
            status.packet_rx_drop_count = 0;
            status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE;
            status.packet_idx = 0;
            status.packet_rx_success_count = 0;
            status.current_rx_seq = 0;
            status.buffer_overrun = 0;
            status.parse_error = 0;


            InitializeComponent();

            //create name of default font
            string fontName = "MinimOSD_" + System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString() + ".mcm";


            // load font

            while (!File.Exists(fontName)) {

                OpenFileDialog ofd = new OpenFileDialog();
                ofd.Filter = "mcm|*.mcm";
                ofd.InitialDirectory = Application.StartupPath;
                ofd.Title = "MCM file " + fontName + " not found! Select MCM file";
                if (ofd.ShowDialog() != System.Windows.Forms.DialogResult.OK) // нечего делать без шрифта
                    return;

                fontName = ofd.FileName;
            }

            chars = mcm.readMCM(fontName);

            lblPresentedCharset.Text = "Presented Charset: " + "MinimOSD_" + System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString() + ".mcm";
            try { // load default bg pic			{
                bgpicture = Image.FromFile(Application.StartupPath + Path.DirectorySeparatorChar + "vlcsnap-2012-01-28-07h46m04s95.png");
            } catch {
            }

            currentlyselected = "";

            print_x = 0;
            print_y = 0;

            screen = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H * CHAR_H);
            gr = Graphics.FromImage(screen);

            pan = new Panels(this);

            // setup all panel options
            setupFunctions(); //setup panel item box
        }

        void changeToPal(bool pal) {
            if (pal) {
                basesize = new Size(SCREEN_W, SCREEN_H);

                screen = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H * CHAR_H);

                image = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H * CHAR_H);

                for (int k = 0; k < npanel; k++) {
                    scr[k].NUM_X.Maximum = SCREEN_W - 1;
                    scr[k].NUM_Y.Maximum = SCREEN_H - 1;
                }

            } else {
                basesize = new Size(SCREEN_W, SCREEN_H_NTSC);

                screen = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H_NTSC * CHAR_H);

                image = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H_NTSC * CHAR_H);
                for (int k = 0; k < npanel; k++) {
                    scr[k].NUM_X.Maximum = SCREEN_W - 1;
                    scr[k].NUM_Y.Maximum = SCREEN_H - 1;
                }
            }


        }

        //Set item boxes
        void setupFunctions() {
            processingpanel = "";


            int a = 0;
            int n;

            for (a = 0; a < usedPostion.Length; a++) {
                usedPostion[a] = new string[SCREEN_H];
            }

            InitPanelControls();


            for (n = 0; n < npanel; n++) { // для всех панелей
                a = 0;
                var pi = scr[n].panelItems;

                // Display name,printfunction,X,Y,ENaddress,Xaddress,Yaddress
                pi[a++] = new Panel("Horizon", pan.panHorizon, 8, 6, panHorizon_XY, 1, UI_Mode.UI_Checkbox_1, 0, "Show HUD frame", 0, "Show ILS", 1, "Show Radar", 0, "  with track", 0, 0, "", (1 << scrFlg_russianHUD), "Russian HUD", (1 << scrFlg_hideHorizon), "Not show Horizon"); // first!

                //pi[a++] = new Panel("Center", pan.panCenter, 13, 8, panCenter_XY);
                pi[a++] = new Panel("Pitch", pan.panPitch, 7, 1, panPitch_XY);
                pi[a++] = new Panel("Roll", pan.panRoll, 13, 1, panRoll_XY);
                pi[a++] = new Panel("Battery A", pan.panBatt_A, 14, 13, panBatt_A_XY, 1, UI_Mode.UI_Filter, 0, "Smooth value",-1,"", 0, "less accurate - only a tenth");
                pi[a++] = new Panel("Battery B", pan.panBatt_B, 14, 12, panBatt_B_XY, 1, UI_Mode.UI_Filter, 0, "Smooth value",-1,"", 0, "less accurate - only a tenth");
                pi[a++] = new Panel("Visible Sats", pan.panGPSats, 26, 11, panGPSats_XY, 1, UI_Mode.UI_Checkbox, 0,"Icon in tail");
                pi[a++] = new Panel("Real heading", pan.panCOG, 22, 15, panCOG_XY, 1);
                pi[a++] = new Panel("GPS Coord", pan.panGPS, 1, 11, panGPS_XY, 1, UI_Mode.UI_Checkbox, 0, "use less precision (5 digits)", 0, "Show only fractional", 0, "Display in row");
                pi[a++] = new Panel("Heading Rose", pan.panRose, 10, 11, panRose_XY, 0, UI_Mode.UI_Checkbox, 0,"Marker below rose", 0, "Even panel length");
                pi[a++] = new Panel("Heading", pan.panHeading, 21, 11, panHeading_XY, 0);
                pi[a++] = new Panel("Home Direction", pan.panHomeDir, 14, 3, panHomeDir_XY, -1, UI_Mode.UI_Checkbox,0,"Show number");
                pi[a++] = new Panel("Home Distance", pan.panHomeDis, 22, 1, panHomeDis_XY, 1, UI_Mode.UI_Checkbox,0,"Reset home on disarm");
                pi[a++] = new Panel("WP Direction", pan.panWPDir, 4, 9, panWPDir_XY);
                pi[a++] = new Panel("WP Distance", pan.panWPDis, 1, 11, panWPDis_XY, 1);

                pi[a++] = new Panel("Altitude", pan.panAlt, 22, 3, panAlt_XY, 1, UI_Mode.UI_Checkbox, 0, "Reset to 0 on arming",0,"Alternate mode");
                pi[a++] = new Panel("Home Altitude", pan.panHomeAlt, 22, 2, panHomeAlt_XY, 1,UI_Mode.UI_Checkbox, 0, "Alternate mode");
                pi[a++] = new Panel("Vertical Speed", pan.panClimb, 1, 8, panClimb_XY, 1, UI_Mode.UI_Filter, 0, "Smooth value", -1, "", 0, "show in m/s",0,"Less accurate");
                
                pi[a++] = new Panel("Battery Percent", pan.panBatteryPercent, 14, 15, panBatteryPercent_XY, 1, UI_Mode.UI_Checkbox, 0, "Show percent, not used mAH");
                pi[a++] = new Panel("Current", pan.panCur_A, 14, 14, panCurrA_XY, 1, UI_Mode.UI_Filter, 0, "Smooth value",-1,"", 0, "less accurate - only a tenth");

                pi[a++] = new Panel("Velocity", pan.panVel, 1, 2, panVel_XY, 1, UI_Mode.UI_Checkbox, 0, "Show in m/s");
                pi[a++] = new Panel("Air Speed", pan.panAirSpeed, 1, 1, panAirSpeed_XY, 1, UI_Mode.UI_Checkbox, 0, "Show in m/s");
                pi[a++] = new Panel("Throttle", pan.panThr, 1, 3, panThr_XY, 1);
                pi[a++] = new Panel("Flight Mode", pan.panFlightMode, 1, 13, panFMod_XY, 1);

                pi[a++] = new Panel("Wind Speed",    pan.panWindSpeed, 24, 7,  panWindSpeed_XY,1, UI_Mode.UI_Checkbox, 0, "Show in m/s",  0, "Point to source");
                pi[a++] = new Panel("Warnings",      pan.panWarn,       9, 4,  panWarn_XY,    -1, UI_Mode.UI_Checkbox, 1, "Enable GeoFence warning");
                pi[a++] = new Panel("Time",          pan.panTime,      23, 4,  panTime_XY,    -1, UI_Mode.UI_Checkbox, 0,"Blinking semicolon");
                pi[a++] = new Panel("RSSI",          pan.panRSSI,       7, 13, panRSSI_XY,     1, UI_Mode.UI_Filter, 0, "Smooth value",-1,"", 0, "Show sign '%'");
                pi[a++] = new Panel("Tune",          pan.panTune,      21, 10, panTune_XY,     1);
                pi[a++] = new Panel("Efficiency",    pan.panEff,        1, 11, panEff_XY,      1, UI_Mode.UI_Checkbox,0,"Show only mAh/km");
                pi[a++] = new Panel("Call Sign",     pan.panCALLSIGN,   1, 12, panCALLSIGN_XY,-1, UI_Mode.UI_Checkbox, 0, "Do not blink");
                pi[a++] = new Panel("Channel Raw",   pan.panCh,        21, 1,  panCh_XY);
                pi[a++] = new Panel("Temperature",   pan.panTemp,       1, 13, panTemp_XY);
                pi[a++] = new Panel("Trip Distance", pan.panDistance,  22, 2,  panDistance_XY, 1);
                pi[a++] = new Panel("Radar Scale",   pan.panRadarScale,23, 9,  panRadarScale_XY, 1, UI_Mode.UI_Checkbox,0,"Arrow relative to home, not north");
                pi[a++] = new Panel("Flight Data",   pan.panFData,      1, 2,  panFdata_XY,   -1, UI_Mode.UI_Checkbox,0,"Coordinates on top" );
                pi[a++] = new Panel("Message",       pan.panMessage,    2, 10, panMessage_XY,  1, UI_Mode.UI_Combo_Time, 0, "Time to show (s)", -1, "Not scroll if not fit" /*,0,"Not show screen number"*/ );
                pi[a++] = new Panel("Sensor 1",      pan.panSenor1,     0, 4,  panSenor1_XY,  -1, UI_Mode.UI_Checkbox, 1, "PWM input");
                pi[a++] = new Panel("Sensor 2",      pan.panSenor2,     0, 5,  panSenor2_XY,  -1, UI_Mode.UI_Checkbox, 1, "PWM input");
                pi[a++] = new Panel("Sensor 3",      pan.panSenor3,     0, 6,  panSenor3_XY,  -1, UI_Mode.UI_Checkbox, 1, "PWM input");
                pi[a++] = new Panel("Sensor 4",      pan.panSenor4,     0, 7,  panSenor4_XY,  -1, UI_Mode.UI_Checkbox, 1, "PWM input");                
                pi[a++] = new Panel("GPS HDOP",      pan.panHdop,       1, 6,  panHdop_XY,     1);
                pi[a++] = new Panel("Channel state", pan.panState,      1, 5,  panState_XY,    1, UI_Mode.UI_Combo_Cb_Strings, 0, "Select channel", -1, "Extended range (800-2200)", str_id: 0, str_count: 5, strings: "Off|Low|Mid|Hi!|On!" );
                pi[a++] = new Panel("Channel Scale", pan.panScale,      1, 5,  panScale_XY,    1, UI_Mode.UI_Combo_Cb,         0, "Select channel",-1, "Extended range (800-2200)");
                pi[a++] = new Panel("Channel Value", pan.panCvlaue,     1, 5,  panCvalue_XY,   1, UI_Mode.UI_Combo,            0, "Select channel");
                pi[a++] = new Panel("Power",         pan.panPower,      1, 5,  panPower_XY,    1);
                pi[a++] = new Panel("Date",          pan.panDate,       7, 1,  fDate_XY,       1, UI_Mode.UI_Checkbox,         0, " Format dd.mm.yyyy");
                pi[a++] = new Panel("Time of day",   pan.panDayTime,   19, 1,  dayTime_XY,     1, UI_Mode.UI_Checkbox,         0, "Blinking", 0, "Show seconds");
                pi[a++] = new Panel("Motors",        pan.panMotor,      7, 4,  fMotor_XY,      1, UI_Mode.UI_Checkbox,         0, "Absolute PWM values");
                pi[a++] = new Panel("Vibrations",    pan.panVibe,       5, 5,  fVibe_XY,       1, UI_Mode.UI_Checkbox,         0);
                pi[a++] = new Panel("Variometer",    pan.panVario,     22, 4,  fVario_XY,      0, UI_Mode.UI_Checkbox_1,       0, "Scale at right", 0, "*10, scale 50 instead of 5", 0, "*2, scale 10/100", 0, "*4 -> 20/40/200/400", 0, 0, "", (1 << scrFlg_Vario_MS), "m/s instead of m/m");
                pi[a++] = new Panel("GPS Coord Lat", pan.panGPS_lat,    1, 11, panGPSLAT_XY,   1, UI_Mode.UI_Checkbox,         0, "use less precision (5 digits)", 0, "Show only fractional");
                pi[a++] = new Panel("GPS Coord Lon", pan.panGPS_lon,    1, 12, panGPSLON_XY,   1, UI_Mode.UI_Checkbox,         0, "use less precision (5 digits)", 0, "Show only fractional");
                pi[a++] = new Panel("ADSB",          pan.panADSB,       1, 11, panADSB_XY,     1, UI_Mode.UI_Checkbox,         0);

               
                osd_functions_N = a;
                //make backup in case EEPROM needs reset to default
                scr[n].panelItems_default = pi;

                System.Windows.Forms.TreeView li = scr[n].LIST_items;

                //Fill List of items in tabe number 1
                scr[n].LIST_items.Nodes.Clear();
                startup = true;
                foreach (var thing in pi) {
                    if (thing != null) {
                        TreeNode tn = li.Nodes.Add(thing.name, thing.name);
                        tn.Tag = thing; // зачем каждый раз искать по имени?
                        // thing.node =tn; // перекрестные связи рулят - но только при однозначном соответствии

                        if (n == 3) {
                            if (thing.name == "Channel Raw") {
                                tn.Checked = true;
                            } else if (thing.name == "Flight Data") {
                                tn.Checked = true;
                            } else if (thing.name == "Temperature") {
                                tn.Checked = true;
                            } else if (thing.name == "Tune") {
                                tn.Checked = true;
                            } else {
                                tn.Checked = false;
                            }

                        } else { // для всех остальных
                            if (thing.name == "Center") {
                                tn.Checked = false;
                            } else if (thing.name == "Tune") {
                                tn.Checked = false;
                            } else if (thing.name == "WP Distance") {
                                tn.Checked = false;
                            } else if (thing.name == "Temperature") {
                                tn.Checked = false;
                            } else if (thing.name == "Trip Distance") {
                                tn.Checked = false;
                            } else if (thing.name == "Channel Raw") {
                                tn.Checked = false;
                            } else if (thing.name == "GPS2") {
                                tn.Checked = false;
                            } else if (thing.name == "Flight Data") {
                                tn.Checked = false;
                            } else if (thing.name == "Sensor 1") {
                                tn.Checked = false;
                            } else if (thing.name == "Sensor 2") {
                                tn.Checked = false;
                            } else if (thing.name == "Sensor 3") {
                                tn.Checked = false;
                            } else if (thing.name == "Sensor 4") {
                                tn.Checked = false;
                            } else if (thing.name == "Radar Scale") {
                                tn.Checked = false;
                            } else if (thing.name == "Channel state") {
                                tn.Checked = false;
                            } else if (thing.name == "Channel Scale") {
                                tn.Checked = false;
                            } else if (thing.name == "Channel Value") {
                                tn.Checked = false;
                            } else if (thing.name == "Motors") {
                                tn.Checked = false;
                            } else if (thing.name == "Vibrations") {
                                tn.Checked = false;
                            } else if (thing.name == "Variometer") {
                                tn.Checked = false;
                            } else if (thing.name == "GPS Coord Lat") {
                                tn.Checked = false;
                            } else if (thing.name == "GPS Coord Lon") {
                                tn.Checked = false;
                            } else if (thing.name == "ADSB") {
                                tn.Checked = false;                            
                            } else {
                                tn.Checked = true;
                            }
                        }
                    }

                }
                li.CheckBoxes = true;
                li.Sort();


                startup = false;
            }	// цикл по экранам

            loadDefaultOsd();

            for (n = 0; n < npanel; n++) { // для всех панелей
                Draw(n);
            }

        }

        void InitPanelControls(){
            //Setup configuration panel
            STALL_numeric.Value = pan.stall;
            RSSI_numeric_min.Value = pan.rssipersent;
            RSSI_numeric_max.Value = pan.rssical;
            RSSI_RAW.Checked = Convert.ToBoolean(pan.rssiraw_on % 2);
            cbxRSSIChannel.SelectedIndex = rssi_decode((int)(pan.rssiraw_on));

            OVERSPEED_numeric.Value = pan.overspeed;

            if (cbxModelType.Items.Count == 0)
                cbxModelType.DataSource = Enum.GetValues(typeof(ModelType));
            cbxModelType.SelectedItem = (ModelType)pan.model_type;

            //			cbxAirSpeedSign.Checked = (pan.sign_air_speed!=0);
            //			cbxGroundSpeedSign.Checked = (pan.sign_ground_speed!=0);
            //			cbxHomeAltitudeSign.Checked = (pan.sign_home_altitude!=0);
            //			cbxMslAltitudeSign.Checked = (pan.sign_msl_altitude!=0);

            //            if (cbxWarningsAutoPanelSwitch.Items.Count == 0)
            //                cbxWarningsAutoPanelSwitch.DataSource = Enum.GetValues(typeof(PanelsAutoSwitch));
            //            cbxWarningsAutoPanelSwitch.SelectedItem = (PanelsAutoSwitch)(pan.auto_screen_switch);

            if (!pan.converts) {
                UNITS_combo.SelectedIndex = 0; //metric
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                OVERSPEED_label.Text = "Overspeed (km/h)";
            } else {
                UNITS_combo.SelectedIndex = 1; //imperial
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                OVERSPEED_label.Text = "Overspeed (mph)";
            }

            MINVOLT_numeric.Value = Convert.ToDecimal(pan.battv) / Convert.ToDecimal(10.0);

            if (pan.ch_toggle >= toggle_offset && pan.ch_toggle < NUM_PWM_Channels + 1)
                ONOFF_combo.SelectedIndex = pan.ch_toggle - toggle_offset;
            /*
             0 -> 2 = disabled
             1 -> 3 = Ext PWM
             2 -> 4 = mode
             3 -> 5 = Ch N
             4...
             */
            else
                ONOFF_combo.SelectedIndex = 0; //reject garbage from the read file

            CHK_pal.Checked = Convert.ToBoolean(pan.pal_ntsc);
            CHK_auto.Checked = Convert.ToBoolean(pan.mode_auto);

            //            chkHUD.Checked = Convert.ToBoolean(pan.flgHUD);
         //   chkTrack.Checked = Convert.ToBoolean(pan.flgTrack);

            BATT_WARNnumeric.Value = pan.batt_warn_level;
            RSSI_WARNnumeric.Value = pan.rssi_warn_level;

            CALLSIGNmaskedText.Text = pan.callsign_str;

            BRIGHTNESScomboBox.SelectedIndex = pan.osd_brightness;

            this.CHK_pal_CheckedChanged(EventArgs.Empty, EventArgs.Empty);
            this.pALToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);
            this.nTSCToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);

            CMB_ComPort.Text = "COM5";
            // new!
            numMinVoltB.Text = (pan.battBv / 10.0).ToString();
            txtRSSI_k.Text = pan.rssi_koef.ToString();
            txtCurr_k.Text = pan.Curr_koef.ToString();
            txtBattA_k.Text = pan.battA_koef.ToString();
            txtBattB_k.Text = pan.battB_koef.ToString();
            txtRollPal.Text = pan.roll_k.ToString();
            txtPitchPal.Text = pan.pitch_k.ToString();
            txtRollNtsc.Text = pan.roll_k_ntsc.ToString();
            txtPitchNtsc.Text = pan.pitch_k_ntsc.ToString();


            cbBattA_source.SelectedIndex = pan.flgBattA ? 1 : 0;
            cbBattB_source.SelectedIndex = pan.flgBattB ? 1 : 0;

            cbCurrentSoure.SelectedIndex = pan.flgCurrent ? 1 : 0;

            chkByTime.Checked = pan.flgTimedSwitch;
            chkFlightResults.Checked=true;
            chkRefrence.Checked =false;

        }

        public string[] GetPortNames() {
            string[] devs = new string[0];

            if (Directory.Exists("/dev/"))
                devs = Directory.GetFiles("/dev/", "*ACM*");

            string[] ports = SerialPort.GetPortNames();

            string[] all = new string[devs.Length + ports.Length];

            devs.CopyTo(all, 0);
            ports.CopyTo(all, devs.Length);

            return all;
        }


        public void setPanel(int x, int y) {
            print_x = x * CHAR_W;
            print_y = y * CHAR_H;

            print_col = 0; // в пределах одного элемента
            print_row = 0;

        }



        public void openSingle(int x, int y) {
            setPanel(x, y);
        }


        public int getCenter() {
            if (CHK_pal.Checked || CHK_auto.Checked)
                return 8;
            return 6;
        }


        // used for printf tracking line and row
        int print_col;
        int print_row;

        public void printf(string format, params object[] args) {
            StringBuilder sb = new StringBuilder();

            try {
                sb = new StringBuilder(AT.MIN.Tools.sprintf(format, args));
            } catch (Exception ex) {
                var x = ex;
            }

            //sprintf(sb, format, __arglist(args));

            //Console.WriteLine(sb.ToString());

            foreach (char ch in sb.ToString().ToCharArray()) {
                write(ch);
            }

        }

        public void write(int ch) {
            write((char)ch);
        }

        public void write(char ch) {
            if (ch == '|') {
                print_col += 1;
                print_row = 0;
                return;
            }
            if(ch==0x20) ch='\0';
            write_raw(ch);
        }

        public void write_raw(int ch) {
            write_raw((char)ch);
        }
        public void write_raw(char ch) {
            try {
                // draw red boxs
                if (selectedrectangle) {
                    gr.DrawRectangle(Pens.Red, (print_x + print_row * CHAR_W) % screen.Width, (print_y + print_col * CHAR_H), CHAR_W, CHAR_H);
                }

                int w1 = (this.print_x / CHAR_W + print_row) % basesize.Width;
                int h1 = (this.print_y / CHAR_H + print_col);

                if (w1 < basesize.Width && h1 < basesize.Height) {
                    // check if this box has bene used
                    if (usedPostion[w1][h1] != null) {
                        //System.Diagnostics.Debug.WriteLine("'" + used[this.x / 12 + r * 12 / 12][this.y / 18 + d * 18 / 18] + "'");
                        gr.DrawImage(chars[ch], (print_x + print_row * CHAR_W) % screen.Width, (print_y + print_col * CHAR_H), CHAR_W, CHAR_H);
                    } else {
                        gr.DrawImage(chars[ch], (print_x + print_row * CHAR_W) % screen.Width, (print_y + print_col * CHAR_H), CHAR_W, CHAR_H);
                    }

                    usedPostion[w1][h1] = processingpanel;
                }
            } catch {
                System.Diagnostics.Debug.WriteLine("printf exception");
            }
            print_row++;
        }

        public void update_used_pins() {

        }


        public bool pal_checked() {
            return CHK_pal.Checked;
        }

        public bool auto_checked() {
            return CHK_auto.Checked;
        }

        public void printf_P(string format, params object[] args) {
            printf(format, args);
        }

        public int getAlt(Panel p){
            return (p.Altf==1?1:0) + (p.Alt2==1?2:0) + (p.Alt3==1?4:0) + (p.Alt4==1?8:0) + (p.Alt5!=0?16:0);
        }

        public bool is_ntsc(){
            return !(CHK_pal.Checked || CHK_auto.Checked);
        }

        public void drawNode(TreeNode tn) {
            Panel thing = (Panel)tn.Tag;

            selectedrectangle = thing.name == currentlyselected;

            processingpanel = thing.name;

            updatePanelStrings(thing.string_id,thing.string_count, thing.strings);// renew before draw

            // ntsc and below the middle line
            if (thing.y >= getCenter() && is_ntsc()) {
                thing.show(thing.x, thing.y - 3, thing.sign, getAlt(thing), thing);
            } else { // pal and no change
                thing.show(thing.x, thing.y, thing.sign, getAlt(thing), thing);
            }
        }

        // draw image and characters overlay
        public void Draw(int k) {
            if (k < 0 || k >= npanel)
                return;

            screen_number = k;
            if (startup)
                return;

            for (int b = 0; b < usedPostion.Length; b++) {
                usedPostion[b] = new string[SCREEN_H];
            }

            System.Windows.Forms.PictureBox pb = scr[k].pictureBox;
            image = new Bitmap(pb.Width, pb.Height);

            float scaleW = pb.Width / (float)screen.Width;
            float scaleH = pb.Height / (float)screen.Height;

            screen = new Bitmap(screen.Width, screen.Height);

            gr = Graphics.FromImage(screen);

            image = new Bitmap(image.Width, image.Height);

            Graphics grfull = Graphics.FromImage(image);

            try {
                grfull.DrawImage(bgpicture, 0, 0, pb.Width, pb.Height);
            } catch {
            }

            //Drawing the grid
            if (checkBox1.Checked) {
                for (int b = 1; b < SCREEN_H; b++) {
                    for (int a = 1; a < SCREEN_W; a++) {
                        grfull.DrawLine(new Pen(Color.Gray, 1), a * CHAR_W * scaleW, 0, a * CHAR_W * scaleW, pb.Height);
                        grfull.DrawLine(new Pen(Color.Gray, 1), 0, b * CHAR_H * scaleH, pb.Width, b * CHAR_H * scaleH);
                    }
                }
            }

            try {
                //pan.setHeadingPatern();
                //pan.setBatteryPic();
            } catch  {
                return;
            }

            /*			
                        List<string> list = new List<string>();

                        foreach(TreeNode tn in scr[k].LIST_items.Nodes) {
                            foreach(TreeNode tn2 in tn.Nodes) {
                                if(tn2.Checked)
                                    list.Add(tn2.Text);
                            }
                            if(tn.Checked)
                                list.Add(tn.Text);
                        }

                        list.Reverse();
			
                        // TODO: use   thing=tn.tag;
                        foreach(string it in list) {
                            foreach(var thing in this.scr[k].panelItems) {
                                selectedrectangle = false;
                                if(thing!=null) {
                                    if(thing.name==it) {
                                        if(thing.name==currentlyselected) {
                                            selectedrectangle = true;
                                        }

                                        processingpanel = thing.name;

                                        // ntsc and below the middle line
                                        if(thing.y >= getCenter() && !(CHK_pal.Checked || CHK_auto.Checked) ) {
                                            thing.show(thing.x, thing.y - 3,thing.sign);
                                        } else { // pal and no change
                                            thing.show(thing.x, thing.y,thing.sign);
                                        }

                                    }
                                }
                            }
                        }
			
            //*/

            foreach (TreeNode tn in scr[k].LIST_items.Nodes) {
                foreach (TreeNode tn2 in tn.Nodes) {
                    if (tn2.Checked)
                        drawNode(tn2);
                }
                if (tn.Checked)
                    drawNode(tn);
            }


            grfull.DrawImage(screen, 0, 0, image.Width, image.Height);

            pb.Image = image;

        }


        string currentVersion = "";

        private void OSD_Load(object sender, EventArgs e) {
            for (int k = 0; k < npanel; k++) {
                PANEL_tabs.Controls.Add(scr[k].tabPage);
                scr[k].init();
                scr[k].last_init();
            }

            cbOutMode.SelectedIndex =0;
            Translate(this);

            BUT_CopyScreen.Visible = false;
            BUT_ClearScreen.Visible = false;
            chkByTime.Checked =false;

            if (cbxModelType.Items.Count == 0)
                cbxModelType.DataSource = Enum.GetValues(typeof(ModelType));
//            if (cbxWarningsAutoPanelSwitch.Items.Count == 0)
//                cbxWarningsAutoPanelSwitch.DataSource = Enum.GetValues(typeof(PanelsAutoSwitch));

            string strVersion = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
            this.Text = this.Text + " " + strVersion + " " + VERSION;
            currentVersion = strVersion + VERSION;

            CMB_ComPort.Items.AddRange(GetPortNames());

            if (CMB_ComPort.Items.Count > 0)
                CMB_ComPort.SelectedIndex = 0;

            xmlconfig(false);

            Draw(screen_number);

            if(System.Diagnostics.Debugger.IsAttached) {
                startListen();
                //btnListen.Visible =true ;
            }

        }





        private void checkedListBox1_ItemCheck(object sender, ItemCheckEventArgs e) {
            // add a delay to this so it runs after the control value has been defined.
            if (this.IsHandleCreated)
                this.BeginInvoke((MethodInvoker)delegate {
                    Draw(screen_number);
                });
        }




        //Write data to MinimOSD EPPROM
        private void BUT_WriteOSD_Click(object sender, EventArgs e) {
            this.BeginInvoke((MethodInvoker)delegate {
                Sub_WriteOSD();
            });
        }

        private string cnv_limit(string s){
            string fmt = convertChars(s);
            try {
                fmt = fmt.Substring(0, Config.OSD_SENSOR_FORMAT_TOTAL);
            } catch {
            }
            return fmt;
        }


        private System.Threading.Thread clear_thread=null ;
        
        private  void clear_thread_proc(){
            System.Threading.Thread.Sleep(10000); 
            
            try {
                this.Invoke((MethodInvoker)delegate {
                    toolStripStatusLabel1.Text = "";
                });

            } catch { };
            clear_thread=null;
        }


        private void start_clear_timeout(){
            if(clear_thread!=null) clear_thread.Abort();

            clear_thread = new System.Threading.Thread(clear_thread_proc);
            clear_thread.Start();
   
            
        }

        private void Sub_WriteOSD() {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            this.toolStripStatusLabel1.Text = "";
            uint16_t wr_start = 0;
            uint16_t wr_length = 0;
            ModelType fwModelType;

            TabPage current = PANEL_tabs.SelectedTab;

            if (current.Text == "Config") {
                //Setup configuration panel
                //It only checks if configuration screen model type matches fw model type if model type already have been read from eeprom
                //(either by pushing the "Read From OSD" or by uploading the fw)
                if (fwWasRead) {
                    fwModelType = (ModelType)conf.eeprom.sets.model_type;

                    if (fwModelType != (ModelType)cbxModelType.SelectedItem) {
                        if (MessageBox.Show("OSD firmware is of type " + fwModelType.ToString() + " and you have selected " + cbxModelType.SelectedText + " model type." + Environment.NewLine +
                            "Are you sure you want to upload this configuration?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) != System.Windows.Forms.DialogResult.Yes)
                            return;
                    }
                }


                // пройтись по всем панелям и проверить, включено ли отображение батареи B
                //если да то pan.battB_used=true
                pan.battB_used = false;
                for (int i = 0; i < npanel; i++) {
                    foreach (var p in scr[i].panelItems) {
                        if ((p != null) && ((p.name == "Battery B")) && p.pos != -1) {
                            var trArray = scr[i].LIST_items.Nodes.Find(p.name, true);
                            pan.battB_used |= trArray[0].Checked;
                        }
                    }
                }

                wr_start = Settings_offset;
                wr_length = Config.Settings_size;

                //				conf.eeprom.flags[sign_air_speed] = pan.sign_air_speed!=0;
                //				conf.eeprom.flags[sign_ground_speed] = pan.sign_ground_speed!=0;
                //				conf.eeprom.flags[sign_home_altitude] = pan.sign_home_altitude!=0;
                //				conf.eeprom.flags[sign_msl_altitude] = pan.sign_msl_altitude!=0;
                fwModelType = (ModelType)cbxModelType.SelectedItem;
                try {
                    conf.eeprom.sets.model_type = (byte)fwModelType;
                } catch (Exception ex) {
                    var x = ex;
                }
                conf.eeprom.flags[converts] = pan.converts;
                //conf.eeprom.sets.auto_screen_switch = pan.auto_screen_switch;

                conf.eeprom.sets.overspeed = pan.overspeed;
                conf.eeprom.sets.stall = pan.stall;
                conf.eeprom.sets.battv = pan.battv;

                conf.eeprom.sets.RSSI_16_high = pan.rssical;
                conf.eeprom.sets.RSSI_16_low = pan.rssipersent;
                conf.eeprom.sets.OSD_RSSI_RAW = pan.rssiraw_on;

                conf.eeprom.sets.ch_toggle = pan.ch_toggle;
                conf.eeprom.sets.switch_mode = pan.switch_mode;

                conf.eeprom.flags[pal_ntsc] = pan.pal_ntsc;
                conf.eeprom.flags[mode_auto] = pan.mode_auto;

                conf.eeprom.sets.OSD_BATT_WARN = pan.batt_warn_level;
         //       conf.eeprom.flags[osd_battery_show_percentage] = pan.osd_battery_show_percentage;
                conf.eeprom.sets.OSD_RSSI_WARN = pan.rssi_warn_level;

                conf.eeprom.sets.OSD_BRIGHTNESS = pan.osd_brightness;
                conf.eeprom.sets.horiz_offs = pan.horiz_offs;
                conf.eeprom.sets.vert_offs = pan.vert_offs;

                conf.eeprom.osd_call_sign = pan.callsign_str;

                conf.eeprom.sets.CHK1_VERSION = VER;
                conf.eeprom.sets.CHK2_VERSION = 0x55 ^ VER;

                /*
                    //// коэффициенты внешних измерений
                    float evBattA_koef; 
                    float evBattB_koef;
                    float eCurrent_koef;
                    float eRSSI_koef;
		
                    // коэффициенты горизонта
                    float horiz_kRoll; //0.010471976 horizon, conversion factor for pitch 
                    float horiz_kPitch; //0.017453293  horizon, conversion factor for roll

                    float horiz_kRoll_a; // коэффициенты горизонта для NTSC
                    float horiz_kPitch_a;
    
                 */
                // new!
                conf.eeprom.sets.battBv = pan.battBv;
                conf.eeprom.sets.eRSSI_koef = pan.rssi_koef;
                conf.eeprom.sets.eCurrent_koef = pan.Curr_koef;
                conf.eeprom.sets.evBattA_koef = pan.battA_koef;
                conf.eeprom.sets.evBattB_koef = pan.battB_koef;
                conf.eeprom.sets.horiz_kRoll = pan.roll_k;
                conf.eeprom.sets.horiz_kPitch = pan.pitch_k;
                conf.eeprom.sets.horiz_kRoll_a = pan.roll_k_ntsc;
                conf.eeprom.sets.horiz_kPitch_a = pan.pitch_k_ntsc;
                conf.eeprom.flags[useExtVbattA] = pan.flgBattA;
                conf.eeprom.flags[useExtVbattB] = pan.flgBattB;
                conf.eeprom.flags[useExtCurr] = pan.flgCurrent;
                conf.eeprom.flags[AutoScreenSwitch] = pan.flgTimedSwitch;
                conf.eeprom.flags[results_on] = chkFlightResults.Checked;
                conf.eeprom.flags[ref_5v] = chkRefrence.Checked;

                //conf.eeprom.flags[flgTrack] = pan.flgTrack;
                //conf.eeprom.flags[flgHUD] = pan.flgHUD;

                conf.eeprom.sets.pwm_src = pan.pwm_src;
                conf.eeprom.sets.pwm_dst = pan.pwm_dst;
                conf.eeprom.sets.pwm_mode = (byte)cbOutMode.SelectedIndex; 
                conf.eeprom.sets.n_screens = pan.n_screens;



                conf.eeprom.format1 = cnv_limit(txtFormat1.Text); 
                conf.eeprom.format2 = cnv_limit(txtFormat2.Text);
                conf.eeprom.format3 = cnv_limit(txtFormat3.Text);
                conf.eeprom.format4 = cnv_limit(txtFormat4.Text);

                conf.eeprom.sensors.sensor_K1 = myConvert(txtFactor1.Text);
                conf.eeprom.sensors.sensor_K2 = myConvert(txtFactor2.Text);
                conf.eeprom.sensors.sensor_K3 = myConvert(txtFactor3.Text);
                conf.eeprom.sensors.sensor_K4 = myConvert(txtFactor4.Text);

                conf.eeprom.sensors.sensor_A1 = myConvert(txtSAdd1.Text);
                conf.eeprom.sensors.sensor_A2 = myConvert(txtSAdd2.Text);
                conf.eeprom.sensors.sensor_A3 = myConvert(txtSAdd3.Text);
                conf.eeprom.sensors.sensor_A4 = myConvert(txtSAdd4.Text);

                conf.eeprom.flags[osd_switch_once] = chkSwitchOnce.Checked;
                conf.eeprom.flags[chkSwitch200] = chkDiap.Checked;
                
                  
                conf.eeprom.sets.autoswitch_times =convertTimes();
                conf.eeprom.sets.timeOffset =  (uint8_t)(20 + timeOffset.Value);

                conf.eeprom.sets.halfThrottleCurrent = (byte)tHalfThrottleCurrent.Value;
                tHalfThrottleCurrent.Value = conf.eeprom.sets.halfThrottleCurrent;

            } else if (screen_number >= 0 && screen_number < npanel) {
                //First Panel 

                wr_start = (uint16_t)(screen_number * OffsetBITpanel);
                wr_length = OffsetBITpanel;

                // все что мы тут делаем это задаем	ПОЛНЫЙ список всех существующих	панелей на всех экранах		

                List<TreeNode> AllNodes = new List<TreeNode>();
                foreach (TreeNode tn in this.scr[this.screen_number].LIST_items.Nodes) {
                    foreach (TreeNode tn2 in tn.Nodes) {
                        AllNodes.Add(tn2);
                    }
                    AllNodes.Add(tn);
                }

                foreach (TreeNode tn in AllNodes) {
                    string str = tn.Text;
                    foreach (var pan in scr[screen_number].panelItems) {
                        if ((pan != null) && ((pan.name == str)) && pan.pos != -1) {
                            TreeNode[] trArray = scr[screen_number].LIST_items.Nodes.Find(str, true);
                            if(pan.string_count!=0)
                                updatePanelStrings(pan.string_id, pan.string_count, pan.strings);// renew before draw
                            conf.setEepromXY(pan, trArray[0].Checked);

                            //Console.WriteLine(str);
                        }
                    }
                    conf.setEepromScrFlags(scr[screen_number].screen_flags);
                }                
                               
            }

            if (wr_length == 0) {
                MessageBox.Show("Zero write length!");
                return;
            }

            int err;
            if (current.Text == "Config") {
                if(MavlinkModeMenuItem.Checked){
                    err = MavWriteEEprom(wr_start, wr_length);
                    if (got_osd_packet) { // OSD confirms receiving so we can check packets
                        toolStripStatusLabel1.Text = "OK sending configuration data!";
                    }else {
                        toolStripStatusLabel1.Text = "Done sending configuration data!";
                    }
                } else {
                    err = conf.writeEEPROM(wr_start, wr_length);
                    if (err > 0)
                        MessageBox.Show("Failed to upload new configuration data");
                    else if (err == 0)
                        toolStripStatusLabel1.Text = "Done writing configuration data!";
                }

            } else if (screen_number >= 0 && screen_number < npanel) {
                string[] tmp = new string[128];
                tmp=conf.eeprom.strings;
                bool writeStrings=false;
                for(int i=0; i<128;i++){
                    if(tmp[i] != StringArray[i])
                        writeStrings=true;
                }

                if(MavlinkModeMenuItem.Checked){
                    comBusy = true;
                    err = MavWriteEEprom(wr_start, wr_length);
                    if(writeStrings) {
                        conf.eeprom.strings = StringArray;
                        err = MavWriteEEprom(Strings_offst, Config.Settings_size);
                    }
                    comBusy = false;
                } else {
                    comBusy = true;
                    err = conf.writeEEPROM(wr_start, wr_length);
                    if(err==0) { // write all strings on each panel change
                        if(writeStrings) {
                            conf.eeprom.strings = StringArray;
                            err = conf.writeEEPROM(Strings_offst, Config.Settings_size);
                        }
                    }
                    comBusy = false;

                    if (err > 0)
                        MessageBox.Show("Failed to upload new Panel data");
                    else if (err == 0) {
                        //MessageBox.Show("Done writing Panel data!");
                        toolStripStatusLabel1.Text = "EEPROM write done";
                    }
                }
            }
            start_clear_timeout();

        }

        private void BUT_ResetOSD_EEPROM_click(object sender, EventArgs e) {
            this.BeginInvoke((MethodInvoker)delegate {
                BUT_ResetOSD_EEPROM();
            });

        }


        //Write data to MinimOSD EPPROM
        private int BUT_ResetOSD_EEPROM() {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            this.toolStripStatusLabel1.Text = "";

            conf.eeprom.clear();

            for (int k = 0; k < npanel; k++) {
                //First Panel 
                screen_number = k;

                List<TreeNode> AllNodes = new List<TreeNode>();
                foreach (TreeNode tn in scr[screen_number].LIST_items.Nodes) {
                    foreach (TreeNode tn2 in tn.Nodes) {
                        AllNodes.Add(tn2);
                    }
                    AllNodes.Add(tn);
                }

                foreach (TreeNode tn in AllNodes) {
                    string str = tn.Text;
                    foreach (var it in scr[screen_number].panelItems_default) {
                        if ((it != null) && ((it.name == str)) && it.pos != -1) {
                            bool en;
                            if (str == "Center")
                                en = false;
                            else if (str == "Tune")
                                en = false;
                            else if (str == "Channel Raw")
                                en = false;
                            else if (str == "GPS2")
                                en = false;
                            else if (str == "Flight Data")
                                en = false;
                            else
                                en = true;

                            conf.setEepromXY(it, en);
                        }
                    }
                }
            }

            //Setup configuration panel
            //			conf.eeprom.flags[sign_air_speed] = pan.sign_air_speed!=0;
            //			conf.eeprom.flags[sign_ground_speed] = pan.sign_ground_speed!=0;
            //			conf.eeprom.flags[sign_home_altitude] = pan.sign_home_altitude!=0;
            //			conf.eeprom.flags[sign_msl_altitude] = pan.sign_msl_altitude!=0;
            conf.eeprom.flags[converts] = pan.converts;

            conf.eeprom.sets.overspeed = pan.overspeed;
            conf.eeprom.sets.stall = pan.stall;
            conf.eeprom.sets.battv = pan.battv;

            conf.eeprom.sets.RSSI_16_high = pan.rssical;
            conf.eeprom.sets.RSSI_16_low = pan.rssipersent;
            conf.eeprom.sets.OSD_RSSI_RAW = pan.rssiraw_on;

            //conf.eeprom.sets.auto_screen_switch = pan.auto_screen_switch;
            conf.eeprom.sets.ch_toggle = pan.ch_toggle;
            conf.eeprom.sets.switch_mode = pan.switch_mode;

            conf.eeprom.flags[pal_ntsc] = pan.pal_ntsc;
            conf.eeprom.flags[mode_auto] = pan.mode_auto;

            conf.eeprom.sets.OSD_BATT_WARN = pan.batt_warn_level;
            //conf.eeprom.flags[osd_battery_show_percentage] = pan.osd_battery_show_percentage;
            conf.eeprom.sets.OSD_RSSI_WARN = pan.rssi_warn_level;

            conf.eeprom.sets.OSD_BRIGHTNESS = pan.osd_brightness;
            conf.eeprom.sets.horiz_offs = pan.horiz_offs;
            conf.eeprom.sets.vert_offs = pan.vert_offs;

            conf.eeprom.sets.CHK1_VERSION = VER;
            conf.eeprom.sets.CHK2_VERSION = 0x55 ^ VER;

            conf.eeprom.osd_call_sign = "12345678";

            /*
                //// коэффициенты внешних измерений
                float evBattA_koef; 
                float evBattB_koef;
                float eCurrent_koef;
                float eRSSI_koef;
		
                // коэффициенты горизонта
                float horiz_kRoll; //0.010471976 horizon, conversion factor for pitch 
                float horiz_kPitch; //0.017453293  horizon, conversion factor for roll

                float horiz_kRoll_a; // коэффициенты горизонта для NTSC
                float horiz_kPitch_a;
    
             * */

            conf.eeprom.sets.evBattA_koef = 1;
            conf.eeprom.sets.evBattB_koef = 1;
            conf.eeprom.sets.eCurrent_koef = 1;
            conf.eeprom.sets.eRSSI_koef = 1;

            // коэффициенты горизонта
            conf.eeprom.sets.horiz_kRoll = 1; //0.010471976 horizon, conversion factor for pitch 
            conf.eeprom.sets.horiz_kPitch = 1; //0.017453293  horizon, conversion factor for roll

            conf.eeprom.sets.horiz_kRoll_a = 1; // коэффициенты горизонта для NTSC
            conf.eeprom.sets.horiz_kPitch_a = 1;

            //conf.eeprom.flags[flgTrack] = pan.flgTrack;
            //.eeprom.flags[flgHUD] = pan.flgHUD;

            conf.eeprom.sets.pwm_src = 0;
            conf.eeprom.sets.pwm_dst = 0;
            conf.eeprom.sets.n_screens = 4;

            conf.eeprom.format1 = txtFormat1.Text; // no conversions!
            conf.eeprom.format2 = txtFormat2.Text;
            conf.eeprom.format3 = txtFormat3.Text;
            conf.eeprom.format4 = txtFormat4.Text;

            conf.eeprom.sensors.sensor_K1 = (float)10;
            conf.eeprom.sensors.sensor_K2 = (float)10;
            conf.eeprom.sensors.sensor_K3 = (float)1;
            conf.eeprom.sensors.sensor_K4 = (float)1;

            conf.eeprom.sensors.sensor_A1 = (float)0;
            conf.eeprom.sensors.sensor_A2 = (float)0;
            conf.eeprom.sensors.sensor_A3 = (float)0;
            conf.eeprom.sensors.sensor_A4 = (float)0;

            conf.eeprom.flags[osd_switch_once] = false;
            conf.eeprom.flags[chkSwitch200] = false;

            conf.eeprom.sets.autoswitch_times = convertTimes();
            conf.eeprom.sets.timeOffset = (uint8_t)(20 + timeOffset.Value);

            conf.eeprom.sets.halfThrottleCurrent = (byte)tHalfThrottleCurrent.Value;
            tHalfThrottleCurrent.Value = conf.eeprom.sets.halfThrottleCurrent;

            int err=0;
            if(MavlinkModeMenuItem.Checked){
                err = MavWriteEEprom(0, Config.EEPROM_SIZE);
                
                if (err < 0) {
                    MessageBox.Show("Failed to send configuration data");
                    return 1;
                } else if (err == 0) {
                    //MessageBox.Show("Done writing configuration data!");
                    toolStripStatusLabel1.Text = "Done sending data!";
                    start_clear_timeout();
                    return 0;
                }
            } else {
                comBusy = true;
                err = conf.writeEEPROM(0, Config.EEPROM_SIZE);
                comBusy = false;
                if (err > 0) {
                    MessageBox.Show("Failed to upload configuration data");
                    return 1;
                } else if (err == 0) {
                    //MessageBox.Show("Done writing configuration data!");
                    toolStripStatusLabel1.Text = "EEPROM write done";
                    start_clear_timeout();
                    return 0;
                }

            }



            return -err;

        }



        private void comboBox1_Click(object sender, EventArgs e) {
            CMB_ComPort.Items.Clear();
            CMB_ComPort.Items.AddRange(GetPortNames());
        }



        private void checkBox1_CheckedChanged(object sender, EventArgs e) {
            Draw(screen_number);
        }

        private void OSD_Resize(object sender, EventArgs e) {

            try {
                Draw(screen_number);

            } catch { }
        }



        private void BUT_ReadOSD_Click(object sender, EventArgs e) {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            this.toolStripStatusLabel1.Text = "";
            comBusy = true;
            bool fail=true;
            if(MavlinkModeMenuItem.Checked){
                fail = MavReadEEprom(0, Config.EEPROM_SIZE) == 0;
            } else {
                fail = conf.readEEPROM(Config.EEPROM_SIZE);
            }
            comBusy = false;

            if (fail)
                return;
            

            if (screen_number>=0)
                scr[screen_number].deselect();

            //Verify EEPROM version
            if (conf.eeprom.sets.CHK1_VERSION != VER) { // no match
                MessageBox.Show("The EEPROM mapping is outdated! An automatic update will start.", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if (BUT_ResetOSD_EEPROM() == 0) //write defaults
                    MessageBox.Show("EEPROM mapping updated!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            //			if(fail) {
            //				MessageBox.Show("Failed to download data!");
            //				return;
            //			} else {
            //				fwWasRead = true;
            //				MessageBox.Show("Done downloading data!");
            //			} 

            StringArray = conf.eeprom.strings; // read strings for panels            


            aTmega644ToolStripMenuItem.Checked = (conf.eeprom.sets.hw_version==1);

            int last_panel_number = screen_number;
            for (int k = 0; k < npanel; k++) {
                screen_number = k; // used globally
                scr[k].fReenter =true;

                scr[screen_number].screen_flags = conf.getEepromScrFlags();

                for (int a = 0; a < scr[k].panelItems.Length; a++) {
                    if (this.scr[k].panelItems[a] != null) {
                        var pi = scr[k].panelItems[a];
                        Pos p = conf.getEepromXY(pi);

                        if (pi.pos >= 0) {
                            TreeNode[] tnArray = this.scr[k].LIST_items.Nodes.Find(pi.name, true);

                            if (tnArray.Length > 0)                            {
                                tnArray[0].Checked = (p.y < 0x80);
                            }

                            if (pi.sign >= 0)
                                pi.sign = (p.x & 0x80) == 0 ? 1 : 0; // inverted

                            switch(pi.ui_mode) {
                            case UI_Mode.UI_Combo:
                            case UI_Mode.UI_Combo_Cb:
                            case UI_Mode.UI_Combo_Cb_Strings:
                            case UI_Mode.UI_Combo_Time:
                                if (pi.Altf >= 0)
                                    pi.Altf = (p.y & 0x40) == 0 ? 0 : 1;
                                pi.Alt2 = (p.y & 0x20) == 0 ? 0 : 1;                            
                                pi.Alt3 = (p.y & 0x10) == 0 ? 0 : 1;                            
                                pi.Alt4 = (p.x & 0x40) == 0 ? 0 : 1;
                                break;
                            case UI_Mode.UI_Checkbox_1:
                                pi.Alt5 = scr[k].screen_flags & pi.Alt5_mask;
                                pi.Alt6 = scr[k].screen_flags & pi.Alt6_mask;
                                goto as_checkbox;
                            case UI_Mode.UI_Checkbox:
as_checkbox:
                                if(pi.Altf >=0)
                                    pi.Altf = (p.y & 0x40) == 0 ? 0 : 1;
                                if (pi.Alt2 >= 0)
                                    pi.Alt2 = (p.y & 0x20) == 0 ? 0 : 1;
                                if (pi.Alt3 >= 0)
                                    pi.Alt3 = (p.y & 0x10) == 0 ? 0 : 1;
                                if (pi.Alt3 >= 0)
                                    pi.Alt4 = (p.x & 0x40) == 0 ? 0 : 1;
                                break;
                            case UI_Mode.UI_Filter:                            
                                if (pi.Altf >= 0)
                                    pi.Altf = (p.y & 0x40) == 0 ? 0 : 1;
                                if (pi.Alt2 >= 0)
                                    pi.Alt2 = (p.y & 0x20) == 0 ? 0 : 1;

                                if (pi.Alt3 >= 0)
                                    pi.Alt3 = (p.y & 0x10) == 0 ? 0 : 1;
                                if (pi.Alt3 >= 0)
                                    pi.Alt4 = (p.x & 0x40) == 0 ? 0 : 1;
                                break;
                            }
                            pi.x = (byte)Constrain(p.x & 0x3f, 0, SCREEN_W);
                            pi.y = (byte)Constrain(p.y & 0x0f, 0, SCREEN_H);

                            if(pi.string_count!=0 ){
                                string s="";
                                int len=0;
                                for(int i=pi.string_id; i<pi.string_id +pi.string_count ; i++){
                                    if(s.Length>0) s+="|";
                                    try {
                                        s += myDecode(StringArray[i]);
                                    }catch{};
                                    try { // no add if null
                                        len +=StringArray[i].Length;
                                    } catch {};
                                }
                                if(len>0) // не заполнять если вообще пусто
                                    pi.strings = s;
                            }
                        }
                    }
                }
                scr[k].fReenter = false;
            }

            try {
                //Setup configuration panel
                pan.model_type = conf.eeprom.sets.model_type;
                pan.fw_version = conf.eeprom.FW_version;

                pan.cs_version = conf.eeprom.CS_version;

                if (pan.fw_version == "0.0.0") {
                    lblFWModelType.Text = "Firmware version of OSD: Unknown or custom";
                } else {
                    lblFWModelType.Text = "Firmware version of OSD: " + pan.fw_version;
                }

                if (pan.cs_version == "0.0.0") {
                    lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: Unknown or custom ";
                } else {
                    try {
                        lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: Charset " + pan.cs_version;
                    } catch { }
                }


                try {
                    cbxModelType.SelectedItem = (ModelType)pan.model_type;
                } catch {
                    cbxModelType.SelectedItem = ModelType.Unknown;
                }
                pan.converts = conf.eeprom.flags[converts];
                //Modify units
                if (!pan.converts) {
                    UNITS_combo.SelectedIndex = 0; //metric
                    STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                    OVERSPEED_label.Text = "Overspeed (km/h)";
                } else {
                    UNITS_combo.SelectedIndex = 1; //imperial
                    STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                    OVERSPEED_label.Text = "Overspeed (mph)";
                }

                try {
                    pan.overspeed = conf.eeprom.sets.overspeed;
                    OVERSPEED_numeric.Value = pan.overspeed;
                } catch {
                    OVERSPEED_numeric.Value = 0;
                }

                try {
                    pan.stall = conf.eeprom.sets.stall;
                    STALL_numeric.Value = pan.stall;
                } catch {
                    STALL_numeric.Value = 0;
                }

                try {
                    pan.battv = conf.eeprom.sets.battv;
                    MINVOLT_numeric.Value = Convert.ToDecimal(pan.battv) / Convert.ToDecimal(10.0);
                } catch {
                    MINVOLT_numeric.Value = 0;
                }

                try {
                    tHalfThrottleCurrent.Value = conf.eeprom.sets.halfThrottleCurrent;                    
                } catch {
                    tHalfThrottleCurrent.Value = 0;
                }

                

                pan.rssical = conf.eeprom.sets.RSSI_16_high;
                //RSSI_numeric_max.Value = pan.rssical;

                pan.rssipersent = conf.eeprom.sets.RSSI_16_low;
                //RSSI_numeric_min.Value = pan.rssipersent;

                pan.rssiraw_on = conf.eeprom.sets.OSD_RSSI_RAW;

                updatingRSSI = true;
                RSSI_numeric_min.Minimum = 0;
                RSSI_numeric_min.Maximum = 4095;
                RSSI_numeric_max.Minimum = 0;
                RSSI_numeric_max.Maximum = 4095;
                RSSI_numeric_min.Value = 0;
                RSSI_numeric_max.Value = 0;
                RSSI_RAW.Checked = Convert.ToBoolean(pan.rssiraw_on % 2);

                if ((int)(pan.rssiraw_on / 2) == 0 || pan.rssiraw_on / 2 == 2) {
                    /*RSSI_numeric_min.Minimum = 0;
                    RSSI_numeric_min.Maximum = 255;
                    RSSI_numeric_max.Minimum = 0;
                    RSSI_numeric_max.Maximum = 255; */

                    //RSSI_numeric_min.Value = pan.rssipersent;
                    //RSSI_numeric_max.Value = pan.rssical;

                } else {
                    /*
                    RSSI_numeric_min.Minimum = 900;
                    RSSI_numeric_min.Maximum = 2000;
                    RSSI_numeric_max.Minimum = 900;
                    RSSI_numeric_max.Maximum = 2000;
                    */
                }

                try {
                    RSSI_numeric_min.Value = pan.rssipersent;
                } catch {
                    RSSI_numeric_min.Value = RSSI_numeric_min.Minimum;
                }
                try {
                    RSSI_numeric_max.Value = pan.rssical;
                } catch {
                    RSSI_numeric_max.Value = RSSI_numeric_max.Maximum;
                }

                cbxRSSIChannel.SelectedIndex = rssi_decode(pan.rssiraw_on);

                updatingRSSI = false;

                pan.ch_toggle = conf.eeprom.sets.ch_toggle;
                try {
                    ONOFF_combo.SelectedIndex = pan.ch_toggle - toggle_offset;
                } catch {
                    ONOFF_combo.SelectedIndex = 0; //reject garbage from EEPROM
                }

                //pan.auto_screen_switch = conf.eeprom.sets.auto_screen_switch;
                //cbxWarningsAutoPanelSwitch.SelectedItem = (PanelsAutoSwitch)pan.auto_screen_switch;

                pan.switch_mode = conf.eeprom.sets.switch_mode;
                TOGGLE_BEH.Checked = pan.switch_mode != 0;

                pan.pal_ntsc = conf.eeprom.flags[pal_ntsc];
                CHK_pal.Checked = pan.pal_ntsc;
                
                pan.mode_auto = conf.eeprom.flags[mode_auto];
                CHK_auto.Checked = pan.mode_auto;

                CHK_ntsc.Checked = !(pan.mode_auto || pan.pal_ntsc);

                //pan.flgTrack = conf.eeprom.flags[flgTrack];
                //pan.flgHUD = conf.eeprom.flags[flgHUD];

                //chkTrack.Checked = pan.flgTrack;
                //chkHUD.Checked = pan.flgHUD;

                try {
                    pan.batt_warn_level = conf.eeprom.sets.OSD_BATT_WARN;
                    BATT_WARNnumeric.Value = pan.batt_warn_level;
                } catch {
                    BATT_WARNnumeric.Value = 0;
                }

               // pan.osd_battery_show_percentage = conf.eeprom.flags[osd_battery_show_percentage];
          //      rbtBatteryPercent.Checked = pan.osd_battery_show_percentage;
//                rbtBatterymAh.Checked = !rbtBatteryPercent.Checked;

                pan.rssi_warn_level = conf.eeprom.sets.OSD_RSSI_WARN;
                try {
                    RSSI_WARNnumeric.Value = pan.rssi_warn_level;
                } catch {
                    RSSI_WARNnumeric.Value = 0;
                }
                pan.osd_brightness = conf.eeprom.sets.OSD_BRIGHTNESS;
                try {
                    BRIGHTNESScomboBox.SelectedIndex = pan.osd_brightness;
                } catch {
                    BRIGHTNESScomboBox.SelectedIndex = 3;
                }

                try {
                    pan.horiz_offs = conf.eeprom.sets.horiz_offs;
                    pan.vert_offs = conf.eeprom.sets.vert_offs;

                    numHOS.Value = pan.horiz_offs - 0x20;
                    numVOS.Value = pan.vert_offs - 0x10;
                } catch {
                    pan.horiz_offs = (byte)numHOS.Value;
                    pan.vert_offs = (byte)numVOS.Value;
                }

                pan.callsign_str = conf.eeprom.osd_call_sign;

                CALLSIGNmaskedText.Text = pan.callsign_str;

                this.pALToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);
                this.nTSCToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);
                this.CHK_pal_CheckedChanged(EventArgs.Empty, EventArgs.Empty);

                /*
                    //// коэффициенты внешних измерений
                    float evBattA_koef; 
                    float evBattB_koef;
                    float eCurrent_koef;
                    float eRSSI_koef;
		
                    // коэффициенты горизонта
                    float horiz_kRoll; //0.010471976 horizon, conversion factor for pitch 
                    float horiz_kPitch; //0.017453293  horizon, conversion factor for roll

                    float horiz_kRoll_a; // коэффициенты горизонта для NTSC
                    float horiz_kPitch_a;
    
                 * */
                // new!
                pan.battBv = conf.eeprom.sets.battBv;
                numMinVoltB.Text = (pan.battBv / 10.0).ToString();

                pan.rssi_koef = conf.eeprom.sets.eRSSI_koef;
                txtRSSI_k.Text = pan.rssi_koef.ToString();

                pan.Curr_koef = conf.eeprom.sets.eCurrent_koef;
                txtCurr_k.Text = pan.Curr_koef.ToString();

                pan.battA_koef = conf.eeprom.sets.evBattA_koef;
                txtBattA_k.Text = pan.battA_koef.ToString();

                pan.battB_koef = conf.eeprom.sets.evBattB_koef;
                txtBattB_k.Text = pan.battB_koef.ToString();

                pan.roll_k = conf.eeprom.sets.horiz_kRoll;
                txtRollPal.Text = pan.roll_k.ToString();

                pan.pitch_k = conf.eeprom.sets.horiz_kPitch;
                txtPitchPal.Text = pan.pitch_k.ToString();

                pan.roll_k_ntsc = conf.eeprom.sets.horiz_kRoll_a;
                txtRollNtsc.Text = pan.roll_k_ntsc.ToString();

                pan.pitch_k_ntsc = conf.eeprom.sets.horiz_kPitch_a;
                txtPitchNtsc.Text = pan.pitch_k_ntsc.ToString();


                pan.flgBattA = conf.eeprom.flags[useExtVbattA];
                cbBattA_source.SelectedIndex = pan.flgBattA ? 1 : 0;

                pan.flgBattB = conf.eeprom.flags[useExtVbattB];
                cbBattB_source.SelectedIndex = pan.flgBattB ? 1 : 0;

                pan.flgCurrent = conf.eeprom.flags[useExtCurr];
                cbCurrentSoure.SelectedIndex = pan.flgCurrent ? 1 : 0;

                pan.flgTimedSwitch = conf.eeprom.flags[AutoScreenSwitch];
                chkByTime.Checked = pan.flgTimedSwitch;

                chkFlightResults.Checked = conf.eeprom.flags[results_on];
                chkRefrence.Checked = conf.eeprom.flags[ref_5v];
                

                pan.pwm_src = conf.eeprom.sets.pwm_src;
                pan.pwm_dst = conf.eeprom.sets.pwm_dst;
                cbOutMode.SelectedIndex = conf.eeprom.sets.pwm_mode;
                chkSwitchOnce.Checked = conf.eeprom.flags[osd_switch_once];
                chkDiap.Checked = conf.eeprom.flags[chkSwitch200];

                updateTimes(conf.eeprom.sets.autoswitch_times);
                timeOffset.Value = conf.eeprom.sets.timeOffset - 20;

            } catch  { }


            try {
                cbOutSource.SelectedIndex = pan.pwm_src;
                cbOutPin.SelectedIndex = pan.pwm_dst;
            } catch  { }

            pan.n_screens = conf.eeprom.sets.n_screens;
            try {
                cbNscreens.SelectedIndex = pan.n_screens ;
            } catch  { }


            if (!float.IsNaN(conf.eeprom.sensors.sensor_K1) && !float.IsNaN(conf.eeprom.sensors.sensor_A1)) {
                txtFactor1.Text = Convert.ToString(conf.eeprom.sensors.sensor_K1);
                txtSAdd1.Text = Convert.ToString(conf.eeprom.sensors.sensor_A1);
                txtFormat1.Text = myDecode(conf.eeprom.format1); // no conversions!
            }

            if (!float.IsNaN(conf.eeprom.sensors.sensor_K1) && !float.IsNaN(conf.eeprom.sensors.sensor_A2)) {
                txtFactor2.Text = Convert.ToString(conf.eeprom.sensors.sensor_K2);
                txtSAdd2.Text = Convert.ToString(conf.eeprom.sensors.sensor_A2);
                txtFormat2.Text = myDecode(conf.eeprom.format2);
            }
            if (!float.IsNaN(conf.eeprom.sensors.sensor_K1) && !float.IsNaN(conf.eeprom.sensors.sensor_A3)) {
                txtFactor3.Text = Convert.ToString(conf.eeprom.sensors.sensor_K3);
                txtSAdd3.Text = Convert.ToString(conf.eeprom.sensors.sensor_A3);
                txtFormat3.Text = myDecode(conf.eeprom.format3);
            }
            if (!float.IsNaN(conf.eeprom.sensors.sensor_K1) && !float.IsNaN(conf.eeprom.sensors.sensor_A4)) {
                txtFactor4.Text = Convert.ToString(conf.eeprom.sensors.sensor_K4);
                txtSAdd4.Text = Convert.ToString(conf.eeprom.sensors.sensor_A4);
                txtFormat4.Text = myDecode(conf.eeprom.format4);
            }


            toolStripStatusLabel1.Text="EEPROM read OK";
            start_clear_timeout();
            Draw(screen_number = last_panel_number);

        }


        byte[] readIntelHEXv2(StreamReader sr) {
            byte[] FLASH = new byte[1024 * 256];

            int optionoffset = 0;
            int total = 0;
            bool hitend = false;

            while (!sr.EndOfStream) {
                toolStripProgressBar1.Value = (int)(((float)sr.BaseStream.Position / (float)sr.BaseStream.Length) * 100);

                string line = sr.ReadLine();

                if (line.StartsWith(":")) {
                    int length = Convert.ToInt32(line.Substring(1, 2), 16);
                    int address = Convert.ToInt32(line.Substring(3, 4), 16);
                    int option = Convert.ToInt32(line.Substring(7, 2), 16);
                    //Console.WriteLine("len {0} add {1} opt {2}", length, address, option);

                    if (option == 0) {
                        string data = line.Substring(9, length * 2);
                        for (int i = 0; i < length; i++) {
                            byte byte1 = Convert.ToByte(data.Substring(i * 2, 2), 16);
                            FLASH[optionoffset + address] = byte1;
                            address++;
                            if ((optionoffset + address) > total)
                                total = optionoffset + address;
                        }
                    } else if (option == 2) {
                        optionoffset = (int)Convert.ToUInt16(line.Substring(9, 4), 16) << 4;
                    } else if (option == 1) {
                        hitend = true;
                    }
                    int checksum = Convert.ToInt32(line.Substring(line.Length - 2, 2), 16);

                    byte checksumact = 0;
                    for (int z = 0; z < ((line.Length - 1 - 2) / 2); z++) { // minus 1 for : then mins 2 for checksum itself 
                        checksumact += Convert.ToByte(line.Substring(z * 2 + 1, 2), 16);
                    }
                    checksumact = (byte)(0x100 - checksumact);

                    if (checksumact != checksum) {
                        MessageBox.Show("The hex file loaded is invalid, please try again.");
                        throw new Exception("Checksum Failed - Invalid Hex");
                    }
                }              
            }

            if (!hitend) {
                MessageBox.Show("The hex file did no contain an end flag. aborting");
                throw new Exception("No end flag in file");
            }

            Array.Resize<byte>(ref FLASH, total);

            return FLASH;
        }

        void sp_Progress(int progress) {
            toolStripStatusLabel1.Text = "Uploading " + progress + " %";
            toolStripProgressBar1.Value = progress;

            statusStrip1.Refresh();
            Application.DoEvents();
        }


        private void CHK_pal_CheckedChanged(object sender, EventArgs e) {
            if (!CHK_auto.Checked) {
                changeToPal(CHK_pal.Checked);

                Draw(screen_number);
            }
        }



        private void pALToolStripMenuItem_CheckStateChanged(object sender, EventArgs e) {
            if (CHK_pal.Checked) {
                CHK_ntsc.Checked = false;
                CHK_auto.Checked = false;
            }
        }

        private void nTSCToolStripMenuItem_CheckStateChanged(object sender, EventArgs e) {
            if (CHK_ntsc.Checked) {
                CHK_pal.Checked = false;
                CHK_auto.Checked = false;
            }
        }

        private void AUTOToolStripMenuItem_CheckStateChanged(object sender, EventArgs e) {

            if (CHK_auto.Checked) {
                changeToPal(true);
                pan.mode_auto = true;
                Draw(screen_number);

                CHK_pal.Checked = false;
                CHK_ntsc.Checked = false;
                CHK_auto.Checked = true;
            } else
                pan.mode_auto = false;


        }

        private void CHK_auto_Click(object sender, EventArgs e) {

            //
            CHK_auto.Checked = true;
        }
        private void CHK_pal_Click(object sender, EventArgs e) {
            pan.pal_ntsc = true;
        }

        private void CHK_ntsc_Click(object sender, EventArgs e) {
            pan.pal_ntsc = false;
        }


        private void saveToFileToolStripMenuItem_Click(object sender, EventArgs e) {
            SaveFileDialog sfd = new SaveFileDialog() { Filter = "*.osd|*.osd" };

            sfd.ShowDialog();

            if (sfd.FileName != "") {
                try {
                    using (StreamWriter sw = new StreamWriter(sfd.OpenFile())) {       //Write                    
                        //Panel 1
                        for (int k = 0; k < npanel; k++) {                            
                            sw.WriteLine("{0}\t{1}\t{2}", "Panel", k, scr[k].screen_flags);
                            foreach (var item in this.scr[k].panelItems) {
                                if (item != null) {
                                    TreeNode[] tnArray = scr[k].LIST_items.Nodes.Find(item.name, true);
                                    if (tnArray.Length > 0)
                                        sw.WriteLine("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}\t{8}\t{9}", item.name, item.x, item.y, tnArray[0].Checked.ToString(), item.sign, item.Altf, item.Alt2, item.Alt3, item.Alt4, item.strings);
                                }
                            }

                        }

                        //Config 
                        sw.WriteLine("{0}", "Configuration");
                        sw.WriteLine("{0}\t{1}", "Model Type", (byte)(ModelType)cbxModelType.SelectedItem); //We're just saving what's in the config screen, not the eeprom model type
                        sw.WriteLine("{0}\t{1}", "Units", UNITS_combo.SelectedIndex);
                        sw.WriteLine("{0}\t{1}", "Overspeed", pan.overspeed);
                        sw.WriteLine("{0}\t{1}", "Stall", pan.stall);
                        sw.WriteLine("{0}\t{1}", "Battery", pan.battv);
                        sw.WriteLine("{0}\t{1}", "RSSI High", pan.rssical);
                        sw.WriteLine("{0}\t{1}", "RSSI Low", pan.rssipersent);
                        sw.WriteLine("{0}\t{1}", "RSSI Enable Raw", pan.rssiraw_on);
                        sw.WriteLine("{0}\t{1}", "Toggle Channel", pan.ch_toggle);
                        sw.WriteLine("{0}\t{1}", "Auto Screen Switch", pan.auto_screen_switch);
                        sw.WriteLine("{0}\t{1}", "Chanel Rotation Switching", pan.switch_mode);
                        sw.WriteLine("{0}\t{1}", "Video Mode", pan.pal_ntsc);
                        sw.WriteLine("{0}\t{1}", "Auto Mode", pan.mode_auto);
                        sw.WriteLine("{0}\t{1}", "Battery Warning Level", pan.batt_warn_level);
                        sw.WriteLine("{0}\t{1}", "RSSI Warning Level", pan.rssi_warn_level);
                        sw.WriteLine("{0}\t{1}", "OSD Brightness", pan.osd_brightness);
                        sw.WriteLine("{0}\t{1}", "Call Sign", CALLSIGNmaskedText.Text);
                        sw.WriteLine("{0}\t{1}", "flgHUD", pan.flgHUD);
                        sw.WriteLine("{0}\t{1}", "flgTrack", pan.flgTrack);
                        //                        sw.WriteLine("{0}\t{1}", "Sign Air Speed", pan.sign_air_speed);
                        //                        sw.WriteLine("{0}\t{1}", "Sign Ground  Speed", pan.sign_ground_speed);
                        //                        sw.WriteLine("{0}\t{1}", "Sign Home Altitude", pan.sign_home_altitude);
                        //                        sw.WriteLine("{0}\t{1}", "Sign MSL Altitude", pan.sign_msl_altitude);

                        /*
                            //// коэффициенты внешних измерений
                            float evBattA_koef; 
                            float evBattB_koef;
                            float eCurrent_koef;
                            float eRSSI_koef;
		
                            // коэффициенты горизонта
                            float horiz_kRoll; //0.010471976 horizon, conversion factor for pitch 
                            float horiz_kPitch; //0.017453293  horizon, conversion factor for roll

                            float horiz_kRoll_a; // коэффициенты горизонта для NTSC
                            float horiz_kPitch_a;
    
                         * */
                        sw.WriteLine("{0}\t{1}", "BattB", pan.battBv);
                        sw.WriteLine("{0}\t{1}", "rssi_k", pan.rssi_koef);
                        sw.WriteLine("{0}\t{1}", "curr_k", pan.Curr_koef);
                        sw.WriteLine("{0}\t{1}", "batt_a_k", pan.battA_koef);
                        sw.WriteLine("{0}\t{1}", "batt_b_k", pan.battB_koef);
                        sw.WriteLine("{0}\t{1}", "roll_k", pan.roll_k);
                        sw.WriteLine("{0}\t{1}", "pitch_k", pan.pitch_k);
                        sw.WriteLine("{0}\t{1}", "roll_kn", pan.roll_k_ntsc);
                        sw.WriteLine("{0}\t{1}", "pitch_kn", pan.pitch_k_ntsc);


                        sw.WriteLine("{0}\t{1}", "fBattA", pan.flgBattA);
                        sw.WriteLine("{0}\t{1}", "fBattB", pan.flgBattB);
                        sw.WriteLine("{0}\t{1}", "fCurr", pan.flgCurrent);

                        sw.WriteLine("{0}\t{1}", "timedSwitch", pan.flgTimedSwitch);                        
                        sw.WriteLine("{0}\t{1}", "HOS", pan.horiz_offs);
                        sw.WriteLine("{0}\t{1}", "VOS", pan.vert_offs);
                        // выходной PWM
                        sw.WriteLine("{0}\t{1}", "PWMSRC", pan.pwm_src);
                        sw.WriteLine("{0}\t{1}", "PWMDST", pan.pwm_dst);
                        sw.WriteLine("{0}\t{1}", "pwm_mode", cbOutMode.SelectedIndex);                        
                        //
                        sw.WriteLine("{0}\t{1}", "NSCREENS", pan.n_screens);

                        sw.WriteLine("{0}\t{1}", "SFormat1", txtFormat1.Text);
                        sw.WriteLine("{0}\t{1}", "SFormat2", txtFormat2.Text);
                        sw.WriteLine("{0}\t{1}", "SFormat3", txtFormat3.Text);
                        sw.WriteLine("{0}\t{1}", "SFormat4", txtFormat4.Text);

                        sw.WriteLine("{0}\t{1}", "SFactor1", txtFactor1.Text);
                        sw.WriteLine("{0}\t{1}", "SFactor2", txtFactor2.Text);
                        sw.WriteLine("{0}\t{1}", "SFactor3", txtFactor3.Text);
                        sw.WriteLine("{0}\t{1}", "SFactor4", txtFactor4.Text);

                        sw.WriteLine("{0}\t{1}", "SAdd1", txtSAdd1.Text);
                        sw.WriteLine("{0}\t{1}", "SAdd2", txtSAdd2.Text);
                        sw.WriteLine("{0}\t{1}", "SAdd3", txtSAdd3.Text);
                        sw.WriteLine("{0}\t{1}", "SAdd4", txtSAdd4.Text);

                        sw.WriteLine("{0}\t{1}", "flgOnce", chkSwitchOnce.Checked);
                        sw.WriteLine("{0}\t{1}", "flg200", chkDiap.Checked);
                        sw.WriteLine("{0}\t{1}", "txtTime0", txtTime0.Text);
                        sw.WriteLine("{0}\t{1}", "txtTime1", txtTime1.Text);
                        sw.WriteLine("{0}\t{1}", "txtTime2", txtTime2.Text);
                        sw.WriteLine("{0}\t{1}", "txtTime3", txtTime3.Text);

                        sw.WriteLine("{0}\t{1}", "fResults", chkFlightResults.Checked);
                        sw.WriteLine("{0}\t{1}", "timeOffset", timeOffset.Value);
                        sw.WriteLine("{0}\t{1}", "ref5v", chkRefrence.Checked );
                        sw.WriteLine("{0}\t{1}", "halfThrottleCurrent", tHalfThrottleCurrent.Value );
                        
                        
                        sw.Close();
                    }
                } catch (Exception ex) {
                    MessageBox.Show("Error writing file: " + ex.Message);
                }
            }
        }

        private Boolean updatingRSSI = false;

        private void loadFromFileToolStripMenuItem_Click(object sender, EventArgs e) {
            OpenFileDialog ofd = new OpenFileDialog() { Filter = "*.osd|*.osd" };
            //const int nosdfunctions = 29;
            ofd.ShowDialog();

            if (ofd.FileName != "") 
                loadOsdFile(ofd.FileName);

            //ofd.OpenFile()
        }

        int parseFlag(string s){
            int f=0;
            if (s != null)
                int.TryParse(s, out f);
            if(f<0) f=0;
            return f;
        }

        void loadOsdFile(string fn) {
            string[] strings = { "" };
            startup=true;
            try {
                using (StreamReader sr = new StreamReader(fn)) {
                    while (!sr.EndOfStream) {
                        //Panel 1
                        //string stringh = sr.ReadLine(); //
                        strings = sr.ReadLine().Split(new char[] { '\t',' ' }, StringSplitOptions.RemoveEmptyEntries);
                        int k = 0;

                        if (strings[0] != "Panel")
                            break;
                        
again:
                        k = int.Parse(strings[1]); // number of panels

                        try {                           
                            scr[k].screen_flags = (uint16_t)int.Parse(strings[2]);
                        } catch{
                            scr[k].screen_flags = 0;
                        }

                        //while (!sr.EndOfStream)
                        for (int i = 0; i < osd_functions_N; i++) {
                            string line=sr.ReadLine();
                            strings = line.Split(new char[] { '\t' }, StringSplitOptions.RemoveEmptyEntries);
                            string[] hdr = line.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                            if (strings[0] == "Panel" ) { // try to load more options      
                                goto again;
                            }else if(hdr[0] == "Panel"){
                                strings=hdr;
                                goto again;
                            }

                            for (int a = 0; a < scr[k].panelItems.Length; a++) {
                                if (this.scr[k].panelItems[a] != null && scr[k].panelItems[a].name == strings[0]) {
                                    var pi = scr[k].panelItems[a];
                                    // incase there is an invalid line number or to shore
                                    try {

                                        //scr[k].fReenter =true;
                                        //scr[k].panelItems[a] = new Panel(pi.name, pi.show, int.Parse(strings[1]), int.Parse(strings[2]), pi.pos);
                                        pi.x = int.Parse(strings[1]);
                                        pi.y = int.Parse(strings[2]);
                                        if (!int.TryParse(strings[4], out pi.sign)) {
                                            pi.sign = 1;
                                        }
                                        // if TryParse fails, default is zero
                                        
                                        if(strings.Length >=6)
                                            pi.Altf = parseFlag(strings[5]);
                                            
                                        if (strings.Length >= 7)
                                            pi.Alt2 = parseFlag(strings[6]);
                                            
                                        if (strings.Length >= 8)
                                            pi.Alt3 = parseFlag(strings[7]);
                                            
                                        if (strings.Length >= 9)
                                            pi.Alt4 = parseFlag(strings[8]);
                                            
                                        if(pi.Alt5_mask!=0){
                                            pi.Alt5 =  scr[k].screen_flags & pi.Alt5_mask;
                                        }
                                        if (pi.Alt6_mask != 0) {
                                            pi.Alt6 = scr[k].screen_flags & pi.Alt6_mask;
                                        }
                                        try {
                                            if(pi.string_count >0){
                                                pi.strings =strings[9];
                                                updatePanelStrings(pi.string_id, pi.string_count, pi.strings );
                                            }
                                        } catch{};
                                        //scr[k].fReenter = false;
                                        TreeNode[] tnArray = scr[k].LIST_items.Nodes.Find(scr[k].panelItems[a].name, true);
                                        if (tnArray.Length > 0)
                                            tnArray[0].Checked = (strings[3] == "True");
                                    } catch (Exception ex) {
                                        MessageBox.Show("Error reading file: " + ex.Message);
                                    }
                                }
                            }
                        }
                    }
                    //                        stringh = sr.ReadLine(); //config
                    while (!sr.EndOfStream) {
                        strings = sr.ReadLine().Split(new char[] { '\t' }, StringSplitOptions.RemoveEmptyEntries);

                        if (strings[0] == "Units")
                            try {                                
                                UNITS_combo.SelectedIndex = byte.Parse(strings[1]) != 0?1:0;
                            } catch {
                                UNITS_combo.SelectedIndex = 0;
                            } 
                        else if (strings[0] == "Overspeed")
                            pan.overspeed = byte.Parse(strings[1]);
                        else if (strings[0] == "Stall") pan.stall = byte.Parse(strings[1]);
                        else if (strings[0] == "Battery") pan.battv = byte.Parse(strings[1]);
                        else if (strings[0] == "RSSI High")
                            pan.rssical = (UInt16)(int.Parse(strings[1]));
                        else if (strings[0] == "RSSI Low")
                            pan.rssipersent = (UInt16)(int.Parse(strings[1]));
                        else if (strings[0] == "RSSI Enable Raw") pan.rssiraw_on = byte.Parse(strings[1]);
                        else if (strings[0] == "Toggle Channel") pan.ch_toggle = byte.Parse(strings[1]);
                        else if (strings[0] == "Auto Screen Switch") pan.auto_screen_switch = byte.Parse(strings[1]);
                        else if (strings[0] == "Chanel Rotation Switching") pan.switch_mode = byte.Parse(strings[1]);
                        else if (strings[0] == "Video Mode")
                            try {
                                pan.pal_ntsc = byte.Parse(strings[1]) != 0;
                            } catch {
                                pan.pal_ntsc = bool.Parse(strings[1]);
                            }
                            //sw.WriteLine("{0}\t{1}", "Auto Mode", pan.mode_auto);
                        else if (strings[0] == "Auto Mode")
                            try {
                                pan.mode_auto = byte.Parse(strings[1]) != 0;
                            } catch {
                                pan.mode_auto = bool.Parse(strings[1]);
                            } else if (strings[0] == "Battery Warning Level") pan.batt_warn_level = byte.Parse(strings[1]);
                        else if (strings[0] == "RSSI Warning Level") pan.rssi_warn_level = byte.Parse(strings[1]);
                        else if (strings[0] == "OSD Brightness") pan.osd_brightness = byte.Parse(strings[1]);
                        else if (strings[0] == "Call Sign") {
                            try {
                                CALLSIGNmaskedText.Text = strings[1];
                            } catch{}
                        }
                        else if (strings[0] == "Model Type") cbxModelType.SelectedItem = (ModelType)(pan.model_type = byte.Parse(strings[1])); //we're not overwriting "eeprom" model type
                        else if (strings[0] == "BattB") pan.battBv = byte.Parse(strings[1]);
                        else if (strings[0] == "rssi_k") pan.rssi_koef = float.Parse(strings[1]);
                        else if (strings[0] == "curr_k") pan.Curr_koef = float.Parse(strings[1]);
                        else if (strings[0] == "batt_a_k") pan.battA_koef = float.Parse(strings[1]);
                        else if (strings[0] == "batt_b_k") pan.battB_koef = float.Parse(strings[1]);
                        else if (strings[0] == "roll_k") pan.roll_k = float.Parse(strings[1]);
                        else if (strings[0] == "pitch_k") pan.pitch_k = float.Parse(strings[1]);
                        else if (strings[0] == "roll_kn") pan.roll_k_ntsc = float.Parse(strings[1]);
                        else if (strings[0] == "pitch_kn") pan.pitch_k_ntsc = float.Parse(strings[1]);
                        else if (strings[0] == "fBattA") pan.flgBattA = bool.Parse(strings[1]);
                        else if (strings[0] == "fBattB") pan.flgBattB = bool.Parse(strings[1]);
                        else if (strings[0] == "fCurr") pan.flgCurrent = bool.Parse(strings[1]);
                        else if (strings[0] == "timedSwitch") pan.flgTimedSwitch = bool.Parse(strings[1]);                        
                        else if (strings[0] == "HOS") pan.horiz_offs = (byte)int.Parse(strings[1]);
                        else if (strings[0] == "VOS") pan.vert_offs = (byte)int.Parse(strings[1]);
                        else if (strings[0] == "PWMSRC") pan.pwm_src = (byte)int.Parse(strings[1]);
                        else if (strings[0] == "PWMDST") pan.pwm_dst = (byte)int.Parse(strings[1]);
                        else if (strings[0] == "NSCREENS") pan.n_screens = (byte)int.Parse(strings[1]);
                        else if (strings[0] == "flgHUD") pan.flgHUD = bool.Parse(strings[1]);
                        else if (strings[0] == "flgTrack") pan.flgTrack = bool.Parse(strings[1]);

                        else if (strings[0] == "SFormat1") txtFormat1.Text = strings[1];
                        else if (strings[0] == "SFormat2") txtFormat2.Text = strings[1];
                        else if (strings[0] == "SFormat3") txtFormat3.Text = strings[1];
                        else if (strings[0] == "SFormat4") txtFormat4.Text = strings[1];

                        else if (strings[0] == "SFactor1") txtFactor1.Text = strings[1];
                        else if (strings[0] == "SFactor2") txtFactor2.Text = strings[1];
                        else if (strings[0] == "SFactor3") txtFactor3.Text = strings[1];
                        else if (strings[0] == "SFactor4") txtFactor4.Text = strings[1];

                        else if (strings[0] == "SAdd1") txtSAdd1.Text = strings[1];
                        else if (strings[0] == "SAdd2") txtSAdd2.Text = strings[1];
                        else if (strings[0] == "SAdd3") txtSAdd3.Text = strings[1];
                        else if (strings[0] == "SAdd4") txtSAdd4.Text = strings[1];

                        else if (strings[0] == "flgOnce") chkSwitchOnce.Checked = bool.Parse(strings[1]);
                        else if (strings[0] == "flg200")  chkDiap.Checked = bool.Parse(strings[1]);

                        else if (strings[0] == "txtTime0") txtTime0.Text = strings[1];
                        else if (strings[0] == "txtTime1") txtTime1.Text = strings[1];
                        else if (strings[0] == "txtTime2") txtTime2.Text = strings[1];
                        else if (strings[0] == "txtTime3") txtTime3.Text = strings[1];
                        else if (strings[0] == "fResults") chkFlightResults.Checked = bool.Parse(strings[1]);
                        else if (strings[0] == "timeOffset") timeOffset.Value = int.Parse(strings[1]);
                        else if (strings[0] == "pwm_mode") cbOutMode.SelectedIndex = int.Parse(strings[1]);
                        else if (strings[0] == "ref5v") chkRefrence.Checked = bool.Parse(strings[1]);
                        else if (strings[0] == "halfThrottleCurrent") tHalfThrottleCurrent.Value = int.Parse(strings[1]);


                    }

                    //pan.model_type = (byte)cbxModelType.SelectedItem;

                    //Modify units
                    if (!pan.converts) {
                        
                        STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                        OVERSPEED_label.Text = "Overspeed (km/h)";
                    } else {
                        
                        STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                        OVERSPEED_label.Text = "Overspeed (mph)";
                    }

                    OVERSPEED_numeric.Value = pan.overspeed;
                    STALL_numeric.Value = pan.stall;
                    MINVOLT_numeric.Value = Convert.ToDecimal(pan.battv) / Convert.ToDecimal(10.0);

                    //RSSI_numeric_max.Value = pan.rssical;
                    //RSSI_numeric_min.Value = pan.rssipersent;

                    updatingRSSI = true;
                    RSSI_numeric_min.Minimum = 0;
                    RSSI_numeric_min.Maximum = 4095;
                    RSSI_numeric_max.Minimum = 0;
                    RSSI_numeric_max.Maximum = 4095;
                    RSSI_numeric_min.Value = 0;
                    RSSI_numeric_max.Value = 0;
                    RSSI_RAW.Checked = Convert.ToBoolean(pan.rssiraw_on % 2);
                    try {
                        RSSI_numeric_min.Value = pan.rssipersent;
                    } catch {
                        RSSI_numeric_min.Value = RSSI_numeric_min.Minimum;
                    }
                    try {
                        RSSI_numeric_max.Value = pan.rssical;
                    } catch {
                        RSSI_numeric_max.Value = RSSI_numeric_max.Minimum;
                    }

                    cbxRSSIChannel.SelectedIndex = rssi_decode(pan.rssiraw_on);

                    if (pan.ch_toggle >= toggle_offset && pan.ch_toggle < NUM_PWM_Channels+1) 
                            ONOFF_combo.SelectedIndex = pan.ch_toggle - toggle_offset;
                    else ONOFF_combo.SelectedIndex = 0; //reject garbage from the red file

                    //cbxWarningsAutoPanelSwitch.SelectedItem = (PanelsAutoSwitch)pan.auto_screen_switch;
                    TOGGLE_BEH.Checked = Convert.ToBoolean(pan.switch_mode);

                    CHK_pal.Checked = Convert.ToBoolean(pan.pal_ntsc);
                    CHK_auto.Checked = Convert.ToBoolean(pan.mode_auto);

                    //chkHUD.Checked = Convert.ToBoolean(pan.flgHUD);
                    //chkTrack.Checked = Convert.ToBoolean(pan.flgTrack);

                    BATT_WARNnumeric.Value = pan.batt_warn_level;
                    RSSI_WARNnumeric.Value = pan.rssi_warn_level;

                    BRIGHTNESScomboBox.SelectedIndex = pan.osd_brightness;

                    try {
                        numHOS.Value = pan.horiz_offs - 0x20;
                        numVOS.Value = pan.vert_offs - 0x10;
                    } catch {
                        pan.horiz_offs = 0;
                        pan.vert_offs = 0;
                    }

                    
                    //                        cbxAirSpeedSign.Checked = pan.sign_air_speed!=0;
                    //                        cbxGroundSpeedSign.Checked = pan.sign_ground_speed!=0;
                    //                        cbxHomeAltitudeSign.Checked = pan.sign_home_altitude!=0 ;
                    //                        cbxMslAltitudeSign.Checked = pan.sign_msl_altitude!=0 ;

                    this.CHK_pal_CheckedChanged(EventArgs.Empty, EventArgs.Empty);
                    this.pALToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);
                    this.nTSCToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);
                    // new!
                    numMinVoltB.Text = (pan.battBv / 10.0).ToString();
                    txtRSSI_k.Text = pan.rssi_koef.ToString();
                    txtCurr_k.Text = pan.Curr_koef.ToString();
                    txtBattA_k.Text = pan.battA_koef.ToString();
                    txtBattB_k.Text = pan.battB_koef.ToString();
                    txtRollPal.Text = pan.roll_k.ToString();
                    txtPitchPal.Text = pan.pitch_k.ToString();
                    txtRollNtsc.Text = pan.roll_k_ntsc.ToString();
                    txtPitchNtsc.Text = pan.pitch_k_ntsc.ToString();


                    cbBattA_source.SelectedIndex = pan.flgBattA ? 1 : 0;
                    cbBattB_source.SelectedIndex = pan.flgBattB ? 1 : 0;
                    cbCurrentSoure.SelectedIndex = pan.flgCurrent ? 1 : 0;

                    chkByTime.Checked = pan.flgTimedSwitch;
                    

                    try {
                        cbOutSource.SelectedIndex = pan.pwm_src;
                        cbOutPin.SelectedIndex = pan.pwm_dst;
                    } catch  { }

                    try {
                        cbNscreens.SelectedIndex = pan.n_screens ;
                    } catch  { }

                }
            } catch (Exception ex) {
                MessageBox.Show("Error Reading file at " + ex.Message + " str=" + strings[0] + " val=" + strings[1]);
            } finally {
                updatingRSSI = false;
            }

            startup = false;
            Draw(screen_number);
        }

        private void loadDefaultsToolStripMenuItem_Click(object sender, EventArgs e) {
            setupFunctions();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e) {
            Application.Exit();
        }



        private void updateFirmwareToolStripMenuItem_Click(object sender, EventArgs e) {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            this.toolStripStatusLabel1.Text = "";
            fDone =true;

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "*.hex|*.hex";
            if (ofd.ShowDialog() == System.Windows.Forms.DialogResult.Cancel)
                return;

            if (ofd.FileName != "") {
                byte[] FLASH;
                bool result = false;
                try {
                    toolStripStatusLabel1.Text = "Reading Hex File";

                    statusStrip1.Refresh();

                    FLASH = readIntelHEXv2(new StreamReader(ofd.FileName));
                } catch {
                    MessageBox.Show("Bad Hex File");
                    toolStripStatusLabel1.Text = "Failed";
                    start_clear_timeout();
                    return;
                }

                int maxsize = (aTmega644ToolStripMenuItem.Checked)? 64512 :30720;

                if(FLASH.Length >= maxsize) {
                    MessageBox.Show("File too big!");
                    toolStripStatusLabel1.Text = "Failed";
                    start_clear_timeout();
                    return;
                }


                //bool fail = false;
                ArduinoSTK sp = OpenArduino();

                toolStripStatusLabel1.Text = "Connecting to Board";

                if (sp != null && sp.connectAP()) {

                    sp.Progress += new ArduinoSTK.ProgressEventHandler(sp_Progress);//////
                    try {
                        for (int i = 0; i < 3; i++) { //try to upload 3 times //try to upload n times if it fail
                            toolStripStatusLabel1.Text = "Witing flash " + i.ToString();
                            Application.DoEvents();
                            sp.Close();

                            sp.Open();
                            sp.connectAP ();
                            result = sp.uploadflash(FLASH, 0, (uint16_t)FLASH.Length, 0);
                            if (!result) {
                                if (sp.keepalive())
                                    Console.WriteLine("keepalive successful (iter " + i + ")");
                                else
                                    Console.WriteLine("keepalive fail (iter " + i + ")");
                            } else {
                                bool fOK=false;
                                toolStripStatusLabel1.Text = "Reading flash ";
                                for(int j=0;j<3;j++) {
                                    sp.Close();

                                    sp.Open(); 
                                    sp.connectAP();
                                    fOK = true;
                                    toolStripStatusLabel1.Text = "Reading flash "+(j>0?" try "+ (j+1).ToString():"");
                                    Application.DoEvents();
                                    byte[] test = sp.downloadflash((uint16_t)FLASH.Length);
                                    
                                    for(int k=0;k<FLASH.Length;k++){
                                        if(test[k]!=FLASH[k]){
                                            fOK=false;
                                            Console.WriteLine ("content mismatch at {0}! {1}!={2} try {3}",k,test[k], FLASH[k], j);
                                            break;
                                        }
                                    }

                                    if(fOK) break; // OK ends loop
                                }

                                if(fOK) 
                                    break; // OK ends tries
                            }
                        }
                        
                    } catch (Exception ex) {

                        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        toolStripStatusLabel1.Text = "Failed";
                        start_clear_timeout();
                        sp.Close();
                        return;
                    }

                } else {
                    MessageBox.Show("Failed to talk to bootloader");
                    toolStripStatusLabel1.Text = "Failed";
                    start_clear_timeout();
                    return;
                }

                try {
                    sp.Close();
                } catch{}

                
                if (result) {
                    // TODO: update pan.fw_version = conf.eeprom.FW_version ;
                    //		pan.cs_version = conf.eeprom.CS_version;

                    toolStripStatusLabel1.Text = "Done";

                    //MessageBox.Show("Done!");
                } else {
                    MessageBox.Show("Upload failed. Lost sync. Try using Arduino to upload instead",
                                "Error",
                                MessageBoxButtons.OK,
                                MessageBoxIcon.Warning);
                    toolStripStatusLabel1.Text = "Failed";
                    start_clear_timeout();
                    return;
                }
            }

            toolStripStatusLabel1.Text = "Reading EEPOM";
            Application.DoEvents();
            //read EEPROM 
            this.BUT_ReadOSD_Click(EventArgs.Empty, EventArgs.Empty);

            toolStripStatusLabel1.Text = "Firmware written successully!";
            start_clear_timeout();
        }

        private Boolean customImage = false;
        private void customBGPictureToolStripMenuItem_Click(object sender, EventArgs e) {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "jpg or bmp|*.jpg;*.bmp";

            ofd.ShowDialog();

            if (ofd.FileName != "") {
                try {
                    bgpicture = Image.FromFile(ofd.FileName);

                } catch { MessageBox.Show("Bad Image"); }
                customImage = true;
                Draw(screen_number);

            }
        }

        private void stop_tlog(){
            need_stop_tlog=true;
            delay(200);
            Application.DoEvents();
            if(tlog_run) {
                try {
                    tlog_thread.Abort();
                } catch{}
            }
            tlog_run = false;
            btnTLog.Text = tlog_run ? "Stop" : "Start";
        }

        private void sendTLogToolStripMenuItem_Click(object sender, EventArgs e) {

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Tlog|*.tlog";

            ofd.ShowDialog();

            if (ofd.FileName == "")
                return;



            BinaryReader br = new BinaryReader(ofd.OpenFile());

            this.toolStripProgressBar1.Style = ProgressBarStyle.Marquee;
            this.toolStripStatusLabel1.Text = "Loading TLOG data...";

            while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed) {
                try {
                    
                    byte[] bytes = br.ReadBytes(20000000); // no more 20MB
  
                    tlog_data = bytes;
                    btnTLog.Enabled = true;

                } catch { break; }

                Application.DoEvents();
            }

            try {
                toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
                //toolStripStatusLabel1.Text = "";
                start_clear_timeout();

                //comPort.Close();
            } catch { }
        }

        private void OSD_FormClosed(object sender, FormClosedEventArgs e) {
            fDone=true;

            if (tlog_run)
                stop_tlog();

            xmlconfig(true);
        }

        //private String arduinoIDEPath = "Arduino";
        //private String planeSketchPath = "ArduCAM_OSD";
        //private String copterSketchPath = "ArduCAM_OSD";
        private bool autoUpdate = false;
        private bool checkForUpdates = true;

        private void xmlconfig(bool write) {
            if (write || !File.Exists(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + @"config.xml")) {
                try {
                    XmlTextWriter xmlwriter = new XmlTextWriter(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + @"config.xml", Encoding.ASCII);
                    xmlwriter.Formatting = Formatting.Indented;

                    xmlwriter.WriteStartDocument();

                    xmlwriter.WriteStartElement("Config");

                    xmlwriter.WriteElementString("comport", CMB_ComPort.Text);

                    xmlwriter.WriteElementString("Pal", CHK_pal.Checked.ToString());
                    xmlwriter.WriteElementString("MAVlink", MavlinkModeMenuItem.Checked.ToString());

                    //xmlwriter.WriteElementString("ArduinoIDEPath", arduinoIDEPath);

                    //xmlwriter.WriteElementString("PlaneSketchPath", planeSketchPath);

                    //xmlwriter.WriteElementString("CopterSketchPath", copterSketchPath);

                    xmlwriter.WriteElementString("AutoUpdate", autoUpdate.ToString());

                    xmlwriter.WriteElementString("CheckForUpdates", checkForUpdates.ToString());

                    xmlwriter.WriteEndElement();

                    xmlwriter.WriteEndDocument();
                    xmlwriter.Close();

                    //appconfig.Save();
                } catch (Exception ex) { MessageBox.Show(ex.ToString()); }
            } else {
                try {
                    using (XmlTextReader xmlreader = new XmlTextReader(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + @"config.xml")) {
                        while (xmlreader.Read()) {
                            xmlreader.MoveToElement();
                            try {
                                switch (xmlreader.Name) {
                                case "comport":
                                    string temp = xmlreader.ReadString();
                                    CMB_ComPort.Text = temp;
                                    break;
                                case "Pal":
                                    //string temp2 = xmlreader.ReadString();
                                    //CHK_pal.Checked = (temp2 == "True");
                                    break;
                                case "MAVlink":
                                    MavlinkModeMenuItem.Checked = (xmlreader.ReadString().ToUpper() == "TRUE");
                                    break;
                       //         case "ArduinoIDEPath":
                       //             arduinoIDEPath = xmlreader.ReadString();
                       //             break;
                      //          case "PlaneSketchPath":
                      //              planeSketchPath = xmlreader.ReadString();
                      //              break;
                      ///          case "CopterSketchPath":
//copterSketchPath = xmlreader.ReadString();
                       //             break;
                                /*
                                case "AutoUpdate":
                                    autoUpdate = (xmlreader.ReadString().ToUpper() == "TRUE");
                                    cbxShowUpdateDialog.Checked = !autoUpdate;
                                    break;
                                case "CheckForUpdates":
                                    checkForUpdates = (xmlreader.ReadString().ToUpper() == "TRUE");
                                    cbxAutoUpdate.Checked = checkForUpdates;
                                    break;
                                 */
                                case "xml":
                                    break;
                                default:
                                    if (xmlreader.Name == "") // line feeds
                                        break;
                                    break;
                                }
                            } catch (Exception ee) { Console.WriteLine(ee.Message); } // silent fail on bad entry
                        }
                    }
                } catch (Exception ex) { Console.WriteLine("Bad Config File: " + ex.ToString()); } // bad config file
            }
        }

        private Boolean IsValidCharsetFile(OpenFileDialog ofd) {
            string errorMessage = "";
            using (var stream = ofd.OpenFile()) {
                StreamReader sr = new StreamReader(stream);
                //Check header
                long lineNumber = 1;
                if (sr.ReadLine() != "MAX7456")
                    errorMessage += "Invalid file header." + Environment.NewLine;

                lineNumber++;
                while (!sr.EndOfStream) {
                    string line = sr.ReadLine();
                    if (line.Length != 8) {
                        errorMessage += "Invalid line length in line:" + lineNumber + Environment.NewLine;
                        break;
                    }
                    foreach (char c in line)
                        if (c != '0' && c != '1') {
                            errorMessage += "Invalid char in line:" + lineNumber + Environment.NewLine;
                            break;
                        }
                    lineNumber++;
                }
                if (string.IsNullOrEmpty(errorMessage) && lineNumber != 16386)
                    errorMessage += "Invalid number of lines: " + lineNumber + Environment.NewLine;
            }
            if (!string.IsNullOrEmpty(errorMessage))
                MessageBox.Show("Invalid Charset File:" + errorMessage, "Invalid Charset File", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            return string.IsNullOrEmpty(errorMessage);
        }

        private void updateFontToolStripMenuItem_Click(object sender, EventArgs e) {
            fDone = true;
            Application.DoEvents();

            this.BeginInvoke((MethodInvoker)delegate {
                sub_updateCharset();
            });
        }

        private string myReadLine(){
            string s="";
            int n=500;
            do {
                while (comPort.BytesToRead != 0) {
                    char c= (char)comPort.ReadByte();
                    if(c=='\n' || (c=='\r' && s.Length !=0)) return s;                    
                    s+=c;
                }
                System.Threading.Thread.Sleep(10);
                Application.DoEvents();
            } while(n-- > 0);
            return s;
        }

        private void sub_updateCharset() {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            toolStripStatusLabel1.Text = "";

            if (tlog_run)
                stop_tlog();

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "mcm|*.mcm";

            DialogResult dialogResp = ofd.ShowDialog();
            if ((dialogResp != System.Windows.Forms.DialogResult.OK) || (ofd.FileName.Trim() == ""))
                return;

            if (!IsValidCharsetFile(ofd))
                return;

            Application.DoEvents();

            if(MavlinkModeMenuItem.Checked){
                MavUploadFont(ofd);
                return;
            }


            //Get file version
            string fileVersion = "000";
            string tempFileName = ofd.SafeFileName.ToUpper();
            if (tempFileName.StartsWith("MINIMOSD_")) {
                tempFileName = tempFileName.Remove(0, 9);
                if (tempFileName.EndsWith(".MCM")) {
                    tempFileName = tempFileName.Remove(tempFileName.Length - 4, 3);
                    string[] versionArray = tempFileName.Split('.');
                    Int16 version1, version2, version3;
                    if (versionArray.Length > 2) {
                        if (Int16.TryParse(versionArray[0], out version1) &&
                           Int16.TryParse(versionArray[1], out version2) &&
                           Int16.TryParse(versionArray[2], out version3))
                            fileVersion = version1.ToString().Substring(0, 1).Trim() + version2.ToString().Substring(0, 1).Trim() + version3.ToString().Substring(0, 1).Trim();
                    }
                }
            }


            Application.DoEvents();

            if (ofd.FileName != "") {
                if (comPort.IsOpen)
                    comPort.Close();

                try {

                    comPort.PortName = CMB_ComPort.Text;
                    comPort.BaudRate = 57600;

                    comPort.Open();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    System.Threading.Thread.Sleep(50);

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(1000);
                    Application.DoEvents();

                    while (comPort.BytesToRead != 0)
                        parseInputData(comPort.ReadExisting());

                    comPort.WriteLine("");
                    comPort.WriteLine("");

again:
                    int timeout = 0;
    
                    while (comPort.BytesToRead == 0) {
                        System.Threading.Thread.Sleep(100);
                        comPort.WriteLine("");
                        Console.WriteLine("Waiting... " + timeout.ToString());
                        timeout++;
                        Application.DoEvents();

                        if (timeout > 60) {
                            MessageBox.Show("Error entering font mode - No Data");
                            comPort.Close();
                            start_clear_timeout();
                            return;
                        }
                    }
                    string readFont = myReadLine();
                    Console.WriteLine("< "+readFont);
                    if(readFont[0]=='#') goto again; // debug comment

                    if (readFont.Length == 0 ) {
                        comPort.WriteLine("");
                        goto again;
                    }

                    if (!readFont.Contains("RFF")) {
                        MessageBox.Show("Error entering CharSet upload mode - invalid data: " + readFont);
                        comPort.Close();
                        start_clear_timeout();
                        return;
                    }

                } catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

                System.Threading.Thread.Sleep(100);
                while (comPort.BytesToRead != 0){ // read out all 
                    string resp = comPort.ReadExisting(); //CDn
                    Console.WriteLine("< " + resp);
                }

                using (var stream = ofd.OpenFile()) {

                    BinaryReader br = new BinaryReader(stream);
                    StreamReader sr2 = new StreamReader(br.BaseStream);

                    string device = sr2.ReadLine();

                    if (device != "MAX7456") {
                        MessageBox.Show("Invalid MCM");
                        comPort.Close();
                        return;
                    }

                    br.BaseStream.Seek(0, SeekOrigin.Begin);

                    toolStripStatusLabel1.Text = "CharSet Uploading";

                    long length = br.BaseStream.Length;
                    byte[] skip = br.ReadBytes(9);
                    length -= 9;
                    while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed) {
                        try {
                            toolStripProgressBar1.Value = (int)((br.BaseStream.Position / (float)br.BaseStream.Length) * 100);


                            int read = 256 * 3;// 163847 / 256 + 1; // 163,847 font file
                            if ((br.BaseStream.Position + read) > br.BaseStream.Length) {
                                read = (int)(br.BaseStream.Length - br.BaseStream.Position);
                            }
                            length -= read;
                            byte[] buffer = br.ReadBytes(read);
                            //Console.WriteLine("write " + buffer.ToString());
                            comPort.Write(buffer,  0, buffer.Length);
                            int timeout = 0;

                            while (comPort.BytesToRead == 0 && read == 768) {
                                System.Threading.Thread.Sleep(10);
                                Application.DoEvents();
                                timeout++;

                                if (timeout > 100) {
                                    MessageBox.Show("CharSet upload failed - no response");
                                    comPort.Close();
                                    start_clear_timeout();
                                    return;
                                }
                            }

                            string resp = comPort.ReadExisting(); //CDn
                            Console.WriteLine("responce "+resp );
                            //parseInputData(resp);
                            //if (length < 1000) {
                            //    lblFWModelType.Text = lblFWModelType.Text;
                            //}

                        } catch {
                            break;
                        }

                        Application.DoEvents();
                    }
                    comPort.WriteLine("\r\n");
                    //Wait for last char acknowledge
                    int t = 0;
                    while (comPort.BytesToRead == 0) {
                        System.Threading.Thread.Sleep(10);
                        Application.DoEvents();
                        t++;

                        if (t > 100) {
                            MessageBox.Show("No end");
                            start_clear_timeout();
                            comPort.Close();
                            return;
                        }
                    }
                    //CparseInputData(comPort.ReadExisting());
                    while (comPort.BytesToRead != 0) {
                        Console.Write((char)comPort.ReadByte());
                    }


                    comPort.WriteLine("\r\n\r\n\r\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
/*
                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    System.Threading.Thread.Sleep(50);
                    Application.DoEvents();

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(50);
                    Application.DoEvents();
*/
 
                    comPort.Close();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    toolStripProgressBar1.Value = 100;
                    toolStripStatusLabel1.Text = "CharSet Done";
                }

                conf.WriteCharsetVersion(fileVersion, false);
                lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: " + ofd.SafeFileName;
                toolStripStatusLabel1.Text = "CharSet Done!!!";
                start_clear_timeout();
            }
        }

        private void STALL_numeric_ValueChanged(object sender, EventArgs e) {
            pan.stall = (byte)STALL_numeric.Value;
        }

        private void RSSI_numeric_min_ValueChanged(object sender, EventArgs e) {
            if (updatingRSSI)
                return;
            
            pan.rssipersent = (UInt16)RSSI_numeric_min.Value;
        }

        private void RSSI_numeric_max_ValueChanged(object sender, EventArgs e) {
            if (updatingRSSI)
                return;
            pan.rssical = (UInt16)RSSI_numeric_max.Value;
        }

        private void OVERSPEED_numeric_ValueChanged(object sender, EventArgs e) {
            pan.overspeed = (byte)OVERSPEED_numeric.Value;
        }

        private void UNITS_combo_SelectedIndexChanged(object sender, EventArgs e) {
            if (UNITS_combo.SelectedIndex == 0) {
                pan.converts = false; //metric
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                OVERSPEED_label.Text = "Overspeed (km/h)";
            } else if (UNITS_combo.SelectedIndex == 1) {
                pan.converts = true; //imperial
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                OVERSPEED_label.Text = "Overspeed (mph)";
            }
            pan.do_converts();

            Draw(screen_number);

        }

        private void MINVOLT_numeric_ValueChanged(object sender, EventArgs e) {
            pan.battv = (byte)(MINVOLT_numeric.Value * 10);
        }

        private void ONOFF_combo_SelectedIndexChanged(object sender, EventArgs e) {
            pan.ch_toggle = (byte)(ONOFF_combo.SelectedIndex + toggle_offset);
            
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e) {

            pan.rssiraw_on = Convert.ToByte(rssi_encode(cbxRSSIChannel.SelectedIndex) + Convert.ToInt32(RSSI_RAW.Checked));
        }

        private void TOGGLE_BEHChanged(object sender, EventArgs e) {
            pan.switch_mode = Convert.ToByte(TOGGLE_BEH.Checked);
        }



        private void RSSI_WARNnumeric_ValueChanged(object sender, EventArgs e) {
            pan.rssi_warn_level = (byte)RSSI_WARNnumeric.Value;
        }

        private void BATT_WARNnumeric_ValueChanged(object sender, EventArgs e) {
            pan.batt_warn_level = (byte)BATT_WARNnumeric.Value;
        }


        private void CALLSIGNmaskedText_Validated(object sender, EventArgs e) {
            pan.callsign_str = CALLSIGNmaskedText.Text;
            //convert to lowercase on validate
            pan.callsign_str = pan.callsign_str.ToLower(new CultureInfo("en-US", false));

            CALLSIGNmaskedText.Text = pan.callsign_str;

            Draw(screen_number);

        }

        private void BRIGHTNESScomboBox_SelectedIndexChanged(object sender, EventArgs e) {
            pan.osd_brightness = (byte)BRIGHTNESScomboBox.SelectedIndex;
        }

        private void gettingStartedToolStripMenuItem_Click(object sender, EventArgs e) {
            try {
                //System.Diagnostics.Process.Start("https://code.google.com/p/arducam-osd/wiki/arducam_osd?tm=6");
                System.Diagnostics.Process.Start("https://github.com/night-ghost/minimosd-extra/blob/master/wiki/Config_Tool.md");
            } catch { MessageBox.Show("Webpage open failed... do you have a virus?"); }
        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e) {
            AboutBox1 about = new AboutBox1();
            about.Show();
        }
/*
        private void rbtBatteryPercent_CheckedChanged(object sender, EventArgs e) {
            pan.osd_battery_show_percentage = Convert.ToByte(rbtBatteryPercent.Checked) != 0;
            //Refresh battery percent presentation

            Draw(panel_number);

        }
*/



        public ModelType modelType = ModelType.Plane;
        private void cbxModelType_SelectedIndexChanged(object sender, EventArgs e) {
            modelType = (ModelType)cbxModelType.SelectedItem;
            pan.model_type = (byte)modelType;

            if (UNITS_combo.SelectedIndex == 0) {
                pan.converts = false; //metric
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS(m/min)/10" : "Stall Speed (km/h)";
                OVERSPEED_label.Text = "Overspeed (km/h)";
            } else if (UNITS_combo.SelectedIndex == 1) {
                pan.converts = true; //imperial
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS(ft/min)/10" : "Stall Speed (mph)";
                OVERSPEED_label.Text = "Overspeed (mph)";
            }

            if (modelType == ModelType.Plane) {
                if (!customImage)
                    try {
                        bgpicture = Image.FromFile(Application.StartupPath + Path.DirectorySeparatorChar + "vlcsnap-2012-01-28-07h46m04s95.png");
                    } catch (Exception ex) {
                        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    };
            } else if (modelType == ModelType.Copter) {
                if (!customImage)
                    try {
                        bgpicture = Image.FromFile(Application.StartupPath + Path.DirectorySeparatorChar + "quad.png");
                    } catch (Exception ex) {
                        //fail = true;
                        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
            }

            Draw(screen_number);

        }

        enum PanelsAutoSwitch {
            Disabled = 3,
            Panel1 = 0,
            Panel2 = 1,
            //PanelOff = 2
        }
/*
        private void cbxWarningsAutoPanelSwitch_SelectedIndexChanged(object sender, EventArgs e) {
            pan.auto_screen_switch = (byte)0; // (PanelsAutoSwitch)cbxWarningsAutoPanelSwitch.SelectedItem;

            //Get panel warnings check status
            Boolean isPanel1WarningChecked = false;
            Boolean isPanel2WarningChecked = false;
            for (int k = 0; k < npanel; k++) {
                //Panel 
                foreach (var item in this.scr[k].panelItems) {
                    if (item != null && item.name == "Warnings") {
                        TreeNode[] tnArray = scr[k].LIST_items.Nodes.Find(item.name, true);
                        isPanel1WarningChecked = tnArray[0].Checked;
                    }
                }
            }

   no more auto-switch 
                        switch ((PanelsAutoSwitch)cbxWarningsAutoPanelSwitch.SelectedItem)
                        {
                            case PanelsAutoSwitch.Panel1:
                                if (!isPanel1WarningChecked)
                                    MessageBox.Show("You have selected to auto switch to panel 1. " + Environment.NewLine + "However you didn't configured warnings on panel 1.", "Panel Auto Switch Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                break;
                            case PanelsAutoSwitch.Panel2:
                                if (!isPanel2WarningChecked)
                                    MessageBox.Show("You have selected to auto switch to panel 2. " + Environment.NewLine + "However you didn't configured warnings on panel 2.", "Panel Auto Switch Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                break;
                        }
            

        }
*/

        private void cbxRSSIChannel_SelectedIndexChanged(object sender, EventArgs e) {
            SetRSSIValues();
        }

        private void SetRSSIValues() {
            //updatingRSSI = true;
            if (updatingRSSI) return;

            int OldMax = (int)RSSI_numeric_min.Maximum;
            RSSI_numeric_min.Minimum = 0;
            RSSI_numeric_min.Maximum = 4095;
            RSSI_numeric_max.Minimum = 0;
            RSSI_numeric_max.Maximum = 4095;
            if (cbxRSSIChannel.SelectedIndex == 0 || cbxRSSIChannel.SelectedIndex == 2) { // analog 
                lblRSSIMin.Text = "Min Value";
                lblRSSIMax.Text = "Max Value";
                /*
                RSSI_numeric_min.Minimum = 0;
                RSSI_numeric_min.Value=0;
                RSSI_numeric_min.Maximum = 2047;
                RSSI_numeric_max.Minimum = 0;
                RSSI_numeric_max.Value=0;
                RSSI_numeric_max.Maximum = 2047;

                if (OldMax == 2000)  {
                    //RSSI_numeric_min.Value = (pan.rssipersent * 10 - 1000) * 255 / 1000;
                    //RSSI_numeric_max.Value = (pan.rssical * 10 - 1000) * 255 / 1000;
                    try {
                        RSSI_numeric_min.Value = (pan.rssipersent * 10 - 900) * 255 / 1100;
                        RSSI_numeric_max.Value = (pan.rssical * 10 - 900) * 255 / 1100;
                    } catch{}
                    //pan.rssipersent = (byte)((pan.rssipersent - 100) * 255 / 100);
                    //pan.rssical = (byte)((pan.rssical - 100) * 255 / 100);
                }
                */
            } else { // PWM 
                lblRSSIMin.Text = "Min Val(pwm)";
                lblRSSIMax.Text = "Max Val(pwm)";

                /*RSSI_numeric_min.Maximum = 2000;
                RSSI_numeric_min.Value = 2000;
                RSSI_numeric_min.Minimum = 900;
                RSSI_numeric_max.Maximum = 2000;
                RSSI_numeric_max.Value = 2000;
                RSSI_numeric_max.Minimum = 900;

                if (OldMax == 255) {
                    //RSSI_numeric_min.Value = pan.rssipersent * 100 / 255 + 100;
                    //RSSI_numeric_max.Value = pan.rssical * 100 / 255 + 100;
                    try {
                        RSSI_numeric_min.Value = (pan.rssipersent * 1100 / 255) + 900;
                        RSSI_numeric_max.Value = (pan.rssical * 1100 / 255) + 900;
                    } catch {}
                    //pan.rssipersent = (byte)(pan.rssipersent * 100 / 255 + 100);
                    //pan.rssical = (byte)(pan.rssical * 100 / 255 + 100);
                }
                */
            }

            RSSI_used = (cbxRSSIChannel.SelectedIndex == 2 || cbxRSSIChannel.SelectedIndex == 3);

            update_used_pins();

            pan.rssiraw_on = Convert.ToByte(rssi_encode(cbxRSSIChannel.SelectedIndex) + Convert.ToInt32(RSSI_RAW.Checked));
        }

        private int rssi_decode(int v) {
            v /= 2; // turn off RAW flag

            switch (v) {
            case 0:
                return 0;//  MAvlink
            case 4:
                return 1; // channel 8
            case 1:
                return 2; // pin analog
            case 2:
                return 3; // pin PWM
            case 3:
                return 4;  // 3DR modem RSSI
            }
            return v;
        }
        /* in firmware
         0 - MAVlink
         1 - analog
         2 - pulse
         3 - 3DR modem RSSI
         4 - ch 8                         
         */
        private int rssi_encode(int v) {
            switch (v) {
            case 0:     // MAVlink
                return 0 * 2;
            case 1:     // channel 8
                return 4 * 2;
            case 2:     //  pin analog
                return 1 * 2;
            case 3:     //   pin PWM
                return 2 * 2;
            case 4:     // 3DR modem RSSI
                return 3 * 2; 
            }
            return 0;
        }

        private void presentCustomCharsetToolStripMenuItem_Click(object sender, EventArgs e) {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "mcm|*.mcm";
            if (ofd.ShowDialog() != System.Windows.Forms.DialogResult.OK)
                return;

            chars = mcm.readMCM(ofd.FileName);
            lblPresentedCharset.Text = "Presented Charset: " + ofd.SafeFileName;


            Draw(screen_number);
        }


        private bool UploadFirmware(string fileName) {
            if (string.IsNullOrEmpty(fileName))
                return false;

            if (tlog_run)
                stop_tlog();

            byte[] FLASH;
            bool spuploadflash_flag = false;
            try {
                toolStripStatusLabel1.Text = "Reading Hex File";

                statusStrip1.Refresh();

                FLASH = readIntelHEXv2(new StreamReader(fileName));
            } catch { MessageBox.Show("Bad Hex File"); return false; }

            ArduinoSTK sp = OpenArduino();

            toolStripStatusLabel1.Text = "Connecting to Board";

            if (sp != null && sp.connectAP()) {
                sp.Progress += new ArduinoSTK.ProgressEventHandler(sp_Progress);
                try {
                    for (int i = 0; i < 3; i++) { //try to upload 3 times  //try to upload n times if it fail
                        spuploadflash_flag = sp.uploadflash(FLASH, 0, (uint16_t)FLASH.Length, 0);
                        if (!spuploadflash_flag) {
                            if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                            else Console.WriteLine("keepalive fail (iter " + i + ")");
                            //toolStripStatusLabel1.Text = "Lost sync. Reconnecting...";
                        } else break;
                    }

                } catch (Exception ex) {
                    //fail = true;
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            } else {
                MessageBox.Show("Failed to talk to bootloader");
            }

            sp.Close();

            if (spuploadflash_flag) {

                toolStripStatusLabel1.Text = "Done";

                MessageBox.Show("Done!");
            } else {
                MessageBox.Show("Upload failed. Lost sync. Try using Arduino to upload instead",
                            "Error",
                            MessageBoxButtons.OK,
                            MessageBoxIcon.Warning);
                toolStripStatusLabel1.Text = "Failed";
            }
            start_clear_timeout();
            return true;
        }


 

        private bool GetLatestFW(ModelType modelType) {
            try {
                string localFwDir = AppDomain.CurrentDomain.BaseDirectory + "\\FW";
                string fileName = "MinimOSD_Extra_" + modelType.ToString() + ".hex";

                if (!Directory.Exists(localFwDir))
                    Directory.CreateDirectory(localFwDir);
                FileStream latestPlaneFile = new FileStream(localFwDir + "\\MinimOSD_" + modelType.ToString() + ".hex", FileMode.Create);
                //FileStream latestPlaneFile = new FileStream("C:\\test\\MinimOSD_" + modelType.ToString() + "_Test.hex", FileMode.Create);

                FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://gabek.dyndns.org:23/Latest/" + fileName));
                request.Credentials = new NetworkCredential("ct", "secret01201");
                request.Method = WebRequestMethods.Ftp.DownloadFile;
                request.UseBinary = true;

                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                Stream ftpStream = response.GetResponseStream();
                long cl = response.ContentLength;
                int bufferSize = 2048;
                int readCount;
                byte[] buffer = new byte[bufferSize];
                readCount = ftpStream.Read(buffer, 0, bufferSize);
                while (readCount > 0) {
                    latestPlaneFile.Write(buffer, 0, readCount);
                    readCount = ftpStream.Read(buffer, 0, bufferSize);
                }
                ftpStream.Close();
                latestPlaneFile.Close();
                response.Close();
            } catch {
                return false;
            }
            return true;
        }




 

        private void CALLSIGNmaskedText_Validating(object sender, CancelEventArgs e) {
            string validString = "";
            foreach (char c in CALLSIGNmaskedText.Text) {

                if ((c == '-') || ((c >= 'a') && (c <= 'z')) || ((c >= 'A') && (c <= 'Z')) || ((c >= '0') && (c <= '9')))
                    validString += c;
            }
            CALLSIGNmaskedText.Text = validString;
        }



        int Constrain(int value, int min, int max) {
            if (value < min)
                return (int)min;
            if (value > max)
                return (int)max;

            return (int)value;
        }


        private void cbxAutoUpdate_CheckedChanged(object sender, EventArgs e) {
            checkForUpdates = cbxAutoUpdate.Checked;
        }

        private void cbxShowUpdateDialog_CheckedChanged(object sender, EventArgs e) {
            autoUpdate = !cbxShowUpdateDialog.Checked;
        }
        public Size get_basesize() {
            return basesize;
        }

        public ArduinoSTK OpenArduino() {
            ArduinoSTK sp;
            try {
                if (comPort.IsOpen)
                    comPort.Close();

                sp = new ArduinoSTK();
                sp.PortName = CMB_ComPort.Text;
                sp.BaudRate = 57600;
                sp.DataBits = 8;
                sp.StopBits = StopBits.One;
                sp.Parity = Parity.None;
                sp.DtrEnable = true;
                //				sp.RtsEnable = false; //added

                sp.Open();
                return sp;
            } catch {
                MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return null;
            }

        }

        private void PANEL_tabs_Selected(object sender, TabControlEventArgs e) {
            //System.Windows.Forms.TabControl
            string s = ((TabControl)sender).SelectedTab.Name;


            string[] hdr = s.Split(new char[] { '_' }, StringSplitOptions.RemoveEmptyEntries);

            if (hdr.Length > 1) {
                int k = int.Parse(hdr[1]);
                currentlyselected = "";
                scr[k-1].deselect();
                Draw(k - 1);
                BUT_CopyScreen.Visible = true;
                BUT_ClearScreen.Visible = true;
            } else {
                screen_number = -1;
                BUT_CopyScreen.Visible = false;
                BUT_ClearScreen.Visible = false;
            }
        }

        private void txtRSSI_k_TextChanged(object sender, EventArgs e) {
            string s = txtRSSI_k.Text;

            //if(txtRSSI_k.Focused) return;

            pan.rssi_koef = myConvert(s); 
            if(txtRSSI_k.Text != pan.rssi_koef.ToString())
                txtRSSI_k.Text = pan.rssi_koef.ToString();
        }


        private void txtCurr_k_TextChanged(object sender, EventArgs e) {
            //if (txtCurr_k.Focused) return;

            pan.Curr_koef = myConvert(txtCurr_k.Text);
            if(txtCurr_k.Text != pan.Curr_koef.ToString())
            txtCurr_k.Text = pan.Curr_koef.ToString();
        }

        private void txtBattA_k_TextChanged(object sender, EventArgs e) {
            //if (txtBattA_k.Focused) return;

            pan.battA_koef = myConvert(txtBattA_k.Text);
            if(txtBattA_k.Text != pan.battA_koef.ToString())
            txtBattA_k.Text = pan.battA_koef.ToString();
        }


        private void cbBattA_source_SelectedIndexChanged(object sender, EventArgs e) {
            pan.flgBattA = (cbBattA_source.SelectedIndex > 0);
            batt1_used = (pan.flgBattA);

            update_used_pins();
            txtBattA_k.Enabled = pan.flgBattA;
        }




        private void cbCurrentSoure_SelectedIndexChanged(object sender, EventArgs e) {
            pan.flgCurrent = (cbCurrentSoure.SelectedIndex > 0);
            curr_used = (pan.flgCurrent);

            update_used_pins();
            txtCurr_k.Enabled =pan.flgCurrent;
        }

        private void numMinVoltB_ValueChanged(object sender, EventArgs e) {
            pan.battBv = (byte)(numMinVoltB.Value * 10);
        }

        private void txtBattB_k_TextChanged(object sender, EventArgs e) {
            //if (txtBattB_k.Focused) return;
            pan.battB_koef = myConvert(txtBattB_k.Text);
            txtBattB_k.Text = pan.battB_koef.ToString();
        }

        private void txtRollPal_TextChanged(object sender, EventArgs e) {
            //if (txtRollPal.Focused) return;

            pan.roll_k = myConvert(txtRollPal.Text);
            if(txtRollPal.Text != pan.roll_k.ToString())
                txtRollPal.Text = pan.roll_k.ToString();
        }

        private void txtPitchPal_TextChanged(object sender, EventArgs e) {
            //if (txtPitchPal.Focused) return;

            pan.pitch_k = myConvert(txtPitchPal.Text);
            if(txtPitchPal.Text != pan.pitch_k.ToString())
                txtPitchPal.Text = pan.pitch_k.ToString();
        }

        private void txtRollNtsc_TextChanged(object sender, EventArgs e) {
            //if (txtRollNtsc.Focused) return;
            pan.roll_k_ntsc = myConvert(txtRollNtsc.Text);
            if(txtRollNtsc.Text != pan.roll_k_ntsc.ToString())
                txtRollNtsc.Text = pan.roll_k_ntsc.ToString();
        }

        private void txtPitchNtsc_TextChanged(object sender, EventArgs e) {
            //if (txtPitchNtsc.Focused) return;
            pan.pitch_k_ntsc = myConvert(txtPitchNtsc.Text);
            if(txtPitchNtsc.Text != pan.pitch_k_ntsc.ToString())
                txtPitchNtsc.Text = pan.pitch_k_ntsc.ToString();
        }

       

        private void chkILS_CheckedChanged(object sender, EventArgs e) {
            //pan.flgILS = chkILS.Checked;
        }

/*
        static  void crc_accumulate(uint8_t data, ref uint16_t crcAccum){
            //Accumulate one byte of data into the CRC
            uint16_t tmp;

            tmp = (uint16_t)(data ^ (uint8_t)(crcAccum & 0x00ff));
            tmp ^= (uint16_t)((tmp<<4) & 0x00ff);
            crcAccum = (uint16_t)((crcAccum>>8) ^ (tmp<<8) ^ (tmp <<3) ^ (tmp>>4));
        }
*/
        public static ushort crc_accumulate(byte b, ref ushort crc)    {
            unchecked        {
                byte ch = (byte)(b ^ (byte)(crc & 0x00ff));
                ch = (byte)(ch ^ (ch << 4));
                crc = (ushort)((crc >> 8) ^ (ch << 8) ^ (ch << 3) ^ (ch >> 4));
                return crc;
            }
        }
        static  void crc_init(ref uint16_t crcAccum)
        {
                crcAccum = X25_INIT_CRC;
        }

        private void mavlink_start_checksum(ref mavlink_message msg){
            crc_init(ref msg.checksum);
        }

        void mavlink_update_checksum(ref mavlink_message msg, uint8_t c){
            crc_accumulate(c, ref msg.checksum);
        }

        public byte mavlink_parse_char(uint8_t c) {
/*
	default message crc function. You can override this per-system to
	put this data in a different memory segment
*/

	        //mavlink_message_t* rxmsg = mavlink_get_channel_buffer(chan); ///< The currently decoded message
	        //mavlink_status_t* status = mavlink_get_channel_status(chan); ///< The current decode status
            
	        int bufferIndex = 0;

	        status.msg_received = 0;

	        switch (status.parse_state) {
	   

	        case mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE:
		        if (c == MAVLINK_STX) {
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_STX;
			        rxmsg.len = 0;
                    status.msg_error=0;
        //			rxmsg->magic = c;
			        mavlink_start_checksum(ref rxmsg);
        //mavlink_comm_0_port->printf_P(PSTR("\n\ngot STX!"));
                    return (byte)1;
		        } else {
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE;
		        }
		        break;

	        case mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_STX:
		        if (status.msg_received !=0
        /* Support shorter buffers than the
            default maximum packet size */
				        ){
			        status.buffer_overrun++;
			        status.parse_error++;
			        status.msg_received = 0;			        
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE;
		        }
		        else
		        {
        //mavlink_comm_0_port->printf_P(PSTR(" got Length!"));

			        // NOT counting STX, LENGTH, SEQ, SYSID, COMPID, MSGID, CRC1 and CRC2
			        rxmsg.len = c;
			        status.packet_idx = 0;
			        mavlink_update_checksum(ref rxmsg, c);
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_LENGTH;
		        }
		        break;

            case mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_LENGTH:
        //mavlink_comm_0_port->printf_P(PSTR(" got Seq!"));

		        rxmsg.seq = c;
		        mavlink_update_checksum(ref rxmsg, c);
                status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_SEQ;
		        break;

            case mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_SEQ:
        //mavlink_comm_0_port->printf_P(PSTR(" got Sysid!"));

		        rxmsg.sysid = c;
		        mavlink_update_checksum(ref rxmsg, c);
                status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_SYSID;
		        break;

            case mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_SYSID:
        //mavlink_comm_0_port->printf_P(PSTR(" got Compid!"));

		        rxmsg.compid = c;
		        mavlink_update_checksum(ref rxmsg, c);
                status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_COMPID;
		        break;

            case mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_COMPID:
		        rxmsg.msgid = c;
		        mavlink_update_checksum(ref rxmsg, c);
		        if (rxmsg.len == 0) {
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_PAYLOAD;
		        } else {
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_MSGID;
		        }               
		        break;

            case mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_MSGID:
                rxmsg.payload[status.packet_idx++] = (byte)c;
		        mavlink_update_checksum(ref rxmsg, c);
		        if (status.packet_idx == rxmsg.len) {
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_PAYLOAD;

		        }                
		        break;

            case mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_PAYLOAD:
                mavlink_update_checksum(ref rxmsg, MAVLink.MAVLINK_MESSAGE_CRCS[rxmsg.msgid]);

		        if ( c != (rxmsg.checksum & 0xFF)) {
        Console.WriteLine("\n CRC1 err! want={0} got={1}", rxmsg.checksum & 0xFF, c);
			        // Check first checksum byte
			        status.parse_error++;
			        status.msg_received = 0;
                    status.msg_error = 1;
			        if (c == MAVLINK_STX) {
                        status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_STX;
                        rxmsg.len = 0;
                        status.msg_error = 0;
                        mavlink_start_checksum(ref rxmsg);

                    } else {
                        status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_BAD_CRC1;
			        }
		        } else {
 //  {
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_CRC1;
                    rxmsg.payload[status.packet_idx] = (byte)c;
		        }
		        break;

            case mavlink_parse_state_t.MAVLINK_PARSE_STATE_BAD_CRC1:
                 if (c == MAVLINK_STX) {
                           status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_STX;
                           rxmsg.len = 0;
                           status.msg_error = 0;
                           mavlink_start_checksum(ref rxmsg);
                 } else {
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE;
			        rxmsg.payload[status.packet_idx+1] = (byte)c;
                 }

                break;

            case mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_CRC1:
                //*
                   if (c != (rxmsg.checksum >> 8)) {// Check second checksum byte

//                       Console.WriteLine("\nCRC2 err! want={0} got={1}", rxmsg.checksum >> 8, c);
                       status.msg_error = 1;
                        status.parse_error++;
                           status.msg_received = 0;
			
                           if (c == MAVLINK_STX) {
                                  status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_STX;
                                  rxmsg.len = 0;                                  
                                  mavlink_start_checksum(ref rxmsg);
                           } else {
                                        //status->parse_state = MAVLINK_PARSE_STATE_IDLE;     
                                   status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE;
                          }
                 } else 
                //*/ 
                       {
                  // Successfully got message
			        status.msg_received = 1;

                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE;
			        rxmsg.payload[status.packet_idx+1] = (byte)c;
                }
		        break;
	        }

	        bufferIndex++;
	        // If a message has been sucessfully decoded, check index
	        if (status.msg_received!=0) {
		        //while(status->current_seq != rxmsg->seq)
		        //{
		        //	status->packet_rx_drop_count++;
		        //               status->current_seq++;
		        //}
		        status.current_rx_seq = rxmsg.seq;
		        // Initial condition: If no packet has been received so far, drop count is undefined
		        if (status.packet_rx_success_count == 0) status.packet_rx_drop_count = 0;
		        // Count this packet as received
		        status.packet_rx_success_count++;
	        }

	        //status.parse_error = 0;
            status.current_rx_seq +=1;
	        //status.packet_rx_success_count = status->packet_rx_success_count;
	        status.packet_rx_drop_count = status.parse_error;
	        //r_mavlink_status->buffer_overrun = status->buffer_overrun;

            if(status.msg_error !=0) {
                status.msg_error=0;
                    return (byte)3;
            }
	        return status.msg_received!=0?(byte)2:(byte)0;
        }


        private void btnTLog_Click(object sender, EventArgs e) {
            logOffset = myConvert(txtLogOffset.Text);
            txtLogOffset.Text = logOffset.ToString();

            if (!tlog_run) {
                CurrentCOM = CMB_ComPort.Text;
                tlog_thread = new System.Threading.Thread(thread_proc);
                tlog_run = true;
                comBusy=true ; 
                tlog_thread.Start();
            } else {
                need_stop_tlog=true;

                delay(100);
                Application.DoEvents();
                delay(100);

                if(tlog_run) {
                    tlog_run=false;
                    try {
                        tlog_thread.Abort();
                    } catch {};
                }
                try {
                    if (comPort.IsOpen)
                        comPort.Close();
                } catch {};
                comBusy = false;
            }
            btnTLog.Text = tlog_run ? "Stop" : "Start";
        }



         private void numVOS_ValueChanged(object sender, EventArgs e) {
            pan.vert_offs = (byte)(0x10 + numVOS.Value);
        }

        private void numHOS_ValueChanged(object sender, EventArgs e) {
            pan.horiz_offs = (byte)(0x20 + numHOS.Value);
        }

        private void cbOutSource_SelectedIndexChanged(object sender, EventArgs e) {
            //
            pan.pwm_src = (byte)cbOutSource.SelectedIndex;
        }

        private void cbOutPin_SelectedIndexChanged(object sender, EventArgs e) {
            //
            pan.pwm_dst = (byte)cbOutPin.SelectedIndex;
        }



        private void cbNscreens_SelectedIndexChanged(object sender, EventArgs e) {
            pan.n_screens = (byte)(cbNscreens.SelectedIndex );
        }

/*        private void chkHUD_CheckedChanged(object sender, EventArgs e) {
            pan.flgHUD = chkHUD.Checked;
        }
*/
        private void chkTrack_CheckedChanged(object sender, EventArgs e) {
            //pan.flgTrack = chkTrack.Checked;
        }

        public string convertChars(string s){
            string so="";
            try {
                for(int i=0; i<s.Length; i++) {
                    char c = s[i];
                    if(c=='\\'){
                        i++;
                        if(i==s.Length) break;
                        switch(s[i]) {
                        case 'n':
                            so +="\n";
                            break;
                        case 'r':
                            so +="\r";
                            break;
                        case 't':
                            so +="\n";
                            break;
                            
                        case '0': // octal string
                        case '1': 
                            string oct="";
                            oct += s[i];
                            i++;
                            if(i==s.Length) break;
                            oct += s[i];
                            i++;
                            if(i==s.Length) break;
                            oct += s[i];
                            so += Convert.ToByte(oct,8);
                            break;
    
                        case 'x': // hex string
                            string hex="";
                            i++;
                            if(i==s.Length) break;
                            hex+=s[i];
                            i++;
                            if(i==s.Length) break;
                            hex+=s[i];
                            so += Convert.ToChar(Convert.ToByte(hex,16));
                            break;

                        }
                    } else {
                        so +=c;
                    }
                }
                return so;
            } catch{
                return s;
            }
        }

        public string myDecode(string s){
            string so="";
            try {
                for(int i=0; i<s.Length; i++) {
                    char c = s[i];
                    if(c==0) break;
                    if(c<0x20 || c>=0x80) {
                        string hex=Convert.ToString(c, 16);
                        if (hex.Length % 2 != 0)
                            hex = '0' + hex;
                        so+="\\x" + hex;
                    } else
                        so+=c;
                }
                return so;
            } catch{
                return s;
            }
        }

        float myConvert(string s) {
            bool f = false;
            double v = 0;
            
            
            do {
                try {
                    v = Convert.ToDouble(s);
                    f=true;
                } catch {                    
                };

                if(!f) {
                    string s1 = s.Replace('.', ',');
                    try {
                        v = Convert.ToDouble(s1);
                        f = true;
                    } catch {
                    };
                }
                if (!f && s.Length!=0) s = s.Substring(0, s.Length - 1);
            } while (!f && s != "");
            
            return (float)v;
        }

        //this.txtFactor1.TextChanged += new System.EventHandler(this.txtFactor1_TextChanged);
        private void txtFactor1_TextChanged(object sender, EventArgs e) {
            //if (((System.Windows.Forms.TextBox)sender).Focused) return;

            string s = ((System.Windows.Forms.TextBox)sender).Text;
            float v=myConvert(s);

            if(v==0) v=1;
            if(s != v.ToString())
                ((System.Windows.Forms.TextBox)sender).Text = v.ToString();
        }

        UInt64 get_timestamp(byte[] bytes, int ptr){
            UInt64 time=0;
            byte[] datearray=new Byte[8];
            for (int i = 0; i <8; i++) {
                datearray[i] = bytes[ptr + i];
            }
            Array.Reverse(datearray);
            time = (ulong)BitConverter.ToInt64(datearray,0);
            return time;
        }

        double millis(){
            return (DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds;
        }

        void thread_proc() {
            need_stop_tlog=false;
            byte[] bytes = tlog_data;
            int frStart = 0;
            int frEnd = 0;
            int frameIndex = 0;
            int np = 0;
            int[] last_seq = new int[256];
            string message;
            MAVLink mv=new MAVLink();
            

            status.packet_rx_drop_count = 0;
            status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE;
            status.packet_idx = 0;
            status.packet_rx_success_count = 0;
            status.current_rx_seq = 0;
            status.buffer_overrun = 0;
            status.parse_error = 0;

            for (int i = 0; i < 256; i++) last_seq[i] = 0xff;

            if (comPort.IsOpen)
                comPort.Close();

            try {

                comPort.PortName = CurrentCOM;
                comPort.BaudRate = PORT_SPEED;
                //comPort.BaudRate = 115200;


                comPort.Open();

                comPort.DtrEnable = true;

            } catch {
                MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            while (true) {
                np = 0;
                UInt64 time, start_time;
                DateTime localtime = DateTime.Now;
                DateTime tlog_start_time = DateTime.Now;
                UInt64 stamp = (UInt64)(millis() * 1000);
                bool playOn = false;

                int byteIndex;
                try {
                    // MP writes as
                    // byte[] datearray = BitConverter.GetBytes((UInt64)((DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds * 1000));
                    // Array.Reverse(datearray);
                            
                    time = start_time = get_timestamp(bytes, 0);
                    for (byteIndex = 8; byteIndex < bytes.Length; byteIndex++) {
                        if(need_stop_tlog) {
                            tlog_run=false;
                            return;
                        }
                        if (comPort.BytesToRead != 0)
                            parseInputData(comPort.ReadExisting());


                        byte c = bytes[byteIndex];
                        int stx_count=0, error_count=0;

                        switch (mavlink_parse_char(c)) {
                        case 3: // some error
                            error_count++;
                            Console.WriteLine("ERROR! >" + MAVLink.MAVLINK_NAMES[bytes[frStart+5]] + "\n");
                            break;
                        case 1: // got STX
                            frStart = byteIndex;
                            stx_count++;
                            break;
                        case 2: // got packet
                            frameIndex++;
                            frEnd = byteIndex;

                            if (!playOn && (time - start_time) / 1000000 >= logOffset) {
                                playOn =true;
                                tlog_start_time = DateTime.Now;
                            }
                            if (playOn) {
                                while(comPort.BytesToWrite!=0) // подождем передачи пакета
                                    System.Threading.Thread.Sleep(1); 

                                byte[] packet=new byte[256];

                                for(int i=0, j=frStart; i<256 && j<frEnd +1; i++, j++){
                                    packet[i]=bytes[j];
                                }

                                //0 - STX
                                // 1 - len
                                // 2 - seq
                                // 3 - sysid
                                // 4 - compid
                                // 5 - msgid
                                //
                                comPort.Write(bytes, frStart, frEnd - frStart + 1);

                                if(packet[5]==  168 ) { // MAVLINK_MSG_ID_WIND
                                    //Console.WriteLine ("wind !");
                                    byte bb=packet[6];// float direction
                                    // float speed
                                    // float speed_Z
                                }

                                Console.WriteLine(MAVLink.MAVLINK_NAMES[packet[5]] + "\n");

                                if(packet[5]==  109 ) { //MAVLINK_MSG_ID_RADIO_STATUS
                                    byte rssi=packet[11];
                                    byte remrssi = packet[12];
                                /*
typedef struct __mavlink_radio_status_t
{
7 uint16_t rxerrors; ///< receive errors
9 uint16_t fixed; ///< count of error corrected packets
11 uint8_t rssi; ///< local signal strength
12 uint8_t remrssi; ///< remote signal strength
 uint8_t txbuf; ///< how full the tx buffer is as a percentage
 uint8_t noise; ///< background noise level
 uint8_t remnoise; ///< remote background noise level
} mavlink_radio_status_t;
                                 */
                            }

                                if(packet[5]==  65 ) { // rc_channels
                                    byte b=packet[7];
                                }
                                try {
                                    this.Invoke((MethodInvoker)delegate {
                                        lblTLog.Text = np.ToString(); // runs on UI thread
                                        lblTime.Text = (DateTime.Now - tlog_start_time).ToString();
                                    });

                                } catch { };

                            }
                            if (((last_seq[rxmsg.sysid] + 1) & 0xff) == rxmsg.seq) { // поймали синхронизацию
                                time = get_timestamp(bytes, byteIndex+1); // skip CRC2                         
                                byteIndex += 8; // skip timestamp
                            }
                            last_seq[rxmsg.sysid] = rxmsg.seq;
                            np++;

                            if (playOn) {
                                double time_w = millis();

                                while(true){
                                    UInt64 diff_log=(time - start_time);
                                    UInt64 diff_real = ((UInt64)(millis() * 1000)) - stamp; // если время лога опережает реальное - задерживаемся
                                    if(diff_log < diff_real) {
                                        //Console.WriteLine("go");
                                        break;
                                    }

                                    if ((millis() - time_w) > 100) { // но не реже 10 раз в секунду
                                        start_time=time; // ждали слишком долго, сместим метку времени в логе
                                        break;
                                    }
                                    if (need_stop_tlog) {
                                        tlog_run = false;
                                        return;
                                    }
                                    //Console.WriteLine("wait");
                                    System.Threading.Thread.Sleep(1); 
                                }
                            }

                            message = "";
                            message += "Payload length: " + rxmsg.len.ToString();
                            message += "Packet sequence: " + rxmsg.seq.ToString();
                            message += "System ID: " + rxmsg.sysid.ToString();
                            message += "Component ID: " + rxmsg.compid.ToString();
                            message += "Message ID: " + rxmsg.msgid.ToString();
                            message += "Message: ";
                            for (int x = 0; x < rxmsg.len; x++) {
                                message += rxmsg.payload[x].ToString();
                            }
                            message += "CRC1: " + rxmsg.seq.ToString();
                            message += "CRC2: " + ((int)bytes[byteIndex]).ToString();
                            message += Environment.NewLine;

                            //Console.Write(message);
                            break;
                        }

                        while (comPort.BytesToRead != 0)
                            parseInputData(comPort.ReadExisting());
                    }
                } catch {
                    continue;
                }
            }

        }

        void delay(int t){
            System.Threading.Thread.Sleep(t); 
        }

        private void connectComPortToolStripMenuItem_Click(object sender, EventArgs e) {
            frmComPort frm = new frmComPort(this);
            
            frm.ShowInTaskbar =false;
            comBusy=true;
            frm.ShowDialog(); // modal
            comBusy=false;
        }

        private void BUT_CopyScreen_Click(object sender, EventArgs e)
        {
            CopyScreen frm = new CopyScreen(PANEL_tabs.SelectedIndex);
            frm.ShowInTaskbar = false;
            DialogResult res = frm.ShowDialog(); // modal
            if (res == DialogResult.OK) {
                int screen = frm.Selection;
                scr[PANEL_tabs.SelectedIndex-1].copyFrom(scr[screen-1]);
                Draw(screen_number);
            }

        }

        private void BUT_ClearScreen_Click(object sender, EventArgs e) {
            scr[PANEL_tabs.SelectedIndex - 1].clearScreen();
        }


        private void MavlinkModeMenuItem_Click(object sender, EventArgs e) {
            //BUT_ReadOSD.Enabled = ! MavlinkModeMenuItem.Checked;
            //updateFontToolStripMenuItem.Enabled = !MavlinkModeMenuItem.Checked;
            //resetEepromToolStripMenuItem.Enabled = !MavlinkModeMenuItem.Checked;
            updateFirmwareToolStripMenuItem.Enabled = !MavlinkModeMenuItem.Checked;
            
        }

        

        public void updatePanelStrings(int str_id, int str_count, string str) {
            str = convertChars(str);
            string[] s=str.Split('|');

            for(int p=0; p<str_count;p++){
                string v="";
                try {
                    v=s[p];
                } catch{};

                StringArray[str_id+p] = v;
            }
        
        }

        private void parseInputData(string s) {
            Console.WriteLine(s);
        }

        [StructLayout(LayoutKind.Sequential, Pack = 1, Size = 136)]
        private struct Mav_conf { // needs to fit in 253 bytes
            public byte magick0; // = 0xee 'O' 'S' 'D'
            public byte magick1;
            public byte magick2;
            public byte magick3;
            public byte cmd;           // command
            public byte id;            // number of 128-bytes block
            public byte len;           // real length
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = 128)]
            public byte[] data;
            public byte crc;           // may be
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = 117)]
            public byte[] pad;
        };

        
        public static byte[] StructureToByteArray(object obj){ // Stolen from MissionPlanner
            int len = Marshal.SizeOf(obj);
            byte[] arr = new byte[len];
            IntPtr ptr = Marshal.AllocHGlobal(len);
            Marshal.StructureToPtr(obj, ptr, true);
            Marshal.Copy(ptr, arr, 0, len);
            Marshal.FreeHGlobal(ptr);
            return arr;
        }
        

        static T ByteArrayToStructureGC<T>(byte[] bytearray, int startoffset) where T : struct {
            GCHandle gch = GCHandle.Alloc(bytearray, GCHandleType.Pinned);
            try {
                return (T)Marshal.PtrToStructure(new IntPtr(gch.AddrOfPinnedObject().ToInt64() + startoffset), typeof(T));
            } finally {
                gch.Free();
            }
        }

        public void sendPacket(object indata) {
            bool validPacket = false;
            byte a = 0;
            foreach (Type ty in MAVLink.MAVLINK_MESSAGE_INFO) {
                if (ty == indata.GetType()) {
                    validPacket = true;
                    generatePacket(a, indata);
                    return;
                }
                a++;
            }
            if (!validPacket) {
                Console.WriteLine("Mavlink : NOT VALID PACKET sendPacket() " + indata.GetType().ToString());
            }
        }

        /// <summary>
        /// Generate a Mavlink Packet and write to serial
        /// </summary>
        /// <param name="messageType">type number = MAVLINK_MSG_ID</param>
        /// <param name="indata">struct of data</param>
        void generatePacket(byte messageType, object indata) {
           
            lock (objlock) {
                byte[] data;

                if(!flag_EEPROM_read) {
                    parseInputData(comPort.ReadExisting());
                }

                data = StructureToByteArray(indata);

                //Console.WriteLine(DateTime.Now + " PC Doing req "+ messageType + " " + this.BytesToRead);
                byte[] packet = new byte[data.Length + 6 + 2];
                int i = 0;
                packet[i++] = 254;
                packet[i++] = (byte)data.Length;
                packet[i++] = (byte)(MAV_packetcount++);
                packet[i++] = 255; // gcssysid; // this is always 255 - MYGCS
                packet[i++] = (byte)MAVLink.MAV_COMPONENT.MAV_COMP_ID_CAMERA;
                packet[i++] = messageType;
                
                foreach (byte b in data) {
                    packet[i++] = b;
                }

                ushort checksum = MAVLink.MavlinkCRC.crc_calculate(packet, packet[1] /* data.length */ + 6);

                checksum = MAVLink.MavlinkCRC.crc_accumulate(MAVLink.MAVLINK_MESSAGE_CRCS[messageType], checksum);

                byte ck_a = (byte)(checksum & 0xFF); ///< High byte
                byte ck_b = (byte)(checksum >> 8); ///< Low byte

                packet[i++] = ck_a;                
                packet[i++] = ck_b;                

                comPort.Write(packet, 0, i);

                delay(100); 
                if(!flag_EEPROM_read) {
                    parseInputData(comPort.ReadExisting());
                }
            }
        }

        void com_mavlink_proc() {
            const int Block_Size = 128;
            bool binMode=false;
            int cnt=0;
            
            int blockCount=0;

            while (flag_EEPROM_read) {
                try {
                    if (comPort.IsOpen && comPort.BytesToRead > 0) {
                        byte c = (byte)comPort.ReadByte();

                        if(binMode){
        /*
                            string hexOutput = String.Format("{0:X}", c);
                            Console.Write(hexOutput+" ");
                            cnt++;
                            if(cnt>=16){
                                cnt=0;
                                Console.WriteLine();
                            }
         */
                        } else {
                            Console.Write((char)c);
                            cnt=0;
                        }

                        switch (mavlink_parse_char(c)) {
                        case 3: // error
                            binMode = false;
                            Console.WriteLine("got error packet");
                            break;
                        case 1: // got STX
                            binMode = true;
                            break;
                        case 2: // got packet
                            binMode = false;
                            if (rxmsg.msgid == (byte)MAVLink.MAVLINK_MSG_ID.ENCAPSULATED_DATA && rxmsg.sysid == 12 /* OSD */ && rxmsg.compid == (byte)MAVLink.MAV_COMPONENT.MAV_COMP_ID_CAMERA) { //reply                                  
                                Mav_conf packet = ByteArrayToStructureGC<Mav_conf>(rxmsg.payload, 2);
                                if( packet.magick0 == (byte)0xEE &&
                                    packet.magick1 == (byte)'O' &&
                                    packet.magick2 == (byte)'S' &&
                                    packet.magick3 == (byte)'D' )
                                {
                                    byte block = packet.id;
                                    blockCount++;

                                    this.Invoke((MethodInvoker)delegate {
                                        toolStripProgressBar1.Value = (blockCount * 25) / 2;
                                    });
                                    
                                    if(packet.cmd == 'r') { // read EEPROM
                                        int addr = Block_Size * block;

                                        for(int k=0; k<Block_Size; k++){
                                            conf.eeprom[addr + k] = packet.data[k];
                                        }
                                    }
                                    got_osd_packet=true;
                                    mav_blocks[block] = true;
                                    Console.WriteLine("got data block " + block);
                                } else {
                                    Console.WriteLine("got bad data block");
                                }

                            }else {
                                Console.WriteLine("got message id=" + rxmsg.msgid + " sysid=" + rxmsg.sysid + " compid=" + rxmsg.compid );               
                            }
                            break;
                        } // switch

                    }
                } catch { }
                System.Threading.Thread.Sleep(10);
            }
        }

        private int MavReadEEprom(int pos, int length){
            Mav_conf packet = new Mav_conf();

            packet.data = new byte[128];
            packet.pad = new byte[117];

            if (comPort.IsOpen)
                comPort.Close();

            try {

                comPort.PortName = CMB_ComPort.Text;
                comPort.BaudRate = 57600;

                comPort.Open();

                // delay 1s to  OSD boot up
                for (int i = 0; i < 100; i++) {
                    System.Threading.Thread.Sleep(10);
                    Application.DoEvents();
                    parseInputData(comPort.ReadExisting());
                }

                MAVLink.mavlink_heartbeat_t htb = new MAVLink.mavlink_heartbeat_t() {
                    type = (byte)MAVLink.MAV_TYPE.GCS,
                    autopilot = (byte)MAVLink.MAV_AUTOPILOT.INVALID,
                    mavlink_version = 3// MAVLink.MAVLINK_VERSION
                };

                sendPacket(htb); // lets AutoBaud will be happy
                sendPacket(htb);
                sendPacket(htb);
                sendPacket(htb);

                for(int i=0; i<mav_blocks.Length; i++){
                    mav_blocks[i]=false;
                }
                got_osd_packet=false;

                int seq = 0; // reset on each heartbeat
                
                const int Block_Size = 128;

                flag_EEPROM_read = true;

                com_thread = new System.Threading.Thread(com_mavlink_proc);
                com_thread.Start();
                bool was_read = false;

                int n=0;
                int nTry = 50; // 5s per block
                do {
                    was_read = false;
                    int bytes = 0;
                    for (n = 0; n < length / Block_Size; n++) {
                        int sz = Block_Size;
                        bytes = n*Block_Size;
                        if(mav_blocks[n]) continue; // block already got

                        was_read = true;

                        if (bytes + sz > length)
                            sz = length - bytes;

                        this.toolStripStatusLabel1.Text = "Reading block "+n;

                        packet.magick0 = (byte)0xEE; // = 0xee 'O' 'S' 'D'
                        packet.magick1 = (byte)'O';
                        packet.magick2 = (byte)'S';
                        packet.magick3 = (byte)'D';
                            
                        packet.cmd = (byte)'r';         // command Read
                        packet.id = (byte)n;            // number of 128-bytes block
                        packet.len = (byte)Block_Size;  // real length
                            
                        bytes += sz;


                        MAVLink.mavlink_encapsulated_data_t ed = new MAVLink.mavlink_encapsulated_data_t() {
                            seqnr = (ushort)(++seq),
                            data = StructureToByteArray(packet)
                        };

                        sendPacket(ed);
                        for (int i = 0; i < 10; i++) {
                            System.Threading.Thread.Sleep(10);
                            Application.DoEvents();
                        }
                    }
                    if (--nTry <= 0) {
                        MessageBox.Show("Timeout reading EEPROM block " + n, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        flag_EEPROM_read = false;
                        toolStripProgressBar1.Value =0;
                        return 0; // failed to get packet
                    }
                } while (was_read);

                this.toolStripStatusLabel1.Text = "Done.";

                for (int i = 0; i < 100; i++) {
                    System.Threading.Thread.Sleep(10);
                    Application.DoEvents();
                }

                flag_EEPROM_read = false;
                toolStripProgressBar1.Value = 0;
                
                return 1;
            } catch (Exception ex) {
                MessageBox.Show("Error reading data: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                flag_EEPROM_read = false;
                toolStripProgressBar1.Value = 0;
                return 0;
            }
        
        }

        private int MavWriteEEprom(int pos, int length) {
            
 
            Mav_conf packet = new Mav_conf();
            
            packet.data = new byte [128];
            packet.pad =new byte[117];

            if (comPort.IsOpen)
                comPort.Close();

            try {

                comPort.PortName = CMB_ComPort.Text;
                comPort.BaudRate = 57600;

                comPort.Open();

                parseInputData(comPort.ReadExisting());

                MAVLink.mavlink_heartbeat_t htb = new MAVLink.mavlink_heartbeat_t(){
                    type = (byte)MAVLink.MAV_TYPE.GCS,
                    autopilot = (byte)MAVLink.MAV_AUTOPILOT.INVALID,
                    mavlink_version = 3// MAVLink.MAVLINK_VERSION
                };
                                    
                sendPacket(htb); // lets AutoBaud will be happy
                sendPacket(htb);
                sendPacket(htb);
                sendPacket(htb);

                for (int i = 0; i < mav_blocks.Length; i++) {
                    mav_blocks[i] = false;
                }
                got_osd_packet = false;

                int seq=0; // reset on each heartbeat
                int bytes=0;
                const int Block_Size=128;

                for (int n = pos / Block_Size; bytes < length; n++) {
                    int sz = Block_Size;
                    
                    if(bytes+sz > length)                     
                        sz=length-bytes;
                    
                    

                    packet.magick0 = (byte) 0xEE; // = 0xee 'O' 'S' 'D'
                    packet.magick1 = (byte) 'O';
                    packet.magick2 = (byte) 'S';
                    packet.magick3 = (byte) 'D';

                    packet.cmd = (byte) 'w';           // command
                    packet.id = (byte) n;            // number of 128-bytes block
                    packet.len = (byte) sz;           // real length
            
                    for(int k=0; k<sz; k++)
                        packet.data[k] = conf.eeprom[pos + bytes + k];


                    bytes+=sz;

                    MAVLink.mavlink_encapsulated_data_t ed = new MAVLink.mavlink_encapsulated_data_t(){
                        seqnr=(ushort)(++seq),
                        data = StructureToByteArray(packet)
                    };

                    sendPacket(ed);
                    if(!mav_blocks[n])  sendPacket(ed);
                    if (!mav_blocks[n]) sendPacket(ed);
                    System.Threading.Thread.Sleep(100);
                }
                if (got_osd_packet) { // OSD confirms receiving so we can check packets
                    bool need_send=false;
                    int n_try=50;
                    do {
                        need_send=false;
                        for (int n = pos / Block_Size; bytes < length; n++) {
                            int sz = Block_Size;
                        
                            if(bytes+sz > length)                     
                                sz=length-bytes;
                            if (!mav_blocks[n]) {
                                need_send=true;

                                packet.magick0 = (byte) 0xEE; // = 0xee 'O' 'S' 'D'
                                packet.magick1 = (byte) 'O';
                                packet.magick2 = (byte) 'S';
                                packet.magick3 = (byte) 'D';

                                packet.cmd = (byte) 'w';           // command
                                packet.id = (byte) n;            // number of 128-bytes block
                                packet.len = (byte) sz;           // real length
            
                                for(int k=0; k<sz; k++)
                                    packet.data[k] = conf.eeprom[pos + bytes + k];

                                
                                MAVLink.mavlink_encapsulated_data_t ed = new MAVLink.mavlink_encapsulated_data_t(){
                                    seqnr=(ushort)(++seq),
                                    data = StructureToByteArray(packet)
                                };

                                sendPacket(ed);
                            }

                            bytes+=sz;
                        }
                    } while(need_send && n_try-- > 0);
                }

                packet.cmd = (byte)'b';         // command  "Reboot"
                packet.len = (byte)0;           // real length

                MAVLink.mavlink_encapsulated_data_t rbt = new MAVLink.mavlink_encapsulated_data_t() {
                    seqnr = (ushort)(++seq),
                    data = StructureToByteArray(packet)
                };

                sendPacket(rbt);
                sendPacket(rbt);
                
                for(int i=0; i<100; i++){
                    System.Threading.Thread.Sleep(10); 
                    parseInputData(comPort.ReadExisting());
                    Application.DoEvents();
                }
                return 0;
            } catch (Exception ex) {
                MessageBox.Show("Error sending data: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); 
                return 1;
            }
        }

        void MavUploadFont(OpenFileDialog ofd) {
            //Get file version
            string fileVersion = "000";
            string tempFileName = ofd.SafeFileName.ToUpper();
            if (tempFileName.StartsWith("MINIMOSD_")) {
                tempFileName = tempFileName.Remove(0, 9);
                if (tempFileName.EndsWith(".MCM")) {
                    tempFileName = tempFileName.Remove(tempFileName.Length - 4, 3);
                    string[] versionArray = tempFileName.Split('.');
                    Int16 version1, version2, version3;
                    if (versionArray.Length > 2) {
                        if (Int16.TryParse(versionArray[0], out version1) &&
                           Int16.TryParse(versionArray[1], out version2) &&
                           Int16.TryParse(versionArray[2], out version3))
                            fileVersion = version1.ToString().Substring(0, 1).Trim() + version2.ToString().Substring(0, 1).Trim() + version3.ToString().Substring(0, 1).Trim();
                    }
                }
            }

            Mav_conf packet = new Mav_conf();

            packet.data = new byte[128];
            packet.pad = new byte[117];

            if (comPort.IsOpen)
                comPort.Close();

            byte[] character_bitmap = new byte[64];

            int font_count = 0;

            byte chk=0;
            bool got_any_data=false;
            byte last_c=0;
            byte b=0;

            int cnt=0;
            int bit_count=0;
            int byte_count=0;

            try {

                comPort.PortName = CMB_ComPort.Text;
                comPort.BaudRate = 57600;

                comPort.Open();

                parseInputData(comPort.ReadExisting());

                for (int i = 0; i < mav_blocks.Length; i++) {
                    mav_blocks[i] = false;
                }

                MAVLink.mavlink_heartbeat_t htb = new MAVLink.mavlink_heartbeat_t() {
                    type = (byte)MAVLink.MAV_TYPE.GCS,
                    autopilot = (byte)MAVLink.MAV_AUTOPILOT.INVALID,
                    mavlink_version = 3// MAVLink.MAVLINK_VERSION
                };

                sendPacket(htb); // lets AutoBaud will be happy
                sendPacket(htb);
                sendPacket(htb);
                sendPacket(htb);

                int seq = 0; // reset on each heartbeat
                int bytes = 0;
                const int Block_Size = 128;


                 using (var stream = ofd.OpenFile()) {

                    BinaryReader br = new BinaryReader(stream);
                    StreamReader sr2 = new StreamReader(br.BaseStream);

                    string device = sr2.ReadLine();

                    if (device != "MAX7456") {
                        MessageBox.Show("Invalid MCM");
                        return;
                    }

                    br.BaseStream.Seek(0, SeekOrigin.Begin);

                    toolStripStatusLabel1.Text = "CharSet Uploading";

                    long length = br.BaseStream.Length;
                    byte[] skip = br.ReadBytes(9);
            
                    length -= 9;
                    while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed) {
                        try {
                            toolStripProgressBar1.Value = (int)((br.BaseStream.Position / (float)br.BaseStream.Length) * 100);


                            int read =1;
                            length -= read;
                            byte[] buffer = br.ReadBytes(read);
                        
                            /////////// TODO
                            byte c = buffer[0];

                            switch (c) { // parse and decode mcm file
                            case 0x0A: // line feed - skip
                                if (last_c == 0x0d) continue;
                            // lf without cr cause line end
                                goto case_d;

                            case 0x0d: // carridge return, end of line
                            case_d:
                                if (bit_count == 8) {
                                    chk ^= b;
                                    character_bitmap[byte_count] = b;
                                    b = 0;
                                    byte_count++;
                                }
                                bit_count = 0;
                                break;

                            case 0x30: // ascii '0'
                            case 0x31: // ascii '1' 
                                b <<= 1;
                                if (c == 0x31)
                                    b += 1;
                                bit_count++;

                                got_any_data = true;
                                break;

                            default:
                                break;
                            }

                            // we have one completed character
                            // write the character to NVM 
                            if (byte_count == 64) {
                                int sz = 64;
                                packet.magick0 = (byte)0xEE; // = 0xee 'O' 'S' 'D'
                                packet.magick1 = (byte)'O';
                                packet.magick2 = (byte)'S';
                                packet.magick3 = (byte)'D';

                                packet.cmd = (byte)'f';          // command
                                packet.id = (byte)font_count;    // number of data block
                                packet.len = (byte)sz;           // real length

                                packet.data[0] = (byte)(font_count & 0xff);
                                packet.data[1] = (byte)(font_count >>8);
                                for (int k = 0; k < sz; k++)
                                    packet.data[k + 2] = character_bitmap[k];


                                bytes += sz;

                                MAVLink.mavlink_encapsulated_data_t ed = new MAVLink.mavlink_encapsulated_data_t() {
                                    seqnr = (ushort)(++seq),
                                    data = StructureToByteArray(packet)
                                };

                                sendPacket(ed);
                                if (!mav_blocks[font_count]) sendPacket(ed);
                                if (!mav_blocks[font_count]) sendPacket(ed);
                                if (!mav_blocks[font_count]) sendPacket(ed);
                                if (!mav_blocks[font_count]) sendPacket(ed);
                                if (!mav_blocks[font_count]) sendPacket(ed);
                                

                                byte_count = 0;
                                font_count++;                            
                                
                                chk = 0;
                                for (int i = 0; i < 100; i++) {
                                    System.Threading.Thread.Sleep(1);
                                    Application.DoEvents();
                                }

                            }

                        } catch { // one byte read
                            break;
                        }

                        Application.DoEvents();
                    }
 
                    toolStripProgressBar1.Value = 100;
                    if (got_osd_packet) { // OSD confirms receiving so we can check packets
                        toolStripStatusLabel1.Text = "CharSet Done OK";
                    }else {
                        toolStripStatusLabel1.Text = "CharSet Done";
                    }
                }

            } catch{} // com port

            conf.WriteCharsetVersion(fileVersion, false);
            lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: " + ofd.SafeFileName;
            
            start_clear_timeout();        
        }

        

        void loadDefaultOsd(){
            string fn = Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + "default.osd";
            if (!File.Exists(fn)) {                
                return;
            }
        
            loadOsdFile(fn);

        }

        private void Translate(Form f) {
            bool found = false;
            string fn = Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + "lang.txt";
            if (!File.Exists(fn)) {
                generateLang(fn);
                return;
            }

            using (StreamReader sr = new StreamReader(fn)) {
                while (!sr.EndOfStream) {

                    string s = sr.ReadLine();
                    if (!found) {
                        if (s == "[" + f.Name + "]")
                            found = true;
                        continue;
                    }
                    if (s[0] == '[') break; // next section
                    // found
                    string[] sa = s.Split('=');

                    string nm = sa[0].Substring(sa[0].Length - 3);
                    if (nm == "-tt") { // tooltip
                        Control ct = this.Controls.Find(sa[0].Substring(0, sa[0].Length - 3), true).FirstOrDefault() as Control;
                        if (ct != null)
                            hint.SetToolTip(ct, sa[1]);
                    } else {
                        Control c = this.Controls.Find(sa[0], true).FirstOrDefault() as Control;
                        if(c==null) continue;
                        if (c.ToString().Contains("System.Windows.Forms.TextBox")) continue;
                        if (c.ToString().Contains("System.Windows.Forms.ComboBox")) continue;
                        if (c.ToString().Contains("System.Windows.Forms.NumericUpDown")) continue;
                        if (c.ToString().Contains("System.Windows.Forms.MaskedTextBox")) continue;

                        c.Text = sa[1];
                    }
                }
            }
        }

        void parseControls(StreamWriter sw, Control.ControlCollection ctls) {
            foreach (Control c in ctls) {

                if (c.Controls != null && c.Controls.Count > 0) {
                    parseControls(sw, c.Controls);
                }

                if (c.Name == "") continue;
                if (c.Name == c.Text) continue;
                string tt = hint.GetToolTip(c);
                if (tt != "") {
                    sw.WriteLine(c.Name + "-tt" + "=" + tt);
                }

                if (c.Text == "") continue;
                //txtParam
                if (c.ToString().Contains("System.Windows.Forms.TextBox")) continue;
                if (c.ToString().Contains("System.Windows.Forms.ComboBox")) continue;
                if (c.ToString().Contains("System.Windows.Forms.NumericUpDown")) continue;
                if (c.ToString().Contains("System.Windows.Forms.MaskedTextBox")) continue;
                
                sw.WriteLine(c.Name + "=" + c.Text);
            }

            /*
                        foreach (System.Windows.Forms.ToolTip p in hint.tools) {

                        }
            */
        }

        void generateLang(string fn) {
            /*
                        List<Type> forms = new List<Type>();
                        foreach (Assembly asm in AppDomain.CurrentDomain.GetAssemblies()) {
                            forms.AddRange(from t in asm.GetTypes() where t.IsSubclassOf(typeof(Form)) select t);
                        }
                        foreach (object f in forms) {
                            Console.WriteLine ("f="+f.GetType());
                            string n = ((System.RuntimeType)f).
                        }
              */

            
            using (StreamWriter sw = new StreamWriter(fn)) {       //Write   
                sw.WriteLine("[" + this.Name + "]");

                parseControls(sw, this.Controls);

                sw.Close();
            }


        }

        uint16_t convertTimes(){
            int v0,v1,v2,v3;
            
            v0 = (int)myConvert(txtTime0.Text);
            v1 = (int)myConvert(txtTime1.Text);
            v2 = (int)myConvert(txtTime2.Text);
            v3 = (int)myConvert(txtTime3.Text);
            
            if (v0 < 0) v0 = 0; if (v0 > 15) v0 = 15;
            if (v1 < 0) v1 = 0; if (v1 > 15) v1 = 15;
            if (v2 < 0) v2 = 0; if (v2 > 15) v2 = 15;
            if (v3 < 0) v3 = 0; if (v3 > 15) v3 = 15;

            return (uint16_t)((v3 << (4 * 3)) | (v2 << (4 * 2)) | (v1 << (4 * 1)) | v0);
        }

        void updateTimes(int v){
            txtTime0.Text = (v & 0xf).ToString ();
            v = v>>4;
            txtTime1.Text = (v & 0xf).ToString();
            v = v >> 4;
            txtTime2.Text = (v & 0xf).ToString();
            v = v >> 4;
            txtTime3.Text = (v & 0xf).ToString();
            
        }

        void com_thread_proc(){
            fDone=false;
            while (!fDone) {
                if (!comBusy && !flag_EEPROM_read) {
                    try {
                        if (comPort.IsOpen && comPort.BytesToRead > 0) {
                            string s = comPort.ReadExisting();
                            Console.Write(s);
                        }
                    } catch { }
                }
                System.Threading.Thread.Sleep(10);
            }
        }
        private void startListen(){
            if (!comPort.IsOpen) {
                comPort.PortName = CMB_ComPort.Text; ;
                comPort.BaudRate = 57600;
                try {
                    comPort.Open();
                } catch{
                    //nothing
                }
            }

            com_thread = new System.Threading.Thread(com_thread_proc);
            com_thread.Start();
        }

        private void btnListen_Click(object sender, EventArgs e) {
             startListen();
        }

        private void chkByTime_CheckedChanged(object sender, EventArgs e) {
            bool flg = chkByTime.Checked ;
            pan.flgTimedSwitch = flg;

            lblTimes.Visible = flg;
            txtTime0.Visible = flg;
            txtTime1.Visible = flg;
            txtTime2.Visible = flg;
            txtTime3.Visible = flg;
        }

        private void cbBattB_source_SelectedIndexChanged(object sender, EventArgs e) {        
            pan.flgBattB = (cbBattB_source.SelectedIndex > 0);
            batt2_used = (pan.flgBattB);

            update_used_pins();
            txtBattB_k.Enabled = pan.flgBattB;
        }

        private void toolStripProgressBar1_Click(object sender, EventArgs e) {

        }

        private void aTmega644ToolStripMenuItem_Click(object sender, EventArgs e) {

        }

        private void groupBox16_Enter(object sender, EventArgs e) {

        }

        

        

        

        

        
    


    }
}
