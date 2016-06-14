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
	public class osd_screen
	{
		public Panel[] panelItems; 
        public Panel[] panelItems_default;
		public System.Windows.Forms.TreeView LIST_items;
		public System.Windows.Forms.TabPage tabPage;
		public System.Windows.Forms.GroupBox groupBox;
		public System.Windows.Forms.PictureBox pictureBox;
		public System.Windows.Forms.RadioButton rbtSortCategory;
        public System.Windows.Forms.RadioButton rbtSortAlphabetic;
		public System.Windows.Forms.Label label2;
        public System.Windows.Forms.Label label1;
        public System.Windows.Forms.NumericUpDown NUM_Y;
        public System.Windows.Forms.NumericUpDown NUM_X;
		public System.Windows.Forms.CheckBox chkSign;
        public System.Windows.Forms.CheckBox chkAlt;
        public System.Windows.Forms.CheckBox chkAlt2;
        public System.Windows.Forms.CheckBox chkAlt3;
        public System.Windows.Forms.CheckBox chkAlt4;
        public System.Windows.Forms.ComboBox cbNumber;
        public System.Windows.Forms.Label labNumber;
        public System.Windows.Forms.Label labStrings;
        public System.Windows.Forms.TextBox txtStrings;
		
		private int number;
		private OSD osd;
		
		private int clickX, clickY;
		
		private bool mousedown;
		
		public osd_screen (int num, OSD aosd)
		{
			number=num;
			osd=aosd;
			
			num+=1;
			
			this.tabPage = new System.Windows.Forms.TabPage();		
			this.panelItems=new Panel[64];
			this.panelItems_default = new Panel[64];
			this.LIST_items=new System.Windows.Forms.TreeView();
			this.rbtSortCategory = new System.Windows.Forms.RadioButton();
            this.rbtSortAlphabetic = new System.Windows.Forms.RadioButton();
			this.groupBox = new System.Windows.Forms.GroupBox();
			this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.NUM_Y = new System.Windows.Forms.NumericUpDown();
            this.NUM_X = new System.Windows.Forms.NumericUpDown();
			this.pictureBox = new System.Windows.Forms.PictureBox();
			this.chkSign = new System.Windows.Forms.CheckBox();
            this.chkAlt = new System.Windows.Forms.CheckBox();
            this.chkAlt2 = new System.Windows.Forms.CheckBox();
            this.chkAlt3 = new System.Windows.Forms.CheckBox();
            this.chkAlt4 = new System.Windows.Forms.CheckBox();
            this.cbNumber = new System.Windows.Forms.ComboBox();
            this.labNumber = new System.Windows.Forms.Label();
            this.labStrings = new System.Windows.Forms.Label();
            this.txtStrings = new System.Windows.Forms.TextBox();
			
			this.tabPage.SuspendLayout();
			this.groupBox.SuspendLayout();
			this.pictureBox.SuspendLayout();
		}
		
		public int init(){
			int num=number+1;
			
			//OSD.OSD.PANEL_tabs.Controls.Add(this.tabPage);
			this.tabPage.Controls.Add(this.LIST_items);		
            this.tabPage.Controls.Add(this.rbtSortCategory);
            this.tabPage.Controls.Add(this.rbtSortAlphabetic);
            this.tabPage.Controls.Add(this.groupBox);
            this.tabPage.Controls.Add(this.pictureBox);
            this.tabPage.Location = new System.Drawing.Point(4, 22);
            this.tabPage.Margin = new System.Windows.Forms.Padding(2);
            this.tabPage.Name = "tabPage_"+num;
            this.tabPage.Size = new System.Drawing.Size(679, 381);
            this.tabPage.TabIndex = 0;
            this.tabPage.Text = "Screen "+num;
            this.tabPage.UseVisualStyleBackColor = true;
			
			this.rbtSortCategory.AutoSize = true;
            this.rbtSortCategory.Location = new System.Drawing.Point(3, 17);
            this.rbtSortCategory.Name = "rbtSortCategory";
            this.rbtSortCategory.Size = new System.Drawing.Size(104, 17);
            this.rbtSortCategory.TabIndex = 4;
            this.rbtSortCategory.Text = "Sort By Category";
            this.rbtSortCategory.UseVisualStyleBackColor = true;
            // 
            // rbtSortAlphabetic
            // 
            this.rbtSortAlphabetic.AutoSize = true;
            this.rbtSortAlphabetic.Checked = true;
            this.rbtSortAlphabetic.Location = new System.Drawing.Point(3, 3);
            this.rbtSortAlphabetic.Name = "rbtSortAlphabetic";
            this.rbtSortAlphabetic.Size = new System.Drawing.Size(112, 17);
            this.rbtSortAlphabetic.TabIndex = 3;
            this.rbtSortAlphabetic.TabStop = true;
            this.rbtSortAlphabetic.Text = "Sort Alphabetically";
            this.rbtSortAlphabetic.UseVisualStyleBackColor = true;
            this.rbtSortAlphabetic.CheckedChanged += new System.EventHandler(this.rbtSortAlphabetic_CheckedChanged);
            
			this.groupBox.Controls.Add(this.label2);
            this.groupBox.Controls.Add(this.label1);
            this.groupBox.Controls.Add(this.NUM_Y);
            this.groupBox.Controls.Add(this.NUM_X);
			this.groupBox.Controls.Add(this.chkSign);
            this.groupBox.Controls.Add(this.chkAlt);
            this.groupBox.Controls.Add(this.chkAlt2);
            this.groupBox.Controls.Add(this.chkAlt3);
            this.groupBox.Controls.Add(this.chkAlt4);
            this.groupBox.Controls.Add(this.cbNumber);
            this.groupBox.Controls.Add(this.labNumber);
            this.groupBox.Controls.Add(this.labStrings);
            this.groupBox.Controls.Add(this.txtStrings);
            this.groupBox.Location = new System.Drawing.Point(3, 229);
            this.groupBox.Name = "groupBox"+num;
            this.groupBox.Size = new System.Drawing.Size(169, 149);
            this.groupBox.TabIndex = 2;
            this.groupBox.TabStop = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(80, 12);
            this.label2.Name = "labela"+num;
            this.label2.Size = new System.Drawing.Size(14, 11);
            this.label2.TabIndex = 3;
            this.label2.Text = "Y";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(10, 12);
            this.label1.Name = "labelb"+num;
            this.label1.Size = new System.Drawing.Size(14, 11);
            this.label1.TabIndex = 2;
            this.label1.Text = "X";
            // 
            // NUM_Y
            // 
            this.NUM_Y.Location = new System.Drawing.Point(96, 10);
            this.NUM_Y.Maximum = new decimal(new int[] {
            	15,
            	0,
            	0,
            	0});
            this.NUM_Y.Name = "NUM_Y"+num;
            this.NUM_Y.Size = new System.Drawing.Size(44, 20);
            this.NUM_Y.TabIndex = 1;
            this.NUM_Y.ValueChanged += new System.EventHandler(this.numericUpDown2_ValueChanged);
            // 
            // NUM_X
            // 
            this.NUM_X.Location = new System.Drawing.Point(30, 10);
            this.NUM_X.Maximum = new decimal(new int[] {
            	29,
            	0,
            	0,
            	0});
            this.NUM_X.Name = "NUM_X"+num;
            this.NUM_X.Size = new System.Drawing.Size(44, 20);
            this.NUM_X.TabIndex = 0;
            this.NUM_X.ValueChanged += new System.EventHandler(this.numericUpDown1_ValueChanged);			
			
			((System.ComponentModel.ISupportInitialize)(this.NUM_Y)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X)).BeginInit();

			// LIST_items
            // 
            this.LIST_items.Location = new System.Drawing.Point(3, 40);
            this.LIST_items.Name = "LIST_items";
            this.LIST_items.Size = new System.Drawing.Size(169, 191);
            this.LIST_items.TabIndex = 5;
            this.LIST_items.AfterCheck += new System.Windows.Forms.TreeViewEventHandler(this.treeView1_AfterCheck);
            this.LIST_items.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeView1_AfterSelect);
            //
			            // pictureBox1
            // 
            this.pictureBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.pictureBox.Location = new System.Drawing.Point(178, 17);
            this.pictureBox.Name = "pictureBox1";
            this.pictureBox.Size = new System.Drawing.Size(497, 361);
            this.pictureBox.TabIndex = 0;
            this.pictureBox.TabStop = false;
            this.pictureBox.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseDown);
            this.pictureBox.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseMove);
            this.pictureBox.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseUp);			
			
			//
			// chkSign
			//
			this.chkSign.AutoSize = true;
            //this.chkSign.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.chkSign.Location = new System.Drawing.Point(10, 34);
            this.chkSign.Name = "chkSign";
            this.chkSign.Size = new System.Drawing.Size(137, 17);
            this.chkSign.TabIndex = 4;
            this.chkSign.Text = "Show icon before value";
            this.chkSign.UseVisualStyleBackColor = true;
			this.chkSign.CheckedChanged += new System.EventHandler(this.chkSign_CheckedChanged);

            // 
            // chkAlt
            //
            this.chkAlt.AutoSize = true;
            //this.chkAlt.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.chkAlt.Location = new System.Drawing.Point(10, 51);
            this.chkAlt.Name = "chkAlt";
            this.chkAlt.Size = new System.Drawing.Size(137, 17);
            this.chkAlt.TabIndex = 4;
            this.chkAlt.Text = "Alternative mode";
            this.chkAlt.UseVisualStyleBackColor = true;
            this.chkAlt.CheckedChanged += new System.EventHandler(this.chkAlt_CheckedChanged);
            this.chkAlt.Visible =false;

            // 
            // chkAlt2
            //
            this.chkAlt2.AutoSize = true;
            //this.chkAlt2.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.chkAlt2.Location = new System.Drawing.Point(10, 68);
            this.chkAlt2.Name = "chkAlt2";
            this.chkAlt2.Size = new System.Drawing.Size(137, 17);
            this.chkAlt2.TabIndex = 4;
            this.chkAlt2.Text = "Alternative mode2";
            this.chkAlt2.UseVisualStyleBackColor = true;
            this.chkAlt2.CheckedChanged += new System.EventHandler(this.chkAlt_CheckedChanged);
            this.chkAlt2.Visible = false;

            // 
            // chkAlt3
            //
            this.chkAlt3.AutoSize = true;
            //this.chkAlt3.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.chkAlt3.Location = new System.Drawing.Point(10, 83);
            this.chkAlt3.Name = "chkAlt3";
            this.chkAlt3.Size = new System.Drawing.Size(137, 17);
            this.chkAlt3.TabIndex = 4;
            this.chkAlt3.Text = "Alternative mode3";
            this.chkAlt3.UseVisualStyleBackColor = true;
            this.chkAlt3.CheckedChanged += new System.EventHandler(this.chkAlt_CheckedChanged);
            this.chkAlt3.Visible = false;

            // 
            // chkAlt4
            //
            this.chkAlt4.AutoSize = true;
            //this.chkAlt4.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.chkAlt4.Location = new System.Drawing.Point(10, 98);
            this.chkAlt4.Name = "chkAlt4";
            this.chkAlt4.Size = new System.Drawing.Size(137, 17);
            this.chkAlt4.TabIndex = 4;
            this.chkAlt4.Text = "Alternative mode4";
            this.chkAlt4.UseVisualStyleBackColor = true;
            this.chkAlt4.CheckedChanged += new System.EventHandler(this.chkAlt_CheckedChanged);
            this.chkAlt4.Visible = false;

            //128

            this.cbNumber.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbNumber.FormattingEnabled = true;
            this.cbNumber.Items.AddRange(new object[] {
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            "11",
            "12",
            });
            this.cbNumber.Location = new System.Drawing.Point(10, 85);
            this.cbNumber.Name = "cbNumber" ;
            this.cbNumber.Size = new System.Drawing.Size(137, 17);
            this.cbNumber.TabIndex = 18;
            this.cbNumber.SelectedIndexChanged += new System.EventHandler(this.cbNumber_SelectedIndexChanged);
            this.cbNumber.Visible =false;
            // 
            // labNumber
            // 
            this.labNumber.AutoSize = true;
            this.labNumber.Location = new System.Drawing.Point(10, 70);
            this.labNumber.Name = "labeln";
            this.labNumber.Size = new System.Drawing.Size(14, 11);
            this.labNumber.TabIndex = 2;
            this.labNumber.Text = "";
            this.labNumber.Visible =false ;

            // 
            // labStrings
            // 
            this.labStrings.AutoSize = true;
            this.labStrings.Location = new System.Drawing.Point(10, 109);
            this.labStrings.Name = "labels";
            this.labStrings.Size = new System.Drawing.Size(14, 11);
            this.labStrings.TabIndex = 3;
            this.labStrings.Text = "Strings";
            this.labStrings.Visible = false;

            // 
            // txtStrings
            //           
            this.txtStrings.Location = new System.Drawing.Point(10, 124);
            this.txtStrings.Name = "txtStrings";
            this.txtStrings.Size = new System.Drawing.Size(137, 20);
            this.txtStrings.TabIndex = 4;
            this.txtStrings.Text = "";
            this.txtStrings.Visible = false;
            this.txtStrings.Leave += new System.EventHandler(this.txtStrings_TextChanged);

            return 0;
		}
		public int  last_init(){
			((System.ComponentModel.ISupportInitialize)(this.pictureBox)).BeginInit();
			
			this.groupBox.ResumeLayout(false);
            this.groupBox.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.NUM_Y)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X)).EndInit();
			this.tabPage.ResumeLayout(false);
            this.tabPage.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.pictureBox)).EndInit();			
			return 0;
		}

        public void copyFrom(osd_screen other) {
            for (int i = 0; i < other.panelItems.Length; i++) {
                if (panelItems[i] != null && other.panelItems[i] != null) { 
                    panelItems[i].copyFrom(other.panelItems[i]);
                }
            }
            var e1 = LIST_items.Nodes.GetEnumerator();
            var e2 = other.LIST_items.Nodes.GetEnumerator();
            while (e1.MoveNext() && e2.MoveNext()) {
                ((TreeNode)e1.Current).Checked = ((TreeNode)e2.Current).Checked;
            }
        }

        public void clearScreen() {
            foreach (TreeNode node in LIST_items.Nodes) {
                node.Checked = false;
            }
        }
        //Controls if it's a populate process or user input
        private Boolean AutomaticCheck = true;
        private void rbtSortAlphabetic_CheckedChanged(object sender, EventArgs e)
        {
            AutomaticCheck = true;
            List<TreeNode> allNodes = new List<TreeNode>();
			var li=this.LIST_items;
            foreach (TreeNode nd1 in li.Nodes)
            {
                foreach (TreeNode nd2 in nd1.Nodes)
                {
                    allNodes.Add(nd2);
                }
                allNodes.Add(nd1);
            }
            li.Nodes.Clear();
            li.CheckBoxes = true;
            if (rbtSortAlphabetic.Checked) {
                //List<string> instruments = new List<string>();
                foreach (TreeNode node in allNodes)  {
                    if ((node.Text != "Attitude") &&
                        (node.Text != "General") &&
                        (node.Text != "Energy") &&
                        (node.Text != "Location") &&
					    (node.Text != "Misc") &&
                        (node.Text != "Speed"))
                    {
                        li.Nodes.Add(node);
                    }
                }
                li.Sort();
            } else    {
                li.Nodes.Add("Attitude", "Attitude");
                li.Nodes.Add("General", "General");
                li.Nodes.Add("Energy", "Energy");
                li.Nodes.Add("Location", "Location");
                li.Nodes.Add("Speed", "Speed");
				li.Nodes.Add("Misc", "Misc");

                foreach (TreeNode node in allNodes)  {
                    if ((node.Text == "Horizon") ||
                        (node.Text == "Pitch") ||
                        (node.Text == "Roll"))
                        li.Nodes["Attitude"].Nodes.Add(node);

                    else if ((node.Text == "Call Sign") ||
                        (node.Text == "RSSI") ||
                        (node.Text == "Flight Mode") ||
                        (node.Text == "Temperature") ||
                        (node.Text == "Throttle") ||
                        (node.Text == "Time") ||
                        (node.Text == "Warnings"))
                        li.Nodes["General"].Nodes.Add(node);

                    else if ((node.Text == "Battery A") ||
                        (node.Text == "Battery Percent") ||
                        (node.Text == "Current") ||
                        (node.Text == "Efficiency") ||
                        (node.Text == "Tune"))
                        li.Nodes["Energy"].Nodes.Add(node);

                    else if ((node.Text == "Altitude") ||
                        (node.Text == "GPS Coord") ||
                        (node.Text == "Heading") ||
                        (node.Text == "Heading Rose") ||
                        (node.Text == "Real heading") ||
                        (node.Text == "Home Altitude") ||
                        (node.Text == "Home Direction") ||
                        (node.Text == "Home Distance") ||
                        (node.Text == "Trip Distance") ||
                        (node.Text == "Visible Sats") ||
                        (node.Text == "WP Distance"))
                        li.Nodes["Location"].Nodes.Add(node);

                    else if ((node.Text == "Air Speed") ||
                        (node.Text == "Vertical Speed") ||
                        (node.Text == "Velocity") ||
                        (node.Text == "Wind Speed"))
                        li.Nodes["Speed"].Nodes.Add(node);
					else
						li.Nodes["Misc"].Nodes.Add(node);
                }
				
            }

            li.ExpandAll();
            AutomaticCheck = false;
        }
		
 		private void treeView1_AfterCheck (object sender, TreeViewEventArgs e) {
			if(!AutomaticCheck)
				foreach(TreeNode node in e.Node.Nodes)
					node.Checked = e.Node.Checked;

			if(osd.IsHandleCreated)
				osd.BeginInvoke((MethodInvoker)delegate {
					osd.Draw(number); });
		}
		
        private void adjust(Panel thing){
            int n;

            chkSign.Checked = thing.sign == 1;
            chkSign.Visible = thing.sign != -1;

            labStrings.Visible=false;
            txtStrings.Visible = false;

            switch(thing.ui_mode){ 
            case UI_Mode.UI_Combo:
                n = osd.getAlt(thing)/2;
                cbNumber.SelectedIndex =n;
                cbNumber.Visible = true;
                chkAlt.Visible = false;
                chkAlt2.Visible = false;
                chkAlt3.Visible = false;
                chkAlt4.Visible = false;
                cbNumber.Text = n.ToString();
                labNumber.Text = thing.alt_text;
                labNumber.Visible = true;
                break;

            case  UI_Mode.UI_Combo_Cb_Strings:
                labStrings.Visible=true;
                txtStrings.Visible = true;
                txtStrings.Text = thing.strings;
                goto as_combo_cb;
                //labStrings
                
            case UI_Mode.UI_Combo_Cb:
as_combo_cb:
                n = osd.getAlt(thing)/2;
                cbNumber.SelectedIndex =n;
                cbNumber.Visible = true;
                chkAlt.Visible = true;
                chkAlt2.Visible = false;
                chkAlt3.Visible = false;
                chkAlt4.Visible = false;
                cbNumber.Text = n.ToString();
                
                labNumber.Text = thing.alt_text;
                chkAlt.Text = thing.alt2_text;
                labNumber.Visible = true;
                break;

            case UI_Mode.UI_Checkbox:
            default:
                labNumber.Visible = false;
                cbNumber.Visible = false;

                chkAlt.Text = thing.alt_text;
                chkAlt.Visible = thing.Altf != -1 && thing.alt_text != "";
                chkAlt.Checked = thing.Altf == 1;

                chkAlt2.Text = thing.alt2_text;
                chkAlt2.Visible = thing.Alt2 != -1 && thing.alt2_text != "";
                chkAlt2.Checked = thing.Alt2 == 1;

                chkAlt3.Text = thing.alt3_text;
                chkAlt3.Visible = thing.Alt3 != -1 && thing.alt3_text != "";
                chkAlt3.Checked = thing.Alt3 == 1;

                chkAlt4.Text = thing.alt4_text;
                chkAlt4.Visible = thing.Alt4 != -1 && thing.alt4_text != "";
                chkAlt4.Checked = thing.Alt4 == 1;
                break;
            }
        }

        private void treeView1_AfterSelect (object sender, TreeViewEventArgs e) {
			//string item = ((CheckedListBox)sender).SelectedItem.ToString();

			osd.currentlyselected = e.Node.Text;
			osd.Draw(number);

			foreach(var thing in panelItems) {
				if(thing!=null && thing.name==e.Node.Text) {
					NUM_X.Value = Constrain(thing.x, 0, osd.get_basesize().Width - 1);
					NUM_Y.Value = Constrain(thing.y, 0, OSD.SCREEN_H - 1);

                    adjust(thing);
				}
			}
		}
		


        private void LIST_items_AfterSelect (object sender, TreeViewEventArgs e) {
			//string item = ((CheckedListBox)sender).SelectedItem.ToString();

			osd.currentlyselected = e.Node.Text;
			osd.Draw(number);

			foreach(var thing in panelItems) {
				if(thing!=null && thing.name==e.Node.Text) {
					NUM_X.Value = Constrain(thing.x, 0, osd.get_basesize().Width - 1);
					NUM_Y.Value = Constrain(thing.y, 0, OSD.SCREEN_H - 1);

                    adjust(thing);
                }
			}
		}
		
		private void numericUpDown1_ValueChanged (object sender, EventArgs e) {
			string item = osd.currentlyselected;
			

			for (int a = 0; a < panelItems.Length; a++) {
				if(panelItems[a]!=null && panelItems[a].name==item) {
					panelItems[a].x = (int)NUM_X.Value;
                }
            }

            osd.Draw(number);
        }


        private void numericUpDown2_ValueChanged (object sender, EventArgs e) {
			string item;

			item = osd.currentlyselected;
			
			for (int a = 0; a < panelItems.Length; a++) {
				if(panelItems[a]!=null && panelItems[a].name==item) {
					panelItems[a].y = (int)NUM_Y.Value;

				}
			}

			osd.Draw(number);
		}
		
		private void pictureBox1_MouseUp (object sender, MouseEventArgs e) {
			getMouseOverItem(e.X, e.Y);

			mousedown = false;
		}
		


        private void pictureBox1_MouseMove (object sender, MouseEventArgs e) {
			if(e.Button==System.Windows.Forms.MouseButtons.Left && mousedown==true) {
				int ansW, ansH;
				getCharLoc(e.X, e.Y, out ansW, out ansH);
				if(ansH >= osd.getCenter() && !(osd.pal_checked() || osd.auto_checked())) {
					ansH += 3;
				}
				ansW -= clickX; //запомним куда ткнули
				ansH -= clickY;
				
				NUM_X.Value = Constrain(ansW, 0, osd.get_basesize().Width - 1);
				NUM_Y.Value = Constrain(ansH, 0, OSD.SCREEN_H - 1);

				pictureBox.Focus();
			} else {
				mousedown = false;
			}
		}
		

        

        private void pictureBox1_MouseDown (object sender, MouseEventArgs e) {
			osd.BeginInvoke((MethodInvoker)delegate {
				osd.currentlyselected = getMouseOverItem(e.X, e.Y);
			});
			

			mousedown = true;
        
		}
		
		int Constrain (double value, double min, double max) {
			if(value < min)
				return (int)min;
			if(value > max)
				return (int)max;

			return (int)value;
		}
		

        string getMouseOverItem (int x, int y) {
			int ansW, ansH;
			System.Windows.Forms.TreeView li = LIST_items;
			
			getCharLoc(x, y, out ansW, out ansH);

			if(osd.usedPostion[ansW][ansH]!=null && osd.usedPostion[ansW][ansH]!="") {
			
				string name = osd.usedPostion[ansW][ansH];

				TreeNode[] tnArray = li.Nodes.Find(name, true);
				
				li.Focus();
				li.SelectedNode = tnArray[0]; // выберем этот элемент в списке

/*				
				foreach(var thing in osd.scr[osd.panel_number].panelItems) {
					if(thing!=null) {
						if(thing.name==name) {
				// левый верхний угол нашей фигуры thing.x, thing.y
							clickX = ansW - thing.x; //запомним куда ткнули
							clickY = ansH - thing.y;
							break; 
						}
					}
				}
				
*/
//				/*
				Panel thing=(Panel)tnArray[0].Tag;
			// левый верхний угол нашей фигуры thing.x, thing.y
				clickX = ansW - thing.x; //запомним куда ткнули
				clickY = ansH - thing.y;				
//*/				
				//LIST_items.SelectedIndex = LIST_items.Items.IndexOf(usedPostion[ansW][ansH]);
				return name;
			}

			return "";
		}
		

		void getCharLoc (int x, int y, out int xpos, out int ypos) {
			System.Windows.Forms.PictureBox pb = pictureBox;

			x = Constrain(x, 0, pb.Width - 1);
			y = Constrain(y, 0, pb.Height - 1);

			float scaleW = pb.Width / (float)osd.screen.Width;
			float scaleH = pb.Height / (float)osd.screen.Height;

			int ansW = (int)((x / scaleW / OSD.CHAR_W) % OSD.SCREEN_W);
			int ansH = 0;
			if(osd.pal_checked()) {
				ansH = (int)((y / scaleH / OSD.CHAR_H) % OSD.SCREEN_H);
			} else {
				ansH = (int)((y / scaleH / OSD.CHAR_H) % OSD.SCREEN_H_NTSC);
			}

			xpos = Constrain(ansW, 0, OSD.SCREEN_W - 1);
			ypos = Constrain(ansH, 0, OSD.SCREEN_H - 1);
		}

		private void chkSign_CheckedChanged(object sender, EventArgs e) {
    		
			string item = osd.currentlyselected;
			
			for (int a = 0; a < panelItems.Length; a++) {
				if(panelItems[a]!=null && panelItems[a].name==item) {
					if(panelItems[a].sign>=0)
						panelItems[a].sign = chkSign.Checked?1:0;

				}
			}

			osd.Draw(number);
        
        }

        private void chkAlt_CheckedChanged(object sender, EventArgs e) {

            string item = osd.currentlyselected;

            for (int a = 0; a < panelItems.Length; a++) {
                if (panelItems[a] != null && panelItems[a].name == item) {
                    if (panelItems[a].Altf >= 0)
                        panelItems[a].Altf = chkAlt.Checked ? 1 : 0;
                    if (panelItems[a].Alt2 >= 0)
                        panelItems[a].Alt2 = chkAlt2.Checked ? 1 : 0;
                    if (panelItems[a].Alt3 >= 0)
                        panelItems[a].Alt3 = chkAlt3.Checked ? 1 : 0;
                    if (panelItems[a].Alt4 >= 0)
                        panelItems[a].Alt4 = chkAlt4.Checked ? 1 : 0;

                }
            }

            osd.Draw(number);

        }		
	
	    private void cbNumber_SelectedIndexChanged(object sender, EventArgs e) {
            string item = osd.currentlyselected;
            
            for (int a = 0; a < panelItems.Length; a++) {
                if (panelItems[a] != null && panelItems[a].name == item) {
                    int n=cbNumber.SelectedIndex;
                    
                    
                    panelItems[a].Alt2 = (n & 1) != 0 ? 1 : 0;
                    panelItems[a].Alt3 = (n & 2) != 0 ? 1 : 0;
                    panelItems[a].Alt4 = (n & 4) != 0 ? 1 : 0;
                }
            }
            osd.Draw(number);
        }	

        private void txtStrings_TextChanged(object sender, EventArgs e) {
            string item = osd.currentlyselected;
            for (int a = 0; a < panelItems.Length; a++) {
                if (panelItems[a] != null && panelItems[a].name == item) {
                    string s = txtStrings.Text ;
                    int n=panelItems[a].string_count;
                    if(n>0) {
                        panelItems[a].strings =s;
                        osd.updatePanelStrings(panelItems[a].string_id,n, s);
                    }
                }
            }
            osd.Draw(number);
        }	

	}
}

