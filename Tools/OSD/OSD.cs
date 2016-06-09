



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

        //*****************************************/		
        public const string VERSION = "r851 DV";

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
            MAVLINK_PARSE_STATE_GOT_CRC1
        }; ///< The state machine for the comm parser

        public struct mavlink_status {
            public uint8_t msg_received;               /// Number of received messages
            public uint8_t buffer_overrun;             /// Number of buffer overruns
            public uint8_t parse_error;                /// Number of parse errors
            public mavlink_parse_state_t parse_state;  /// Parsing state machine
            public uint8_t packet_idx;                 /// Index in current packet
            public uint8_t current_rx_seq;             /// Sequence number of last packet received
            public uint8_t current_tx_seq;             /// Sequence number of last packet sent
            public uint16_t packet_rx_success_count;   /// Received packets
            public uint16_t packet_rx_drop_count;      /// Number of packet drops
        };

        public mavlink_status status = new mavlink_status() { msg_received=0, buffer_overrun=0, parse_error=0, parse_state=mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE, packet_idx= 0, current_rx_seq =0, current_tx_seq=0, packet_rx_success_count=0, packet_rx_drop_count =0 };

        public mavlink_message rxmsg;

        public const int npanel = 4; // количество панелей 

        /*------------------------------------------------*/
        public int panel_number = 0;

        const Int16 toggle_offset = 3;
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
        System.Threading.Thread tlog_thread;
        public System.Threading.Thread com_thread;
        public bool com_run=false;

        bool RSSI_used = false; //  использование дополнительных ног
        bool curr_used = false;
        bool batt1_used = false;

        string CurrentCOM;

        public OSD() {

            conf = new Config(this); // конфиг по умолчанию

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
                bgpicture = Image.FromFile("vlcsnap-2012-01-28-07h46m04s95.png");
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



            for (n = 0; n < npanel; n++) { // для всех панелей
                a = 0;
                var pi = scr[n].panelItems;

                // Display name,printfunction,X,Y,ENaddress,Xaddress,Yaddress
                pi[a++] = new Panel("Horizon", pan.panHorizon, 8, 5, panHorizon_XY, 1, UI_Mode.UI_Checkbox, 0, "Show HUD frame", 0, "Show ILS", 1, "Show Radar", 0 , "  with track"); // first!

                //pi[a++] = new Panel("Center", pan.panCenter, 13, 8, panCenter_XY);
                pi[a++] = new Panel("Pitch", pan.panPitch, 7, 1, panPitch_XY);
                pi[a++] = new Panel("Roll", pan.panRoll, 13, 1, panRoll_XY);
                pi[a++] = new Panel("Battery A", pan.panBatt_A, 14, 13, panBatt_A_XY, 1);
                pi[a++] = new Panel("Battery B", pan.panBatt_B, 14, 12, panBatt_B_XY, 1);
                pi[a++] = new Panel("Visible Sats", pan.panGPSats, 26, 11, panGPSats_XY, 1, UI_Mode.UI_Checkbox, 0,"Icon in tail");
                pi[a++] = new Panel("Real heading", pan.panCOG, 22, 14, panCOG_XY, 1);
                pi[a++] = new Panel("GPS Coord", pan.panGPS, 1, 14, panGPS_XY, 1, UI_Mode.UI_Checkbox, 0, "use less precision (5 digits)", 0, "Show only fractional", 0, "Display in row");
                //        pi[a++] = new Panel("GPS Coord 2", pan.panGPS2, 2, 0, panGPS2_XY, 1, UI_Mode.UI_Checkbox, 0, "use less precision (5 digits)", 0, "Show only fractional");

                pi[a++] = new Panel("Heading Rose", pan.panRose, 10, 11, panRose_XY, 0, UI_Mode.UI_Checkbox, 0,"Marker below rose", 0, "Even panel length");
                pi[a++] = new Panel("Heading", pan.panHeading, 21, 11, panHeading_XY, 0);
                //          pi[a++] = new Panel("Heart Beat", pan.panMavBeat, 14, 15, panMavBeat_XY;
                pi[a++] = new Panel("Home Direction", pan.panHomeDir, 14, 3, panHomeDir_XY);
                pi[a++] = new Panel("Home Distance", pan.panHomeDis, 22, 1, panHomeDis_XY, 1);
                pi[a++] = new Panel("WP Direction", pan.panWPDir, 4, 9, panWPDir_XY);
                pi[a++] = new Panel("WP Distance", pan.panWPDis, 1, 11, panWPDis_XY, 1);

                pi[a++] = new Panel("Altitude", pan.panAlt, 22, 3, panAlt_XY, 1, UI_Mode.UI_Checkbox, 0, "Reset to 0 on arming");
                pi[a++] = new Panel("Home Altitude", pan.panHomeAlt, 22, 2, panHomeAlt_XY, 1);
                pi[a++] = new Panel("Vertical Speed", pan.panClimb, 1, 8, panClimb_XY, 1, UI_Mode.UI_Checkbox, 0 , "show in m/s");
                pi[a++] = new Panel("Battery Percent", pan.panBatteryPercent, 14, 15, panBatteryPercent_XY, 1, UI_Mode.UI_Checkbox, 0, "Show percent, not used mAH");
                pi[a++] = new Panel("Current", pan.panCur_A, 14, 14, panCurrA_XY, 1);

                pi[a++] = new Panel("Velocity", pan.panVel, 1, 2, panVel_XY, 1, UI_Mode.UI_Checkbox, 0, "Show in m/s");
                pi[a++] = new Panel("Air Speed", pan.panAirSpeed, 1, 1, panAirSpeed_XY, 1, UI_Mode.UI_Checkbox, 0, "Show in m/s");
                pi[a++] = new Panel("Throttle", pan.panThr, 1, 3, panThr_XY, 1);
                pi[a++] = new Panel("Flight Mode", pan.panFlightMode, 1, 13, panFMod_XY, 1);

                pi[a++] = new Panel("Wind Speed", pan.panWindSpeed, 24, 7, panWindSpeed_XY, 1, UI_Mode.UI_Checkbox, 0, "Show in m/s");
                pi[a++] = new Panel("Warnings", pan.panWarn, 9, 4, panWarn_XY);
                pi[a++] = new Panel("Time", pan.panTime, 23, 4, panTime_XY,-1, UI_Mode.UI_Checkbox, 0,"Blinking semicolon");
                pi[a++] = new Panel("RSSI", pan.panRSSI, 7, 13, panRSSI_XY, 1);
                pi[a++] = new Panel("Tune", pan.panTune, 21, 10, panTune_XY, 1);
                pi[a++] = new Panel("Efficiency", pan.panEff, 1, 11, panEff_XY, 1);
                pi[a++] = new Panel("Call Sign", pan.panCALLSIGN, 1, 12, panCALLSIGN_XY);
                pi[a++] = new Panel("Channel Raw", pan.panCh, 21, 1, panCh_XY);
                pi[a++] = new Panel("Temperature", pan.panTemp, 1, 11, panTemp_XY);
                pi[a++] = new Panel("Trip Distance", pan.panDistance, 22, 2, panDistance_XY, 1);
                pi[a++] = new Panel("Radar Scale", pan.panRadarScale, 23, 9, panRadarScale_XY, 1);
                pi[a++] = new Panel("Flight Data", pan.panFData, 1, 2, panFdata_XY);
                pi[a++] = new Panel("Message", pan.panMessage, 2, 10, panMessage_XY, 1, UI_Mode.UI_Checkbox, 0, "Not scroll if not fit" /*,0,"Not show screen number"*/ );
                pi[a++] = new Panel("Sensor 1", pan.panSenor1, 0, 4, panSenor1_XY, -1, UI_Mode.UI_Checkbox, 1, "PWM input");
                pi[a++] = new Panel("Sensor 2", pan.panSenor2, 0, 5, panSenor2_XY, -1, UI_Mode.UI_Checkbox, 1, "PWM input");
                pi[a++] = new Panel("Sensor 3", pan.panSenor3, 0, 6, panSenor3_XY, -1, UI_Mode.UI_Checkbox, 1, "PWM input");
                pi[a++] = new Panel("Sensor 4", pan.panSenor4, 0, 7, panSenor4_XY, -1, UI_Mode.UI_Checkbox, 1, "PWM input");
                 //pi[a++] = new Panel("Baro Alt", pan.panBaroAlt, 1, 4, panBroAlt_XY, 1, -1);
                pi[a++] = new Panel("GPS HDOP", pan.panHdop, 1, 6, panHdop_XY, 1);
                pi[a++] = new Panel("Channel state", pan.panState, 1, 5, panState_XY, 1, UI_Mode.UI_Combo, 0, "Select channel");
                pi[a++] = new Panel("Channel Scale", pan.panScale, 1, 5, panScale_XY, 1, UI_Mode.UI_Combo_Cb, 0, "Select channel",-1,"Extended range (800-2200)");
                pi[a++] = new Panel("Channel Value", pan.panCvlaue, 1, 5, panCvalue_XY, 1, UI_Mode.UI_Combo, 0, "Select channel");


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
                            } else {
                                tn.Checked = true;
                            }
                        }
                    }

                }
                li.CheckBoxes = true;
                li.Sort();
                startup = false;

                Draw(n);

            }	// цикл по экранам




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

            if (pan.ch_toggle >= toggle_offset && pan.ch_toggle < 9)
                ONOFF_combo.SelectedIndex = pan.ch_toggle - toggle_offset;
            else
                ONOFF_combo.SelectedIndex = 0; //reject garbage from the red file

            CHK_pal.Checked = Convert.ToBoolean(pan.pal_ntsc);
            CHK_auto.Checked = Convert.ToBoolean(pan.mode_auto);

