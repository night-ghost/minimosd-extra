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


namespace OSD
{
    public partial class OSD : Form
    {
		
         //max 7456 datasheet pg 10
        //pal  = 16r 30 char
        //ntsc = 13r 30 char
public const int CHAR_W=12;
public const  int CHAR_H=18;

public const  int SCREEN_W=30;
public const  int SCREEN_H=16;
public const  int SCREEN_H_NTSC=13;		
		
		
        int panel_number = 0;
        const int npanel = 3; // количество панелей 
		
        const Int16 toggle_offset = 3;
        public Size basesize = new Size(OSD.SCREEN_W, SCREEN_H);
        /// <summary>
        /// the un-scaled font render image
        /// </summary>
        //Bitmap[] screen = new Bitmap[npanel];

        public Bitmap screen = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H * CHAR_H);
        //Bitmap screen2 = new Bitmap(30 * 12, 16 * 18);
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
        public string[] currentlyselected = new string[npanel];
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
        /// 328 eeprom memory
        /// </summary>
        byte[] eeprom = new byte[1024];
        /// <summary>
        /// background image
        /// </summary>
        Image bgpicture;
		public osd_screen[] scr = new osd_screen[npanel];

        public bool[] mousedown = new bool[npanel];
        //bool mousedown1 = false;
        //bool mousedown2 = false;

        SerialPort comPort = new SerialPort();

        Panels pan;
        int nosdfunctions = 0;
		
		public  int panel_num=0;
				
		
//        Tuple<string, Func<int, int, int>, int, int, int, int, int>[] panelItems = new Tuple<string, Func<int, int, int>, int, int, int, int, int>[32];
//        Tuple<string, Func<int, int, int>, int, int, int, int, int>[] panelItems_default = new Tuple<string, Func<int, int, int>, int, int, int, int, int>[32];
//			
//		Tuple<string, Func<int, int, int>, int, int, int, int, int>[] panelItems2 = new Tuple<string, Func<int, int, int>, int, int, int, int, int>[32];
//        Tuple<string, Func<int, int, int>, int, int, int, int, int>[] panelItems2_default = new Tuple<string, Func<int, int, int>, int, int, int, int, int>[32];

       
        //Graphics gr2;
        //s
        int print_x; // текущие координаты вывода
        int print_y;

        Boolean fwWasRead = false;

        public OSD()
        {
			

			int i;
			for(i=0;i<npanel;i++) {
				var s = new osd_screen(i, this );
				scr[i]=s;
			}

            InitializeComponent();


            // load default font
            chars = mcm.readMCM("MinimOSD_" + System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString() + ".mcm");
            lblPresentedCharset.Text = "Presented Charset: " + "MinimOSD_" + System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString() + ".mcm";
            // load default bg picture
            try
            {
                bgpicture = Image.FromFile("vlcsnap-2012-01-28-07h46m04s95.png");
            }
            catch { }
            for (i = 0; i < npanel; i++)
            {
                mousedown[i] = false;
                currentlyselected[i] = "";
            }
            print_x = 0;
            print_y = 0;
			
			screen = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H * CHAR_H);
            gr = Graphics.FromImage(screen);

            pan = new Panels(this);

