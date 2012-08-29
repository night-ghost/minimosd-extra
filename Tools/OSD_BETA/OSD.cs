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

namespace OSD
{
    public partial class OSD : Form
    {
        //max 7456 datasheet pg 10
        //pal  = 16r 30 char
        //ntsc = 13r 30 char
        Int16 panel_number = 0;
        const Int16 npanel = 2;

        Size basesize = new Size(30, 16);
        /// <summary>
        /// the un-scaled font render image
        /// </summary>
        //Bitmap[] screen = new Bitmap[npanel];

        Bitmap[] screen = new Bitmap[npanel];
        //Bitmap screen2 = new Bitmap(30 * 12, 16 * 18);
        /// <summary>
        /// the scaled to size background control
        /// </summary>
        Bitmap image = new Bitmap(30 * 12, 16 * 18);
        /// <summary>
        /// Bitmaps of all the chars created from the mcm
        /// </summary>
        Bitmap[] chars;
        /// <summary>
        /// record of what panel is using what squares
        /// </summary>
        string[][] usedPostion = new string[30][];
        /// <summary>
        /// used to track currently selected panel across calls
        /// </summary>
        string[] currentlyselected = new string[npanel];
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

        bool[] mousedown = new bool[npanel];
        //bool mousedown1 = false;
        //bool mousedown2 = false;

        SerialPort comPort = new SerialPort();

        Panels pan;

        Tuple<string, Func<int, int, int>, int, int, int, int, int>[] panelItems = new Tuple<string, Func<int, int, int>, int, int, int, int, int>[30];
        Tuple<string, Func<int, int, int>, int, int, int, int, int>[] panelItems2 = new Tuple<string, Func<int, int, int>, int, int, int, int, int>[30];

        Graphics[] gr = new Graphics[npanel];
        //Graphics gr2;
        // in pixels
        int[] x = new int[npanel];
        int[] y = new int[npanel];
        //int x2 = 0, y2 = 0;

        public OSD()
        {
            InitializeComponent();

            // load default font
            chars = mcm.readMCM("Gabor.mcm");
            // load default bg picture
            try
            {
                bgpicture = Image.FromFile("vlcsnap-2012-01-28-07h46m04s95.png");
            }
            catch { }
            for(int i = 0; i < npanel;i++) {
                screen[i] = new Bitmap(30 * 12, 16 * 18);
                gr[i] = Graphics.FromImage(screen[i]);
                mousedown[i] = false;
                x[i] = 0;
                y[i] = 0;
                currentlyselected[i] = "";
            }

            pan = new Panels(this);

            // setup all panel options
            setupFunctions(); //setup panel item box
        }

        void changeToPal(bool pal)
        {
            if (pal)
            {
                basesize = new Size(30, 16);
                for(int i = 0; i < npanel;i++){
                    screen[i] = new Bitmap(30 * 12, 16 * 18);
                }
                image = new Bitmap(30 * 12, 16 * 18);

                NUM_X.Maximum = 29;
                NUM_Y.Maximum = 15;
                NUM_X2.Maximum = 29;
                NUM_Y2.Maximum = 15;
            }
            else
            {
                basesize = new Size(30, 13);
                for (int i = 0; i < npanel; i++)
                {
                    screen[i] = new Bitmap(30 * 12, 13 * 18);
                }
                image = new Bitmap(30 * 12, 13 * 18);

                NUM_X.Maximum = 29;
                NUM_Y.Maximum = 15;
                NUM_X2.Maximum = 29;
                NUM_Y2.Maximum = 15;
            }

            
        }
        //Set item boxes
        void setupFunctions()
        {
            //currentlyselected1 = "";
            //currentlyselected2 = "";
            processingpanel = "";


            int a = 0;

            for (a = 0; a < usedPostion.Length; a++)
            {
                usedPostion[a] = new string[16];
            }

            a = 0;

            // first 8
            // Display name,printfunction,X,Y,ENaddress,Xaddress,Yaddress
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Center", pan.panCenter, 13, 8, panCenter_en_ADDR, panCenter_x_ADDR, panCenter_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Pitch", pan.panPitch, 22, 10, panPitch_en_ADDR, panPitch_x_ADDR, panPitch_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Roll", pan.panRoll, 11, 1, panRoll_en_ADDR, panRoll_x_ADDR, panRoll_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Battery A", pan.panBatt_A, 1, 13, panBatt_A_en_ADDR, panBatt_A_x_ADDR, panBatt_A_y_ADDR);
            //items[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Battery B", pan.panBatt_B, 21, 3, panBatt_B_en_ADDR, panBatt_B_x_ADDR, panBatt_B_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Visible Sats", pan.panGPSats, 1, 9, panGPSats_en_ADDR, panGPSats_x_ADDR, panGPSats_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("GPS Lock", pan.panGPL, 1, 10, panGPL_en_ADDR, panGPL_x_ADDR, panGPL_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("GPS Coord", pan.panGPS, 1, 14, panGPS_en_ADDR, panGPS_x_ADDR, panGPS_y_ADDR);

            //second 8
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Heading Rose", pan.panRose, 17, 14, panRose_en_ADDR, panRose_x_ADDR, panRose_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Heading", pan.panHeading, 24, 13, panHeading_en_ADDR, panHeading_x_ADDR, panHeading_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Heart Beat", pan.panMavBeat, 14, 15, panMavBeat_en_ADDR, panMavBeat_x_ADDR, panMavBeat_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Home Direction", pan.panHomeDir, 14, 3, panHomeDir_en_ADDR, panHomeDir_x_ADDR, panHomeDir_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Home Distance", pan.panHomeDis, 22, 1, panHomeDis_en_ADDR, panHomeDis_x_ADDR, panHomeDis_y_ADDR);
            //items[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("WP Dir", pan.panWPDir, 14, 4, panWPDir_en_ADDR, panWPDir_x_ADDR, panWPDir_y_ADDR);
            //items[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("WP Dir", pan.panWPDis, 14, 4, panWPDis_en_ADDR, panWPDis_x_ADDR, panWPDis_y_ADDR);
            // rssi

