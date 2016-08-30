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
    public partial class frmComPort : Form {
        public OSD parent;
        private SerialPort comPort = new SerialPort();
        private bool loop=false;
        private bool flgRaw=false;

        public frmComPort(OSD form) {
            parent=form;
            InitializeComponent();
        }

        private void cbComPort_SelectedIndexChanged(object sender, EventArgs e) {

            if(cbComPort.Items.Count>0){
                btnStart.Enabled =true;
            }else{
                btnStart.Enabled = false;
            }
            int n=cbComPort.SelectedIndex;
        }

        private void btnStart_Click(object sender, EventArgs e) {
            btnStop.Enabled =true ;
            btnStart.Enabled =false;

            if (parent.comPort.IsOpen)
                parent.comPort.Close();

            if (comPort.IsOpen)
                comPort.Close();

            try {

                parent.comPort.PortName = parent.CMB_ComPort.Text;
                parent.comPort.BaudRate = int.Parse(cbSpeed.Text);

                parent.comPort.Open();

                parent.comPort.DtrEnable = false;
                parent.comPort.RtsEnable = false;

                System.Threading.Thread.Sleep(50);

                parent.comPort.DtrEnable = true;
                parent.comPort.RtsEnable = true;

                System.Threading.Thread.Sleep(100);
                Application.DoEvents();
 
                comPort.PortName = cbComPort.Text;
                comPort.BaudRate = int.Parse(cbSpeed.Text);
                //comPort.Encoding

                try {
                    comPort.Open();
                } catch{}

                byte[] buffer=new byte[512];
                int index=-1;

                if(parent.comPort.IsOpen && comPort.IsOpen) {
                    loop=true;
                    int np=0;
                    string message;

                    while(loop){
                        System.Threading.Thread.Sleep(2);

                        string s = "";
                        string so = "";
                        while (parent.comPort.BytesToRead != 0 && loop){
                            
                            //parent.comPort.Write(s);
                            byte c = (byte)parent.comPort.ReadByte();
                            byte[] ba = new byte[2];
                            
                            ba[0] = c;
                            comPort.Write(ba, 0, 1);

                            
                            if(c==0 || c==10){
                                Console.WriteLine('>' + s);
                                s="";
                            }else {
                                char ch=(char)c;
                                s = s + ch; //.ToString();
                            }
                            Application.DoEvents();
                        }
                        
                        
/*
                        while (comPort.BytesToRead != 0){
                            string s=comPort.ReadExisting();
                            parent.comPort.Write(s);
                        }
*/

                        while(comPort.BytesToRead != 0 && loop) {

                            byte c = (byte)comPort.ReadByte();
                            byte[] ba = new byte[2];

                            if(flgRaw) {
                                ba[0]=c;
                                parent.comPort.Write(ba,0,1);
                            }

                            if (c == 0 || c == 10) {
                                Console.WriteLine('<' + so);
                                so = "";
                            } else {
                                char ch = (char)c;
                                so = so + ch; //.ToString();
                            }


                            if(index>=0) buffer[index++]=c;

                            switch (parent.mavlink_parse_char(c)) {
                            case 1: // got STX
                                index=0;
                                buffer[index++] = c; // store STX
                                break;
                            case 2: // got packet
                                if(!flgRaw) {
                                    if(parent.comPort.BytesToWrite==0) // skip packet on buffer overrun
                                        parent.comPort.Write(buffer, 0, index);
                                }
                                index= -1;
                                
                                np++;
                                try {
                                    this.Invoke((MethodInvoker)delegate {
                                        lblTLog.Text = np.ToString(); // runs on UI thread
                                    });

                                } catch { };

                                Application.DoEvents();
                                break;
                            } // switch
                        } // while bytes_to_read
                        Application.DoEvents();

                    }// loop

                } else { // if open
                    btnStop_Click(sender, null);
                }
 
                comPort.Close();
                parent.comPort.Close();

            } catch {};
        }



        private void frmComPort_Load(object sender, EventArgs e) {
            cbComPort_Enter(sender, null);
            cbSpeed.Text ="57600";
            if (cbComPort.Items.Count > 0)
                cbComPort.SelectedIndex = 0;
        }

        private void btnListen_Click(object sender, EventArgs e) {
            if (!comPort.IsOpen) comPort.Open();
        }

        
        private void btnStop_Click(object sender, EventArgs e) {
            btnStop.Enabled = false;
            btnStart.Enabled = true;
            loop=false;         

            parent.com_run = false;           
 
            try {
                parent.comPort.Close();
            } catch{}

            try {
                comPort.Close();
            } catch { }

            if (parent.com_run)
                parent.com_thread.Abort();
        }
        private void frmComPort_FormClosing(object sender, FormClosingEventArgs e) {
            try {
                btnStop_Click(sender, null);
            } catch{};
        }

        private void cbComPort_Click(object sender, EventArgs e) {

        }

        private void cbComPort_Enter(object sender, EventArgs e) {
            int t = cbComPort.SelectedIndex;
            string s = cbComPort.Text;
            cbComPort.Items.Clear();
            cbComPort.Items.AddRange(parent.GetPortNames());
            //cbComPort.Items.Contains
            Application.DoEvents();
            foreach (var thing in cbComPort.Items) {
                if (thing.ToString() == parent.CMB_ComPort.Text) {
                    cbComPort.Items.Remove(thing);
                    break;
                }
            }
            try {
                cbComPort.SelectedIndex = t;
            } catch { }
            try {
                cbComPort.Text = s;
            } catch { }
        }

        private void chkRaw_CheckedChanged(object sender, EventArgs e) {
            flgRaw = chkRaw.Checked ;
        }
    }
}