//            chkHUD.Checked = Convert.ToBoolean(pan.flgHUD);
            chkTrack.Checked = Convert.ToBoolean(pan.flgTrack);

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

            cbCurrentSoure.SelectedIndex = pan.flgCurrent ? 1 : 0;

            chkRadar.Checked = pan.flgRadar;
            chkILS.Checked = pan.flgILS;
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
            return (p.Altf==1?1:0) + (p.Alt2==1?2:0) + (p.Alt3==1?4:0) + (p.Alt4==1?8:0);
        }

        public void drawNode(TreeNode tn) {
            Panel thing = (Panel)tn.Tag;

            selectedrectangle = thing.name == currentlyselected;

            processingpanel = thing.name;

            // ntsc and below the middle line
            if (thing.y >= getCenter() && !(CHK_pal.Checked || CHK_auto.Checked)) {
                thing.show(thing.x, thing.y - 3, thing.sign, getAlt(thing));
            } else { // pal and no change
                thing.show(thing.x, thing.y, thing.sign, getAlt(thing));
            }
        }

        // draw image and characters overlay
        public void Draw(int k) {
            if (k < 0 || k >= npanel)
                return;

            panel_number = k;
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
            BUT_CopyScreen.Visible = false;
            BUT_ClearScreen.Visible = false;

            if (cbxModelType.Items.Count == 0)
                cbxModelType.DataSource = Enum.GetValues(typeof(ModelType));
//            if (cbxWarningsAutoPanelSwitch.Items.Count == 0)
//                cbxWarningsAutoPanelSwitch.DataSource = Enum.GetValues(typeof(PanelsAutoSwitch));

            string strVersion = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
            this.Text = this.Text + " " + strVersion + " - Pre-Release " + VERSION;
            currentVersion = strVersion + VERSION;

            CMB_ComPort.Items.AddRange(GetPortNames());

            if (CMB_ComPort.Items.Count > 0)
                CMB_ComPort.SelectedIndex = 0;

            xmlconfig(false);

            Draw(panel_number);

        }





        private void checkedListBox1_ItemCheck(object sender, ItemCheckEventArgs e) {
            // add a delay to this so it runs after the control value has been defined.
            if (this.IsHandleCreated)
                this.BeginInvoke((MethodInvoker)delegate {
                    Draw(panel_number);
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
            int wr_start = 0;
            int wr_length = 0;
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
                //если да то pan.flgBattB=true
                pan.flgBattB = false;
                for (int i = 0; i < npanel; i++) {
                    foreach (var p in scr[i].panelItems) {
                        if ((p != null) && ((p.name == "Battery B")) && p.pos != -1) {
                            var trArray = scr[i].LIST_items.Nodes.Find(p.name, true);
                            pan.flgBattB |= trArray[0].Checked;
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
                conf.eeprom.sets.auto_screen_switch = pan.auto_screen_switch;

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
                conf.eeprom.flags[useExtCurr] = pan.flgCurrent;
                conf.eeprom.flags[radar_on] = pan.flgRadar;
                conf.eeprom.flags[ils_on] = pan.flgILS;

                conf.eeprom.flags[flgTrack] = pan.flgTrack;
                conf.eeprom.flags[flgHUD] = pan.flgHUD;

                conf.eeprom.sets.pwm_src = pan.pwm_src;
                conf.eeprom.sets.pwm_dst = pan.pwm_dst;
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

            } else if (panel_number >= 0 && panel_number < npanel) {
                //First Panel 

                wr_start = panel_number * OffsetBITpanel;
                wr_length = OffsetBITpanel;

                // все что мы тут делаем это задаем	ПОЛНЫЙ список всех существующих	панелей на всех экранах		

                List<TreeNode> AllNodes = new List<TreeNode>();
                foreach (TreeNode tn in this.scr[this.panel_number].LIST_items.Nodes) {
                    foreach (TreeNode tn2 in tn.Nodes) {
                        AllNodes.Add(tn2);
                    }
                    AllNodes.Add(tn);
                }

                foreach (TreeNode tn in AllNodes) {
                    string str = tn.Text;
                    foreach (var pan in scr[panel_number].panelItems) {
                        if ((pan != null) && ((pan.name == str)) && pan.pos != -1) {
                            TreeNode[] trArray = scr[panel_number].LIST_items.Nodes.Find(str, true);
                            conf.setEepromXY(pan, trArray[0].Checked);

                            //Console.WriteLine(str);
                        }
                    }
                }

            }

            if (wr_length == 0) {
                MessageBox.Show("Zero write length!");
                return;
            }

            int err;
            if (current.Text == "Config") {
                err = conf.writeEEPROM(wr_start, wr_length);
                if (err > 0)
                    MessageBox.Show("Failed to upload new configuration data");
                else if (err == 0)
                    toolStripStatusLabel1.Text = "Done writing configuration data!";

            } else if (panel_number >= 0 && panel_number < npanel) {
                err = conf.writeEEPROM(wr_start, wr_length);
                if (err > 0)
                    MessageBox.Show("Failed to upload new Panel data");
                else if (err == 0) {
                    //MessageBox.Show("Done writing Panel data!");
                    toolStripStatusLabel1.Text = "EEPROM write done";
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
                panel_number = k;

                List<TreeNode> AllNodes = new List<TreeNode>();
                foreach (TreeNode tn in scr[panel_number].LIST_items.Nodes) {
                    foreach (TreeNode tn2 in tn.Nodes) {
                        AllNodes.Add(tn2);
                    }
                    AllNodes.Add(tn);
                }

                foreach (TreeNode tn in AllNodes) {
                    string str = tn.Text;
                    foreach (var it in scr[panel_number].panelItems_default) {
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

            conf.eeprom.sets.auto_screen_switch = pan.auto_screen_switch;
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

            conf.eeprom.flags[flgTrack] = pan.flgTrack;
            conf.eeprom.flags[flgHUD] = pan.flgHUD;

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


            int err = conf.writeEEPROM(0, Config.EEPROM_SIZE);
            if (err > 0) {
                MessageBox.Show("Failed to upload configuration data");
                return 1;
            } else if (err == 0) {
                //MessageBox.Show("Done writing configuration data!");
                toolStripStatusLabel1.Text = "EEPROM write done";
                start_clear_timeout();
                return 0;
            }
            return -err;

        }



        private void comboBox1_Click(object sender, EventArgs e) {
            CMB_ComPort.Items.Clear();
            CMB_ComPort.Items.AddRange(GetPortNames());
        }



        private void checkBox1_CheckedChanged(object sender, EventArgs e) {
            Draw(panel_number);
        }

        private void OSD_Resize(object sender, EventArgs e) {

            try {
                Draw(panel_number);

            } catch { }
        }



        private void BUT_ReadOSD_Click(object sender, EventArgs e) {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            this.toolStripStatusLabel1.Text = "";

            bool fail = conf.readEEPROM(Config.EEPROM_SIZE);

            if (fail)
                return;


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

            int tN = panel_number;
            for (int k = 0; k < npanel; k++) {
                panel_number = k;
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

                            if (pi.ui_mode == UI_Mode.UI_Combo) {
                                // pi.Altf = (p.y & 0x40) == 0 ? 0 : 1; // TODO -TY - is this right?
                                pi.Alt2 = (p.y & 0x20) == 0 ? 0 : 1;                            
                                pi.Alt3 = (p.y & 0x10) == 0 ? 0 : 1;                            
                                pi.Alt4 = (p.x & 0x40) == 0 ? 0 : 1;
                            } else {
                                if(pi.Altf >=0)
                                    pi.Altf = (p.y & 0x40) == 0 ? 0 : 1;
                                if (pi.Alt2 >= 0)
                                    pi.Alt2 = (p.y & 0x20) == 0 ? 0 : 1;
                                if (pi.Alt3 >= 0)
                                    pi.Alt3 = (p.y & 0x10) == 0 ? 0 : 1;
                                if (pi.Alt3 >= 0)
                                    pi.Alt4 = (p.x & 0x40) == 0 ? 0 : 1;
                            }
                            pi.x = (byte)Constrain(p.x & 0x3f, 0, SCREEN_W);
                            pi.y = (byte)Constrain(p.y & 0x0f, 0, SCREEN_H);

                            
                        }
                    }
                }
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

                pan.rssical = conf.eeprom.sets.RSSI_16_high;
                //RSSI_numeric_max.Value = pan.rssical;

                pan.rssipersent = conf.eeprom.sets.RSSI_16_low;
                //RSSI_numeric_min.Value = pan.rssipersent;

                pan.rssiraw_on = conf.eeprom.sets.OSD_RSSI_RAW;

                updatingRSSI = true;
                RSSI_numeric_min.Minimum = 0;
                RSSI_numeric_min.Maximum = 2047;
                RSSI_numeric_max.Minimum = 0;
                RSSI_numeric_max.Maximum = 2047;
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

                pan.auto_screen_switch = conf.eeprom.sets.auto_screen_switch;
                //cbxWarningsAutoPanelSwitch.SelectedItem = (PanelsAutoSwitch)pan.auto_screen_switch;

                pan.switch_mode = conf.eeprom.sets.switch_mode;
                TOGGLE_BEH.Checked = pan.switch_mode != 0;

                pan.pal_ntsc = conf.eeprom.flags[pal_ntsc];
                CHK_pal.Checked = pan.pal_ntsc;
                
                pan.mode_auto = conf.eeprom.flags[mode_auto];
                CHK_auto.Checked = pan.mode_auto;

                CHK_ntsc.Checked = !(pan.mode_auto || pan.pal_ntsc);

                pan.flgTrack = conf.eeprom.flags[flgTrack];
                pan.flgHUD = conf.eeprom.flags[flgHUD];

                chkTrack.Checked = pan.flgTrack;
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

                pan.flgCurrent = conf.eeprom.flags[useExtCurr];
                cbCurrentSoure.SelectedIndex = pan.flgCurrent ? 1 : 0;

                pan.flgRadar = conf.eeprom.flags[radar_on];
                chkRadar.Checked = pan.flgRadar;

                pan.flgILS = conf.eeprom.flags[ils_on];
                chkILS.Checked = pan.flgILS;

                pan.pwm_src = conf.eeprom.sets.pwm_src;
                pan.pwm_dst = conf.eeprom.sets.pwm_dst;
                chkSwitchOnce.Checked = conf.eeprom.flags[osd_switch_once];
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
            Draw(panel_number = tN);

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
                    Console.WriteLine("len {0} add {1} opt {2}", length, address, option);

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
        }


        private void CHK_pal_CheckedChanged(object sender, EventArgs e) {
            if (!CHK_auto.Checked) {
                changeToPal(CHK_pal.Checked);

                Draw(panel_number);
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
                Draw(panel_number);

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
                            sw.WriteLine("{0}", "Panel " + k);
                            foreach (var item in this.scr[k].panelItems) {
                                if (item != null) {
                                    TreeNode[] tnArray = scr[k].LIST_items.Nodes.Find(item.name, true);
                                    if (tnArray.Length > 0)
                                        sw.WriteLine("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}\t{8}", item.name, item.x, item.y, tnArray[0].Checked.ToString(), item.sign, item.Altf, item.Alt2, item.Alt3, item.Alt4);
                                }
                            }
                        }

                        //Config 
                        sw.WriteLine("{0}", "Configuration");
                        sw.WriteLine("{0}\t{1}", "Model Type", (byte)(ModelType)cbxModelType.SelectedItem); //We're just saving what's in the config screen, not the eeprom model type
                        sw.WriteLine("{0}\t{1}", "Units", pan.converts);
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
                        sw.WriteLine("{0}\t{1}", "Call Sign", pan.callsign_str);
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

                        sw.WriteLine("{0}\t{1}", "fRadar", pan.flgRadar);
                        sw.WriteLine("{0}\t{1}", "fILS", pan.flgILS);
                        sw.WriteLine("{0}\t{1}", "HOS", pan.horiz_offs);
                        sw.WriteLine("{0}\t{1}", "VOS", pan.vert_offs);
                        // выходной PWM
                        sw.WriteLine("{0}\t{1}", "PWMSRC", pan.pwm_src);
                        sw.WriteLine("{0}\t{1}", "PWMDST", pan.pwm_dst);
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

            startup = true;

            string[] strings = { "" };

            if (ofd.FileName != "") {
                try {
                    using (StreamReader sr = new StreamReader(ofd.OpenFile())) {
                        while (!sr.EndOfStream) {
                            //Panel 1
                            //string stringh = sr.ReadLine(); //
                            string[] hdr = sr.ReadLine().Split(new char[] { '\x20' }, StringSplitOptions.RemoveEmptyEntries);
                            int k = 0;

                            if (hdr[0] != "Panel")
                                break;

                            k = int.Parse(hdr[1]);
                            //while (!sr.EndOfStream)
                            for (int i = 0; i < osd_functions_N; i++) {
                                strings = sr.ReadLine().Split(new char[] { '\t' }, StringSplitOptions.RemoveEmptyEntries);
                                for (int a = 0; a < scr[k].panelItems.Length; a++) {
                                    if (this.scr[k].panelItems[a] != null && scr[k].panelItems[a].name == strings[0]) {
                                        var pi = scr[k].panelItems[a];
                                        // incase there is an invalid line number or to shore
                                        try {
                                            //scr[k].panelItems[a] = new Panel(pi.name, pi.show, int.Parse(strings[1]), int.Parse(strings[2]), pi.pos);
                                            pi.x = int.Parse(strings[1]);
                                            pi.y = int.Parse(strings[2]);
                                            if (!int.TryParse(strings[4], out pi.sign)) {
                                                pi.sign = 1;
                                            }
                                            // if TryParse fails, default is zero
                                            int.TryParse(strings[5], out pi.Altf);
                                            int.TryParse(strings[6], out pi.Alt2);
                                            int.TryParse(strings[7], out pi.Alt3);
                                            int.TryParse(strings[8], out pi.Alt4);

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
                                    pan.converts = byte.Parse(strings[1]) != 0;
                                } catch {
                                    pan.converts = bool.Parse(strings[1]);
                                } else if (strings[0] == "Overspeed")
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
                            else if (strings[0] == "Call Sign") pan.callsign_str = strings[1];
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
                            else if (strings[0] == "fRadar") pan.flgRadar = bool.Parse(strings[1]);
                            else if (strings[0] == "fILS") pan.flgILS = bool.Parse(strings[1]);
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
                        }

                        //pan.model_type = (byte)cbxModelType.SelectedItem;

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

                        OVERSPEED_numeric.Value = pan.overspeed;
                        STALL_numeric.Value = pan.stall;
                        MINVOLT_numeric.Value = Convert.ToDecimal(pan.battv) / Convert.ToDecimal(10.0);

                        //RSSI_numeric_max.Value = pan.rssical;
                        //RSSI_numeric_min.Value = pan.rssipersent;

                        updatingRSSI = true;
                        RSSI_numeric_min.Minimum = 0;
                        RSSI_numeric_min.Maximum = 2047;
                        RSSI_numeric_max.Minimum = 0;
                        RSSI_numeric_max.Maximum = 2047;
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

                        if (pan.ch_toggle >= toggle_offset && pan.ch_toggle < 9) ONOFF_combo.SelectedIndex = pan.ch_toggle - toggle_offset;
                        else ONOFF_combo.SelectedIndex = 0; //reject garbage from the red file

                        //cbxWarningsAutoPanelSwitch.SelectedItem = (PanelsAutoSwitch)pan.auto_screen_switch;
                        TOGGLE_BEH.Checked = Convert.ToBoolean(pan.switch_mode);

                        CHK_pal.Checked = Convert.ToBoolean(pan.pal_ntsc);
                        CHK_auto.Checked = Convert.ToBoolean(pan.mode_auto);

                        //chkHUD.Checked = Convert.ToBoolean(pan.flgHUD);
                        chkTrack.Checked = Convert.ToBoolean(pan.flgTrack);

                        BATT_WARNnumeric.Value = pan.batt_warn_level;
                        RSSI_WARNnumeric.Value = pan.rssi_warn_level;

                        BRIGHTNESScomboBox.SelectedIndex = pan.osd_brightness;

                        try {
                            numHOS.Value = pan.horiz_offs - 0x20;
                            numVOS.Value = pan.vert_offs - 0x10;
                        } catch {
                            pan.horiz_offs = (byte)numHOS.Value;
                            pan.vert_offs = (byte)numVOS.Value;
                        }

                        CALLSIGNmaskedText.Text = pan.callsign_str;

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
                        cbCurrentSoure.SelectedIndex = pan.flgCurrent ? 1 : 0;

                        chkRadar.Checked = pan.flgRadar;
                        chkILS.Checked = pan.flgILS;

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
            }
            startup = false;
            Draw(panel_number);

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

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "*.hex|*.hex";
            if (ofd.ShowDialog() == System.Windows.Forms.DialogResult.Cancel)
                return;

            if (ofd.FileName != "") {
                byte[] FLASH;
                bool spuploadflash_flag = false;
                try {
                    toolStripStatusLabel1.Text = "Reading Hex File";

                    statusStrip1.Refresh();

                    FLASH = readIntelHEXv2(new StreamReader(ofd.FileName));
                } catch {
                    MessageBox.Show("Bad Hex File");
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
                            spuploadflash_flag = sp.uploadflash(FLASH, 0, FLASH.Length, 0);
                            if (!spuploadflash_flag) {
                                if (sp.keepalive())
                                    Console.WriteLine("keepalive successful (iter " + i + ")");
                                else
                                    Console.WriteLine("keepalive fail (iter " + i + ")");
                            } else
                                break;
                        }

                    } catch (Exception ex) {

                        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }

                } else {
                    MessageBox.Show("Failed to talk to bootloader");
                }

                sp.Close();

                if (spuploadflash_flag) {
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
                }
            }

            //read EEPROM 
            this.BUT_ReadOSD_Click(EventArgs.Empty, EventArgs.Empty);

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
                Draw(panel_number);

            }
        }

        private void stop_tlog(){
            tlog_thread.Abort();
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
                    grpTLog.Enabled = true;

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
                       //         case "ArduinoIDEPath":
                       //             arduinoIDEPath = xmlreader.ReadString();
                       //             break;
                      //          case "PlaneSketchPath":
                      //              planeSketchPath = xmlreader.ReadString();
                      //              break;
                      ///          case "CopterSketchPath":
//copterSketchPath = xmlreader.ReadString();
                       //             break;
                                case "AutoUpdate":
                                    autoUpdate = (xmlreader.ReadString().ToUpper() == "TRUE");
                                    cbxShowUpdateDialog.Checked = !autoUpdate;
                                    break;
                                case "CheckForUpdates":
                                    checkForUpdates = (xmlreader.ReadString().ToUpper() == "TRUE");
                                    cbxAutoUpdate.Checked = checkForUpdates;
                                    break;
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
            Application.DoEvents();

            this.BeginInvoke((MethodInvoker)delegate {
                sub_updateCharset();
            });
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
                        Console.WriteLine(comPort.ReadExisting());

                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    //comPort.WriteLine("");
                    //comPort.WriteLine("");
                    // comPort.WriteLine("");

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
                    string readFont = comPort.ReadLine();
                    if (!readFont.Contains("RFF")) {
                        MessageBox.Show("Error entering CharSet upload mode - invalid data: " + readFont);
                        comPort.Close();
                        start_clear_timeout();
                        return;
                    }

                } catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

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
                    while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed) {
                        try {
                            toolStripProgressBar1.Value = (int)((br.BaseStream.Position / (float)br.BaseStream.Length) * 100);


                            int read = 256 * 3;// 163847 / 256 + 1; // 163,847 font file
                            if ((br.BaseStream.Position + read) > br.BaseStream.Length) {
                                read = (int)(br.BaseStream.Length - br.BaseStream.Position);
                            }
                            length -= read;
                            byte[] buffer = br.ReadBytes(read);
                            Console.WriteLine("write " + buffer.ToString());
                            comPort.Write(buffer, 0, buffer.Length);
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
                            //Console.WriteLine("responce "+resp );
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

                        if (t > 10) {
                            MessageBox.Show("No end");
                            start_clear_timeout();
                            comPort.Close();
                            return;
                        }
                    }
                    //Console.WriteLine(comPort.ReadExisting());
                    if (comPort.BytesToRead != 0)
                        comPort.ReadLine();

                    comPort.WriteLine("\r\n\r\n\r\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    System.Threading.Thread.Sleep(50);
                    Application.DoEvents();

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(50);
                    Application.DoEvents();

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

            Draw(panel_number);

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

            Draw(panel_number);

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
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                OVERSPEED_label.Text = "Overspeed (km/h)";
            } else if (UNITS_combo.SelectedIndex == 1) {
                pan.converts = true; //imperial
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                OVERSPEED_label.Text = "Overspeed (mph)";
            }

            if (modelType == ModelType.Plane) {
                if (!customImage)
                    bgpicture = Image.FromFile("vlcsnap-2012-01-28-07h46m04s95.png");
            } else if (modelType == ModelType.Copter) {
                if (!customImage)
                    try {
                        bgpicture = Image.FromFile("quad.png");
                    } catch (Exception ex) {
                        //fail = true;
                        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
            }

            Draw(panel_number);

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
            RSSI_numeric_min.Maximum = 2047;
            RSSI_numeric_max.Minimum = 0;
            RSSI_numeric_max.Maximum = 2047;
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


            Draw(panel_number);
        }

        private void updateCharsetDevToolStripMenuItem_Click(object sender, EventArgs e) {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            toolStripStatusLabel1.Text = "";

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "mcm|*.mcm";

            DialogResult dialogResp = ofd.ShowDialog();
            if ((dialogResp != System.Windows.Forms.DialogResult.OK) || (ofd.FileName.Trim() == ""))
                return;

            if (!IsValidCharsetFile(ofd))
                return;

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

            if (ofd.FileName != "") {
                if (comPort.IsOpen)
                    comPort.Close();

                try {

                    comPort.PortName = CMB_ComPort.Text;
                    comPort.BaudRate = 57600;

                    comPort.Open();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    System.Threading.Thread.Sleep(2);

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(2000);

                    comPort.ReadExisting();

                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");

                    int timeout = 0;

                    while (comPort.BytesToRead == 0) {
                        System.Threading.Thread.Sleep(500);
                        Console.WriteLine("Waiting...");
                        timeout++;

                        if (timeout > 6) {
                            MessageBox.Show("Error entering font mode - No Data");
                            comPort.Close();
                            start_clear_timeout();
                            return;
                        }
                    }
                    if (!comPort.ReadLine().Contains("RFF")) {
                        MessageBox.Show("Error entering CharSet upload mode - invalid data");
                        comPort.Close();
                        start_clear_timeout();
                        return;
                    }

                } catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

                using (var stream = ofd.OpenFile()) {

                    BinaryReader br = new BinaryReader(stream);
                    StreamReader sr2 = new StreamReader(br.BaseStream);

                    string device = sr2.ReadLine();

                    if (device != "MAX7456") {
                        MessageBox.Show("Invalid MCM");
                        comPort.Close();
                        start_clear_timeout();
                        return;
                    }

                    br.BaseStream.Seek(0, SeekOrigin.Begin);

                    long length = br.BaseStream.Length;
                    while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed) {
                        try {
                            toolStripProgressBar1.Value = (int)((br.BaseStream.Position / (float)br.BaseStream.Length) * 100);
                            toolStripStatusLabel1.Text = "CharSet Uploading";


                            int read = 256 * 3;// 163847 / 256 + 1; // 163,847 font file
                            if ((br.BaseStream.Position + read) > br.BaseStream.Length) {
                                read = (int)(br.BaseStream.Length - br.BaseStream.Position);
                            }
                            length -= read;
                            byte[] buffer = br.ReadBytes(read);
                            comPort.Write(buffer, 0, buffer.Length);
                            int timeout = 0;

                            while (comPort.BytesToRead == 0 && read == 768) {
                                System.Threading.Thread.Sleep(10);
                                timeout++;

                                if (timeout > 10) {
                                    MessageBox.Show("CharSet upload failed - no response");
                                    comPort.Close();
                                    start_clear_timeout();
                                    return;
                                }
                            }

                            comPort.ReadExisting();
                            if (length < 1000) {
                                lblFWModelType.Text = lblFWModelType.Text;
                            }

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
                        t++;

                        if (t > 10) {
                            MessageBox.Show("No end");
                            comPort.Close();
                            start_clear_timeout();
                            return;
                        }
                    }
                    //Console.WriteLine(comPort.ReadExisting());
                    if (comPort.BytesToRead != 0)
                        comPort.ReadLine();

                    comPort.WriteLine("\r\n\r\n\r\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    System.Threading.Thread.Sleep(50);

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(50);

                    comPort.Close();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    toolStripProgressBar1.Value = 100;
                    toolStripStatusLabel1.Text = "CharSet Done";
                }

                conf.WriteCharsetVersion(fileVersion);
                lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: " + ofd.SafeFileName;
                start_clear_timeout();
            }
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
                        spuploadflash_flag = sp.uploadflash(FLASH, 0, FLASH.Length, 0);
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


        private bool UploadFont(OpenFileDialog ofd) {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            toolStripStatusLabel1.Text = "";


            if (!IsValidCharsetFile(ofd))
                return false;

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

            if (ofd.FileName != "") {
                if (comPort.IsOpen)
                    comPort.Close();

                try {

                    comPort.PortName = CMB_ComPort.Text;
                    comPort.BaudRate = 57600;

                    comPort.Open();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    //System.Threading.Thread.Sleep(2);

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(1000);

                    comPort.ReadExisting();

                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");

                    int timeout = 0;

                    while (comPort.BytesToRead == 0) {
                        System.Threading.Thread.Sleep(500);
                        Console.WriteLine("Waiting...");
                        timeout++;

                        if (timeout > 6) {
                            MessageBox.Show("Error entering font mode - No Data");
                            comPort.Close();
                            start_clear_timeout();
                            return false;
                        }
                    }
                    if (!comPort.ReadLine().Contains("RFF")) {
                        MessageBox.Show("Error entering CharSet upload mode - invalid data");
                        start_clear_timeout();
                        comPort.Close();
                        start_clear_timeout();
                        return false;
                    }

                } catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return false; }

                using (var stream = ofd.OpenFile()) {

                    BinaryReader br = new BinaryReader(stream);
                    StreamReader sr2 = new StreamReader(br.BaseStream);

                    string device = sr2.ReadLine();

                    if (device != "MAX7456") {
                        MessageBox.Show("Invalid MCM");
                        comPort.Close();
                        start_clear_timeout();
                        return false;
                    }

                    br.BaseStream.Seek(0, SeekOrigin.Begin);

                    long length = br.BaseStream.Length;
                    while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed) {
                        try {
                            toolStripProgressBar1.Value = (int)((br.BaseStream.Position / (float)br.BaseStream.Length) * 100);
                            toolStripStatusLabel1.Text = "CharSet Uploading";


                            int read = 256 * 3;// 163847 / 256 + 1; // 163,847 font file
                            if ((br.BaseStream.Position + read) > br.BaseStream.Length) {
                                read = (int)(br.BaseStream.Length - br.BaseStream.Position);
                            }
                            length -= read;
                            byte[] buffer = br.ReadBytes(read);
                            comPort.Write(buffer, 0, buffer.Length);
                            int timeout = 0;

                            while (comPort.BytesToRead == 0 && read == 768) {
                                System.Threading.Thread.Sleep(10);
                                timeout++;

                                if (timeout > 10) {
                                    MessageBox.Show("CharSet upload failed - no response");
                                    comPort.Close();
                                    start_clear_timeout();
                                    return false;
                                    
                                }
                            }

                            comPort.ReadExisting();
                            if (length < 1000) {
                                lblFWModelType.Text = lblFWModelType.Text;
                            }

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
                        t++;

                        if (t > 10) {
                            MessageBox.Show("No end");
                            comPort.Close();
                            start_clear_timeout();
                            return false;
                        }


                    }
                    //Console.WriteLine(comPort.ReadExisting());
                    if (comPort.BytesToRead != 0)
                        comPort.ReadLine();

                    comPort.WriteLine("\r\n\r\n\r\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    System.Threading.Thread.Sleep(50);

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(50);

                    comPort.Close();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    toolStripProgressBar1.Value = 100;
                    toolStripStatusLabel1.Text = "CharSet Done";
                }

                conf.WriteCharsetVersion(fileVersion);
                lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: " + ofd.SafeFileName;
                start_clear_timeout();
            }
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

        private void updateCharsetcustomFwToolStripMenuItem_Click(object sender, EventArgs e) {
            #region Get and validate font file
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "mcm|*.mcm";

            DialogResult dialogResp = ofd.ShowDialog();
            if ((dialogResp != System.Windows.Forms.DialogResult.OK) || (ofd.FileName.Trim() == ""))
                return;

            if (!IsValidCharsetFile(ofd))
                return;
            #endregion

            //Get current fw version (plane, copter...)
            ModelType modelType = conf.GetModelType();
            modelType = ModelType.Copter;
            string modelFileName = "MinimOSD_" + modelType.ToString() + ".hex";
            if (modelType == ModelType.Unknown) {
                if (MessageBox.Show("Unknown current fw." + Environment.NewLine +
                                   "If you proceed you'll need to upload  the fw manually after charset upload." + Environment.NewLine +
                                   "Do you want to proceed?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == System.Windows.Forms.DialogResult.No)
                    return;
            }

            //Get latest fw from ftp
            if (!GetLatestFW(modelType)) {
                if (MessageBox.Show("Unable to get latest fw from internet." + Environment.NewLine +
                                   "If you proceed you'll need to upload the fw manually after charset upload." + Environment.NewLine +
                                   "Do you want to proceed?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == System.Windows.Forms.DialogResult.No)
                    return;
            }

            //Upload font fw
            if (!UploadFirmware("charuploader.hex")) {
                MessageBox.Show("Unable to write character uploader!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            //Upload font
            if (!UploadFont(ofd))
                return;

            //Upload fw
            if (modelType != ModelType.Unknown)
                UploadFirmware(modelFileName);
            else
                MessageBox.Show("Wrong ModelType!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);

            start_clear_timeout();
        }



        private void GetFwFromOSD() {
            byte[] FLASH = new byte[32 * 1024];
            //byte[] FLASH = new byte[30382];

            ArduinoSTK sp = OpenArduino();


            if (sp != null && sp.connectAP()) {
                try {
                    int start = 0;
                    short length = 0x100;

                    while (start < FLASH.Length) {
                        sp.setaddress(start);
                        sp.downloadflash(length).CopyTo(FLASH, start);
                        start += length;
                    }

                    StreamWriter sw = new StreamWriter(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + "FW" + Path.DirectorySeparatorChar + @"flash.bin", false);
                    BinaryWriter bw = new BinaryWriter(sw.BaseStream);
                    bw.Write(FLASH, 0, FLASH.Length);
                    bw.Close();

                    sw = new StreamWriter(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + "FW" + Path.DirectorySeparatorChar + @"flash.hex", false);
                    for (int i = 0; i < FLASH.Length; i += 16) {
                        string add = string.Format("{0:X4}", i);
                        if (i % (0x1000 << 4) == 0) {
                            if (i != 0)
                                sw.WriteLine(":02000002{0:X4}{1:X2}", ((i >> 4) & 0xf000), 0x100 - (2 + 2 + (((i >> 4) & 0xf000) >> 8) & 0xff));
                        }
                        if (add.Length == 5) {
                            add = add.Substring(1);
                        }
                        sw.Write(":{0:X2}{1}00", 16, add);
                        byte ck = (byte)(16 + (i & 0xff) + ((i >> 8) & 0xff));
                        for (int a = 0; a < 16; a++) {
                            ck += FLASH[i + a];
                            sw.Write("{0:X2}", FLASH[i + a]);
                        }
                        sw.WriteLine("{0:X2}", (byte)(0x100 - ck));
                    }

                    sw.Close();
                } catch (Exception ex) {
                    MessageBox.Show(ex.Message);
                }

            }
            start_clear_timeout();
            sp.Close();
        }

        private void getFwFromOSDToolStripMenuItem_Click(object sender, EventArgs e) {
            GetFwFromOSD();
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
                //				sp.DtrEnable = true;
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

                Draw(k - 1);
                BUT_CopyScreen.Visible = true;
                BUT_ClearScreen.Visible = true;
            } else {
                panel_number = -1;
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
        }





        private void cbCurrentSoure_SelectedIndexChanged(object sender, EventArgs e) {
            pan.flgCurrent = (cbCurrentSoure.SelectedIndex > 0);
            curr_used = (pan.flgCurrent);

            update_used_pins();

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

        private void chkRadar_CheckedChanged(object sender, EventArgs e) {
            pan.flgRadar = chkRadar.Checked;
        }

        private void chkILS_CheckedChanged(object sender, EventArgs e) {
            pan.flgILS = chkILS.Checked;
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

		        if (false && c != (rxmsg.checksum & 0xFF)) {
        //mavlink_comm_0_port->printf_P(PSTR("\n CRC1 err! want=%d got=%d"), rxmsg->checksum & 0xFF, c);
			        // Check first checksum byte
			        status.parse_error++;
			        status.msg_received = 0;
			        if (c == MAVLINK_STX) {
                        status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_STX;
                        rxmsg.len = 0;
                        mavlink_start_checksum(ref rxmsg);

                    } else {
                        status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_IDLE;
			        }
		        } else {
 //  {
                    status.parse_state = mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_CRC1;
                    rxmsg.payload[status.packet_idx] = (byte)c;
		        }
		        break;

            case mavlink_parse_state_t.MAVLINK_PARSE_STATE_GOT_CRC1:
/*		        if (c != (rxmsg.checksum >> 8)) {
			        // Check second checksum byte
        //mavlink_comm_0_port->printf_P(PSTR("\nCRC2 err! want=%d got=%d"), rxmsg->checksum >> 8, c);

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
		        } else {
//*/ {
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

	        return status.msg_received!=0?(byte)2:(byte)0;
        }


        private void btnTLog_Click(object sender, EventArgs e) {
            tlog_run = !tlog_run;
            btnTLog.Text = tlog_run ? "Stop" : "Start";

            if (tlog_run) {
                CurrentCOM = CMB_ComPort.Text;
                tlog_thread = new System.Threading.Thread(thread_proc);
                tlog_thread.Start();
            } else {
                try {
                    tlog_thread.Abort();
                } catch {};
                try {
                    if (comPort.IsOpen)
                        comPort.Close();
                } catch {};
            }
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
            pan.flgTrack = chkTrack.Checked;
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

        void thread_proc() {
            byte[] bytes = tlog_data;
            int frStart = 0;
            int frEnd = 0;
            int frameIndex = 0;
            int np = 0;
            int[] last_seq = new int[256];
            string message;


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
                comPort.BaudRate = 57600;
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
                UInt64 stamp = (UInt64)((DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds * 1000);

                int byteIndex;
                try {
                    // MP writes as
                    // byte[] datearray = BitConverter.GetBytes((UInt64)((DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds * 1000));
                    // Array.Reverse(datearray);
                            
                    time = start_time = get_timestamp(bytes, 0);
                    for (byteIndex = 8; byteIndex < bytes.Length; byteIndex++) {
                        if (comPort.BytesToRead != 0)
                            Console.WriteLine(comPort.ReadExisting());


                        byte c = bytes[byteIndex];

                        switch (mavlink_parse_char(c)) {
                        case 1: // got STX
                            frStart = byteIndex;
                            break;
                        case 2: // got packet
                            frameIndex++;
                            frEnd = byteIndex;

                            while(comPort.BytesToWrite!=0) // подождем передачи пакета
                                System.Threading.Thread.Sleep(1); 

                            comPort.Write(bytes, frStart, frEnd - frStart + 1);

                            if (((last_seq[rxmsg.sysid] + 1) & 0xff) == rxmsg.seq) { // поймали синхронизацию
                                time = get_timestamp(bytes, byteIndex+1);  // skip parsed CRC2                              
                                byteIndex += 8; // skip timestamp
                            }
                            last_seq[rxmsg.sysid] = rxmsg.seq;
                            np++;
                            try {
                                this.Invoke((MethodInvoker)delegate {
                                    lblTLog.Text = np.ToString(); // runs on UI thread
                                });

                            } catch { };

                            double time_w = (DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds;
                            while(true){
                                UInt64 diff_log=(time - start_time);
                                UInt64 diff_real = ((UInt64)((DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds * 1000)) - stamp; // если время лога опережает реальное - задерживаемся
                                if(diff_log < diff_real) {
                                    //Console.WriteLine("go");
                                    break;
                                }

                                if (((DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds - time_w) > 100) { // но не реже 10 раз в секунду
                                    start_time=time; // ждали слишком долго, сместим метку времени в логе
                                    break;
                                } 
                                //Console.WriteLine("wait");
                                System.Threading.Thread.Sleep(1); 
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
                            Console.WriteLine(comPort.ReadExisting());
                    }
                } catch {
                    continue;
                }
            }

        }


        private void connectComPortToolStripMenuItem_Click(object sender, EventArgs e) {
        //
            frmComPort frm = new frmComPort(this);
            //frm.Show();
            frm.ShowInTaskbar =false;
            frm.ShowDialog(); // modal
        }

        private void BUT_CopyScreen_Click(object sender, EventArgs e)
        {
            CopyScreen frm = new CopyScreen(PANEL_tabs.SelectedIndex);
            frm.ShowInTaskbar = false;
            DialogResult res = frm.ShowDialog(); // modal
            if (res == DialogResult.OK) {
                int screen = frm.Selection;
                scr[PANEL_tabs.SelectedIndex-1].copyFrom(scr[screen-1]);
                Draw(panel_number);
            }

        }

        private void BUT_ClearScreen_Click(object sender, EventArgs e) {
            scr[PANEL_tabs.SelectedIndex - 1].clearScreen();
        }

    }
}