            // third 8
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Altitude", pan.panAlt, 22, 3, panAlt_en_ADDR, panAlt_x_ADDR, panAlt_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Home Altitude", pan.panHomeAlt, 22, 2, panHomeAlt_en_ADDR, panHomeAlt_x_ADDR, panHomeAlt_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Climb Rate", pan.panClimb, 1, 6, panClimb_en_ADDR, panClimb_x_ADDR, panClimb_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Battery Percent", pan.panBatteryPercent, 1, 4, panBatteryPercent_en_ADDR, panBatteryPercent_x_ADDR, panBatteryPercent_y_ADDR);
            
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Current", pan.panCur_A, 1, 12, panCur_A_en_ADDR, panCur_A_x_ADDR, panCur_A_y_ADDR);
            
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Velocity", pan.panVel, 1, 2, panVel_en_ADDR, panVel_x_ADDR, panVel_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Air Speed", pan.panAirSpeed, 1, 1, panAirSpeed_en_ADDR, panAirSpeed_x_ADDR, panAirSpeed_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Throttle", pan.panThr, 1, 3, panThr_en_ADDR, panThr_x_ADDR, panThr_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Flight Mode", pan.panFlightMode, 18, 13, panFMod_en_ADDR, panFMod_x_ADDR, panFMod_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Horizon", pan.panHorizon, 8, 6, panHorizon_en_ADDR, panHorizon_x_ADDR, panHorizon_y_ADDR);
            
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Wind Speed", pan.panWindSpeed, 24, 7, panWindSpeed_en_ADDR, panWindSpeed_x_ADDR, panWindSpeed_y_ADDR);
            
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Warnings", pan.panWarn, 9, 4, panWarn_en_ADDR, panWarn_x_ADDR, panWarn_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Time", pan.panTime, 22, 4, panTime_en_ADDR, panTime_x_ADDR, panTime_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("On/Off", pan.panOff, 16, 15, panOff_en_ADDR, panOff_x_ADDR, panOff_y_ADDR);
            panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("RSSI", pan.panRSSI, 12, 12, panRSSI_en_ADDR, panRSSI_x_ADDR, panRSSI_y_ADDR);
        //    panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Tune", pan.panTune, 0, 0, panTune_en_ADDR, panTune_x_ADDR, panTune_y_ADDR);
            
            //Fill List of items in tabe number 1
            LIST_items.Items.Clear();

            startup = true;
            foreach (var thing in panelItems)
            {
                if (thing != null)
                {
                    
                    if (thing.Item1 == "Center")
                    {
                        LIST_items.Items.Add(thing.Item1, false);

                    }
                    
                    else if (thing.Item1 == "Tune")
                    {
                        LIST_items.Items.Add(thing.Item1, false);

                    }
                    else
                    {
                        LIST_items.Items.Add(thing.Item1, true);
                    }
                }
            }

            startup = false;



            a = 0;