            // setup all panel options
            setupFunctions(); //setup panel item box
        }

        void changeToPal(bool pal)
        {
            if (pal)
            {
                basesize = new Size(SCREEN_W, SCREEN_H);                
                
                screen = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H * CHAR_H);
                
                image = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H * CHAR_H);
				
				for(int k=0;k<npanel;k++){
                	scr[panel_number].NUM_X.Maximum = SCREEN_W-1;
                	scr[panel_number].NUM_Y.Maximum = SCREEN_H-1;
				}
                
            }
            else
            {
                basesize = new Size(SCREEN_W, SCREEN_H_NTSC);

                screen = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H_NTSC * CHAR_H);
 
                image = new Bitmap(SCREEN_W * CHAR_W, SCREEN_H_NTSC * CHAR_H);
				for(int k=0;k<npanel;k++){
                	scr[panel_number].NUM_X.Maximum = SCREEN_W-1;
                	scr[panel_number].NUM_Y.Maximum = SCREEN_H-1;                
				}
            }


        }
        //Set item boxes
        void setupFunctions()
        {
            //currentlyselected1 = "";
            //currentlyselected2 = "";
            processingpanel = "";


            int a = 0;
			int n;

            for (a = 0; a < usedPostion.Length; a++)
            {
                usedPostion[a] = new string[SCREEN_H];
            }

            

		  	for(n=0;n<npanel;n++){ // для всех панелей
				a = 0;
				var pi=this.scr[n].panelItems;
	            // first 8
	            // Display name,printfunction,X,Y,ENaddress,Xaddress,Yaddress
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Center", pan.panCenter, 13, 8, panCenter_en_ADDR, panCenter_x_ADDR, panCenter_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Pitch", pan.panPitch, 7, 1, panPitch_en_ADDR, panPitch_x_ADDR, panPitch_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Roll", pan.panRoll, 13, 1, panRoll_en_ADDR, panRoll_x_ADDR, panRoll_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Battery A", pan.panBatt_A, 14, 13, panBatt_A_en_ADDR, panBatt_A_x_ADDR, panBatt_A_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Battery B", pan.panBatt_B, 21, 3, panBatt_B_en_ADDR, panBatt_B_x_ADDR, panBatt_B_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Visible Sats", pan.panGPSats, 26, 11, panGPSats_en_ADDR, panGPSats_x_ADDR, panGPSats_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Real heading", pan.panCOG, 22, 14, panCOG_en_ADDR, panCOG_x_ADDR, panCOG_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("GPS Coord", pan.panGPS, 1, 14, panGPS_en_ADDR, panGPS_x_ADDR, panGPS_y_ADDR);
	
	            //second 8
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Heading Rose", pan.panRose, 21, 15, panRose_en_ADDR, panRose_x_ADDR, panRose_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Heading", pan.panHeading, 24, 13, panHeading_en_ADDR, panHeading_x_ADDR, panHeading_y_ADDR);
	//          pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Heart Beat", pan.panMavBeat, 14, 15, panMavBeat_en_ADDR, panMavBeat_x_ADDR, panMavBeat_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Home Direction", pan.panHomeDir, 14, 3, panHomeDir_en_ADDR, panHomeDir_x_ADDR, panHomeDir_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Home Distance", pan.panHomeDis, 22, 1, panHomeDis_en_ADDR, panHomeDis_x_ADDR, panHomeDis_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("WP Direction", pan.panWPDir, 20, 12, panWPDir_en_ADDR, panWPDir_x_ADDR, panWPDir_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("WP Distance", pan.panWPDis, 1, 11, panWPDis_en_ADDR, panWPDis_x_ADDR, panWPDis_y_ADDR);
	            // rssi
	
	            // third 8
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Altitude", pan.panAlt, 22, 3, panAlt_en_ADDR, panAlt_x_ADDR, panAlt_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Home Altitude", pan.panHomeAlt, 22, 2, panHomeAlt_en_ADDR, panHomeAlt_x_ADDR, panHomeAlt_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Vertical Speed", pan.panClimb, 1, 8, panClimb_en_ADDR, panClimb_x_ADDR, panClimb_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Battery Percent", pan.panBatteryPercent, 14, 15, panBatteryPercent_en_ADDR, panBatteryPercent_x_ADDR, panBatteryPercent_y_ADDR);
	
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Current", pan.panCur_A, 14, 14, panCur_A_en_ADDR, panCur_A_x_ADDR, panCur_A_y_ADDR);
	
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Velocity", pan.panVel, 1, 2, panVel_en_ADDR, panVel_x_ADDR, panVel_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Air Speed", pan.panAirSpeed, 1, 1, panAirSpeed_en_ADDR, panAirSpeed_x_ADDR, panAirSpeed_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Throttle", pan.panThr, 1, 3, panThr_en_ADDR, panThr_x_ADDR, panThr_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Flight Mode", pan.panFlightMode, 1, 13, panFMod_en_ADDR, panFMod_x_ADDR, panFMod_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Horizon", pan.panHorizon, 8, 6, panHorizon_en_ADDR, panHorizon_x_ADDR, panHorizon_y_ADDR);
				pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("ILS", pan.panILS, 24, 6, panILS_en_ADDR, panILS_x_ADDR, panILS_y_ADDR);
	
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Wind Speed", pan.panWindSpeed, 24, 7, panWindSpeed_en_ADDR, panWindSpeed_x_ADDR, panWindSpeed_y_ADDR);
	
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Warnings", pan.panWarn, 9, 4, panWarn_en_ADDR, panWarn_x_ADDR, panWarn_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Time", pan.panTime, 23, 4, panTime_en_ADDR, panTime_x_ADDR, panTime_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("RSSI", pan.panRSSI, 7, 13, panRSSI_en_ADDR, panRSSI_x_ADDR, panRSSI_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Tune", pan.panTune, 1, 1, panTune_en_ADDR, panTune_x_ADDR, panTune_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Efficiency", pan.panEff, 1, 11, panEff_en_ADDR, panEff_x_ADDR, panEff_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Call Sign", pan.panCALLSIGN, 0, 0, panCALLSIGN_en_ADDR, panCALLSIGN_x_ADDR, panCALLSIGN_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Channel Raw", pan.panCh, 1, 0, panCh_en_ADDR, panCh_x_ADDR, panCh_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Temperature", pan.panTemp, 1, 11, panTemp_en_ADDR, panTemp_x_ADDR, panTemp_y_ADDR);
	            pi[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Trip Distance", pan.panDistance, 22, 2, panDistance_en_ADDR, panDistance_x_ADDR, panDistance_y_ADDR);
	
	            nosdfunctions = a;
	            //make backup in case EEPROM needs reset to deualt
	            this.scr[n].panelItems_default = pi;
				
				System.Windows.Forms.TreeView li=this.scr[n].LIST_items;
					
	            //Fill List of items in tabe number 1
	            this.scr[n].LIST_items.Nodes.Clear();
	            startup = true;
	            foreach (var thing in pi)
	            {
	                if (thing != null)
	                {
	
	                    if (thing.Item1 == "Center")
	                    {
	                        TreeNode tn = li.Nodes.Add(thing.Item1, thing.Item1);
	                        tn.Checked = false;
	                    }
	
	                    else if (thing.Item1 == "Tune")
	                    {
	                        TreeNode tn = li.Nodes.Add(thing.Item1, thing.Item1);
	                        tn.Checked = false;
	                    }
	                    else if (thing.Item1 == "WP Distance")
	                    {
	                        TreeNode tn = li.Nodes.Add(thing.Item1, thing.Item1);
	                        tn.Checked = false;
	                    }
	
	                    else if (thing.Item1 == "Temperature")
	                    {
	                        TreeNode tn = li.Nodes.Add(thing.Item1, thing.Item1);
	                        tn.Checked = false;
	                    }
	
	
	                    else if (thing.Item1 == "Trip Distance")
	                    {
	                        TreeNode tn = li.Nodes.Add(thing.Item1, thing.Item1);
	                        tn.Checked = false;
	                    }
	
	
	                    else if (thing.Item1 == "Channel Raw")
	                    {
	                        TreeNode tn = li.Nodes.Add(thing.Item1, thing.Item1);
	                        tn.Checked = false;
	                    }
	                    else
	                    {
	                        TreeNode tn = li.Nodes.Add(thing.Item1, thing.Item1);
	                        tn.Checked = true;
	                    }
	                }
	            }
	            li.CheckBoxes = true;
	            li.Sort();
	            startup = false;
				
				osdDraw(n);
					
		  	}	// цикл по экранам
			
            //startup = true;
            //List<string> instruments = new List<string>();
            //LIST_items.Nodes.Clear();
            //foreach (var tuple in this.panelItems)
            //{
            //    if ((tuple != null))
            //    {
            //        TreeNode tn = LIST_items.Nodes.Add(tuple.Item1, tuple.Item1);
            //        tn.Checked = (tuple.Item3 == 1);
            //    }
            //}


            
            

            //Setup configuration panel
            STALL_numeric.Value = pan.stall;
            RSSI_numeric_min.Value = pan.rssipersent;
            RSSI_numeric_max.Value = pan.rssical;
            RSSI_RAW.Checked = Convert.ToBoolean(pan.rssiraw_on % 2);
            cbxRSSIChannel.SelectedIndex = (int)(pan.rssiraw_on / 2);

            OVERSPEED_numeric.Value = pan.overspeed;

            if (cbxModelType.Items.Count == 0)
                cbxModelType.DataSource = Enum.GetValues(typeof(ModelType));
            cbxModelType.SelectedItem = (ModelType)pan.model_type;

            cbxAirSpeedSign.Checked = (pan.sign_air_speed != 0);
            cbxGroundSpeedSign.Checked = (pan.sign_ground_speed != 0);
            cbxHomeAltitudeSign.Checked = (pan.sign_home_altitude != 0);
            cbxMslAltitudeSign.Checked = (pan.sign_msl_altitude != 0);

            if (cbxWarningsAutoPanelSwitch.Items.Count == 0)
                cbxWarningsAutoPanelSwitch.DataSource = Enum.GetValues(typeof(PanelsAutoSwitch));
            cbxWarningsAutoPanelSwitch.SelectedItem = (PanelsAutoSwitch)pan.auto_screen_switch;

            if (pan.converts == 0)
            {
                UNITS_combo.SelectedIndex = 0; //metric
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                OVERSPEED_label.Text = "Overspeed (km/h)";
            }
            else if (pan.converts == 1)
            {
                UNITS_combo.SelectedIndex = 1; //imperial
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                OVERSPEED_label.Text = "Overspeed (mph)";
            }

            MINVOLT_numeric.Value = Convert.ToDecimal(pan.battv) / Convert.ToDecimal(10.0);

            if (pan.ch_toggle >= toggle_offset && pan.ch_toggle < 9) ONOFF_combo.SelectedIndex = pan.ch_toggle - toggle_offset;
            else ONOFF_combo.SelectedIndex = 0; //reject garbage from the red file

            CHK_pal.Checked = Convert.ToBoolean(pan.pal_ntsc);

            BATT_WARNnumeric.Value = pan.batt_warn_level;
            RSSI_WARNnumeric.Value = pan.rssi_warn_level;

            CALLSIGNmaskedText.Text = pan.callsign_str;

            BRIGHTNESScomboBox.SelectedIndex = pan.osd_brightness;

            this.CHK_pal_CheckedChanged(EventArgs.Empty, EventArgs.Empty);
            this.pALToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);
            this.nTSCToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);

            CMB_ComPort.Text = "COM5";
        }

        private string[] GetPortNames()
        {
            string[] devs = new string[0];

            if (Directory.Exists("/dev/"))
                devs = Directory.GetFiles("/dev/", "*ACM*");

            string[] ports = SerialPort.GetPortNames();

            string[] all = new string[devs.Length + ports.Length];

            devs.CopyTo(all, 0);
            ports.CopyTo(all, devs.Length);

            return all;
        }

        public void setPanel(int x, int y)
        {
            print_x = x * CHAR_W;
            print_y = y * CHAR_H;

		    print_col = 0; // в пределах одного элемента
            print_row = 0;
 
		}


        public void openSingle(int x, int y)
        {
            setPanel(x, y);
            
        }

        public int getCenter()
        {
            if (CHK_pal.Checked)
                return 8;
            return 6;
        }

        // used for printf tracking line and row
        int print_col;
        int print_row;

        public void printf(string format, params object[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb = new StringBuilder(AT.MIN.Tools.sprintf(format, args));

            //sprintf(sb, format, __arglist(args));

            //Console.WriteLine(sb.ToString());

            foreach (char ch in sb.ToString().ToCharArray())
            {
                if (ch == '|')
                {
                    print_col += 1;
                    print_row = 0;
                    continue;
                }

                try
                {
                    // draw red boxs
                    if (selectedrectangle)
                    {
                        gr.DrawRectangle(Pens.Red, (print_x + print_row * CHAR_W) % screen.Width, (print_y + print_col * CHAR_H), CHAR_W, CHAR_H);
                    }

                    int w1 = (this.print_x / CHAR_W + print_row) % basesize.Width;
                    int h1 = (this.print_y / CHAR_H + print_col);

                    if (w1 < basesize.Width && h1 < basesize.Height)
                    {
                        // check if this box has bene used
                        if (usedPostion[w1][h1] != null)
                        {
                            //System.Diagnostics.Debug.WriteLine("'" + used[this.x / 12 + r * 12 / 12][this.y / 18 + d * 18 / 18] + "'");
                        }
                        else
                        {
                            gr.DrawImage(chars[ch], (print_x + print_row * CHAR_W) % screen.Width, (print_y + print_col * CHAR_H), CHAR_W, CHAR_H);
							
//							testDraw(chars[ch]);
                        }

                        usedPostion[w1][h1] = processingpanel;
                    }
                }
                catch { System.Diagnostics.Debug.WriteLine("printf exception"); }
                print_row++;
            }

        }


        

        public bool pal_checked(){
			return CHK_pal.Checked;
		}
        

        public void printf_P(string format, params object[] args)
        {
            printf(format, args);
        }

        
        // draw image and characters overlay
        public void osdDraw(int k)
        {
			if(k<0 || k>=npanel) return;
			
            panel_number = k;
            if (startup)
                return;

            for (int b = 0; b < usedPostion.Length; b++)
            {
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

            try
            {
                grfull.DrawImage(bgpicture, 0, 0, pb.Width, pb.Height);
            }
            catch { }

            //Drawing the grid
            if (checkBox1.Checked)
            {
                for (int b = 1; b < SCREEN_H; b++)
                {
                    for (int a = 1; a < SCREEN_W; a++)
                    {
                        grfull.DrawLine(new Pen(Color.Gray, 1), a * CHAR_W * scaleW, 0, a * CHAR_W * scaleW, pb.Height);
                        grfull.DrawLine(new Pen(Color.Gray, 1), 0, b * CHAR_H * scaleH, pb.Width, b * CHAR_H * scaleH);
                    }
                }
            }

            pan.setHeadingPatern();
            pan.setBatteryPic();

            List<string> list = new List<string>();

            foreach (TreeNode tn in this.scr[k].LIST_items.Nodes)
            {
                foreach (TreeNode tn2 in tn.Nodes)
                {
                    if (tn2.Checked)
                        list.Add(tn2.Text);
                }
                if (tn.Checked)
                    list.Add(tn.Text);
            }

            list.Reverse();

            foreach (string it in list)
            {
                foreach (var thing in this.scr[k].panelItems)
                {
                    selectedrectangle = false;
                    if (thing != null)
                    {
                        if (thing.Item1 == it)
                        {
                            if (thing.Item1 == currentlyselected[0])
                            {
                                selectedrectangle = true;
                            }

                            processingpanel = thing.Item1;

                            // ntsc and below the middle line
                            if (thing.Item4 >= getCenter() && !CHK_pal.Checked)
                            {
                                thing.Item2(thing.Item3, thing.Item4 - 3);
                            }
                            else // pal and no change
                            {
                                thing.Item2(thing.Item3, thing.Item4);
                            }

                        }
                    }
                }
            }

            grfull.DrawImage(screen, 0, 0, image.Width, image.Height);

            pb.Image = image;
			
        }

        
        public enum ModelType
        {
            Plane = 0,
            Copter = 1,
            Unknown = 9
        }

        string currentVersion = "";

        private void OSD_Load(object sender, EventArgs e)
        {
            if (cbxModelType.Items.Count == 0)
                cbxModelType.DataSource = Enum.GetValues(typeof(ModelType));
            if (cbxWarningsAutoPanelSwitch.Items.Count == 0)
                cbxWarningsAutoPanelSwitch.DataSource = Enum.GetValues(typeof(PanelsAutoSwitch));

            string strVersion = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
            this.Text = this.Text + " " + strVersion + " - Pre-Release r806 DV";
            currentVersion = strVersion + "r806 DV";

            CMB_ComPort.Items.AddRange(GetPortNames());

            if (CMB_ComPort.Items.Count > 0)
                CMB_ComPort.SelectedIndex = 0;

            xmlconfig(false);

 		   	osdDraw(panel_number);
            
        }


//        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
//        {
//            string item = ((CheckedListBox)sender).SelectedItem.ToString();
//
//            currentlyselected[0] = item;
//
//            osdDraw(this.panel_number);
//
//            foreach (var thing in this.scr[this.panel_number].panelItems)
//            {
//                if (thing != null && thing.Item1 == item)
//                {
//                    NUM_X.Value = Constrain(thing.Item3, 0, basesize.Width - 1);
//                    NUM_Y.Value = Constrain(thing.Item4, 0, SCREEN_H - 1);
//                }
//            }
//        }
//
// 


//        private void checkedListBox1_SelectedValueChanged(object sender, EventArgs e)
//        {
//            if (((CheckedListBox)sender).Text == "Horizon")
//            {
//                //groupBox1.Enabled = false;
//            }
//            else
//            {
//                //groupBox1.Enabled = true;
//            }
//        }
//
//        private void checkedListBox2_SelectedValueChanged(object sender, EventArgs e)
//        {
//            if (((CheckedListBox)sender).Text == "Horizon")
//            {
//                //groupBox1.Enabled = false;
//            }
//            else
//            {
//                //groupBox1.Enabled = true;
//            }
//        }


        private void checkedListBox1_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            // if (((CheckedListBox)sender).SelectedItem != null && ((CheckedListBox)sender).SelectedItem.ToString() == "Horizon")
            //            if (((CheckedListBox)sender).SelectedItem != null)
            //            {
            //                if (((CheckedListBox)sender).SelectedItem.ToString() == "Horizon" && e.NewValue == CheckState.Checked)
            //                {
            //                    int index = LIST_items.Items.IndexOf("Center");
            //                    LIST_items.SetItemChecked(index, false);
            //                }
            //                else if (((CheckedListBox)sender).SelectedItem.ToString() == "Center" && e.NewValue == CheckState.Checked)
            //                {
            //                    int index = LIST_items.Items.IndexOf("Horizon");
            //                    LIST_items.SetItemChecked(index, false);
            //                }
            //            }

            // add a delay to this so it runs after the control value has been defined.
            if (this.IsHandleCreated)
                this.BeginInvoke((MethodInvoker)delegate { osdDraw(panel_number); });
        }

       


        //Write data to MinimOSD EPPROM
        private void BUT_WriteOSD_Click(object sender, EventArgs e)
        {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            this.toolStripStatusLabel1.Text = "";

            TabPage current = PANEL_tabs.SelectedTab;
            if (current.Text == "Panel 1")
            {
                //First Panel 
                List<TreeNode> AllNodes = new List<TreeNode>();
                foreach (TreeNode tn in this.scr[this.panel_number].LIST_items.Nodes)
                {
                    foreach (TreeNode tn2 in tn.Nodes)
                    {
                        AllNodes.Add(tn2);
                    }
                    AllNodes.Add(tn);
                }

                foreach (TreeNode tn in AllNodes)
                {
                    string str = tn.Text;
                    foreach (var tuple in this.scr[this.panel_number].panelItems)
                    {
                        if ((tuple != null) && ((tuple.Item1 == str)) && tuple.Item5 != -1)
                        {
                            TreeNode[] trArray = this.scr[this.panel_number].LIST_items.Nodes.Find(str, true);
                            eeprom[tuple.Item5] = (byte)(trArray[0].Checked ? 1 : 0);
                            eeprom[tuple.Item6] = (byte)tuple.Item3; // x
                            eeprom[tuple.Item7] = (byte)tuple.Item4; // y

                            //Console.WriteLine(str);
                        }
                    }
                }
            }
            else if (current.Text == "Panel 2")
            {
            }
            else if (current.Text == "Config")
            {
                //Setup configuration panel
                //It only checks if configuration screen model type matches fw model type if model type already have been read from eeprom
                //(either by pushing the "Read From OSD" or by uploading the fw)
                if (fwWasRead)
                {
                    ModelType fwModelType = (ModelType)eeprom[MODEL_TYPE_ADD];
                    if (fwModelType != (ModelType)cbxModelType.SelectedItem)
                    {
                        if (MessageBox.Show("OSD firmware is of type " + fwModelType.ToString() + " and you have selected " + cbxModelType.SelectedText + " model type." + Environment.NewLine +
                            "Are you sure you want to upload this configuration?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) != System.Windows.Forms.DialogResult.Yes)
                            return;
                    }
                }
                eeprom[SIGN_AS_ON_ADDR] = pan.sign_air_speed;
                eeprom[SIGN_GS_ON_ADDR] = pan.sign_ground_speed;
                eeprom[SIGN_HA_ON_ADDR] = pan.sign_home_altitude;
                eeprom[SIGN_MSL_ON_ADDR] = pan.sign_msl_altitude;
                eeprom[measure_ADDR] = pan.converts;
                eeprom[overspeed_ADDR] = pan.overspeed;
                eeprom[stall_ADDR] = pan.stall;
                eeprom[battv_ADDR] = pan.battv;

                eeprom[OSD_RSSI_HIGH_ADDR] = pan.rssical;
                eeprom[OSD_RSSI_LOW_ADDR] = pan.rssipersent;
                eeprom[OSD_RSSI_RAW_ADDR] = pan.rssiraw_on;

                eeprom[AUTO_SCREEN_SWITCH_ADD] = pan.auto_screen_switch;
                eeprom[OSD_Toggle_ADDR] = pan.ch_toggle;
                eeprom[switch_mode_ADDR] = pan.switch_mode;

                eeprom[PAL_NTSC_ADDR] = pan.pal_ntsc;

                eeprom[OSD_BATT_WARN_ADDR] = pan.batt_warn_level;
                eeprom[OSD_BATT_SHOW_PERCENT_ADDR] = Convert.ToByte(pan.osd_battery_show_percentage);
                eeprom[OSD_RSSI_WARN_ADDR] = pan.rssi_warn_level;

                eeprom[OSD_BRIGHTNESS_ADDR] = pan.osd_brightness;

                //for (int i = 0; i < OSD_CALL_SIGN_TOTAL; i++)
                for (int i = 0; i < pan.callsign_str.Length; i++)
                {
                    eeprom[OSD_CALL_SIGN_ADDR + i] = Convert.ToByte(pan.callsign_str[i]);
                    Console.WriteLine("Call Sign ", i, " is ", eeprom[OSD_CALL_SIGN_ADDR + i]);
                }
                if (pan.callsign_str.Length < OSD_CALL_SIGN_TOTAL)
                    for (int i = pan.callsign_str.Length; i < OSD_CALL_SIGN_TOTAL; i++) eeprom[OSD_CALL_SIGN_ADDR + i] = Convert.ToByte('\0');
            }

            ArduinoSTK sp;

            try
            {
                if (comPort.IsOpen)
                    comPort.Close();

                sp = new ArduinoSTK();
                sp.PortName = CMB_ComPort.Text;
                sp.BaudRate = 57600;
                sp.DataBits = 8;
                sp.StopBits = StopBits.One;
                sp.Parity = Parity.None;
                sp.DtrEnable = false;
                sp.RtsEnable = false; //added

                sp.Open();
            }
            catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

            if (sp.connectAP())
            {
                try
                {
                    bool spupload_flag = false;
                    //nav_up = sp.upload(eeprom, 0, OffsetBITpanel * npanel, 0);
                    //conf_up = sp.upload(eeprom, measure_ADDR, (OSD_RSSI_LOW_ADDR - measure_ADDR), measure_ADDR);
                    if (current.Text == "Panel 1")
                    {
                        for (int i = 0; i < 10; i++)
                        { //try to upload two times if it fail
                            spupload_flag = sp.upload(eeprom, (short)0, (short)OffsetBITpanel, (short)0);
                            if (!spupload_flag)
                            {
                                if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                                else Console.WriteLine("keepalive fail (iter " + i + ")");
                            }
                            else break;
                        }
                        if (spupload_flag) MessageBox.Show("Done writing Panel 1 data!");
                        else MessageBox.Show("Failed to upload new Panel 1 data");
                    }
                    else if (current.Text == "Panel 2")
                    {
                        for (int i = 0; i < 10; i++)
                        { //try to upload two times if it fail
                            spupload_flag = sp.upload(eeprom, (short)OffsetBITpanel, (short)(OffsetBITpanel), (short)OffsetBITpanel);
                            if (!spupload_flag)
                            {
                                if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                                else Console.WriteLine("keepalive fail (iter " + i + ")");
                            }
                            else break;
                        }
                        if (spupload_flag) MessageBox.Show("Done writing Panel 2 data!");
                        else MessageBox.Show("Failed to upload new Panel 2 data");
                    }
                    else if (current.Text == "Config")
                    {
                        for (int i = 0; i < 10; i++)
                        { //try to upload two times if it fail
                            spupload_flag = sp.upload(eeprom, (short)SIGN_MSL_ON_ADDR, (short)((OSD_CALL_SIGN_ADDR + OSD_CALL_SIGN_TOTAL) - SIGN_MSL_ON_ADDR + 1), (short)SIGN_MSL_ON_ADDR);
                            if (!spupload_flag)
                            {
                                if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                                else Console.WriteLine("keepalive fail (iter " + i + ")");
                            }
                            else break;
                        }
                        if (spupload_flag) MessageBox.Show("Done writing configuration data!");
                        else MessageBox.Show("Failed to upload new configuration data");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Failed to talk to bootloader");
            }

            sp.Close();
        }


        //Write data to MinimOSD EPPROM
        private void BUT_ResetOSD_EEPROM()
        {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            this.toolStripStatusLabel1.Text = "";

		  for(int k=0;k<npanel;k++) {
            //First Panel 
            List<TreeNode> AllNodes = new List<TreeNode>();
            foreach (TreeNode tn in this.scr[this.panel_number].LIST_items.Nodes)
            {
                foreach (TreeNode tn2 in tn.Nodes)
                {
                    AllNodes.Add(tn2);
                }
                AllNodes.Add(tn);
            }

            foreach (TreeNode tn in AllNodes)
            {
                string str = tn.Text;
                foreach (var tuple in this.scr[this.panel_number].panelItems_default)
                {
                    if ((tuple != null) && ((tuple.Item1 == str)) && tuple.Item5 != -1)
                    {
                        if (str == "Center") eeprom[tuple.Item5] = 0;
                        else if (str == "Tune") eeprom[tuple.Item5] = 0;
                        else if (str == "Channel Raw") eeprom[tuple.Item5] = 0;
                        else eeprom[tuple.Item5] = 1;

                        eeprom[tuple.Item6] = (byte)tuple.Item3; // x
                        eeprom[tuple.Item7] = (byte)tuple.Item4; // y
                    }
                }
            }
		  }
            //Setup configuration panel
            eeprom[SIGN_AS_ON_ADDR] = pan.sign_air_speed;
            eeprom[SIGN_GS_ON_ADDR] = pan.sign_ground_speed;
            eeprom[SIGN_HA_ON_ADDR] = pan.sign_home_altitude;
            eeprom[SIGN_MSL_ON_ADDR] = pan.sign_msl_altitude;
            eeprom[measure_ADDR] = pan.converts;
            eeprom[overspeed_ADDR] = pan.overspeed;
            eeprom[stall_ADDR] = pan.stall;
            eeprom[battv_ADDR] = pan.battv;

            eeprom[OSD_RSSI_HIGH_ADDR] = pan.rssical;
            eeprom[OSD_RSSI_LOW_ADDR] = pan.rssipersent;
            eeprom[OSD_RSSI_RAW_ADDR] = pan.rssiraw_on;

            eeprom[AUTO_SCREEN_SWITCH_ADD] = pan.auto_screen_switch;
            eeprom[OSD_Toggle_ADDR] = pan.ch_toggle;
            eeprom[switch_mode_ADDR] = pan.switch_mode;

            eeprom[PAL_NTSC_ADDR] = pan.pal_ntsc;

            eeprom[OSD_BATT_WARN_ADDR] = pan.batt_warn_level;
            eeprom[OSD_BATT_SHOW_PERCENT_ADDR] = Convert.ToByte(pan.osd_battery_show_percentage);
            eeprom[OSD_RSSI_WARN_ADDR] = pan.rssi_warn_level;

            eeprom[OSD_BRIGHTNESS_ADDR] = pan.osd_brightness;

            eeprom[CHK_VERSION] = VER;

            for (int i = 0; i < OSD_CALL_SIGN_TOTAL; i++)
            {
                eeprom[OSD_CALL_SIGN_ADDR + i] = Convert.ToByte('a');
                Console.WriteLine("Call Sign ", i, " is ", eeprom[OSD_CALL_SIGN_ADDR + i]);
            }

            ArduinoSTK sp;

            try
            {
                if (comPort.IsOpen)
                    comPort.Close();

                sp = new ArduinoSTK();
                sp.PortName = CMB_ComPort.Text;
                sp.BaudRate = 57600;
                sp.DataBits = 8;
                sp.StopBits = StopBits.One;
                sp.Parity = Parity.None;
                sp.DtrEnable = false;
                sp.RtsEnable = false; //added

                sp.Open();
            }
            catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

            if (sp.connectAP())
            {
                try
                {
                    bool spupload_flag = false;
                    for (int i = 0; i < 10; i++)
                    { //try to upload two times if it fail
                        spupload_flag = sp.upload(eeprom, 0, CHK_VERSION + 1, 0);
                        if (!spupload_flag)
                        {
                            if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                            else Console.WriteLine("keepalive fail (iter " + i + ")");
                        }
                        else break;
                    }
                    if (spupload_flag) MessageBox.Show("Done writing configuration data!");
                    else MessageBox.Show("Failed to upload new configuration data");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Failed to talk to bootloader");
            }

            sp.Close();
        }



        private void comboBox1_Click(object sender, EventArgs e)
        {
            CMB_ComPort.Items.Clear();
            CMB_ComPort.Items.AddRange(GetPortNames());
        }



        /* *********************************************** */
        // Version number, incrementing this will erase/upload factory settings.
        // Only devs should increment this
        const int VER = 76;
        // EEPROM Storage addresses
        const int OffsetBITpanel = 250;
        // First of 8 panels
        const int panCenter_en_ADDR = 0;
        const int panCenter_x_ADDR = 2;
        const int panCenter_y_ADDR = 4;
        const int panPitch_en_ADDR = 6;
        const int panPitch_x_ADDR = 8;
        const int panPitch_y_ADDR = 10;
        const int panRoll_en_ADDR = 12;
        const int panRoll_x_ADDR = 14;
        const int panRoll_y_ADDR = 16;
        const int panBatt_A_en_ADDR = 18;
        const int panBatt_A_x_ADDR = 20;
        const int panBatt_A_y_ADDR = 22;
        const int panBatt_B_en_ADDR = 24;
        const int panBatt_B_x_ADDR = 26;
        const int panBatt_B_y_ADDR = 28;
        const int panGPSats_en_ADDR = 30;
        const int panGPSats_x_ADDR = 32;
        const int panGPSats_y_ADDR = 34;
        const int panCOG_en_ADDR = 36;
        const int panCOG_x_ADDR = 38;
        const int panCOG_y_ADDR = 40;
        const int panGPS_en_ADDR = 42;
        const int panGPS_x_ADDR = 44;
        const int panGPS_y_ADDR = 46;

        // Second set of 8 panels
        const int panRose_en_ADDR = 48;
        const int panRose_x_ADDR = 50;
        const int panRose_y_ADDR = 52;
        const int panHeading_en_ADDR = 54;
        const int panHeading_x_ADDR = 56;
        const int panHeading_y_ADDR = 58;
        //        const int panMavBeat_en_ADDR = 60;
        //        const int panMavBeat_x_ADDR = 62;
        //        const int panMavBeat_y_ADDR = 64;
        const int panHomeDir_en_ADDR = 66;
        const int panHomeDir_x_ADDR = 68;
        const int panHomeDir_y_ADDR = 70;
        const int panHomeDis_en_ADDR = 72;
        const int panHomeDis_x_ADDR = 74;
        const int panHomeDis_y_ADDR = 76;
        const int panWPDir_en_ADDR = 80;
        const int panWPDir_x_ADDR = 82;
        const int panWPDir_y_ADDR = 84;
        const int panWPDis_en_ADDR = 86;
        const int panWPDis_x_ADDR = 88;
        const int panWPDis_y_ADDR = 90;
        const int panRSSI_en_ADDR = 92;
        const int panRSSI_x_ADDR = 94;
        const int panRSSI_y_ADDR = 96;


        // Third set of 8 panels
        const int panCur_A_en_ADDR = 98;
        const int panCur_A_x_ADDR = 100;
        const int panCur_A_y_ADDR = 102;
        const int panCurB_en_ADDR = 104;
        const int panCurB_x_ADDR = 106;
        const int panCurB_y_ADDR = 108;
        const int panAlt_en_ADDR = 110;
        const int panAlt_x_ADDR = 112;
        const int panAlt_y_ADDR = 114;
        const int panVel_en_ADDR = 116;
        const int panVel_x_ADDR = 118;
        const int panVel_y_ADDR = 120;
        const int panThr_en_ADDR = 122;
        const int panThr_x_ADDR = 124;
        const int panThr_y_ADDR = 126;
        const int panFMod_en_ADDR = 128;
        const int panFMod_x_ADDR = 130;
        const int panFMod_y_ADDR = 132;
        const int panHorizon_en_ADDR = 134;
        const int panHorizon_x_ADDR = 136;
        const int panHorizon_y_ADDR = 138;
        const int panHomeAlt_en_ADDR = 140;
        const int panHomeAlt_x_ADDR = 142;
        const int panHomeAlt_y_ADDR = 144;
        const int panAirSpeed_en_ADDR = 146;
        const int panAirSpeed_x_ADDR = 148;
        const int panAirSpeed_y_ADDR = 150;
        const int panBatteryPercent_en_ADDR = 152;
        const int panBatteryPercent_x_ADDR = 154;
        const int panBatteryPercent_y_ADDR = 156;
        const int panTime_en_ADDR = 158;
        const int panTime_x_ADDR = 160;
        const int panTime_y_ADDR = 162;
        const int panWarn_en_ADDR = 164;
        const int panWarn_x_ADDR = 166;
        const int panWarn_y_ADDR = 168;
        const int panOff_en_ADDR = 170;
        const int panOff_x_ADDR = 172;
        const int panOff_y_ADDR = 174;
        const int panWindSpeed_en_ADDR = 176;
        const int panWindSpeed_x_ADDR = 178;
        const int panWindSpeed_y_ADDR = 180;
        const int panClimb_en_ADDR = 182;
        const int panClimb_x_ADDR = 184;
        const int panClimb_y_ADDR = 186;
        const int panTune_en_ADDR = 188;
        const int panTune_x_ADDR = 190;
        const int panTune_y_ADDR = 192;
        const int panEff_en_ADDR = 194;
        const int panEff_x_ADDR = 196;
        const int panEff_y_ADDR = 198;
        const int panCALLSIGN_en_ADDR = 200;
        const int panCALLSIGN_x_ADDR = 202;
        const int panCALLSIGN_y_ADDR = 204;
        const int panCh_en_ADDR = 206;
        const int panCh_x_ADDR = 208;
        const int panCh_y_ADDR = 210;
        const int panTemp_en_ADDR = 212;
        const int panTemp_x_ADDR = 214;
        const int panTemp_y_ADDR = 216;
        const int panDistance_en_ADDR = 224;
        const int panDistance_x_ADDR = 226;
        const int panDistance_y_ADDR = 228;
		const int panILS_en_ADDR = 230;
        const int panILS_x_ADDR = 232;
        const int panILS_y_ADDR = 234;
        
		
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

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
          	osdDraw(panel_number);  
        }

        private void OSD_Resize(object sender, EventArgs e)
        {
			
            try
            {
                osdDraw(panel_number);
             
            }
            catch { }
        }

        private void ReadCharsetVersion()
        {
            byte[] tempEeprom = new byte[1024];

            bool fail = false;
            ArduinoSTK sp;

            try
            {
                if (comPort.IsOpen)
                    comPort.Close();

                sp = new ArduinoSTK();
                sp.PortName = CMB_ComPort.Text;
                sp.BaudRate = 57600;
                sp.DtrEnable = true;

                sp.Open();
            }
            catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

            if (sp.connectAP())
            {
                try
                {
                    for (int i = 0; i < 5; i++)
                    { //try to download two times if it fail
                        tempEeprom = sp.download(1024);
                        if (!sp.down_flag)
                        {
                            if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                            else Console.WriteLine("keepalive fail (iter " + i + ")");
                        }
                        else break;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Failed to talk to bootloader");
                fail = true;
            }

            sp.Close();

            if (!fail)
            {
                lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: " + tempEeprom[CS_VERSION1_ADDR].ToString() + "." + tempEeprom[CS_VERSION1_ADDR + 1].ToString() + "." + tempEeprom[CS_VERSION1_ADDR + 2].ToString(); 
            }
        }

        private void WriteCharsetVersion(string version)
        {
            byte[] tempEeprom = new byte[3];
            tempEeprom[0] = (byte)version[0];
            tempEeprom[1] = (byte)version[1];
            tempEeprom[2] = (byte)version[2];
            //Set Com port
            ArduinoSTK sp;
            try
            {
                if (comPort.IsOpen)
                    comPort.Close();

                sp = new ArduinoSTK();
                sp.PortName = CMB_ComPort.Text;
                sp.BaudRate = 57600;
                sp.DataBits = 8;
                sp.StopBits = StopBits.One;
                sp.Parity = Parity.None;
                sp.DtrEnable = false;
                sp.RtsEnable = false; //added

                sp.Open();
            }
            catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

            if (sp.connectAP())
            {
                try
                {
                    bool spupload_flag = false;
                        for (int i = 0; i < 10; i++)
                        { //try to upload two times if it fail
                            spupload_flag = sp.upload(tempEeprom, (short)0, (short)tempEeprom.Length, (short)CS_VERSION1_ADDR);
                            if (!spupload_flag)
                            {
                                if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                                else Console.WriteLine("keepalive fail (iter " + i + ")");
                            }
                            else break;
                        }
                        if (spupload_flag) MessageBox.Show("Done writing configuration data!");
                        else MessageBox.Show("Failed to upload new configuration data");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Failed to talk to bootloader");
            }

            sp.Close();
        }

        private void BUT_ReadOSD_Click(object sender, EventArgs e)
        {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            this.toolStripStatusLabel1.Text = "";

            bool fail = false;
            ArduinoSTK sp;

            try
            {
                if (comPort.IsOpen)
                    comPort.Close();

                sp = new ArduinoSTK();
                sp.PortName = CMB_ComPort.Text;
                sp.BaudRate = 57600;
                sp.DtrEnable = true;

                sp.Open();
            }
            catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

            if (sp.connectAP())
            {
                try
                {
                    for (int i = 0; i < 5; i++)
                    { //try to download two times if it fail
                        eeprom = sp.download(1024);
                        if (!sp.down_flag)
                        {
                            if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                            else Console.WriteLine("keepalive fail (iter " + i + ")");
                        }
                        else break;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Failed to talk to bootloader");
                fail = true;
            }

            sp.Close();

            //Verify EEPROM version
            if (eeprom[CHK_VERSION] != VER)
            { // no match
                MessageBox.Show("The EEPROM mapping is outdated! An automatic update will start.", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                BUT_ResetOSD_EEPROM(); //write defaults
                MessageBox.Show("EEPROM mapping updated!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (!fail)
            {

			for(int k=0;k<npanel;k++){
                for (int a = 0; a < this.scr[k].panelItems.Length; a++)
                {
                    if (this.scr[k].panelItems[a] != null)
                    {
						var pi=this.scr[k].panelItems[a];
                        if (pi.Item5 >= 0)
                        {
                            TreeNode[] tnArray = this.scr[k].LIST_items.Nodes.Find(pi.Item1, true);
                            if (tnArray.Length > 0)
                                tnArray[0].Checked = (eeprom[pi.Item5] == 1);

                            //LIST_items.SetItemCheckState(a, eeprom[panelItems[a].Item5] == 0 ? CheckState.Unchecked : CheckState.Checked);
                        }
                        if (pi.Item7 >= 0 || pi.Item6 >= 0)
                            this.scr[k].panelItems[a] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>(pi.Item1, pi.Item2, eeprom[pi.Item6], eeprom[pi.Item7], pi.Item5, pi.Item6, pi.Item7);
                    }
                }
			}
            }

            //Setup configuration panel
            pan.model_type = eeprom[MODEL_TYPE_ADD];
            pan.fw_version1 = eeprom[FW_VERSION1_ADDR];
            pan.fw_version2 = eeprom[FW_VERSION2_ADDR];
            pan.fw_version3 = eeprom[FW_VERSION3_ADDR];
            pan.cs_version1 = eeprom[CS_VERSION1_ADDR];
            pan.cs_version2 = eeprom[CS_VERSION1_ADDR + 1];
            pan.cs_version3 = eeprom[CS_VERSION1_ADDR + 2];
            if((pan.fw_version1 == '0') && (pan.fw_version2 == '0') && (pan.fw_version3 == '0'))
            {
                lblFWModelType.Text = "Model Type found in OSD: Unknown or custom";
            }
            else
            {
                lblFWModelType.Text = "Model Type found in OSD: " + (ModelType)pan.model_type + " " + pan.fw_version1 + "." + pan.fw_version2 + "." + pan.fw_version3;
            }

            if ((pan.cs_version1 == '0') && (pan.cs_version2 == '0') && (pan.cs_version3 == '0'))
            {
                lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: Unknown or custom ";
            }
            else
            {
                lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: Charset " + (pan.cs_version1 - '0').ToString() + "." + (pan.cs_version2 - '0').ToString() + "." + (pan.cs_version3 - '0').ToString();
            }

            pan.sign_air_speed = eeprom[SIGN_AS_ON_ADDR];
            pan.sign_ground_speed = eeprom[SIGN_GS_ON_ADDR];
            pan.sign_home_altitude = eeprom[SIGN_HA_ON_ADDR];
            pan.sign_msl_altitude = eeprom[SIGN_MSL_ON_ADDR];
            cbxAirSpeedSign.Checked = (pan.sign_air_speed != 0);
            cbxGroundSpeedSign.Checked = (pan.sign_ground_speed != 0);
            cbxHomeAltitudeSign.Checked = (pan.sign_home_altitude != 0);
            cbxMslAltitudeSign.Checked = (pan.sign_msl_altitude != 0);
            cbxModelType.SelectedItem = (ModelType)pan.model_type;
            pan.converts = eeprom[measure_ADDR];
            //Modify units
            if (pan.converts == 0)
            {
                UNITS_combo.SelectedIndex = 0; //metric
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                OVERSPEED_label.Text = "Overspeed (km/h)";
            }
            else if (pan.converts == 1)
            {
                UNITS_combo.SelectedIndex = 1; //imperial
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                OVERSPEED_label.Text = "Overspeed (mph)";
            }
            else //garbage value in EEPROM - default to metric
            {
                pan.converts = 0; //correct value
                UNITS_combo.SelectedIndex = 0; //metric
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                OVERSPEED_label.Text = "Overspeed (km/h)";
            }

            pan.overspeed = eeprom[overspeed_ADDR];
            OVERSPEED_numeric.Value = pan.overspeed;

            pan.stall = eeprom[stall_ADDR];
            STALL_numeric.Value = pan.stall;

            pan.battv = eeprom[battv_ADDR];
            MINVOLT_numeric.Value = Convert.ToDecimal(pan.battv) / Convert.ToDecimal(10.0);

            pan.rssical = eeprom[OSD_RSSI_HIGH_ADDR];
            //RSSI_numeric_max.Value = pan.rssical;

            pan.rssipersent = eeprom[OSD_RSSI_LOW_ADDR];
            //RSSI_numeric_min.Value = pan.rssipersent;

            pan.rssiraw_on = eeprom[OSD_RSSI_RAW_ADDR];

            updatingRSSI = true;
            RSSI_numeric_min.Minimum = 0;
            RSSI_numeric_min.Maximum = 2000;
            RSSI_numeric_max.Minimum = 0;
            RSSI_numeric_max.Maximum = 2000;
            RSSI_numeric_min.Value = 0;
            RSSI_numeric_max.Value = 0;
            RSSI_RAW.Checked = Convert.ToBoolean(pan.rssiraw_on % 2);
            if ((int)(pan.rssiraw_on / 2) == 0)
            {
                RSSI_numeric_min.Value = pan.rssipersent;
                RSSI_numeric_max.Value = pan.rssical;
                RSSI_numeric_min.Minimum = 0;
                RSSI_numeric_min.Maximum = 255;
                RSSI_numeric_max.Minimum = 0;
                RSSI_numeric_max.Maximum = 255;
            }
            else
            {
                RSSI_numeric_min.Value = pan.rssipersent * 10;
                RSSI_numeric_max.Value = pan.rssical * 10;
                RSSI_numeric_min.Minimum = 900;
                RSSI_numeric_min.Maximum = 2000;
                RSSI_numeric_max.Minimum = 900;
                RSSI_numeric_max.Maximum = 2000;
            }
            if(pan.rssiraw_on <= 1)
                cbxRSSIChannel.SelectedIndex = 0;
            else
                cbxRSSIChannel.SelectedIndex = 1;
            updatingRSSI = false;

            pan.ch_toggle = eeprom[OSD_Toggle_ADDR];
            if (pan.ch_toggle >= toggle_offset && pan.ch_toggle < 9) ONOFF_combo.SelectedIndex = pan.ch_toggle - toggle_offset;
            else ONOFF_combo.SelectedIndex = 0; //reject garbage from EEPROM

            pan.auto_screen_switch = eeprom[AUTO_SCREEN_SWITCH_ADD];
            cbxWarningsAutoPanelSwitch.SelectedItem = (PanelsAutoSwitch)pan.auto_screen_switch;

            pan.switch_mode = eeprom[switch_mode_ADDR];
            TOGGLE_BEH.Checked = Convert.ToBoolean(pan.switch_mode);

            pan.pal_ntsc = eeprom[PAL_NTSC_ADDR];
            CHK_pal.Checked = Convert.ToBoolean(pan.pal_ntsc);

            pan.batt_warn_level = eeprom[OSD_BATT_WARN_ADDR];
            BATT_WARNnumeric.Value = pan.batt_warn_level;

            pan.osd_battery_show_percentage = eeprom[OSD_BATT_SHOW_PERCENT_ADDR];
            rbtBatteryPercent.Checked = Convert.ToBoolean(pan.osd_battery_show_percentage);
            rbtBatterymAh.Checked = !rbtBatteryPercent.Checked;

            pan.rssi_warn_level = eeprom[OSD_RSSI_WARN_ADDR];
            RSSI_WARNnumeric.Value = pan.rssi_warn_level;

            pan.osd_brightness = eeprom[OSD_BRIGHTNESS_ADDR];
            BRIGHTNESScomboBox.SelectedIndex = pan.osd_brightness;

            char[] str_call = new char[OSD_CALL_SIGN_TOTAL];
            for (int i = 0; i < OSD_CALL_SIGN_TOTAL; i++)
            {
                str_call[i] = Convert.ToChar(eeprom[OSD_CALL_SIGN_ADDR + i]);
                Console.WriteLine("Call Sign read ", i, " is ", eeprom[OSD_CALL_SIGN_ADDR + i]);
            }

            pan.callsign_str = new string(str_call);
            CALLSIGNmaskedText.Text = pan.callsign_str;

            this.pALToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);
            this.nTSCToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);
            this.CHK_pal_CheckedChanged(EventArgs.Empty, EventArgs.Empty);
			

        	osdDraw(panel_number);
            

            //if (!fail)
            //    MessageBox.Show("Done!");
            if (sp.down_flag)
            {
                fwWasRead = true;
                MessageBox.Show("Done downloading data!");
            }
            else MessageBox.Show("Failed to download data!");
            sp.down_flag = false;

        }


        byte[] readIntelHEXv2(StreamReader sr)
        {
            byte[] FLASH = new byte[1024 * 1024];

            int optionoffset = 0;
            int total = 0;
            bool hitend = false;

            while (!sr.EndOfStream)
            {
                toolStripProgressBar1.Value = (int)(((float)sr.BaseStream.Position / (float)sr.BaseStream.Length) * 100);

                string line = sr.ReadLine();

                if (line.StartsWith(":"))
                {
                    int length = Convert.ToInt32(line.Substring(1, 2), 16);
                    int address = Convert.ToInt32(line.Substring(3, 4), 16);
                    int option = Convert.ToInt32(line.Substring(7, 2), 16);
                    Console.WriteLine("len {0} add {1} opt {2}", length, address, option);

                    if (option == 0)
                    {
                        string data = line.Substring(9, length * 2);
                        for (int i = 0; i < length; i++)
                        {
                            byte byte1 = Convert.ToByte(data.Substring(i * 2, 2), 16);
                            FLASH[optionoffset + address] = byte1;
                            address++;
                            if ((optionoffset + address) > total)
                                total = optionoffset + address;
                        }
                    }
                    else if (option == 2)
                    {
                        optionoffset = (int)Convert.ToUInt16(line.Substring(9, 4), 16) << 4;
                    }
                    else if (option == 1)
                    {
                        hitend = true;
                    }
                    int checksum = Convert.ToInt32(line.Substring(line.Length - 2, 2), 16);

                    byte checksumact = 0;
                    for (int z = 0; z < ((line.Length - 1 - 2) / 2); z++) // minus 1 for : then mins 2 for checksum itself
                    {
                        checksumact += Convert.ToByte(line.Substring(z * 2 + 1, 2), 16);
                    }
                    checksumact = (byte)(0x100 - checksumact);

                    if (checksumact != checksum)
                    {
                        MessageBox.Show("The hex file loaded is invalid, please try again.");
                        throw new Exception("Checksum Failed - Invalid Hex");
                    }
                }
                //Regex regex = new Regex(@"^:(..)(....)(..)(.*)(..)$"); // length - address - option - data - checksum
            }

            if (!hitend)
            {
                MessageBox.Show("The hex file did no contain an end flag. aborting");
                throw new Exception("No end flag in file");
            }

            Array.Resize<byte>(ref FLASH, total);

            return FLASH;
        }

        void sp_Progress(int progress)
        {
            toolStripStatusLabel1.Text = "Uploading " + progress + " %";
            toolStripProgressBar1.Value = progress;

            statusStrip1.Refresh();
        }

        private void CHK_pal_CheckedChanged(object sender, EventArgs e)
        {
            changeToPal(CHK_pal.Checked);
			
            osdDraw(panel_number);
            
        }

        private void pALToolStripMenuItem_CheckStateChanged(object sender, EventArgs e)
        {
            CHK_ntsc.Checked = !CHK_pal.Checked;
        }

        private void nTSCToolStripMenuItem_CheckStateChanged(object sender, EventArgs e)
        {
            CHK_pal.Checked = !CHK_ntsc.Checked;
        }

        private void saveToFileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveFileDialog sfd = new SaveFileDialog() { Filter = "*.osd|*.osd" };

            sfd.ShowDialog();

            if (sfd.FileName != "")
            {
                try
                {
                    using (StreamWriter sw = new StreamWriter(sfd.OpenFile()))
                    //Write
                    {
                        //Panel 1
						for(int k=0;k<npanel;k++) {
                        	sw.WriteLine("{0}", "Panel "+k);
                        	foreach (var item in this.scr[k].panelItems)
                        	{
	                            if (item != null)
                            	{
	                                TreeNode[] tnArray = this.scr[k].LIST_items.Nodes.Find(item.Item1, true);
                                	if (tnArray.Length > 0)
	                                    sw.WriteLine("{0}\t{1}\t{2}\t{3}", item.Item1, item.Item3, item.Item4, tnArray[0].Checked.ToString());
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
                        sw.WriteLine("{0}\t{1}", "Battery Warning Level", pan.batt_warn_level);
                        sw.WriteLine("{0}\t{1}", "RSSI Warning Level", pan.rssi_warn_level);
                        sw.WriteLine("{0}\t{1}", "OSD Brightness", pan.osd_brightness);
                        sw.WriteLine("{0}\t{1}", "Call Sign", pan.callsign_str);
                        sw.WriteLine("{0}\t{1}", "Sign Air Speed", pan.sign_air_speed);
                        sw.WriteLine("{0}\t{1}", "Sign Ground  Speed", pan.sign_ground_speed);
                        sw.WriteLine("{0}\t{1}", "Sign Home Altitude", pan.sign_home_altitude);
                        sw.WriteLine("{0}\t{1}", "Sign MSL Altitude", pan.sign_msl_altitude);
                        sw.Close();
                    }
                }
                catch
                {
                    MessageBox.Show("Error writing file");
                }
            }
        }

        private Boolean updatingRSSI = false;

        private void loadFromFileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog() { Filter = "*.osd|*.osd" };
            //const int nosdfunctions = 29;
            ofd.ShowDialog();

            if (ofd.FileName != "")
            {
                try
                {
                    using (StreamReader sr = new StreamReader(ofd.OpenFile()))
                    {
						while(true) {
                        	//Panel 1
                        	//string stringh = sr.ReadLine(); //
							string[] hdr = sr.ReadLine().Split(new char[] { '\x20' }, StringSplitOptions.RemoveEmptyEntries);
							int k=0;
						
							if(hdr[0]!="Panel") break;
							
							k=int.Parse(hdr[1]);
							//while (!sr.EndOfStream)
                        	for (int i = 0; i < nosdfunctions; i++)
                        	{
	                            string[] strings = sr.ReadLine().Split(new char[] { '\t' }, StringSplitOptions.RemoveEmptyEntries);
                            	for (int a = 0; a < this.scr[k].panelItems.Length; a++)
                            	{
	                                if (this.scr[k].panelItems[a] != null && this.scr[k].panelItems[a].Item1 == strings[0])
                                	{
										var pi=this.scr[k].panelItems[a];
	                                    // incase there is an invalid line number or to shore
                                    	try
                                    	{
	                                        this.scr[k].panelItems[a] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>(pi.Item1, pi.Item2, int.Parse(strings[1]), int.Parse(strings[2]), pi.Item5, pi.Item6, pi.Item7);
	
                                        	TreeNode[] tnArray = this.scr[k].LIST_items.Nodes.Find(this.scr[k].panelItems[a].Item1, true);
                                        	if (tnArray.Length > 0)
	                                            tnArray[0].Checked = (strings[3] == "True");
                                    	}
                                    	catch { }
                                	}
                            	}
                        	}
						}
//                        stringh = sr.ReadLine(); //config
                        while (!sr.EndOfStream)
                        {
                            string[] strings = sr.ReadLine().Split(new char[] { '\t' }, StringSplitOptions.RemoveEmptyEntries);
                            if (strings[0] == "Units") pan.converts = byte.Parse(strings[1]);
                            else if (strings[0] == "Overspeed") pan.overspeed = byte.Parse(strings[1]);
                            else if (strings[0] == "Stall") pan.stall = byte.Parse(strings[1]);
                            else if (strings[0] == "Battery") pan.battv = byte.Parse(strings[1]);
                            else if (strings[0] == "RSSI High") pan.rssical = byte.Parse(strings[1]);
                            else if (strings[0] == "RSSI Low") pan.rssipersent = byte.Parse(strings[1]);
                            else if (strings[0] == "RSSI Enable Raw") pan.rssiraw_on = byte.Parse(strings[1]);
                            else if (strings[0] == "Toggle Channel") pan.ch_toggle = byte.Parse(strings[1]);
                            else if (strings[0] == "Auto Screen Switch") pan.auto_screen_switch = byte.Parse(strings[1]);
                            else if (strings[0] == "Chanel Rotation Switching") pan.switch_mode = byte.Parse(strings[1]);
                            else if (strings[0] == "Video Mode") pan.pal_ntsc = byte.Parse(strings[1]);
                            else if (strings[0] == "Battery Warning Level") pan.batt_warn_level = byte.Parse(strings[1]);
                            else if (strings[0] == "RSSI Warning Level") pan.rssi_warn_level = byte.Parse(strings[1]);
                            else if (strings[0] == "OSD Brightness") pan.osd_brightness = byte.Parse(strings[1]);
                            else if (strings[0] == "Call Sign") pan.callsign_str = strings[1];
                            else if (strings[0] == "Model Type") cbxModelType.SelectedItem = (ModelType)byte.Parse(strings[1]); //we're not overwriting "eeprom" model type
                            else if (strings[0] == "Sign Air Speed") pan.sign_air_speed = byte.Parse(strings[1]);
                            else if (strings[0] == "Sign Ground  Speed") pan.sign_ground_speed = byte.Parse(strings[1]);
                            else if (strings[0] == "Sign Home Altitude") pan.sign_home_altitude = byte.Parse(strings[1]);
                            else if (strings[0] == "Sign MSL Altitude") pan.sign_msl_altitude = byte.Parse(strings[1]);
                        }

                        //Modify units
                        if (pan.converts == 0)
                        {
                            UNITS_combo.SelectedIndex = 0; //metric
                            STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                            OVERSPEED_label.Text = "Overspeed (km/h)";
                        }
                        else if (pan.converts == 1)
                        {
                            UNITS_combo.SelectedIndex = 1; //imperial
                            STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                            OVERSPEED_label.Text = "Overspeed (mph)";
                        }
                        else //red garbage value in EEPROM - default to metric
                        {
                            pan.converts = 0; //correct value
                            UNITS_combo.SelectedIndex = 0; //metric
                            STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                            OVERSPEED_label.Text = "Overspeed (km/h)";
                        }

                        OVERSPEED_numeric.Value = pan.overspeed;
                        STALL_numeric.Value = pan.stall;
                        MINVOLT_numeric.Value = Convert.ToDecimal(pan.battv) / Convert.ToDecimal(10.0);

                        //RSSI_numeric_max.Value = pan.rssical;
                        //RSSI_numeric_min.Value = pan.rssipersent;

                        updatingRSSI = true;
                        RSSI_numeric_min.Minimum = 0;
                        RSSI_numeric_min.Maximum = 2000;
                        RSSI_numeric_max.Minimum = 0;
                        RSSI_numeric_max.Maximum = 2000;
                        RSSI_numeric_min.Value = 0;
                        RSSI_numeric_max.Value = 0;
                        RSSI_RAW.Checked = Convert.ToBoolean(pan.rssiraw_on % 2);
                        if ((int)(pan.rssiraw_on / 2) == 0)
                        {
                            RSSI_numeric_min.Value = pan.rssipersent;
                            RSSI_numeric_max.Value = pan.rssical;
                            RSSI_numeric_min.Minimum = 0;
                            RSSI_numeric_min.Maximum = 255;
                            RSSI_numeric_max.Minimum = 0;
                            RSSI_numeric_max.Maximum = 255;
                        }
                        else
                        {
                            RSSI_numeric_min.Value = pan.rssipersent * 10;
                            RSSI_numeric_max.Value = pan.rssical * 10;
                            RSSI_numeric_min.Minimum = 900;
                            RSSI_numeric_min.Maximum = 2000;
                            RSSI_numeric_max.Minimum = 900;
                            RSSI_numeric_max.Maximum = 2000;
                        }
                        cbxRSSIChannel.SelectedIndex = (int)(pan.rssiraw_on / 2);

                        if (pan.ch_toggle >= toggle_offset && pan.ch_toggle < 9) ONOFF_combo.SelectedIndex = pan.ch_toggle - toggle_offset;
                        else ONOFF_combo.SelectedIndex = 0; //reject garbage from the red file

                        cbxWarningsAutoPanelSwitch.SelectedItem = (PanelsAutoSwitch)pan.auto_screen_switch;
                        TOGGLE_BEH.Checked = Convert.ToBoolean(pan.switch_mode);

                        CHK_pal.Checked = Convert.ToBoolean(pan.pal_ntsc);

                        BATT_WARNnumeric.Value = pan.batt_warn_level;
                        RSSI_WARNnumeric.Value = pan.rssi_warn_level;

                        BRIGHTNESScomboBox.SelectedIndex = pan.osd_brightness;

                        CALLSIGNmaskedText.Text = pan.callsign_str;

                        cbxAirSpeedSign.Checked = (pan.sign_air_speed != 0);
                        cbxGroundSpeedSign.Checked = (pan.sign_ground_speed != 0);
                        cbxHomeAltitudeSign.Checked = (pan.sign_home_altitude != 0);
                        cbxMslAltitudeSign.Checked = (pan.sign_msl_altitude != 0);

                        this.CHK_pal_CheckedChanged(EventArgs.Empty, EventArgs.Empty);
                        this.pALToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);
                        this.nTSCToolStripMenuItem_CheckStateChanged(EventArgs.Empty, EventArgs.Empty);

                    }
                }
                catch
                {
                    MessageBox.Show("Error Reading file");
                }
                finally
                {
                    updatingRSSI = false;
                }
            }
			
           	osdDraw(panel_number);
            
        }

        private void loadDefaultsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            setupFunctions();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        

        private void updateFirmwareToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            this.toolStripStatusLabel1.Text = "";

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "*.hex|*.hex";
            if(ofd.ShowDialog() == System.Windows.Forms.DialogResult.Cancel)
                return;

            if (ofd.FileName != "")
            {
                byte[] FLASH;
                bool spuploadflash_flag = false;
                try
                {
                    toolStripStatusLabel1.Text = "Reading Hex File";

                    statusStrip1.Refresh();

                    FLASH = readIntelHEXv2(new StreamReader(ofd.FileName));
                }
                catch { MessageBox.Show("Bad Hex File"); return; }

                //bool fail = false;
                ArduinoSTK sp;

                try
                {
                    if (comPort.IsOpen)
                        comPort.Close();

                    sp = new ArduinoSTK();
                    sp.PortName = CMB_ComPort.Text;
                    sp.BaudRate = 57600;
                    sp.DataBits = 8;
                    sp.StopBits = StopBits.One;
                    sp.Parity = Parity.None;
                    sp.DtrEnable = false;
                    sp.RtsEnable = false; //added

                    sp.Open();
                }
                catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

                toolStripStatusLabel1.Text = "Connecting to Board";

                if (sp.connectAP())
                {
                    sp.Progress += new ArduinoSTK.ProgressEventHandler(sp_Progress);
                    try
                    {
                        for (int i = 0; i < 3; i++) //try to upload 3 times
                        { //try to upload n times if it fail
                            spuploadflash_flag = sp.uploadflash(FLASH, 0, FLASH.Length, 0);
                            if (!spuploadflash_flag)
                            {
                                if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                                else Console.WriteLine("keepalive fail (iter " + i + ")");
                                //toolStripStatusLabel1.Text = "Lost sync. Reconnecting...";
                            }
                            else break;
                        }

                        //if (!sp.uploadflash(FLASH, 0, FLASH.Length, 0))
                        //{
                        //    if (sp.IsOpen)
                        //        sp.Close();

                        //    MessageBox.Show("Upload failed. Lost sync. Try using Arduino to upload instead",                                    
                        //        "Error",                            
                        //        MessageBoxButtons.OK,        
                        //        MessageBoxIcon.Warning); 
                        //}
                    }
                    catch (Exception ex)
                    {
                        //fail = true;
                        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }

                }
                else
                {
                    MessageBox.Show("Failed to talk to bootloader");
                }

                sp.Close();

                if (spuploadflash_flag)
                {

                    toolStripStatusLabel1.Text = "Done";

                    MessageBox.Show("Done!");
                }
                else
                {
                    MessageBox.Show("Upload failed. Lost sync. Try using Arduino to upload instead",
                                "Error",
                                MessageBoxButtons.OK,
                                MessageBoxIcon.Warning);
                    toolStripStatusLabel1.Text = "Failed";
                }
            }

            //Check EEPROM version
            this.BUT_ReadOSD_Click(EventArgs.Empty, EventArgs.Empty);

        }

        private Boolean customImage = false;
        private void customBGPictureToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "jpg or bmp|*.jpg;*.bmp";

            ofd.ShowDialog();

            if (ofd.FileName != "")
            {
                try
                {
                    bgpicture = Image.FromFile(ofd.FileName);

                }
                catch { MessageBox.Show("Bad Image"); }
                customImage = true;
				osdDraw(panel_number);
                
            }
        }

        private void sendTLogToolStripMenuItem_Click(object sender, EventArgs e)
        {

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Tlog|*.tlog";

            ofd.ShowDialog();

            if (ofd.FileName != "")
            {
                //if (comPort.IsOpen)
                //    comPort.Close();

                try
                {

                    //comPort.PortName = CMB_ComPort.Text;
                    //comPort.BaudRate = 57600;
                    //comPort.Open();

                }
                catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

                BinaryReader br = new BinaryReader(ofd.OpenFile());

                this.toolStripProgressBar1.Style = ProgressBarStyle.Marquee;
                this.toolStripStatusLabel1.Text = "Sending TLOG data...";

                while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed)
                {
                    try
                    {
                        string message = "";
                        byte[] bytes = br.ReadBytes(200000);
                        int frameIndex = 0;
                        for(int byteIndex = 0; byteIndex < bytes.Length; byteIndex++)
                        {
                            if (frameIndex >= 20)
                            {
                                //string a = "";
                            }

                            if (frameIndex < 20)
                            {
                                while (bytes[byteIndex] == '\0')
                                    byteIndex++;
                                int length = (int)bytes[byteIndex];
                                message += "Payload length: " + length.ToString();
                                byteIndex++;
                                while (bytes[byteIndex] == '\0')
                                    byteIndex++;
                                message += "Packet sequence: " + ((int)bytes[byteIndex]).ToString();
                                byteIndex++;
                                while (bytes[byteIndex] == '\0')
                                    byteIndex++;
                                message += "System ID: " + ((int)bytes[byteIndex]).ToString();
                                byteIndex++;
                                while (bytes[byteIndex] == '\0')
                                    byteIndex++;
                                message += "Component ID: " + ((int)bytes[byteIndex]).ToString();
                                byteIndex++;
                                while (bytes[byteIndex] == '\0')
                                    byteIndex++;
                                message += "Message ID: " + ((int)bytes[byteIndex]).ToString();
                                byteIndex++;
                                message += "Message: ";
                                for (int x = 0; x < length; x++)
                                {
                                    while (bytes[byteIndex] == '\0')
                                        byteIndex++;
                                    message += ((char)bytes[byteIndex]).ToString();
                                    byteIndex++;
                                }
                                while (bytes[byteIndex] == '\0')
                                    byteIndex++;
                                message += "CRC1: " + ((int)bytes[byteIndex]).ToString();
                                byteIndex++;
                                while (bytes[byteIndex] == '\0')
                                    byteIndex++;
                                message += "CRC2: " + ((int)bytes[byteIndex]).ToString();
                                message += Environment.NewLine;
                                byteIndex++;
                            }

                            if (bytes[byteIndex] == 0xFE)
                            {
                                frameIndex++;
                            }

                        }

                        string str = System.Text.Encoding.UTF8.GetString(bytes);
                        str = str.Replace((char)0, '\0');
                        str = str.Replace("\0", "");
                        //comPort.Write(bytes, 0, bytes.Length);

                        System.Threading.Thread.Sleep(5);

                        //Console.Write(comPort.ReadExisting());

                    }
                    catch { break; }

                    Application.DoEvents();
                }

                try
                {
                    toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
                    toolStripStatusLabel1.Text = "";

                    //comPort.Close();
                }
                catch { }
            }
        }

        private void OSD_FormClosed(object sender, FormClosedEventArgs e)
        {
            xmlconfig(true);
        }

        private String arduinoIDEPath = "Arduino-1.6.1";
        private String planeSketchPath = "ArduCAM_OSD";
        private String copterSketchPath = "ArduCAM_OSD";
        private bool autoUpdate = false;
        private bool checkForUpdates = true;

        private void xmlconfig(bool write)
        {
            if (write || !File.Exists(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + @"config.xml"))
            {
                try
                {
                    XmlTextWriter xmlwriter = new XmlTextWriter(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + @"config.xml", Encoding.ASCII);
                    xmlwriter.Formatting = Formatting.Indented;

                    xmlwriter.WriteStartDocument();

                    xmlwriter.WriteStartElement("Config");

                    xmlwriter.WriteElementString("comport", CMB_ComPort.Text);

                    xmlwriter.WriteElementString("Pal", CHK_pal.Checked.ToString());

                    xmlwriter.WriteElementString("ArduinoIDEPath", arduinoIDEPath);

                    xmlwriter.WriteElementString("PlaneSketchPath", planeSketchPath);

                    xmlwriter.WriteElementString("CopterSketchPath", copterSketchPath);

                    xmlwriter.WriteElementString("AutoUpdate", autoUpdate.ToString());

                    xmlwriter.WriteElementString("CheckForUpdates", checkForUpdates.ToString());

                    xmlwriter.WriteEndElement();

                    xmlwriter.WriteEndDocument();
                    xmlwriter.Close();

                    //appconfig.Save();
                }
                catch (Exception ex) { MessageBox.Show(ex.ToString()); }
            }
            else
            {
                try
                {
                    using (XmlTextReader xmlreader = new XmlTextReader(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + @"config.xml"))
                    {
                        while (xmlreader.Read())
                        {
                            xmlreader.MoveToElement();
                            try
                            {
                                switch (xmlreader.Name)
                                {
                                    case "comport":
                                        string temp = xmlreader.ReadString();
                                        CMB_ComPort.Text = temp;
                                        break;
                                    case "Pal":
                                        //string temp2 = xmlreader.ReadString();
                                        //CHK_pal.Checked = (temp2 == "True");
                                        break;
                                    case "ArduinoIDEPath":
                                        arduinoIDEPath = xmlreader.ReadString();
                                        break;
                                    case "PlaneSketchPath":
                                        planeSketchPath = xmlreader.ReadString();
                                        break;
                                    case "CopterSketchPath":
                                        copterSketchPath = xmlreader.ReadString();
                                        break;
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
                            }
                            catch (Exception ee) { Console.WriteLine(ee.Message); } // silent fail on bad entry
                        }
                    }
                }
                catch (Exception ex) { Console.WriteLine("Bad Config File: " + ex.ToString()); } // bad config file
            }
        }

        private Boolean IsValidCharsetFile(OpenFileDialog ofd)
        {
            string errorMessage = "";
            using (var stream = ofd.OpenFile())
            {
                StreamReader sr = new StreamReader(stream);
                //Check header
                long lineNumber = 1;
                if(sr.ReadLine() != "MAX7456")
                    errorMessage += "Invalid file header." + Environment.NewLine;

                lineNumber++;
                while(!sr.EndOfStream)
                {
                    string line = sr.ReadLine();
                    if (line.Length != 8)
                    {
                        errorMessage += "Invalid line length in line:" + lineNumber + Environment.NewLine;
                        break;
                    }
                    foreach(char c in line)
                        if (c != '0' && c != '1')
                        {
                            errorMessage += "Invalid char in line:" + lineNumber + Environment.NewLine;
                            break;
                        }
                    lineNumber++;
                }
                if(string.IsNullOrEmpty(errorMessage) && lineNumber != 16386)
                    errorMessage += "Invalid number of lines: " + lineNumber + Environment.NewLine;
            }
            if(!string.IsNullOrEmpty(errorMessage))
                MessageBox.Show("Invalid Charset File:" + errorMessage, "Invalid Charset File", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            return string.IsNullOrEmpty(errorMessage);
        }

        private void updateFontToolStripMenuItem_Click(object sender, EventArgs e)
        {
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
            if(tempFileName.StartsWith("MINIMOSD_"))
            {
                tempFileName = tempFileName.Remove(0, 9);
                if(tempFileName.EndsWith(".MCM"))
                {
                    tempFileName = tempFileName.Remove(tempFileName.Length - 4, 3);
                    string[] versionArray = tempFileName.Split('.');
                    Int16 version1, version2, version3;
                    if(versionArray.Length > 2)
                    {
                        if(Int16.TryParse(versionArray[0], out version1) && 
                           Int16.TryParse(versionArray[1], out version2) && 
                           Int16.TryParse(versionArray[2], out version3))
                            fileVersion = version1.ToString().Substring(0,1).Trim() + version2.ToString().Substring(0,1).Trim() + version3.ToString().Substring(0,1).Trim();
                    }
                }
            }

            if (ofd.FileName != "")
            {
                if (comPort.IsOpen)
                    comPort.Close();

                try
                {

                    comPort.PortName = CMB_ComPort.Text;
                    comPort.BaudRate = 57600;

                    comPort.Open();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    //System.Threading.Thread.Sleep(2);

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(7000);

                    comPort.ReadExisting();

                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");

                    int timeout = 0;

                    while (comPort.BytesToRead == 0)
                    {
                        System.Threading.Thread.Sleep(500);
                        Console.WriteLine("Waiting...");
                        timeout++;

                        if (timeout > 10)
                        {
                            MessageBox.Show("Error entering font mode - No Data");
                            comPort.Close();
                            return;
                        }
                    }
                    string readFont = comPort.ReadLine();
                    if (!readFont.Contains("Ready for Font") && !readFont.Contains("RFF"))
                    {
                        MessageBox.Show("Error entering CharSet upload mode - invalid data");
                        comPort.Close();
                        return;
                    }

                }
                catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

                using (var stream = ofd.OpenFile())
                {

                    BinaryReader br = new BinaryReader(stream);
                    StreamReader sr2 = new StreamReader(br.BaseStream);

                    string device = sr2.ReadLine();
                    
                    if (device != "MAX7456")
                    {
                        MessageBox.Show("Invalid MCM");
                        comPort.Close();
                        return;
                    }

                    br.BaseStream.Seek(0, SeekOrigin.Begin);

                    long length = br.BaseStream.Length;
                    while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed)
                    {
                        try
                        {
                            toolStripProgressBar1.Value = (int)((br.BaseStream.Position / (float)br.BaseStream.Length) * 100);
                            toolStripStatusLabel1.Text = "CharSet Uploading";


                            int read = 256 * 3;// 163847 / 256 + 1; // 163,847 font file
                            if ((br.BaseStream.Position + read) > br.BaseStream.Length)
                            {
                                read = (int)(br.BaseStream.Length - br.BaseStream.Position);
                            }
                            length -= read;
                            byte[] buffer = br.ReadBytes(read);
                            comPort.Write(buffer, 0, buffer.Length);
                            int timeout = 0;

                            while (comPort.BytesToRead == 0 && read == 768)
                            {
                                System.Threading.Thread.Sleep(10);
                                timeout++;

                                if (timeout > 10)
                                {
                                    MessageBox.Show("CharSet upload failed - no response");
                                    comPort.Close();
                                    return;
                                }
                            }

                            comPort.ReadExisting();
                            if (length < 1000)
                            {
                                lblFWModelType.Text = lblFWModelType.Text;
                            }

                        }
                        catch { 
                            break; 
                        }

                        Application.DoEvents();
                    }
                    comPort.WriteLine("\r\n");
                    //Wait for last char acknowledge
                    int t = 0;
                    while (comPort.BytesToRead == 0)
                    {
                        System.Threading.Thread.Sleep(10);
                        t++;

                        if (t > 10)
                        {
                            MessageBox.Show("No end");
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

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(50);

                    comPort.Close();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    toolStripProgressBar1.Value = 100;
                    toolStripStatusLabel1.Text = "CharSet Done";
                }

                WriteCharsetVersion(fileVersion);
                lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: " + ofd.SafeFileName;
            }
        }

        private void STALL_numeric_ValueChanged(object sender, EventArgs e)
        {
            pan.stall = (byte)STALL_numeric.Value;
        }

        private void RSSI_numeric_min_ValueChanged(object sender, EventArgs e)
        {
            if (updatingRSSI)
                return;
            if (cbxRSSIChannel.SelectedIndex == 0)
            {
                pan.rssipersent = (byte)RSSI_numeric_min.Value;
            }
            else
            {
                pan.rssipersent = (byte)(RSSI_numeric_min.Value / 10);
            }
        }

        private void RSSI_numeric_max_ValueChanged(object sender, EventArgs e)
        {
            if (updatingRSSI)
                return;
            if (cbxRSSIChannel.SelectedIndex == 0)
            {
                pan.rssical = (byte)RSSI_numeric_max.Value;
            }
            else
            {
                pan.rssical = (byte)(RSSI_numeric_max.Value / 10);
            }
        }

        private void OVERSPEED_numeric_ValueChanged(object sender, EventArgs e)
        {
            pan.overspeed = (byte)OVERSPEED_numeric.Value;
        }

        private void UNITS_combo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (UNITS_combo.SelectedIndex == 0)
            {
                pan.converts = 0; //metric
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                OVERSPEED_label.Text = "Overspeed (km/h)";
            }
            else if (UNITS_combo.SelectedIndex == 1)
            {
                pan.converts = 1; //imperial
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                OVERSPEED_label.Text = "Overspeed (mph)";
            }
            pan.do_converts();
			
 	        osdDraw(panel_number);
            
        }

        private void MINVOLT_numeric_ValueChanged(object sender, EventArgs e)
        {
            pan.battv = (byte)(MINVOLT_numeric.Value * 10);
        }

        private void ONOFF_combo_SelectedIndexChanged(object sender, EventArgs e)
        {
            pan.ch_toggle = (byte)(ONOFF_combo.SelectedIndex + toggle_offset);
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            switch (cbxRSSIChannel.SelectedIndex)
            {
                case 0:
                    pan.rssiraw_on = 0;
                    break;
                case 1:
                    pan.rssiraw_on = 8;
                    break;
            }
            pan.rssiraw_on = Convert.ToByte(pan.rssiraw_on + Convert.ToInt32(RSSI_RAW.Checked));
        }

        private void TOGGLE_BEHChanged(object sender, EventArgs e)
        {
            pan.switch_mode = Convert.ToByte(TOGGLE_BEH.Checked);
        }


        private void CHK_pal_Click(object sender, EventArgs e)
        {
            pan.pal_ntsc = 1;
        }

        private void CHK_ntsc_Click(object sender, EventArgs e)
        {
            pan.pal_ntsc = 0;
        }

        private void RSSI_WARNnumeric_ValueChanged(object sender, EventArgs e)
        {
            pan.rssi_warn_level = (byte)RSSI_WARNnumeric.Value;
        }

        private void BATT_WARNnumeric_ValueChanged(object sender, EventArgs e)
        {
            pan.batt_warn_level = (byte)BATT_WARNnumeric.Value;
        }


        private void CALLSIGNmaskedText_Validated(object sender, EventArgs e)
        {
            pan.callsign_str = CALLSIGNmaskedText.Text;
            //convert to lowercase on validate
            pan.callsign_str = pan.callsign_str.ToLower(new CultureInfo("en-US", false));

            CALLSIGNmaskedText.Text = pan.callsign_str;
			
            osdDraw(panel_number);
            
        }

        private void BRIGHTNESScomboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            pan.osd_brightness = (byte)BRIGHTNESScomboBox.SelectedIndex;
        }

        private void gettingStartedToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                System.Diagnostics.Process.Start("https://code.google.com/p/arducam-osd/wiki/arducam_osd?tm=6");
            }
            catch { MessageBox.Show("Webpage open failed... do you have a virus?"); }
        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //MessageBox.Show("Author: Michael Oborne \nCo-authors: Pedro Santos \n Zoltán Gábor", "About ArduCAM OSD Config", MessageBoxButtons.OK, MessageBoxIcon.Information);
            AboutBox1 about = new AboutBox1();
            about.Show();
        }

        private void rbtBatteryPercent_CheckedChanged(object sender, EventArgs e)
        {
            pan.osd_battery_show_percentage = Convert.ToByte(rbtBatteryPercent.Checked);
            //Refresh battery percent presentation
			
            osdDraw(panel_number);
            
        }



       

        public ModelType modelType = ModelType.Plane; 
        private void cbxModelType_SelectedIndexChanged(object sender, EventArgs e)
        {
            modelType = (ModelType)cbxModelType.SelectedItem;
            if (UNITS_combo.SelectedIndex == 0)
            {
                pan.converts = 0; //metric
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (m/min) / 10" : "Stall Speed (km/h)";
                OVERSPEED_label.Text = "Overspeed (km/h)";
            }
            else if (UNITS_combo.SelectedIndex == 1)
            {
                pan.converts = 1; //imperial
                STALL_label.Text = cbxModelType.SelectedItem.ToString() == "Copter" ? "Max VS (ft/min) / 10" : "Stall Speed (mph)";
                OVERSPEED_label.Text = "Overspeed (mph)";
            }

            if (modelType == ModelType.Plane)
            {
                if(!customImage)
                    bgpicture = Image.FromFile("vlcsnap-2012-01-28-07h46m04s95.png");
            }
            else if (modelType == ModelType.Copter)
            {
                if (!customImage)
					try {
                    	bgpicture = Image.FromFile("quad.png");
				} catch (Exception ex)
                {
                    //fail = true;
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
			
            osdDraw(panel_number);
            
        }

        enum PanelsAutoSwitch
        {
            Disabled = 3,
            Panel1 = 0,
            Panel2 = 1,
            //PanelOff = 2
        }

        private void cbxWarningsAutoPanelSwitch_SelectedIndexChanged(object sender, EventArgs e)
        {
            pan.auto_screen_switch = (byte)(PanelsAutoSwitch)cbxWarningsAutoPanelSwitch.SelectedItem;

            //Get panel warnings check status
            Boolean isPanel1WarningChecked = false;
            Boolean isPanel2WarningChecked = false;
			for(int k=0;k<npanel;k++) {
            	//Panel 
            	foreach (var item in this.scr[k].panelItems)
            	{
                	if (item != null && item.Item1 == "Warnings")
                	{
	                    TreeNode[] tnArray = this.scr[k].LIST_items.Nodes.Find(item.Item1, true);
                    	isPanel1WarningChecked = tnArray[0].Checked;
                	}
            	}
            }


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

        public Boolean airSpeedSign = false;
        private void cbxAirSpeedSign_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxAirSpeedSign.Checked)
                pan.sign_air_speed = 0x13;
            else
                pan.sign_air_speed = 0x00;
            airSpeedSign = cbxAirSpeedSign.Checked;
			osdDraw(panel_number);
            
        }

        public Boolean groundSpeedSign = false;
        private void cbxGroundSpeedSign_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxGroundSpeedSign.Checked)
                pan.sign_ground_speed = 0x14;
            else
                pan.sign_ground_speed = 0x00;
            groundSpeedSign = cbxGroundSpeedSign.Checked;
		
			osdDraw(panel_number);
        }

        public Boolean homeAltSign = false;
        private void cbxHomeAltitudeSign_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxHomeAltitudeSign.Checked)
                pan.sign_home_altitude = 0x12;
            else
                pan.sign_home_altitude = 0x00;
            homeAltSign = cbxHomeAltitudeSign.Checked;
			
			osdDraw(panel_number);
        }

        public Boolean mslAltSign = false;
        private void cbxMslAltitudeSign_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxMslAltitudeSign.Checked)
                pan.sign_msl_altitude = 0x11;
            else
                pan.sign_msl_altitude = 0x00;
            mslAltSign = cbxMslAltitudeSign.Checked;
			
			osdDraw(panel_number);
        }




        private void cbxRSSIChannel_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetRSSIValues(); 
        }

        private void SetRSSIValues()
        {
            //updatingRSSI = true;
            int OldMax = (int)RSSI_numeric_min.Maximum;
            RSSI_numeric_min.Minimum = 0;
            RSSI_numeric_min.Maximum = 2000;
            RSSI_numeric_max.Minimum = 0;
            RSSI_numeric_max.Maximum = 2000;
            if (cbxRSSIChannel.SelectedIndex == 0)
            {
                lblRSSIMin.Text = "RSSI Min Value";
                lblRSSIMax.Text = "RSSI Max Value";
                if (OldMax == 2000)
                {
                    //RSSI_numeric_min.Value = (pan.rssipersent * 10 - 1000) * 255 / 1000;
                    //RSSI_numeric_max.Value = (pan.rssical * 10 - 1000) * 255 / 1000;
                    RSSI_numeric_min.Value = (pan.rssipersent * 10 - 900) * 255 / 1100;
                    RSSI_numeric_max.Value = (pan.rssical * 10 - 900) * 255 / 1100;
                    //pan.rssipersent = (byte)((pan.rssipersent - 100) * 255 / 100);
                    //pan.rssical = (byte)((pan.rssical - 100) * 255 / 100);
                }
                RSSI_numeric_min.Minimum = 0;
                RSSI_numeric_min.Maximum = 255;
                RSSI_numeric_max.Minimum = 0;
                RSSI_numeric_max.Maximum = 255;
            }
            else
            {
                lblRSSIMin.Text = "RSSI Min Value (pwm)";
                lblRSSIMax.Text = "RSSI Max Value (pwm)";
                if (OldMax == 255)
                {
                    //RSSI_numeric_min.Value = pan.rssipersent * 100 / 255 + 100;
                    //RSSI_numeric_max.Value = pan.rssical * 100 / 255 + 100;
                    RSSI_numeric_min.Value = (pan.rssipersent * 1100 / 255) + 900;
                    RSSI_numeric_max.Value = (pan.rssical * 1100 / 255) + 900;
                    //pan.rssipersent = (byte)(pan.rssipersent * 100 / 255 + 100);
                    //pan.rssical = (byte)(pan.rssical * 100 / 255 + 100);
                }
                RSSI_numeric_min.Maximum = 2000;
                RSSI_numeric_min.Minimum = 900;
                RSSI_numeric_max.Maximum = 2000;
                RSSI_numeric_max.Minimum = 900;
            }
            
            switch (cbxRSSIChannel.SelectedIndex)
            {
                case 0:
                    pan.rssiraw_on = 0;
                    break;
                case 1:
                    pan.rssiraw_on = 8;
                    break;
            }
            pan.rssiraw_on = Convert.ToByte(pan.rssiraw_on + Convert.ToInt32(RSSI_RAW.Checked));
        }

        private void presentCustomCharsetToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "mcm|*.mcm";
            if(ofd.ShowDialog() != System.Windows.Forms.DialogResult.OK)
                return;

            chars = mcm.readMCM(ofd.FileName);
            lblPresentedCharset.Text = "Presented Charset: " + ofd.SafeFileName;
			
		
			osdDraw(panel_number);
        }

        private void updateCharsetDevToolStripMenuItem_Click(object sender, EventArgs e)
        {
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
            if (tempFileName.StartsWith("MINIMOSD_"))
            {
                tempFileName = tempFileName.Remove(0, 9);
                if (tempFileName.EndsWith(".MCM"))
                {
                    tempFileName = tempFileName.Remove(tempFileName.Length - 4, 3);
                    string[] versionArray = tempFileName.Split('.');
                    Int16 version1, version2, version3;
                    if (versionArray.Length > 2)
                    {
                        if (Int16.TryParse(versionArray[0], out version1) &&
                           Int16.TryParse(versionArray[1], out version2) &&
                           Int16.TryParse(versionArray[2], out version3))
                            fileVersion = version1.ToString().Substring(0, 1).Trim() + version2.ToString().Substring(0, 1).Trim() + version3.ToString().Substring(0, 1).Trim();
                    }
                }
            }

            if (ofd.FileName != "")
            {
                if (comPort.IsOpen)
                    comPort.Close();

                try
                {

                    comPort.PortName = CMB_ComPort.Text;
                    comPort.BaudRate = 57600;

                    comPort.Open();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    //System.Threading.Thread.Sleep(2);

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(7000);

                    comPort.ReadExisting();

                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");

                    int timeout = 0;

                    while (comPort.BytesToRead == 0)
                    {
                        System.Threading.Thread.Sleep(500);
                        Console.WriteLine("Waiting...");
                        timeout++;

                        if (timeout > 6)
                        {
                            MessageBox.Show("Error entering font mode - No Data");
                            comPort.Close();
                            return;
                        }
                    }
                    if (!comPort.ReadLine().Contains("RFF"))
                    {
                        MessageBox.Show("Error entering CharSet upload mode - invalid data");
                        comPort.Close();
                        return;
                    }

                }
                catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

                using (var stream = ofd.OpenFile())
                {

                    BinaryReader br = new BinaryReader(stream);
                    StreamReader sr2 = new StreamReader(br.BaseStream);

                    string device = sr2.ReadLine();

                    if (device != "MAX7456")
                    {
                        MessageBox.Show("Invalid MCM");
                        comPort.Close();
                        return;
                    }

                    br.BaseStream.Seek(0, SeekOrigin.Begin);

                    long length = br.BaseStream.Length;
                    while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed)
                    {
                        try
                        {
                            toolStripProgressBar1.Value = (int)((br.BaseStream.Position / (float)br.BaseStream.Length) * 100);
                            toolStripStatusLabel1.Text = "CharSet Uploading";


                            int read = 256 * 3;// 163847 / 256 + 1; // 163,847 font file
                            if ((br.BaseStream.Position + read) > br.BaseStream.Length)
                            {
                                read = (int)(br.BaseStream.Length - br.BaseStream.Position);
                            }
                            length -= read;
                            byte[] buffer = br.ReadBytes(read);
                            comPort.Write(buffer, 0, buffer.Length);
                            int timeout = 0;

                            while (comPort.BytesToRead == 0 && read == 768)
                            {
                                System.Threading.Thread.Sleep(10);
                                timeout++;

                                if (timeout > 10)
                                {
                                    MessageBox.Show("CharSet upload failed - no response");
                                    comPort.Close();
                                    return;
                                }
                            }

                            comPort.ReadExisting();
                            if (length < 1000)
                            {
                                lblFWModelType.Text = lblFWModelType.Text;
                            }

                        }
                        catch
                        {
                            break;
                        }

                        Application.DoEvents();
                    }
                    comPort.WriteLine("\r\n");
                    //Wait for last char acknowledge
                    int t = 0;
                    while (comPort.BytesToRead == 0)
                    {
                        System.Threading.Thread.Sleep(10);
                        t++;

                        if (t > 10)
                        {
                            MessageBox.Show("No end");
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

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(50);

                    comPort.Close();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    toolStripProgressBar1.Value = 100;
                    toolStripStatusLabel1.Text = "CharSet Done";
                }

                WriteCharsetVersion(fileVersion);
                lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: " + ofd.SafeFileName;
            }
        }

        private bool UploadFirmware(string fileName)
        {
            if (string.IsNullOrEmpty(fileName))
                return false;

            byte[] FLASH;
            bool spuploadflash_flag = false;
            try
            {
                toolStripStatusLabel1.Text = "Reading Hex File";

                statusStrip1.Refresh();

                FLASH = readIntelHEXv2(new StreamReader(fileName));
            }
            catch { MessageBox.Show("Bad Hex File"); return false; }

            //bool fail = false;
            ArduinoSTK sp;

            try
            {
                if (comPort.IsOpen)
                    comPort.Close();

                sp = new ArduinoSTK();
                sp.PortName = CMB_ComPort.Text;
                sp.BaudRate = 57600;
                sp.DataBits = 8;
                sp.StopBits = StopBits.One;
                sp.Parity = Parity.None;
                sp.DtrEnable = false;
                sp.RtsEnable = false; //added

                sp.Open();
            }
            catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return false; }

            toolStripStatusLabel1.Text = "Connecting to Board";

            if (sp.connectAP())
            {
                sp.Progress += new ArduinoSTK.ProgressEventHandler(sp_Progress);
                try
                {
                    for (int i = 0; i < 3; i++) //try to upload 3 times
                    { //try to upload n times if it fail
                        spuploadflash_flag = sp.uploadflash(FLASH, 0, FLASH.Length, 0);
                        if (!spuploadflash_flag)
                        {
                            if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                            else Console.WriteLine("keepalive fail (iter " + i + ")");
                            //toolStripStatusLabel1.Text = "Lost sync. Reconnecting...";
                        }
                        else break;
                    }

                    //if (!sp.uploadflash(FLASH, 0, FLASH.Length, 0))
                    //{
                    //    if (sp.IsOpen)
                    //        sp.Close();

                    //    MessageBox.Show("Upload failed. Lost sync. Try using Arduino to upload instead",                                    
                    //        "Error",                            
                    //        MessageBoxButtons.OK,        
                    //        MessageBoxIcon.Warning); 
                    //}
                }
                catch (Exception ex)
                {
                    //fail = true;
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            else
            {
                MessageBox.Show("Failed to talk to bootloader");
            }

            sp.Close();

            if (spuploadflash_flag)
            {

                toolStripStatusLabel1.Text = "Done";

                MessageBox.Show("Done!");
            }
            else
            {
                MessageBox.Show("Upload failed. Lost sync. Try using Arduino to upload instead",
                            "Error",
                            MessageBoxButtons.OK,
                            MessageBoxIcon.Warning);
                toolStripStatusLabel1.Text = "Failed";
            }
            return true;
        }

        private ModelType GetModelType()
        {
            ModelType modelType = ModelType.Unknown;
            byte[] tempEeprom = null;
            bool fail = false;
            ArduinoSTK sp;
            try
            {
                if (comPort.IsOpen)
                    comPort.Close();

                sp = new ArduinoSTK();
                sp.PortName = CMB_ComPort.Text;
                sp.BaudRate = 57600;
                sp.DtrEnable = true;

                sp.Open();
            }
            catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return ModelType.Unknown; }

            if (sp.connectAP())
            {
                try
                {
                    for (int i = 0; i < 5; i++)
                    { //try to download two times if it fail
                        tempEeprom = sp.download(1024);
                        if (!sp.down_flag)
                        {
                            if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                            else Console.WriteLine("keepalive fail (iter " + i + ")");
                        }
                        else break;
                    }
                    modelType = (ModelType)tempEeprom[MODEL_TYPE_ADD];
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Failed to talk to bootloader");
            }

            sp.Close();
                
            //Setup configuration panel
            return modelType;
        }

        private bool UploadFont(OpenFileDialog ofd)
        {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
            toolStripStatusLabel1.Text = "";


            if (!IsValidCharsetFile(ofd))
                return false;

            //Get file version
            string fileVersion = "000";
            string tempFileName = ofd.SafeFileName.ToUpper();
            if (tempFileName.StartsWith("MINIMOSD_"))
            {
                tempFileName = tempFileName.Remove(0, 9);
                if (tempFileName.EndsWith(".MCM"))
                {
                    tempFileName = tempFileName.Remove(tempFileName.Length - 4, 3);
                    string[] versionArray = tempFileName.Split('.');
                    Int16 version1, version2, version3;
                    if (versionArray.Length > 2)
                    {
                        if (Int16.TryParse(versionArray[0], out version1) &&
                           Int16.TryParse(versionArray[1], out version2) &&
                           Int16.TryParse(versionArray[2], out version3))
                            fileVersion = version1.ToString().Substring(0, 1).Trim() + version2.ToString().Substring(0, 1).Trim() + version3.ToString().Substring(0, 1).Trim();
                    }
                }
            }

            if (ofd.FileName != "")
            {
                if (comPort.IsOpen)
                    comPort.Close();

                try
                {

                    comPort.PortName = CMB_ComPort.Text;
                    comPort.BaudRate = 57600;

                    comPort.Open();

                    comPort.DtrEnable = false;
                    comPort.RtsEnable = false;

                    //System.Threading.Thread.Sleep(2);

                    comPort.DtrEnable = true;
                    comPort.RtsEnable = true;

                    System.Threading.Thread.Sleep(7000);

                    comPort.ReadExisting();

                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");
                    comPort.WriteLine("");

                    int timeout = 0;

                    while (comPort.BytesToRead == 0)
                    {
                        System.Threading.Thread.Sleep(500);
                        Console.WriteLine("Waiting...");
                        timeout++;

                        if (timeout > 6)
                        {
                            MessageBox.Show("Error entering font mode - No Data");
                            comPort.Close();
                            return false;
                        }
                    }
                    if (!comPort.ReadLine().Contains("RFF"))
                    {
                        MessageBox.Show("Error entering CharSet upload mode - invalid data");
                        comPort.Close();
                        return false;
                    }

                }
                catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return false; }

                using (var stream = ofd.OpenFile())
                {

                    BinaryReader br = new BinaryReader(stream);
                    StreamReader sr2 = new StreamReader(br.BaseStream);

                    string device = sr2.ReadLine();

                    if (device != "MAX7456")
                    {
                        MessageBox.Show("Invalid MCM");
                        comPort.Close();
                        return false;
                    }

                    br.BaseStream.Seek(0, SeekOrigin.Begin);

                    long length = br.BaseStream.Length;
                    while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed)
                    {
                        try
                        {
                            toolStripProgressBar1.Value = (int)((br.BaseStream.Position / (float)br.BaseStream.Length) * 100);
                            toolStripStatusLabel1.Text = "CharSet Uploading";


                            int read = 256 * 3;// 163847 / 256 + 1; // 163,847 font file
                            if ((br.BaseStream.Position + read) > br.BaseStream.Length)
                            {
                                read = (int)(br.BaseStream.Length - br.BaseStream.Position);
                            }
                            length -= read;
                            byte[] buffer = br.ReadBytes(read);
                            comPort.Write(buffer, 0, buffer.Length);
                            int timeout = 0;

                            while (comPort.BytesToRead == 0 && read == 768)
                            {
                                System.Threading.Thread.Sleep(10);
                                timeout++;

                                if (timeout > 10)
                                {
                                    MessageBox.Show("CharSet upload failed - no response");
                                    comPort.Close();
                                    return false;
                                }
                            }

                            comPort.ReadExisting();
                            if (length < 1000)
                            {
                                lblFWModelType.Text = lblFWModelType.Text;
                            }

                        }
                        catch
                        {
                            break;
                        }

                        Application.DoEvents();
                    }
                    comPort.WriteLine("\r\n");
                    //Wait for last char acknowledge
                    int t = 0;
                    while (comPort.BytesToRead == 0)
                    {
                        System.Threading.Thread.Sleep(10);
                        t++;

                        if (t > 10)
                        {
                            MessageBox.Show("No end");
                            comPort.Close();
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

                WriteCharsetVersion(fileVersion);
                lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: " + ofd.SafeFileName;
            }
            return true;
        }

        private bool GetLatestFW(ModelType modelType)
        {
            try
            {
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
                while (readCount > 0)
                {
                    latestPlaneFile.Write(buffer, 0, readCount);
                    readCount = ftpStream.Read(buffer, 0, bufferSize);
                }
                ftpStream.Close();
                latestPlaneFile.Close();
                response.Close();
            }
            catch
            {
                return false;
            }
            return true;
        }

        private void updateCharsetcustomFwToolStripMenuItem_Click(object sender, EventArgs e)
        {
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
            ModelType modelType = GetModelType();
            modelType = ModelType.Copter;
            string modelFileName = "MinimOSD_" + modelType.ToString() + ".hex";
            if (modelType == ModelType.Unknown)
            {
                if(MessageBox.Show("Unknown current fw." + Environment.NewLine +
                                   "If you proceed you'll need to upload  the fw manually after charset upload." + Environment.NewLine + 
                                   "Do you want to proceed?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == System.Windows.Forms.DialogResult.No)
                    return;
            }

            //Get latest fw from ftp
            if (!GetLatestFW(modelType))
            {
                if(MessageBox.Show("Unable to get latest fw from internet." + Environment.NewLine +
                                   "If you proceed you'll need to upload the fw manually after charset upload." + Environment.NewLine + 
                                   "Do you want to proceed?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == System.Windows.Forms.DialogResult.No)
                return;
            }

            //Upload font fw
            if(!UploadFirmware("charuploader.hex"))
                return;

            //Upload font
            if(!UploadFont(ofd))
                return;

            //Upload fw
            if(modelType != ModelType.Unknown)
                UploadFirmware(modelFileName);
        }



        private void GetFwFromOSD()
        {
            ArduinoSTK sp;
            byte[] FLASH = new byte[32 * 1024];
            //byte[] FLASH = new byte[30382];

            try
            {
                if (comPort.IsOpen)
                    comPort.Close();

                sp = new ArduinoSTK();
                sp.PortName = CMB_ComPort.Text;
                sp.BaudRate = 57600;
                sp.DataBits = 8;
                sp.StopBits = StopBits.One;
                sp.Parity = Parity.None;
                sp.DtrEnable = false;
                sp.RtsEnable = false; //added

                sp.Open();

            }
            catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

            if (sp.connectAP())
            {
                try
                {
                    int start = 0;
                    short length = 0x100;

                    while (start < FLASH.Length)
                    {
                        sp.setaddress(start);
                        sp.downloadflash(length).CopyTo(FLASH, start);
                        start += length;
                    }

                    StreamWriter sw = new StreamWriter(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + "FW" + Path.DirectorySeparatorChar + @"flash.bin", false);
                    BinaryWriter bw = new BinaryWriter(sw.BaseStream);
                    bw.Write(FLASH, 0, FLASH.Length);
                    bw.Close();

                    sw = new StreamWriter(Path.GetDirectoryName(Application.ExecutablePath) + Path.DirectorySeparatorChar + "FW" + Path.DirectorySeparatorChar + @"flash.hex", false);
                    for (int i = 0; i < FLASH.Length; i += 16)
                    {
                        string add = string.Format("{0:X4}", i);
                        if (i % (0x1000 << 4) == 0)
                        {
                            if (i != 0)
                                sw.WriteLine(":02000002{0:X4}{1:X2}", ((i >> 4) & 0xf000), 0x100 - (2 + 2 + (((i >> 4) & 0xf000) >> 8) & 0xff));
                        }
                        if (add.Length == 5)
                        {
                            add = add.Substring(1);
                        }
                        sw.Write(":{0:X2}{1}00", 16, add);
                        byte ck = (byte)(16 + (i & 0xff) + ((i >> 8) & 0xff));
                        for (int a = 0; a < 16; a++)
                        {
                            ck += FLASH[i + a];
                            sw.Write("{0:X2}", FLASH[i + a]);
                        }
                        sw.WriteLine("{0:X2}", (byte)(0x100 - ck));
                    }

                    sw.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            sp.Close();
        }

        private void getFwFromOSDToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GetFwFromOSD();
        }

        private void CALLSIGNmaskedText_Validating(object sender, CancelEventArgs e)
        {
            string validString = "";
            foreach (char c in CALLSIGNmaskedText.Text)
            {

                if ((c == '-') || ((c >= 'a') && (c <= 'z')) || ((c >= 'A') && (c <= 'Z')) || ((c >= '0') && (c <= '9')))
                    validString += c;
            }
            CALLSIGNmaskedText.Text = validString;
        }

        
		
		int Constrain(double value, double min, double max)
        {
            if (value < min)
                return (int)min;
            if (value > max)
                return (int)max;

            return (int)value;
        }


        private void cbxAutoUpdate_CheckedChanged(object sender, EventArgs e)
        {
            checkForUpdates = cbxAutoUpdate.Checked;
        }

        private void cbxShowUpdateDialog_CheckedChanged(object sender, EventArgs e)
        {
            autoUpdate = !cbxShowUpdateDialog.Checked;
        }
		public Size get_basesize(){
			return basesize;
		}
		
		private void PANEL_tabs_Selected(object sender, TabControlEventArgs e)
        {
			//System.Windows.Forms.TabControl
 			string s = ((TabControl)sender).SelectedTab.Name;
			
					
			string[] hdr = s.Split(new char[] { '_' }, StringSplitOptions.RemoveEmptyEntries);
			
			if(hdr.Length>1) {
				int k=int.Parse(hdr[1]);
				
            	osdDraw(k-1);
			}

        }
 
    }
}