            // first 8
            // Display name,printfunction,X,Y,ENaddress,Xaddress,Yaddress
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Center", pan.panCenter, 13, 8, panCenter_en_ADDR, panCenter_x_ADDR, panCenter_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Pitch", pan.panPitch, 22, 10, panPitch_en_ADDR, panPitch_x_ADDR, panPitch_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Roll", pan.panRoll, 11, 1, panRoll_en_ADDR, panRoll_x_ADDR, panRoll_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Battery A", pan.panBatt_A, 1, 13, panBatt_A_en_ADDR, panBatt_A_x_ADDR, panBatt_A_y_ADDR);
            //items[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Battery B", pan.panBatt_B, 21, 3, panBatt_B_en_ADDR, panBatt_B_x_ADDR, panBatt_B_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Visible Sats", pan.panGPSats, 1, 9, panGPSats_en_ADDR, panGPSats_x_ADDR, panGPSats_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("GPS Lock", pan.panGPL, 1, 10, panGPL_en_ADDR, panGPL_x_ADDR, panGPL_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("GPS Coord", pan.panGPS, 1, 14, panGPS_en_ADDR, panGPS_x_ADDR, panGPS_y_ADDR);

            //second 8
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Heading Rose", pan.panRose, 17, 14, panRose_en_ADDR, panRose_x_ADDR, panRose_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Heading", pan.panHeading, 24, 13, panHeading_en_ADDR, panHeading_x_ADDR, panHeading_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Heart Beat", pan.panMavBeat, 14, 15, panMavBeat_en_ADDR, panMavBeat_x_ADDR, panMavBeat_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Home Direction", pan.panHomeDir, 14, 3, panHomeDir_en_ADDR, panHomeDir_x_ADDR, panHomeDir_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Home Distance", pan.panHomeDis, 22, 1, panHomeDis_en_ADDR, panHomeDis_x_ADDR, panHomeDis_y_ADDR);
            //items[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("WP Dir", pan.panWPDir, 14, 4, panWPDir_en_ADDR, panWPDir_x_ADDR, panWPDir_y_ADDR);
            //items[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("WP Dir", pan.panWPDis, 14, 4, panWPDis_en_ADDR, panWPDis_x_ADDR, panWPDis_y_ADDR);
            // rssi

            // third 8
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Altitude", pan.panAlt, 22, 3, panAlt_en_ADDR, panAlt_x_ADDR, panAlt_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Home Altitude", pan.panHomeAlt, 22, 2, panHomeAlt_en_ADDR, panHomeAlt_x_ADDR, panHomeAlt_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Climb Rate", pan.panClimb, 1, 6, panClimb_en_ADDR, panClimb_x_ADDR, panClimb_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Battery Percent", pan.panBatteryPercent, 1, 4, panBatteryPercent_en_ADDR, panBatteryPercent_x_ADDR, panBatteryPercent_y_ADDR);

            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Current", pan.panCur_A, 1, 12, panCur_A_en_ADDR, panCur_A_x_ADDR, panCur_A_y_ADDR);

            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Velocity", pan.panVel, 1, 2, panVel_en_ADDR, panVel_x_ADDR, panVel_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Air Speed", pan.panAirSpeed, 1, 1, panAirSpeed_en_ADDR, panAirSpeed_x_ADDR, panAirSpeed_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Throttle", pan.panThr, 1, 3, panThr_en_ADDR, panThr_x_ADDR, panThr_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Flight Mode", pan.panFlightMode, 18, 13, panFMod_en_ADDR, panFMod_x_ADDR, panFMod_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Horizon", pan.panHorizon, 8, 6, panHorizon_en_ADDR, panHorizon_x_ADDR, panHorizon_y_ADDR);

            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Wind Speed", pan.panWindSpeed, 24, 7, panWindSpeed_en_ADDR, panWindSpeed_x_ADDR, panWindSpeed_y_ADDR);

            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Warnings", pan.panWarn, 9, 4, panWarn_en_ADDR, panWarn_x_ADDR, panWarn_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Time", pan.panTime, 22, 4, panTime_en_ADDR, panTime_x_ADDR, panTime_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("On/Off", pan.panOff, 16, 15, panOff_en_ADDR, panOff_x_ADDR, panOff_y_ADDR);
            panelItems2[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("RSSI", pan.panRSSI, 12, 12, panRSSI_en_ADDR, panRSSI_x_ADDR, panRSSI_y_ADDR);
        //    panelItems[a++] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>("Tune", pan.panTune, 0, 0, panTune_en_ADDR, panTune_x_ADDR, panTune_y_ADDR);

            
            //Fill List of items in tabe number 2
            LIST_items2.Items.Clear();

            startup = true;
            foreach (var thing in panelItems2)
            {
                if (thing != null)
                {

                    if (thing.Item1 == "Center")
                    {
                        LIST_items2.Items.Add(thing.Item1, false);

                    }

                    else if (thing.Item1 == "Tune")
                    {
                        LIST_items2.Items.Add(thing.Item1, false);

                    }
                    else
                    {
                        LIST_items2.Items.Add(thing.Item1, true);
                    }
                }
            }

            startup = false;

            osdDraw1();
            osdDraw2();

            //Setup configuration panel
            STALL_numeric.Value = pan.stall;
            RSSI_numeric_min.Value = pan.rssipersent;
            RSSI_numeric_max.Value = pan.rssical;
            OVERSPEED_numeric.Value = pan.overspeed;

            if (pan.converts == 1)
            {
                UNITS_combo.SelectedIndex = 0; //metric
                STALL_label.Text = "Stall Speed (m/s)";
                OVERSPEED_label.Text = "Overspeed (m/s)";
            }
            else if (pan.converts == 0)
            {
                UNITS_combo.SelectedIndex = 1; //imperial
                STALL_label.Text = "Stall Speed (ft/s)";
                OVERSPEED_label.Text = "Overspeed (ft/s)";
            }

            MINVOLT_numeric.Value = Convert.ToDecimal(pan.battv) / Convert.ToDecimal(10.0);


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
            this.x[panel_number] = x * 12;
            this.y[panel_number] = y * 18;
        }

        public void openPanel()
        {
            d[panel_number] = 0;
            r[panel_number] = 0;
        }

        public void openSingle(int x, int y)
        {
            setPanel(x, y);
            openPanel();
        }

        public int getCenter()
        {
            if (CHK_pal.Checked)
                return 8;
            return 6;
        }

        // used for printf tracking line and row
        int[] d = new int[npanel];
        int[] r = new int[npanel];

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
                    d[panel_number] += 1;
                    r[panel_number] = 0;
                    continue;
                }

                try
                {
                    // draw red boxs
                    if (selectedrectangle)
                    {
                        gr[panel_number].DrawRectangle(Pens.Red, (this.x[panel_number] + r[panel_number] * 12) % screen[panel_number].Width, (this.y[panel_number] + d[panel_number] * 18), 12, 18);
                    }

                    int w1 = (this.x[panel_number] / 12 + r[panel_number]) % basesize.Width;
                    int h1 = (this.y[panel_number] / 18 + d[panel_number]);

                    if (w1 < basesize.Width && h1 < basesize.Height)
                    {
                        // check if this box has bene used
                        if (usedPostion[w1][h1] != null)
                        {
                            //System.Diagnostics.Debug.WriteLine("'" + used[this.x / 12 + r * 12 / 12][this.y / 18 + d * 18 / 18] + "'");
                        }
                        else
                        {
                            gr[panel_number].DrawImage(chars[ch], (this.x[panel_number] + r[panel_number] * 12) % screen[panel_number].Width, (this.y[panel_number] + d[panel_number] * 18), 12, 18);
                        }

                        usedPostion[w1][h1] = processingpanel;
                    }
                }
                catch { System.Diagnostics.Debug.WriteLine("printf exception"); }
                r[panel_number]++;
            }

        }
            

        string getMouseOverItem(int x, int y)
        {
            int ansW, ansH;

            getCharLoc(x, y, out ansW, out ansH);

            if (usedPostion[ansW][ansH] != null && usedPostion[ansW][ansH] != "")
            {
                LIST_items.SelectedIndex = LIST_items.Items.IndexOf(usedPostion[ansW][ansH]);
                return usedPostion[ansW][ansH];
            }

            return "";
        }

        string getMouseOverItem2(int x, int y)
        {
            int ansW, ansH;

            getCharLoc2(x, y, out ansW, out ansH);

            if (usedPostion[ansW][ansH] != null && usedPostion[ansW][ansH] != "")
            {
                LIST_items2.SelectedIndex = LIST_items2.Items.IndexOf(usedPostion[ansW][ansH]);
                return usedPostion[ansW][ansH];
            }

            return "";
        }

        void getCharLoc(int x, int y, out int xpos, out int ypos)
        {

            x = Constrain(x, 0, pictureBox1.Width - 1);
            y = Constrain(y, 0, pictureBox1.Height - 1);

            float scaleW = pictureBox1.Width / (float)screen[panel_number].Width;
            float scaleH = pictureBox1.Height / (float)screen[panel_number].Height;

            int ansW = (int)((x / scaleW / 12) % 30);
            int ansH = 0;
            if (CHK_pal.Checked)
            {
                ansH = (int)((y / scaleH / 18) % 16);
            }
            else
            {
                ansH = (int)((y / scaleH / 18) % 13);
            }

            xpos = Constrain(ansW, 0, 30 - 1);
            ypos = Constrain(ansH, 0, 16 - 1);
        }
        
        void getCharLoc2(int x, int y, out int xpos, out int ypos)
        {

            x = Constrain(x, 0, pictureBox2.Width - 1);
            y = Constrain(y, 0, pictureBox2.Height - 1);

            float scaleW = pictureBox2.Width / (float)screen[panel_number].Width;
            float scaleH = pictureBox2.Height / (float)screen[panel_number].Height;

            int ansW = (int)((x / scaleW / 12) % 30);
            int ansH = 0;
            if (CHK_pal.Checked)
            {
                ansH = (int)((y / scaleH / 18) % 16);
            }
            else
            {
                ansH = (int)((y / scaleH / 18) % 13);
            }

            xpos = Constrain(ansW, 0, 30 - 1);
            ypos = Constrain(ansH, 0, 16 - 1);
        }

        public void printf_P(string format, params object[] args)
        {
            printf(format, args);
        }

        public void closePanel()
        {
            x[panel_number] = 0;
            y[panel_number] = 0;
        }
        // draw image and characters overlay
        void osdDraw1()
        {
            panel_number = 0;
            if (startup)
                return;

            for (int b = 0; b < usedPostion.Length; b++)
            {
                usedPostion[b] = new string[16];
            }

            image = new Bitmap(pictureBox1.Width, pictureBox1.Height);

            float scaleW = pictureBox1.Width / (float)screen[panel_number].Width;
            float scaleH = pictureBox1.Height / (float)screen[panel_number].Height;

            screen[panel_number] = new Bitmap(screen[panel_number].Width, screen[panel_number].Height);

            gr[panel_number] = Graphics.FromImage(screen[panel_number]);

            image = new Bitmap(image.Width, image.Height);

            Graphics grfull = Graphics.FromImage(image);

            try
            {
                grfull.DrawImage(bgpicture, 0, 0, pictureBox1.Width, pictureBox1.Height);
            }
            catch { }

            if (checkBox1.Checked)
            {
                for (int b = 1; b < 16; b++)
                {
                    for (int a = 1; a < 30; a++)
                    {
                        grfull.DrawLine(new Pen(Color.Gray, 1), a * 12 * scaleW, 0, a * 12 * scaleW, pictureBox1.Height);
                        grfull.DrawLine(new Pen(Color.Gray, 1), 0, b * 18 * scaleH, pictureBox1.Width, b * 18 * scaleH);
                    }
                }
            }

            pan.setHeadingPatern();
            pan.setBatteryPic();

            List<string> list = new List<string>();

            foreach (string it in LIST_items.CheckedItems)
            {
                list.Add(it);
            }

            list.Reverse();

            foreach (string it in list)
            {
                foreach (var thing in panelItems)
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

            grfull.DrawImage(screen[panel_number], 0, 0, image.Width, image.Height);

            pictureBox1.Image = image;
        }

        // draw image and characters overlay for second panel
        void osdDraw2()
        {
            panel_number = 1;
            if (startup)
                return;

            for (int b = 0; b < usedPostion.Length; b++)
            {
                usedPostion[b] = new string[16];
            }

            image = new Bitmap(pictureBox2.Width, pictureBox2.Height);

            float scaleW = pictureBox2.Width / (float)screen[panel_number].Width;
            float scaleH = pictureBox2.Height / (float)screen[panel_number].Height;

            screen[panel_number] = new Bitmap(screen[panel_number].Width, screen[panel_number].Height);

            gr[panel_number] = Graphics.FromImage(screen[panel_number]);

            image = new Bitmap(image.Width, image.Height);

            Graphics grfull = Graphics.FromImage(image);

            try
            {
                grfull.DrawImage(bgpicture, 0, 0, pictureBox2.Width, pictureBox2.Height);
            }
            catch { }

            if (checkBox1.Checked)
            {
                for (int b = 1; b < 16; b++)
                {
                    for (int a = 1; a < 30; a++)
                    {
                        grfull.DrawLine(new Pen(Color.Gray, 1), a * 12 * scaleW, 0, a * 12 * scaleW, pictureBox2.Height);
                        grfull.DrawLine(new Pen(Color.Gray, 1), 0, b * 18 * scaleH, pictureBox2.Width, b * 18 * scaleH);
                    }
                }
            }

            pan.setHeadingPatern();
            pan.setBatteryPic();

            List<string> list = new List<string>();

            foreach (string it in LIST_items2.CheckedItems)
            {
                list.Add(it);
            }

            list.Reverse();

            foreach (string it in list)
            {
                foreach (var thing in panelItems2)
                {
                    selectedrectangle = false;
                    if (thing != null)
                    {
                        if (thing.Item1 == it)
                        {
                            if (thing.Item1 == currentlyselected[1])
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

            grfull.DrawImage(screen[panel_number], 0, 0, image.Width, image.Height);

            pictureBox2.Image = image;
        }


        int Constrain(double value, double min, double max)
        {
            if (value < min)
                return (int)min;
            if (value > max)
                return (int)max;

            return (int)value;
        }

        private void OSD_Load(object sender, EventArgs e)
        {

            string strVersion = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
            this.Text = this.Text + " " + strVersion;

            CMB_ComPort.Items.AddRange(GetPortNames());

            if (CMB_ComPort.Items.Count > 0)
                CMB_ComPort.SelectedIndex = 0;

            xmlconfig(false);

            osdDraw1();
            osdDraw2();
        }


        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string item = ((CheckedListBox)sender).SelectedItem.ToString();

            currentlyselected[0] = item;

            osdDraw1();

            foreach (var thing in panelItems)
            {
                if (thing != null && thing.Item1 == item)
                {
                        NUM_X.Value = Constrain(thing.Item3,0,basesize.Width -1);
                        NUM_Y.Value = Constrain(thing.Item4,0,16 -1);
                }
            }
        }

        private void checkedListBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string item = ((CheckedListBox)sender).SelectedItem.ToString();

            currentlyselected[1] = item;

            osdDraw2();

            foreach (var thing in panelItems2)
            {
                if (thing != null && thing.Item1 == item)
                {
                    NUM_X2.Value = Constrain(thing.Item3, 0, basesize.Width - 1);
                    NUM_Y2.Value = Constrain(thing.Item4, 0, 16 - 1);
                }
            }
        }



        private void checkedListBox1_SelectedValueChanged(object sender, EventArgs e)
        {
            if (((CheckedListBox)sender).Text == "Horizon")
            {
                //groupBox1.Enabled = false;
            }
            else
            {
                //groupBox1.Enabled = true;
            }
        }

        private void checkedListBox2_SelectedValueChanged(object sender, EventArgs e)
        {
            if (((CheckedListBox)sender).Text == "Horizon")
            {
                //groupBox1.Enabled = false;
            }
            else
            {
                //groupBox1.Enabled = true;
            }
        }


        private void checkedListBox1_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            // if (((CheckedListBox)sender).SelectedItem != null && ((CheckedListBox)sender).SelectedItem.ToString() == "Horizon")
            if (((CheckedListBox)sender).SelectedItem != null)
            {
                if (((CheckedListBox)sender).SelectedItem.ToString() == "Horizon" && e.NewValue == CheckState.Checked)
                {
                    int index = LIST_items.Items.IndexOf("Center");
                    LIST_items.SetItemChecked(index, false);
                }
                else if (((CheckedListBox)sender).SelectedItem.ToString() == "Center" && e.NewValue == CheckState.Checked)
                {
                    int index = LIST_items.Items.IndexOf("Horizon");
                    LIST_items.SetItemChecked(index, false);
                }
            }

            // add a delay to this so it runs after the control value has been defined.
                if (this.IsHandleCreated)
                    this.BeginInvoke((MethodInvoker)delegate { osdDraw1(); });
        }

        private void checkedListBox2_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            // if (((CheckedListBox)sender).SelectedItem != null && ((CheckedListBox)sender).SelectedItem.ToString() == "Horizon")
            if (((CheckedListBox)sender).SelectedItem != null)
            {
                if (((CheckedListBox)sender).SelectedItem.ToString() == "Horizon" && e.NewValue == CheckState.Checked)
                {
                    int index = LIST_items2.Items.IndexOf("Center");
                    LIST_items2.SetItemChecked(index, false);
                }
                else if (((CheckedListBox)sender).SelectedItem.ToString() == "Center" && e.NewValue == CheckState.Checked)
                {
                    int index = LIST_items2.Items.IndexOf("Horizon");
                    LIST_items2.SetItemChecked(index, false);
                }
            }

            // add a delay to this so it runs after the control value has been defined.
            if (this.IsHandleCreated)
                this.BeginInvoke((MethodInvoker)delegate { osdDraw2(); });
        }


        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            string item;
            try
            {
                item = LIST_items.SelectedItem.ToString();
            }
            catch { return; }

            for (int a = 0; a < panelItems.Length; a++)
            {
                if (panelItems[a] != null && panelItems[a].Item1 == item)
                {
                    panelItems[a] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>(panelItems[a].Item1, panelItems[a].Item2, (int)NUM_X.Value, panelItems[a].Item4, panelItems[a].Item5, panelItems[a].Item6, panelItems[a].Item7);
                }
            }

            osdDraw1();
        }


        private void numericUpDown2_ValueChanged(object sender, EventArgs e)
        {
            string item;
            try
            {
                item = LIST_items.SelectedItem.ToString();
            }
            catch { return; }

            for (int a = 0; a < panelItems.Length; a++)
            {
                if (panelItems[a] != null && panelItems[a].Item1 == item)
                {
                    panelItems[a] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>(panelItems[a].Item1, panelItems[a].Item2, panelItems[a].Item3, (int)NUM_Y.Value, panelItems[a].Item5, panelItems[a].Item6, panelItems[a].Item7);

                }
            }

            osdDraw1();
        }

        private void numericUpDown3_ValueChanged(object sender, EventArgs e)
        {
            string item;
            try
            {
                item = LIST_items2.SelectedItem.ToString();
            }
            catch { return; }

            for (int a = 0; a < panelItems2.Length; a++)
            {
                if (panelItems2[a] != null && panelItems2[a].Item1 == item)
                {
                    panelItems2[a] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>(panelItems2[a].Item1, panelItems2[a].Item2, (int)NUM_X2.Value, panelItems2[a].Item4, panelItems2[a].Item5, panelItems2[a].Item6, panelItems2[a].Item7);
                }
            }

            osdDraw2();
        }

        private void numericUpDown4_ValueChanged(object sender, EventArgs e)
        {
            string item;
            try
            {
                item = LIST_items2.SelectedItem.ToString();
            }
            catch { return; }

            for (int a = 0; a < panelItems2.Length; a++)
            {
                if (panelItems2[a] != null && panelItems2[a].Item1 == item)
                {
                    panelItems2[a] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>(panelItems2[a].Item1, panelItems2[a].Item2, panelItems2[a].Item3, (int)NUM_Y2.Value, panelItems2[a].Item5, panelItems2[a].Item6, panelItems2[a].Item7);

                }
            }

            osdDraw2();
        }
        //Write data to MinimOSD EPPROM
        private void BUT_WriteOSD_Click(object sender, EventArgs e)
        {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;        
            this.toolStripStatusLabel1.Text = ""; 
            //First Panel 
            foreach (string str in this.LIST_items.Items)
            {
                foreach (var tuple in this.panelItems)
                {
                    if ((tuple != null) && ((tuple.Item1 == str)) && tuple.Item5 != -1)
                    {
                        eeprom[tuple.Item5] = (byte)(this.LIST_items.CheckedItems.Contains(str) ? 1 : 0);
                        eeprom[tuple.Item6] = (byte)tuple.Item3; // x
                        eeprom[tuple.Item7] = (byte)tuple.Item4; // y

                        //Console.WriteLine(str);
                    }
                }
            }
            //Second Panel 
            foreach (string str in this.LIST_items2.Items)
            {
                foreach (var tuple in this.panelItems2)
                {
                    if ((tuple != null) && ((tuple.Item1 == str)) && tuple.Item5 != -1)
                    {
                        eeprom[tuple.Item5 + OffsetBITpanel] = (byte)(this.LIST_items2.CheckedItems.Contains(str) ? 1 : 0);
                        eeprom[tuple.Item6 + OffsetBITpanel] = (byte)tuple.Item3; // x
                        eeprom[tuple.Item7 + OffsetBITpanel] = (byte)tuple.Item4; // y

                        //Console.WriteLine(str);
                    }
                }
            }

            //Setup configuration panel
            eeprom[measure_ADDR] = pan.converts;
            eeprom[overspeed_ADDR] = pan.overspeed;
            eeprom[stall_ADDR] = pan.stall;
            eeprom[battv_ADDR] = pan.battv;

            eeprom[OSD_RSSI_HIGH_ADDR] = pan.rssical;
            eeprom[OSD_RSSI_LOW_ADDR] = pan.rssipersent;
            //for(int i=0;i<201;i++)
            //{
            //    Console.Write(i);
            //    Console.Write(" , ");
            //    Console.Write(eeprom[i]);
            //    Console.Write(" vs ");
            //    Console.Write(i + OffsetBITpanel);
            //    Console.Write(" , ");
            //    Console.WriteLine(eeprom[i + OffsetBITpanel]);

            //}
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
                    //bool nav_up = false;
                    //bool conf_up = false;
                    //Panel settings
                    //nav_up = sp.upload(eeprom, 0, OffsetBITpanel * npanel, 0);
                    //nav_up = sp.upload(eeprom, 0, OffsetBITpanel * npanel, 0);
                    //conf_up = sp.upload(eeprom, measure_ADDR, (OSD_RSSI_LOW_ADDR - measure_ADDR), measure_ADDR);
                    if (sp.upload(eeprom, 0, OSD_RSSI_LOW_ADDR, 0))
                    {
                        MessageBox.Show("Done navigation and configuration!");
                    }
                    else
                    {
                        MessageBox.Show("Failed to upload new navigation screen settings");
                    }
                    //Configuration 
                    //if (conf_up)
                    //{
                    //    MessageBox.Show("Done configuration!");
                    //}
                    //else
                    //{
                    //    MessageBox.Show("Failed to upload new configuration");
                    //}

                }                 
                catch (Exception ex) {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Failed to talk to bootloader");
            }

            sp.Close();
        }



        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_Click(object sender, EventArgs e)
        {
            CMB_ComPort.Items.Clear();
            CMB_ComPort.Items.AddRange(GetPortNames());
        }



        /* *********************************************** */
        // EEPROM Storage addresses
        const int OffsetBITpanel = 200;
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
        const int panGPL_en_ADDR = 36;
        const int panGPL_x_ADDR = 38;
        const int panGPL_y_ADDR = 40;
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
        const int panMavBeat_en_ADDR = 60;
        const int panMavBeat_x_ADDR = 62;
        const int panMavBeat_y_ADDR = 64;
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
        //
        const int measure_ADDR = 890;
        const int overspeed_ADDR = 892;
        const int stall_ADDR = 894;
        const int battv_ADDR = 896;
        //const int battp_ADDR = 898;
        const int OSD_RSSI_HIGH_ADDR = 900;
        const int OSD_RSSI_LOW_ADDR = 902;
        const int RADIO_ON_ADDR = 904;
        const int OSD_Toggle_ADDR = 906;
        const int CHK1 = 1000;
        const int CHK2 = 1006;

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            osdDraw1();
            osdDraw2();
        }

        private void OSD_Resize(object sender, EventArgs e)
        {
            try
            {
                osdDraw1();
                osdDraw2();
            }
            catch { }
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
            catch {  MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);        return; }

            if (sp.connectAP())
            {
                try
                {
                    eeprom = sp.download(1024);
                }
                catch (Exception ex) {
                    fail = true;
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

                for (int a = 0; a < panelItems.Length; a++)
                {
                    if (panelItems[a] != null)
                    {
                        if (panelItems[a].Item5 >= 0)
                            LIST_items.SetItemCheckState(a, eeprom[panelItems[a].Item5] == 0 ? CheckState.Unchecked : CheckState.Checked);

                        if (panelItems[a].Item7 >= 0 || panelItems[a].Item6 >= 0)
                            panelItems[a] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>(panelItems[a].Item1, panelItems[a].Item2, eeprom[panelItems[a].Item6], eeprom[panelItems[a].Item7], panelItems[a].Item5, panelItems[a].Item6, panelItems[a].Item7);
                    }
                }
                //Second panel
                for (int a = 0; a < panelItems2.Length; a++)
                {
                    if (panelItems2[a] != null)
                    {
                        if (panelItems2[a].Item5 >= 0)
                            LIST_items2.SetItemCheckState(a, eeprom[panelItems2[a].Item5 + OffsetBITpanel] == 0 ? CheckState.Unchecked : CheckState.Checked);

                        if (panelItems2[a].Item7 >= 0 || panelItems[a].Item6 >= 0)
                            panelItems2[a] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>(panelItems2[a].Item1, panelItems2[a].Item2, eeprom[panelItems2[a].Item6 + OffsetBITpanel], eeprom[panelItems2[a].Item7 + OffsetBITpanel], panelItems2[a].Item5, panelItems2[a].Item6, panelItems2[a].Item7);
                    }
                }
            }

            osdDraw1();
            osdDraw2();

            //Setup configuration panel
            pan.converts = eeprom[measure_ADDR];
            //Modify units
            if (pan.converts == 1)
            {
                UNITS_combo.SelectedIndex = 0; //metric
                STALL_label.Text = "Stall Speed (m/s)";
                OVERSPEED_label.Text = "Overspeed (m/s)";
            }
            else if (pan.converts == 0)
            {
                UNITS_combo.SelectedIndex = 1; //imperial
                STALL_label.Text = "Stall Speed (ft/s)";
                OVERSPEED_label.Text = "Overspeed (ft/s)";
            }

            pan.overspeed = eeprom[overspeed_ADDR];
            OVERSPEED_numeric.Value = pan.overspeed;

            pan.stall = eeprom[stall_ADDR];
            STALL_numeric.Value = pan.stall;

            pan.battv = eeprom[battv_ADDR];
            MINVOLT_numeric.Value = Convert.ToDecimal(pan.battv) / Convert.ToDecimal(10.0);

            pan.rssical = eeprom[OSD_RSSI_HIGH_ADDR];
            RSSI_numeric_max.Value = pan.rssical;

            pan.rssipersent = eeprom[OSD_RSSI_LOW_ADDR];
            RSSI_numeric_min.Value = pan.rssipersent;

            if (!fail)
                MessageBox.Show("Done!");
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

            osdDraw1();
            osdDraw2();
        }

        private void pALToolStripMenuItem_CheckStateChanged(object sender, EventArgs e)
        {
            nTSCToolStripMenuItem.Checked = !CHK_pal.Checked;
        }

        private void nTSCToolStripMenuItem_CheckStateChanged(object sender, EventArgs e)
        {
            CHK_pal.Checked = !nTSCToolStripMenuItem.Checked;
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
                    {

                        foreach (var item in panelItems)
                        {
                            if (item != null)
                                sw.WriteLine("{0}\t{1}\t{2}\t{3}", item.Item1, item.Item3, item.Item4, LIST_items.GetItemChecked(LIST_items.Items.IndexOf(item.Item1)).ToString());
                        }
                        sw.Close();
                    }
                }
                catch
                {
                    MessageBox.Show("Error writing file");
                }
            }
        }

        private void loadFromFileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog() { Filter = "*.osd|*.osd" };

            ofd.ShowDialog();

            if (ofd.FileName != "")
            {
                try
                {
                    using (StreamReader sr = new StreamReader(ofd.OpenFile()))
                    {
                        while (!sr.EndOfStream)
                        {
                            string[] strings = sr.ReadLine().Split(new char[] {'\t'},StringSplitOptions.RemoveEmptyEntries);

                            for (int a = 0; a < panelItems.Length; a++)
                            {
                                if (panelItems[a] != null && panelItems[a].Item1 == strings[0])
                                {
                                    // incase there is an invalid line number or to shore
                                    try
                                    {
                                        panelItems[a] = new Tuple<string, Func<int, int, int>, int, int, int, int, int>(panelItems[a].Item1, panelItems[a].Item2, int.Parse(strings[1]), int.Parse(strings[2]), panelItems[a].Item5, panelItems[a].Item6, panelItems[a].Item7);

                                        LIST_items.SetItemChecked(a, strings[3] == "True");
                                    }
                                    catch { }
                                }
                            }
                        }
                    }
                }
                catch
                {
                    MessageBox.Show("Error Reading file");
                }
            }

            osdDraw1();
            osdDraw2();
        }

        private void loadDefaultsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            setupFunctions();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void pictureBox1_MouseUp(object sender, MouseEventArgs e)
        {
            getMouseOverItem(e.X, e.Y);

            mousedown[0] = false;
        }
        
        private void pictureBox2_MouseUp(object sender, MouseEventArgs e)
        {
            getMouseOverItem2(e.X, e.Y);

            mousedown[1] = false;
        }

        private void pictureBox1_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Left && mousedown[0] == true)
            {
                int ansW, ansH;
                getCharLoc(e.X, e.Y, out ansW, out ansH);
                if (ansH >= getCenter() && !CHK_pal.Checked)
                {
                    ansH += 3;
                }

                NUM_X.Value = Constrain(ansW, 0, basesize.Width - 1);
                NUM_Y.Value = Constrain(ansH, 0, 16 - 1);

                pictureBox1.Focus();
            }
            else
            {
                mousedown[0] = false;
            }
        }

        private void pictureBox2_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Left && mousedown[1] == true)
            {
                int ansW, ansH;
                getCharLoc2(e.X, e.Y, out ansW, out ansH);
                if (ansH >= getCenter() && !CHK_pal.Checked)
                {
                    ansH += 3;
                }

                NUM_X2.Value = Constrain(ansW, 0, basesize.Width - 1);
                NUM_Y2.Value = Constrain(ansH, 0, 16 - 1);

                pictureBox2.Focus();
            }
            else
            {
                mousedown[1] = false;
            }
        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            currentlyselected[0] = getMouseOverItem(e.X, e.Y);

            mousedown[0] = true;
        }

        private void pictureBox2_MouseDown(object sender, MouseEventArgs e)
        {
            currentlyselected[1] = getMouseOverItem2(e.X, e.Y);

            mousedown[1] = true;
        }

                

        private void updateFirmwareToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;      
            this.toolStripStatusLabel1.Text = ""; 

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "*.hex|*.hex";

            ofd.ShowDialog();

            if (ofd.FileName != "")
            {
                byte[] FLASH;
                try
                {
                    toolStripStatusLabel1.Text = "Reading Hex File";

                    statusStrip1.Refresh();

                    FLASH = readIntelHEXv2(new StreamReader(ofd.FileName));
                }
                catch { MessageBox.Show("Bad Hex File"); return; }

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

                toolStripStatusLabel1.Text = "Connecting to Board";

                if (sp.connectAP())
                {
                    sp.Progress += new ArduinoSTK.ProgressEventHandler(sp_Progress);
                    try
                    {
                        if (!sp.uploadflash(FLASH, 0, FLASH.Length, 0))
                        {
                            if (sp.IsOpen)
                                sp.Close();

                            MessageBox.Show("Upload failed. Lost sync. Try using Arduino to upload instead",                                    
                                "Error",                            
                                MessageBoxButtons.OK,        
                                MessageBoxIcon.Warning); 
                        }
                    }
                    catch (Exception ex)
                    {
                        fail = true;
                        MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }

                }
                else
                {
                    MessageBox.Show("Failed to talk to bootloader");
                }

                sp.Close();

                if (!fail)
                {

                    toolStripStatusLabel1.Text = "Done";

                    MessageBox.Show("Done!");
                }
                else
                {
                    toolStripStatusLabel1.Text = "Failed";
                }
            }
        }

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

                osdDraw1();
                osdDraw2();
            }
        }

        private void sendTLogToolStripMenuItem_Click(object sender, EventArgs e)
        {

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Tlog|*.tlog";

            ofd.ShowDialog();

            if (ofd.FileName != "")
            {
                if (comPort.IsOpen)
                    comPort.Close();

                try
                {

                    comPort.PortName = CMB_ComPort.Text;
                    comPort.BaudRate = 57600;
                    comPort.Open();

                }
                catch { MessageBox.Show("Error opening com port", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error); return; }

                BinaryReader br = new BinaryReader(ofd.OpenFile());

                this.toolStripProgressBar1.Style = ProgressBarStyle.Marquee;        
                this.toolStripStatusLabel1.Text = "Sending TLOG data..."; 

                while (br.BaseStream.Position < br.BaseStream.Length && !this.IsDisposed)
                {
                    try
                    {
                        byte[] bytes = br.ReadBytes(20);

                        comPort.Write(bytes, 0, bytes.Length);

                        System.Threading.Thread.Sleep(5);

                        Console.Write(comPort.ReadExisting());

                    }
                    catch { break; }

                    Application.DoEvents();
                }

                try
                {
                    toolStripProgressBar1.Style = ProgressBarStyle.Continuous;
                    toolStripStatusLabel1.Text = "";   

                    comPort.Close();
                }
                catch { }
            }
        }

        private void OSD_FormClosed(object sender, FormClosedEventArgs e)
        {
            xmlconfig(true);

        }

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
                                        string temp2 = xmlreader.ReadString();
                                        CHK_pal.Checked = (temp2 == "True");
                                        break;
                                    case "Config":
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

        private void updateFontToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripProgressBar1.Style = ProgressBarStyle.Continuous;        
            toolStripStatusLabel1.Text = "";        

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "mcm|*.mcm";

            ofd.ShowDialog();
            
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

                    System.Threading.Thread.Sleep(50);

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

                    if (!comPort.ReadLine().Contains("Ready for Font"))
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

                            Console.WriteLine(comPort.ReadExisting());

                        }
                        catch { break; }

                        Application.DoEvents();
                    }

                    comPort.WriteLine("\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

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
            }
        }

        private void helpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                System.Diagnostics.Process.Start("https://code.google.com/p/arducam-osd/wiki/arducam_osd?tm=6");
            }
            catch { MessageBox.Show("Webpage open failed... do you have a virus?"); }
        }


        private void STALL_numeric_ValueChanged(object sender, EventArgs e)
        {
            pan.stall = (byte)STALL_numeric.Value;
        }

        private void RSSI_numeric_min_ValueChanged(object sender, EventArgs e)
        {
            pan.rssipersent = (byte)RSSI_numeric_min.Value;
        }

        private void RSSI_numeric_max_ValueChanged(object sender, EventArgs e)
        {
            pan.rssical = (byte)RSSI_numeric_max.Value;
        }

        private void OVERSPEED_numeric_ValueChanged(object sender, EventArgs e)
        {
            pan.overspeed = (byte)OVERSPEED_numeric.Value;
        }

        private void UNITS_combo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(UNITS_combo.SelectedIndex == 0) {
                pan.converts = 1; //metric
                STALL_label.Text = "Stall Speed (m/s)";
                OVERSPEED_label.Text = "Overspeed (m/s)";
            }
            else if (UNITS_combo.SelectedIndex == 1){
                pan.converts = 0; //imperial
                STALL_label.Text = "Stall Speed (ft/s)";
                OVERSPEED_label.Text = "Overspeed (ft/s)";
            }
        }

        private void MINVOLT_numeric_ValueChanged(object sender, EventArgs e)
        {
            pan.battv = (byte) (MINVOLT_numeric.Value * 10);
        }

    }
}