using System;
namespace OSD
{
    partial class OSD
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(OSD));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.NUM_Y = new System.Windows.Forms.NumericUpDown();
            this.NUM_X = new System.Windows.Forms.NumericUpDown();
            this.BUT_WriteOSD = new System.Windows.Forms.Button();
            this.CMB_ComPort = new System.Windows.Forms.ComboBox();
            this.BUT_ReadOSD = new System.Windows.Forms.Button();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripProgressBar1 = new System.Windows.Forms.ToolStripProgressBar();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.loadDefaultsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.videoModeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.CHK_ntsc = new System.Windows.Forms.ToolStripMenuItem();
            this.CHK_pal = new System.Windows.Forms.ToolStripMenuItem();
            this.optionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.checkBox1 = new System.Windows.Forms.ToolStripMenuItem();
            this.updateFirmwareToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.customBGPictureToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sendTLogToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.updateFontToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.updateCharsetDevToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.updateCharsetcustomFwToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.presentCustomCharsetToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.setSketchesPathToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.getFwFromOSDToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gettingStartedToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.PANEL_tabs = new System.Windows.Forms.TabControl();
            this.tabPageConfig = new System.Windows.Forms.TabPage();
            this.groupBox10 = new System.Windows.Forms.GroupBox();
            this.label14 = new System.Windows.Forms.Label();
            this.cbxMslAltitudeSign = new System.Windows.Forms.CheckBox();
            this.cbxHomeAltitudeSign = new System.Windows.Forms.CheckBox();
            this.cbxGroundSpeedSign = new System.Windows.Forms.CheckBox();
            this.cbxAirSpeedSign = new System.Windows.Forms.CheckBox();
            this.groupBox9 = new System.Windows.Forms.GroupBox();
            this.BRIGHTNESScomboBox = new System.Windows.Forms.ComboBox();
            this.label13 = new System.Windows.Forms.Label();
            this.groupBox8 = new System.Windows.Forms.GroupBox();
            this.CALLSIGNmaskedText = new System.Windows.Forms.MaskedTextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.groupBox7 = new System.Windows.Forms.GroupBox();
            this.cbxWarningsAutoPanelSwitch = new System.Windows.Forms.ComboBox();
            this.lblWarningsAutoPanelSwitch = new System.Windows.Forms.Label();
            this.TOGGLE_BEH = new System.Windows.Forms.CheckBox();
            this.ONOFF_combo = new System.Windows.Forms.ComboBox();
            this.label11 = new System.Windows.Forms.Label();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.UNITS_combo = new System.Windows.Forms.ComboBox();
            this.label10 = new System.Windows.Forms.Label();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.OVERSPEED_label = new System.Windows.Forms.Label();
            this.OVERSPEED_numeric = new System.Windows.Forms.NumericUpDown();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.rbtBatterymAh = new System.Windows.Forms.RadioButton();
            this.rbtBatteryPercent = new System.Windows.Forms.RadioButton();
            this.label9 = new System.Windows.Forms.Label();
            this.BATT_WARNnumeric = new System.Windows.Forms.NumericUpDown();
            this.label7 = new System.Windows.Forms.Label();
            this.MINVOLT_numeric = new System.Windows.Forms.NumericUpDown();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.STALL_label = new System.Windows.Forms.Label();
            this.STALL_numeric = new System.Windows.Forms.NumericUpDown();
            this.groupBoxRSSI = new System.Windows.Forms.GroupBox();
            this.cbxRSSIChannel = new System.Windows.Forms.ComboBox();
            this.label15 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.RSSI_WARNnumeric = new System.Windows.Forms.NumericUpDown();
            this.RSSI_RAW = new System.Windows.Forms.CheckBox();
            this.lblRSSIMax = new System.Windows.Forms.Label();
            this.lblRSSIMin = new System.Windows.Forms.Label();
            this.RSSI_numeric_max = new System.Windows.Forms.NumericUpDown();
            this.RSSI_numeric_min = new System.Windows.Forms.NumericUpDown();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.LIST_items = new System.Windows.Forms.TreeView();
            this.rbtSortCategory = new System.Windows.Forms.RadioButton();
            this.rbtSortAlphabetic = new System.Windows.Forms.RadioButton();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.LIST_items2 = new System.Windows.Forms.TreeView();
            this.rbtSortCategory2 = new System.Windows.Forms.RadioButton();
            this.rbtSortAlphabetic2 = new System.Windows.Forms.RadioButton();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.NUM_Y2 = new System.Windows.Forms.NumericUpDown();
            this.NUM_X2 = new System.Windows.Forms.NumericUpDown();
            this.lblFWModelType = new System.Windows.Forms.Label();
            this.lblModelType = new System.Windows.Forms.Label();
            this.cbxModelType = new System.Windows.Forms.ComboBox();
            this.btnGeneratePanelsFile = new System.Windows.Forms.Button();
            this.lblPresentedCharset = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.lblLatestCharsetUploaded = new System.Windows.Forms.Label();
            this.groupBox11 = new System.Windows.Forms.GroupBox();
            this.groupBox12 = new System.Windows.Forms.GroupBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.cbxAutoUpdate = new System.Windows.Forms.CheckBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.saveToFileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.loadFromFileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cbxShowUpdateDialog = new System.Windows.Forms.CheckBox();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_Y)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X)).BeginInit();
            this.statusStrip1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.PANEL_tabs.SuspendLayout();
            this.tabPageConfig.SuspendLayout();
            this.groupBox10.SuspendLayout();
            this.groupBox9.SuspendLayout();
            this.groupBox8.SuspendLayout();
            this.groupBox7.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.groupBox5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.OVERSPEED_numeric)).BeginInit();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.BATT_WARNnumeric)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.MINVOLT_numeric)).BeginInit();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.STALL_numeric)).BeginInit();
            this.groupBoxRSSI.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_WARNnumeric)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_numeric_max)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_numeric_min)).BeginInit();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_Y2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X2)).BeginInit();
            this.groupBox11.SuspendLayout();
            this.groupBox12.SuspendLayout();
            this.tabPage3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.NUM_Y);
            this.groupBox1.Controls.Add(this.NUM_X);
            this.groupBox1.Location = new System.Drawing.Point(3, 285);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(169, 82);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(7, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(14, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Y";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(7, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(14, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "X";
            // 
            // NUM_Y
            // 
            this.NUM_Y.Location = new System.Drawing.Point(30, 46);
            this.NUM_Y.Maximum = new decimal(new int[] {
            15,
            0,
            0,
            0});
            this.NUM_Y.Name = "NUM_Y";
            this.NUM_Y.Size = new System.Drawing.Size(91, 20);
            this.NUM_Y.TabIndex = 1;
            this.NUM_Y.ValueChanged += new System.EventHandler(this.numericUpDown2_ValueChanged);
            // 
            // NUM_X
            // 
            this.NUM_X.Location = new System.Drawing.Point(30, 20);
            this.NUM_X.Maximum = new decimal(new int[] {
            29,
            0,
            0,
            0});
            this.NUM_X.Name = "NUM_X";
            this.NUM_X.Size = new System.Drawing.Size(91, 20);
            this.NUM_X.TabIndex = 0;
            this.NUM_X.ValueChanged += new System.EventHandler(this.numericUpDown1_ValueChanged);
            // 
            // BUT_WriteOSD
            // 
            this.BUT_WriteOSD.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.BUT_WriteOSD.Location = new System.Drawing.Point(540, 508);
            this.BUT_WriteOSD.Name = "BUT_WriteOSD";
            this.BUT_WriteOSD.Size = new System.Drawing.Size(148, 23);
            this.BUT_WriteOSD.TabIndex = 2;
            this.BUT_WriteOSD.Text = "Save Current Tab to OSD";
            this.BUT_WriteOSD.UseVisualStyleBackColor = true;
            this.BUT_WriteOSD.Click += new System.EventHandler(this.BUT_WriteOSD_Click);
            // 
            // CMB_ComPort
            // 
            this.CMB_ComPort.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.CMB_ComPort.FormattingEnabled = true;
            this.CMB_ComPort.Location = new System.Drawing.Point(330, 510);
            this.CMB_ComPort.Name = "CMB_ComPort";
            this.CMB_ComPort.Size = new System.Drawing.Size(98, 21);
            this.CMB_ComPort.TabIndex = 4;
            this.CMB_ComPort.Click += new System.EventHandler(this.comboBox1_Click);
            // 
            // BUT_ReadOSD
            // 
            this.BUT_ReadOSD.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.BUT_ReadOSD.Location = new System.Drawing.Point(434, 508);
            this.BUT_ReadOSD.Name = "BUT_ReadOSD";
            this.BUT_ReadOSD.Size = new System.Drawing.Size(100, 23);
            this.BUT_ReadOSD.TabIndex = 6;
            this.BUT_ReadOSD.Text = "Read From OSD";
            this.BUT_ReadOSD.UseVisualStyleBackColor = true;
            this.BUT_ReadOSD.Click += new System.EventHandler(this.BUT_ReadOSD_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripProgressBar1,
            this.toolStripStatusLabel1});
            this.statusStrip1.Location = new System.Drawing.Point(0, 536);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(688, 22);
            this.statusStrip1.TabIndex = 8;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripProgressBar1
            // 
            this.toolStripProgressBar1.Name = "toolStripProgressBar1";
            this.toolStripProgressBar1.Size = new System.Drawing.Size(500, 16);
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(0, 17);
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.videoModeToolStripMenuItem,
            this.optionsToolStripMenuItem,
            this.helpToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(688, 24);
            this.menuStrip1.TabIndex = 10;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.saveToFileToolStripMenuItem,
            this.loadFromFileToolStripMenuItem,
            this.toolStripSeparator2,
            this.loadDefaultsToolStripMenuItem,
            this.toolStripSeparator1,
            this.exitToolStripMenuItem});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(35, 20);
            this.fileToolStripMenuItem.Text = "File";
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(203, 6);
            // 
            // loadDefaultsToolStripMenuItem
            // 
            this.loadDefaultsToolStripMenuItem.Name = "loadDefaultsToolStripMenuItem";
            this.loadDefaultsToolStripMenuItem.Size = new System.Drawing.Size(206, 22);
            this.loadDefaultsToolStripMenuItem.Text = "Load Defaults";
            this.loadDefaultsToolStripMenuItem.Click += new System.EventHandler(this.loadDefaultsToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(203, 6);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.F4)));
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(206, 22);
            this.exitToolStripMenuItem.Text = "Exit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // videoModeToolStripMenuItem
            // 
            this.videoModeToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.CHK_ntsc,
            this.CHK_pal});
            this.videoModeToolStripMenuItem.Name = "videoModeToolStripMenuItem";
            this.videoModeToolStripMenuItem.Size = new System.Drawing.Size(74, 20);
            this.videoModeToolStripMenuItem.Text = "Video Mode";
            // 
            // CHK_ntsc
            // 
            this.CHK_ntsc.CheckOnClick = true;
            this.CHK_ntsc.Name = "CHK_ntsc";
            this.CHK_ntsc.Size = new System.Drawing.Size(111, 22);
            this.CHK_ntsc.Text = "NTSC";
            this.CHK_ntsc.CheckStateChanged += new System.EventHandler(this.nTSCToolStripMenuItem_CheckStateChanged);
            this.CHK_ntsc.Click += new System.EventHandler(this.CHK_ntsc_Click);
            // 
            // CHK_pal
            // 
            this.CHK_pal.Checked = true;
            this.CHK_pal.CheckOnClick = true;
            this.CHK_pal.CheckState = System.Windows.Forms.CheckState.Checked;
            this.CHK_pal.Name = "CHK_pal";
            this.CHK_pal.Size = new System.Drawing.Size(111, 22);
            this.CHK_pal.Text = "PAL";
            this.CHK_pal.CheckedChanged += new System.EventHandler(this.CHK_pal_CheckedChanged);
            this.CHK_pal.CheckStateChanged += new System.EventHandler(this.pALToolStripMenuItem_CheckStateChanged);
            this.CHK_pal.Click += new System.EventHandler(this.CHK_pal_Click);
            // 
            // optionsToolStripMenuItem
            // 
            this.optionsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.checkBox1,
            this.updateFirmwareToolStripMenuItem,
            this.customBGPictureToolStripMenuItem,
            this.sendTLogToolStripMenuItem,
            this.updateFontToolStripMenuItem,
            this.updateCharsetDevToolStripMenuItem,
            this.updateCharsetcustomFwToolStripMenuItem,
            this.presentCustomCharsetToolStripMenuItem,
            this.setSketchesPathToolStripMenuItem,
            this.getFwFromOSDToolStripMenuItem});
            this.optionsToolStripMenuItem.Name = "optionsToolStripMenuItem";
            this.optionsToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.G)));
            this.optionsToolStripMenuItem.ShowShortcutKeys = false;
            this.optionsToolStripMenuItem.Size = new System.Drawing.Size(56, 20);
            this.optionsToolStripMenuItem.Text = "Options";
            // 
            // checkBox1
            // 
            this.checkBox1.Checked = true;
            this.checkBox1.CheckOnClick = true;
            this.checkBox1.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(233, 22);
            this.checkBox1.Text = "Show Grid";
            this.checkBox1.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // updateFirmwareToolStripMenuItem
            // 
            this.updateFirmwareToolStripMenuItem.Name = "updateFirmwareToolStripMenuItem";
            this.updateFirmwareToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.updateFirmwareToolStripMenuItem.Text = "Update Firmware...";
            this.updateFirmwareToolStripMenuItem.ToolTipText = "Re-Flash the OSD with a new firmware image";
            this.updateFirmwareToolStripMenuItem.Click += new System.EventHandler(this.updateFirmwareToolStripMenuItem_Click);
            // 
            // customBGPictureToolStripMenuItem
            // 
            this.customBGPictureToolStripMenuItem.Name = "customBGPictureToolStripMenuItem";
            this.customBGPictureToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.customBGPictureToolStripMenuItem.Text = "Background Image...";
            this.customBGPictureToolStripMenuItem.Click += new System.EventHandler(this.customBGPictureToolStripMenuItem_Click);
            // 
            // sendTLogToolStripMenuItem
            // 
            this.sendTLogToolStripMenuItem.Name = "sendTLogToolStripMenuItem";
            this.sendTLogToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.sendTLogToolStripMenuItem.Text = "Send TLog...";
            this.sendTLogToolStripMenuItem.ToolTipText = "Send a Mavlink transmission log to the OSD to test the layout";
            this.sendTLogToolStripMenuItem.Click += new System.EventHandler(this.sendTLogToolStripMenuItem_Click);
            // 
            // updateFontToolStripMenuItem
            // 
            this.updateFontToolStripMenuItem.Name = "updateFontToolStripMenuItem";
            this.updateFontToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.updateFontToolStripMenuItem.Text = "Update CharSet...";
            this.updateFontToolStripMenuItem.ToolTipText = "Update the font file on the OSD";
            this.updateFontToolStripMenuItem.Click += new System.EventHandler(this.updateFontToolStripMenuItem_Click);
            // 
            // updateCharsetDevToolStripMenuItem
            // 
            this.updateCharsetDevToolStripMenuItem.Name = "updateCharsetDevToolStripMenuItem";
            this.updateCharsetDevToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.updateCharsetDevToolStripMenuItem.Text = "Update Charset (Dev)...";
            this.updateCharsetDevToolStripMenuItem.Visible = false;
            this.updateCharsetDevToolStripMenuItem.Click += new System.EventHandler(this.updateCharsetDevToolStripMenuItem_Click);
            // 
            // updateCharsetcustomFwToolStripMenuItem
            // 
            this.updateCharsetcustomFwToolStripMenuItem.Name = "updateCharsetcustomFwToolStripMenuItem";
            this.updateCharsetcustomFwToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.updateCharsetcustomFwToolStripMenuItem.Text = "Update Charset (custom fw)...";
            this.updateCharsetcustomFwToolStripMenuItem.Visible = false;
            this.updateCharsetcustomFwToolStripMenuItem.Click += new System.EventHandler(this.updateCharsetcustomFwToolStripMenuItem_Click);
            // 
            // presentCustomCharsetToolStripMenuItem
            // 
            this.presentCustomCharsetToolStripMenuItem.Name = "presentCustomCharsetToolStripMenuItem";
            this.presentCustomCharsetToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.presentCustomCharsetToolStripMenuItem.Text = "Show Custom Charset...";
            this.presentCustomCharsetToolStripMenuItem.Click += new System.EventHandler(this.presentCustomCharsetToolStripMenuItem_Click);
            // 
            // setSketchesPathToolStripMenuItem
            // 
            this.setSketchesPathToolStripMenuItem.Name = "setSketchesPathToolStripMenuItem";
            this.setSketchesPathToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.setSketchesPathToolStripMenuItem.Text = "Set Arduino Sketches Path...";
            this.setSketchesPathToolStripMenuItem.Visible = false;
            this.setSketchesPathToolStripMenuItem.Click += new System.EventHandler(this.setSketchesPathToolStripMenuItem_Click);
            // 
            // getFwFromOSDToolStripMenuItem
            // 
            this.getFwFromOSDToolStripMenuItem.Name = "getFwFromOSDToolStripMenuItem";
            this.getFwFromOSDToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.getFwFromOSDToolStripMenuItem.Text = "GetFwFromOSD...";
            this.getFwFromOSDToolStripMenuItem.Visible = false;
            this.getFwFromOSDToolStripMenuItem.Click += new System.EventHandler(this.getFwFromOSDToolStripMenuItem_Click);
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.gettingStartedToolStripMenuItem,
            this.aboutToolStripMenuItem});
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(40, 20);
            this.helpToolStripMenuItem.Text = "Help";
            // 
            // gettingStartedToolStripMenuItem
            // 
            this.gettingStartedToolStripMenuItem.Name = "gettingStartedToolStripMenuItem";
            this.gettingStartedToolStripMenuItem.Size = new System.Drawing.Size(158, 22);
            this.gettingStartedToolStripMenuItem.Text = "Getting started";
            this.gettingStartedToolStripMenuItem.Click += new System.EventHandler(this.gettingStartedToolStripMenuItem_Click);
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(158, 22);
            this.aboutToolStripMenuItem.Text = "About ";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // PANEL_tabs
            // 
            this.PANEL_tabs.Controls.Add(this.tabPageConfig);
            this.PANEL_tabs.Controls.Add(this.tabPage1);
            this.PANEL_tabs.Controls.Add(this.tabPage2);
            this.PANEL_tabs.Controls.Add(this.tabPage3);
            this.PANEL_tabs.Location = new System.Drawing.Point(1, 96);
            this.PANEL_tabs.Margin = new System.Windows.Forms.Padding(2);
            this.PANEL_tabs.Name = "PANEL_tabs";
            this.PANEL_tabs.SelectedIndex = 0;
            this.PANEL_tabs.Size = new System.Drawing.Size(687, 407);
            this.PANEL_tabs.TabIndex = 0;
            // 
            // tabPageConfig
            // 
            this.tabPageConfig.Controls.Add(this.groupBox10);
            this.tabPageConfig.Controls.Add(this.groupBox9);
            this.tabPageConfig.Controls.Add(this.groupBox8);
            this.tabPageConfig.Controls.Add(this.groupBox7);
            this.tabPageConfig.Controls.Add(this.groupBox6);
            this.tabPageConfig.Controls.Add(this.groupBox5);
            this.tabPageConfig.Controls.Add(this.groupBox4);
            this.tabPageConfig.Controls.Add(this.groupBox3);
            this.tabPageConfig.Controls.Add(this.groupBoxRSSI);
            this.tabPageConfig.Location = new System.Drawing.Point(4, 22);
            this.tabPageConfig.Margin = new System.Windows.Forms.Padding(2);
            this.tabPageConfig.Name = "tabPageConfig";
            this.tabPageConfig.Padding = new System.Windows.Forms.Padding(2);
            this.tabPageConfig.Size = new System.Drawing.Size(679, 381);
            this.tabPageConfig.TabIndex = 1;
            this.tabPageConfig.Text = "Config";
            this.tabPageConfig.UseVisualStyleBackColor = true;
            // 
            // groupBox10
            // 
            this.groupBox10.Controls.Add(this.label14);
            this.groupBox10.Controls.Add(this.cbxMslAltitudeSign);
            this.groupBox10.Controls.Add(this.cbxHomeAltitudeSign);
            this.groupBox10.Controls.Add(this.cbxGroundSpeedSign);
            this.groupBox10.Controls.Add(this.cbxAirSpeedSign);
            this.groupBox10.Location = new System.Drawing.Point(357, 224);
            this.groupBox10.Name = "groupBox10";
            this.groupBox10.Size = new System.Drawing.Size(160, 114);
            this.groupBox10.TabIndex = 8;
            this.groupBox10.TabStop = false;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(6, 15);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(121, 13);
            this.label14.TabIndex = 14;
            this.label14.Text = "Show sign before value:";
            // 
            // cbxMslAltitudeSign
            // 
            this.cbxMslAltitudeSign.AutoSize = true;
            this.cbxMslAltitudeSign.Location = new System.Drawing.Point(5, 92);
            this.cbxMslAltitudeSign.Margin = new System.Windows.Forms.Padding(2);
            this.cbxMslAltitudeSign.Name = "cbxMslAltitudeSign";
            this.cbxMslAltitudeSign.Size = new System.Drawing.Size(86, 17);
            this.cbxMslAltitudeSign.TabIndex = 13;
            this.cbxMslAltitudeSign.Text = "MSL Altitude";
            this.cbxMslAltitudeSign.UseVisualStyleBackColor = true;
            this.cbxMslAltitudeSign.CheckedChanged += new System.EventHandler(this.cbxMslAltitudeSign_CheckedChanged);
            // 
            // cbxHomeAltitudeSign
            // 
            this.cbxHomeAltitudeSign.AutoSize = true;
            this.cbxHomeAltitudeSign.Location = new System.Drawing.Point(5, 72);
            this.cbxHomeAltitudeSign.Margin = new System.Windows.Forms.Padding(2);
            this.cbxHomeAltitudeSign.Name = "cbxHomeAltitudeSign";
            this.cbxHomeAltitudeSign.Size = new System.Drawing.Size(92, 17);
            this.cbxHomeAltitudeSign.TabIndex = 12;
            this.cbxHomeAltitudeSign.Text = "Home Altitude";
            this.cbxHomeAltitudeSign.UseVisualStyleBackColor = true;
            this.cbxHomeAltitudeSign.CheckedChanged += new System.EventHandler(this.cbxHomeAltitudeSign_CheckedChanged);
            // 
            // cbxGroundSpeedSign
            // 
            this.cbxGroundSpeedSign.AutoSize = true;
            this.cbxGroundSpeedSign.Location = new System.Drawing.Point(5, 51);
            this.cbxGroundSpeedSign.Margin = new System.Windows.Forms.Padding(2);
            this.cbxGroundSpeedSign.Name = "cbxGroundSpeedSign";
            this.cbxGroundSpeedSign.Size = new System.Drawing.Size(95, 17);
            this.cbxGroundSpeedSign.TabIndex = 11;
            this.cbxGroundSpeedSign.Text = "Ground Speed";
            this.cbxGroundSpeedSign.UseVisualStyleBackColor = true;
            this.cbxGroundSpeedSign.CheckedChanged += new System.EventHandler(this.cbxGroundSpeedSign_CheckedChanged);
            // 
            // cbxAirSpeedSign
            // 
            this.cbxAirSpeedSign.AutoSize = true;
            this.cbxAirSpeedSign.Location = new System.Drawing.Point(5, 30);
            this.cbxAirSpeedSign.Margin = new System.Windows.Forms.Padding(2);
            this.cbxAirSpeedSign.Name = "cbxAirSpeedSign";
            this.cbxAirSpeedSign.Size = new System.Drawing.Size(72, 17);
            this.cbxAirSpeedSign.TabIndex = 10;
            this.cbxAirSpeedSign.Text = "Air Speed";
            this.cbxAirSpeedSign.UseVisualStyleBackColor = true;
            this.cbxAirSpeedSign.CheckedChanged += new System.EventHandler(this.cbxAirSpeedSign_CheckedChanged);
            // 
            // groupBox9
            // 
            this.groupBox9.Controls.Add(this.BRIGHTNESScomboBox);
            this.groupBox9.Controls.Add(this.label13);
            this.groupBox9.Location = new System.Drawing.Point(180, 211);
            this.groupBox9.Name = "groupBox9";
            this.groupBox9.Size = new System.Drawing.Size(150, 63);
            this.groupBox9.TabIndex = 10;
            this.groupBox9.TabStop = false;
            // 
            // BRIGHTNESScomboBox
            // 
            this.BRIGHTNESScomboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.BRIGHTNESScomboBox.FormattingEnabled = true;
            this.BRIGHTNESScomboBox.Items.AddRange(new object[] {
            "Low",
            "Medium",
            "Medium High",
            "High"});
            this.BRIGHTNESScomboBox.Location = new System.Drawing.Point(9, 36);
            this.BRIGHTNESScomboBox.Margin = new System.Windows.Forms.Padding(2);
            this.BRIGHTNESScomboBox.Name = "BRIGHTNESScomboBox";
            this.BRIGHTNESScomboBox.Size = new System.Drawing.Size(92, 21);
            this.BRIGHTNESScomboBox.TabIndex = 3;
            this.BRIGHTNESScomboBox.SelectedIndexChanged += new System.EventHandler(this.BRIGHTNESScomboBox_SelectedIndexChanged);
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(7, 20);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(82, 13);
            this.label13.TabIndex = 2;
            this.label13.Text = "OSD Brightness";
            // 
            // groupBox8
            // 
            this.groupBox8.Controls.Add(this.CALLSIGNmaskedText);
            this.groupBox8.Controls.Add(this.label12);
            this.groupBox8.Location = new System.Drawing.Point(180, 134);
            this.groupBox8.Name = "groupBox8";
            this.groupBox8.Size = new System.Drawing.Size(150, 65);
            this.groupBox8.TabIndex = 9;
            this.groupBox8.TabStop = false;
            // 
            // CALLSIGNmaskedText
            // 
            this.CALLSIGNmaskedText.AllowPromptAsInput = false;
            this.CALLSIGNmaskedText.AsciiOnly = true;
            this.CALLSIGNmaskedText.BeepOnError = true;
            this.CALLSIGNmaskedText.Location = new System.Drawing.Point(9, 37);
            this.CALLSIGNmaskedText.Margin = new System.Windows.Forms.Padding(2);
            this.CALLSIGNmaskedText.Mask = "CCCCCCCC";
            this.CALLSIGNmaskedText.Name = "CALLSIGNmaskedText";
            this.CALLSIGNmaskedText.Size = new System.Drawing.Size(92, 20);
            this.CALLSIGNmaskedText.TabIndex = 11;
            this.CALLSIGNmaskedText.Validating += new System.ComponentModel.CancelEventHandler(this.CALLSIGNmaskedText_Validating);
            this.CALLSIGNmaskedText.Validated += new System.EventHandler(this.CALLSIGNmaskedText_Validated);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(7, 20);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(48, 13);
            this.label12.TabIndex = 2;
            this.label12.Text = "Call Sign";
            // 
            // groupBox7
            // 
            this.groupBox7.Controls.Add(this.cbxWarningsAutoPanelSwitch);
            this.groupBox7.Controls.Add(this.lblWarningsAutoPanelSwitch);
            this.groupBox7.Controls.Add(this.TOGGLE_BEH);
            this.groupBox7.Controls.Add(this.ONOFF_combo);
            this.groupBox7.Controls.Add(this.label11);
            this.groupBox7.Location = new System.Drawing.Point(8, 205);
            this.groupBox7.Name = "groupBox7";
            this.groupBox7.Size = new System.Drawing.Size(150, 144);
            this.groupBox7.TabIndex = 8;
            this.groupBox7.TabStop = false;
            // 
            // cbxWarningsAutoPanelSwitch
            // 
            this.cbxWarningsAutoPanelSwitch.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxWarningsAutoPanelSwitch.FormattingEnabled = true;
            this.cbxWarningsAutoPanelSwitch.Location = new System.Drawing.Point(7, 47);
            this.cbxWarningsAutoPanelSwitch.Margin = new System.Windows.Forms.Padding(2);
            this.cbxWarningsAutoPanelSwitch.Name = "cbxWarningsAutoPanelSwitch";
            this.cbxWarningsAutoPanelSwitch.Size = new System.Drawing.Size(120, 21);
            this.cbxWarningsAutoPanelSwitch.TabIndex = 13;
            this.cbxWarningsAutoPanelSwitch.SelectedIndexChanged += new System.EventHandler(this.cbxWarningsAutoPanelSwitch_SelectedIndexChanged);
            // 
            // lblWarningsAutoPanelSwitch
            // 
            this.lblWarningsAutoPanelSwitch.Location = new System.Drawing.Point(5, 16);
            this.lblWarningsAutoPanelSwitch.Name = "lblWarningsAutoPanelSwitch";
            this.lblWarningsAutoPanelSwitch.Size = new System.Drawing.Size(139, 29);
            this.lblWarningsAutoPanelSwitch.TabIndex = 12;
            this.lblWarningsAutoPanelSwitch.Text = "Warnings Auto Panel Switch:";
            // 
            // TOGGLE_BEH
            // 
            this.TOGGLE_BEH.AutoSize = true;
            this.TOGGLE_BEH.Location = new System.Drawing.Point(7, 122);
            this.TOGGLE_BEH.Margin = new System.Windows.Forms.Padding(2);
            this.TOGGLE_BEH.Name = "TOGGLE_BEH";
            this.TOGGLE_BEH.Size = new System.Drawing.Size(115, 17);
            this.TOGGLE_BEH.TabIndex = 10;
            this.TOGGLE_BEH.Text = "Rotation Switching";
            this.TOGGLE_BEH.UseVisualStyleBackColor = true;
            this.TOGGLE_BEH.CheckedChanged += new System.EventHandler(this.TOGGLE_BEHChanged);
            // 
            // ONOFF_combo
            // 
            this.ONOFF_combo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.ONOFF_combo.FormattingEnabled = true;
            this.ONOFF_combo.Items.AddRange(new object[] {
            "Disabled",
            "Mode Switch",
            "Ch 5",
            "Ch 6",
            "Ch 7",
            "Ch 8"});
            this.ONOFF_combo.Location = new System.Drawing.Point(6, 91);
            this.ONOFF_combo.Margin = new System.Windows.Forms.Padding(2);
            this.ONOFF_combo.Name = "ONOFF_combo";
            this.ONOFF_combo.Size = new System.Drawing.Size(92, 21);
            this.ONOFF_combo.TabIndex = 3;
            this.ONOFF_combo.SelectedIndexChanged += new System.EventHandler(this.ONOFF_combo_SelectedIndexChanged);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(4, 75);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(108, 13);
            this.label11.TabIndex = 2;
            this.label11.Text = "OSD Toggle Channel";
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.UNITS_combo);
            this.groupBox6.Controls.Add(this.label10);
            this.groupBox6.Location = new System.Drawing.Point(357, 5);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(160, 63);
            this.groupBox6.TabIndex = 7;
            this.groupBox6.TabStop = false;
            // 
            // UNITS_combo
            // 
            this.UNITS_combo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.UNITS_combo.FormattingEnabled = true;
            this.UNITS_combo.Items.AddRange(new object[] {
            "Metric",
            "Imperial"});
            this.UNITS_combo.Location = new System.Drawing.Point(9, 36);
            this.UNITS_combo.Margin = new System.Windows.Forms.Padding(2);
            this.UNITS_combo.Name = "UNITS_combo";
            this.UNITS_combo.Size = new System.Drawing.Size(92, 21);
            this.UNITS_combo.TabIndex = 3;
            this.UNITS_combo.SelectedIndexChanged += new System.EventHandler(this.UNITS_combo_SelectedIndexChanged);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(7, 20);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(31, 13);
            this.label10.TabIndex = 2;
            this.label10.Text = "Units";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.OVERSPEED_label);
            this.groupBox5.Controls.Add(this.OVERSPEED_numeric);
            this.groupBox5.Location = new System.Drawing.Point(180, 68);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(150, 67);
            this.groupBox5.TabIndex = 6;
            this.groupBox5.TabStop = false;
            // 
            // OVERSPEED_label
            // 
            this.OVERSPEED_label.AutoSize = true;
            this.OVERSPEED_label.Location = new System.Drawing.Point(7, 20);
            this.OVERSPEED_label.Name = "OVERSPEED_label";
            this.OVERSPEED_label.Size = new System.Drawing.Size(93, 13);
            this.OVERSPEED_label.TabIndex = 2;
            this.OVERSPEED_label.Text = "Overspeed (km/h)";
            // 
            // OVERSPEED_numeric
            // 
            this.OVERSPEED_numeric.Location = new System.Drawing.Point(9, 37);
            this.OVERSPEED_numeric.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.OVERSPEED_numeric.Name = "OVERSPEED_numeric";
            this.OVERSPEED_numeric.Size = new System.Drawing.Size(91, 20);
            this.OVERSPEED_numeric.TabIndex = 0;
            this.OVERSPEED_numeric.ValueChanged += new System.EventHandler(this.OVERSPEED_numeric_ValueChanged);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.rbtBatterymAh);
            this.groupBox4.Controls.Add(this.rbtBatteryPercent);
            this.groupBox4.Controls.Add(this.label9);
            this.groupBox4.Controls.Add(this.BATT_WARNnumeric);
            this.groupBox4.Controls.Add(this.label7);
            this.groupBox4.Controls.Add(this.MINVOLT_numeric);
            this.groupBox4.Location = new System.Drawing.Point(357, 74);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(160, 150);
            this.groupBox4.TabIndex = 5;
            this.groupBox4.TabStop = false;
            // 
            // rbtBatterymAh
            // 
            this.rbtBatterymAh.AutoSize = true;
            this.rbtBatterymAh.Location = new System.Drawing.Point(8, 127);
            this.rbtBatterymAh.Name = "rbtBatterymAh";
            this.rbtBatterymAh.Size = new System.Drawing.Size(102, 17);
            this.rbtBatterymAh.TabIndex = 15;
            this.rbtBatterymAh.Text = "Show used mAh";
            this.rbtBatterymAh.UseVisualStyleBackColor = true;
            // 
            // rbtBatteryPercent
            // 
            this.rbtBatteryPercent.AutoSize = true;
            this.rbtBatteryPercent.Checked = true;
            this.rbtBatteryPercent.Location = new System.Drawing.Point(8, 104);
            this.rbtBatteryPercent.Name = "rbtBatteryPercent";
            this.rbtBatteryPercent.Size = new System.Drawing.Size(111, 17);
            this.rbtBatteryPercent.TabIndex = 14;
            this.rbtBatteryPercent.TabStop = true;
            this.rbtBatteryPercent.Text = "Show remaining %";
            this.rbtBatteryPercent.UseVisualStyleBackColor = true;
            this.rbtBatteryPercent.CheckedChanged += new System.EventHandler(this.rbtBatteryPercent_CheckedChanged);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(6, 60);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(146, 13);
            this.label9.TabIndex = 13;
            this.label9.Text = "Bat. Remain. Warn. Level (%)";
            // 
            // BATT_WARNnumeric
            // 
            this.BATT_WARNnumeric.Location = new System.Drawing.Point(8, 77);
            this.BATT_WARNnumeric.Name = "BATT_WARNnumeric";
            this.BATT_WARNnumeric.Size = new System.Drawing.Size(91, 20);
            this.BATT_WARNnumeric.TabIndex = 12;
            this.BATT_WARNnumeric.ValueChanged += new System.EventHandler(this.BATT_WARNnumeric_ValueChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(7, 20);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(118, 13);
            this.label7.TabIndex = 2;
            this.label7.Text = "Min. Battery Voltage (V)";
            // 
            // MINVOLT_numeric
            // 
            this.MINVOLT_numeric.DecimalPlaces = 1;
            this.MINVOLT_numeric.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.MINVOLT_numeric.Location = new System.Drawing.Point(9, 37);
            this.MINVOLT_numeric.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            65536});
            this.MINVOLT_numeric.Name = "MINVOLT_numeric";
            this.MINVOLT_numeric.Size = new System.Drawing.Size(91, 20);
            this.MINVOLT_numeric.TabIndex = 0;
            this.MINVOLT_numeric.ValueChanged += new System.EventHandler(this.MINVOLT_numeric_ValueChanged);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.STALL_label);
            this.groupBox3.Controls.Add(this.STALL_numeric);
            this.groupBox3.Location = new System.Drawing.Point(180, 5);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(150, 63);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            // 
            // STALL_label
            // 
            this.STALL_label.AutoSize = true;
            this.STALL_label.Location = new System.Drawing.Point(6, 21);
            this.STALL_label.Name = "STALL_label";
            this.STALL_label.Size = new System.Drawing.Size(95, 13);
            this.STALL_label.TabIndex = 2;
            this.STALL_label.Text = "Stall Speed (km/h)";
            // 
            // STALL_numeric
            // 
            this.STALL_numeric.Location = new System.Drawing.Point(9, 37);
            this.STALL_numeric.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.STALL_numeric.Name = "STALL_numeric";
            this.STALL_numeric.Size = new System.Drawing.Size(91, 20);
            this.STALL_numeric.TabIndex = 0;
            this.STALL_numeric.ValueChanged += new System.EventHandler(this.STALL_numeric_ValueChanged);
            // 
            // groupBoxRSSI
            // 
            this.groupBoxRSSI.Controls.Add(this.cbxRSSIChannel);
            this.groupBoxRSSI.Controls.Add(this.label15);
            this.groupBoxRSSI.Controls.Add(this.label8);
            this.groupBoxRSSI.Controls.Add(this.RSSI_WARNnumeric);
            this.groupBoxRSSI.Controls.Add(this.RSSI_RAW);
            this.groupBoxRSSI.Controls.Add(this.lblRSSIMax);
            this.groupBoxRSSI.Controls.Add(this.lblRSSIMin);
            this.groupBoxRSSI.Controls.Add(this.RSSI_numeric_max);
            this.groupBoxRSSI.Controls.Add(this.RSSI_numeric_min);
            this.groupBoxRSSI.Location = new System.Drawing.Point(8, 5);
            this.groupBoxRSSI.Name = "groupBoxRSSI";
            this.groupBoxRSSI.Size = new System.Drawing.Size(150, 194);
            this.groupBoxRSSI.TabIndex = 3;
            this.groupBoxRSSI.TabStop = false;
            // 
            // cbxRSSIChannel
            // 
            this.cbxRSSIChannel.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxRSSIChannel.FormattingEnabled = true;
            this.cbxRSSIChannel.Items.AddRange(new object[] {
            "Mavlink RSSI",
            "Channel 8"});
            this.cbxRSSIChannel.Location = new System.Drawing.Point(9, 27);
            this.cbxRSSIChannel.Margin = new System.Windows.Forms.Padding(2);
            this.cbxRSSIChannel.Name = "cbxRSSIChannel";
            this.cbxRSSIChannel.Size = new System.Drawing.Size(135, 21);
            this.cbxRSSIChannel.TabIndex = 13;
            this.cbxRSSIChannel.SelectedIndexChanged += new System.EventHandler(this.cbxRSSIChannel_SelectedIndexChanged);
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(6, 12);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(76, 13);
            this.label15.TabIndex = 12;
            this.label15.Text = "RSSI channel:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(6, 129);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(121, 13);
            this.label8.TabIndex = 11;
            this.label8.Text = "RSSI Warning Level (%)";
            // 
            // RSSI_WARNnumeric
            // 
            this.RSSI_WARNnumeric.Location = new System.Drawing.Point(9, 145);
            this.RSSI_WARNnumeric.Name = "RSSI_WARNnumeric";
            this.RSSI_WARNnumeric.Size = new System.Drawing.Size(91, 20);
            this.RSSI_WARNnumeric.TabIndex = 10;
            this.RSSI_WARNnumeric.ValueChanged += new System.EventHandler(this.RSSI_WARNnumeric_ValueChanged);
            // 
            // RSSI_RAW
            // 
            this.RSSI_RAW.AutoSize = true;
            this.RSSI_RAW.Location = new System.Drawing.Point(9, 170);
            this.RSSI_RAW.Margin = new System.Windows.Forms.Padding(2);
            this.RSSI_RAW.Name = "RSSI_RAW";
            this.RSSI_RAW.Size = new System.Drawing.Size(112, 17);
            this.RSSI_RAW.TabIndex = 9;
            this.RSSI_RAW.Text = "RSSI Enable Raw";
            this.RSSI_RAW.UseVisualStyleBackColor = true;
            this.RSSI_RAW.CheckedChanged += new System.EventHandler(this.checkBox2_CheckedChanged);
            // 
            // lblRSSIMax
            // 
            this.lblRSSIMax.AutoSize = true;
            this.lblRSSIMax.Location = new System.Drawing.Point(6, 90);
            this.lblRSSIMax.Name = "lblRSSIMax";
            this.lblRSSIMax.Size = new System.Drawing.Size(85, 13);
            this.lblRSSIMax.TabIndex = 3;
            this.lblRSSIMax.Text = "RSSI Max Value";
            // 
            // lblRSSIMin
            // 
            this.lblRSSIMin.AutoSize = true;
            this.lblRSSIMin.Location = new System.Drawing.Point(6, 51);
            this.lblRSSIMin.Name = "lblRSSIMin";
            this.lblRSSIMin.Size = new System.Drawing.Size(82, 13);
            this.lblRSSIMin.TabIndex = 2;
            this.lblRSSIMin.Text = "RSSI Min Value";
            // 
            // RSSI_numeric_max
            // 
            this.RSSI_numeric_max.Location = new System.Drawing.Point(9, 106);
            this.RSSI_numeric_max.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.RSSI_numeric_max.Name = "RSSI_numeric_max";
            this.RSSI_numeric_max.Size = new System.Drawing.Size(91, 20);
            this.RSSI_numeric_max.TabIndex = 1;
            this.RSSI_numeric_max.Value = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.RSSI_numeric_max.ValueChanged += new System.EventHandler(this.RSSI_numeric_max_ValueChanged);
            // 
            // RSSI_numeric_min
            // 
            this.RSSI_numeric_min.Location = new System.Drawing.Point(9, 67);
            this.RSSI_numeric_min.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.RSSI_numeric_min.Name = "RSSI_numeric_min";
            this.RSSI_numeric_min.Size = new System.Drawing.Size(91, 20);
            this.RSSI_numeric_min.TabIndex = 0;
            this.RSSI_numeric_min.ValueChanged += new System.EventHandler(this.RSSI_numeric_min_ValueChanged);
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.LIST_items);
            this.tabPage1.Controls.Add(this.rbtSortCategory);
            this.tabPage1.Controls.Add(this.rbtSortAlphabetic);
            this.tabPage1.Controls.Add(this.groupBox1);
            this.tabPage1.Controls.Add(this.pictureBox1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Margin = new System.Windows.Forms.Padding(2);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Size = new System.Drawing.Size(679, 381);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Panel 1";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // LIST_items
            // 
            this.LIST_items.Location = new System.Drawing.Point(3, 40);
            this.LIST_items.Name = "LIST_items";
            this.LIST_items.Size = new System.Drawing.Size(169, 237);
            this.LIST_items.TabIndex = 5;
            this.LIST_items.AfterCheck += new System.Windows.Forms.TreeViewEventHandler(this.treeView1_AfterCheck);
            this.LIST_items.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeView1_AfterSelect);
            // 
            // rbtSortCategory
            // 
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
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.LIST_items2);
            this.tabPage2.Controls.Add(this.rbtSortCategory2);
            this.tabPage2.Controls.Add(this.rbtSortAlphabetic2);
            this.tabPage2.Controls.Add(this.groupBox2);
            this.tabPage2.Controls.Add(this.pictureBox2);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Margin = new System.Windows.Forms.Padding(2);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Size = new System.Drawing.Size(679, 381);
            this.tabPage2.TabIndex = 0;
            this.tabPage2.Text = "Panel 2";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // LIST_items2
            // 
            this.LIST_items2.Location = new System.Drawing.Point(3, 40);
            this.LIST_items2.Name = "LIST_items2";
            this.LIST_items2.Size = new System.Drawing.Size(169, 237);
            this.LIST_items2.TabIndex = 7;
            this.LIST_items2.AfterCheck += new System.Windows.Forms.TreeViewEventHandler(this.LIST_items2_AfterCheck);
            this.LIST_items2.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.LIST_items2_AfterSelect);
            // 
            // rbtSortCategory2
            // 
            this.rbtSortCategory2.AutoSize = true;
            this.rbtSortCategory2.Location = new System.Drawing.Point(3, 17);
            this.rbtSortCategory2.Name = "rbtSortCategory2";
            this.rbtSortCategory2.Size = new System.Drawing.Size(104, 17);
            this.rbtSortCategory2.TabIndex = 6;
            this.rbtSortCategory2.Text = "Sort By Category";
            this.rbtSortCategory2.UseVisualStyleBackColor = true;
            // 
            // rbtSortAlphabetic2
            // 
            this.rbtSortAlphabetic2.AutoSize = true;
            this.rbtSortAlphabetic2.Checked = true;
            this.rbtSortAlphabetic2.Location = new System.Drawing.Point(3, 3);
            this.rbtSortAlphabetic2.Name = "rbtSortAlphabetic2";
            this.rbtSortAlphabetic2.Size = new System.Drawing.Size(112, 17);
            this.rbtSortAlphabetic2.TabIndex = 5;
            this.rbtSortAlphabetic2.TabStop = true;
            this.rbtSortAlphabetic2.Text = "Sort Alphabetically";
            this.rbtSortAlphabetic2.UseVisualStyleBackColor = true;
            this.rbtSortAlphabetic2.CheckedChanged += new System.EventHandler(this.rbtSortAlphabetic2_CheckedChanged);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.NUM_Y2);
            this.groupBox2.Controls.Add(this.NUM_X2);
            this.groupBox2.Location = new System.Drawing.Point(3, 285);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(169, 82);
            this.groupBox2.TabIndex = 4;
            this.groupBox2.TabStop = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(7, 48);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(14, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Y";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(7, 20);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(14, 13);
            this.label4.TabIndex = 2;
            this.label4.Text = "X";
            // 
            // NUM_Y2
            // 
            this.NUM_Y2.Location = new System.Drawing.Point(30, 46);
            this.NUM_Y2.Maximum = new decimal(new int[] {
            15,
            0,
            0,
            0});
            this.NUM_Y2.Name = "NUM_Y2";
            this.NUM_Y2.Size = new System.Drawing.Size(91, 20);
            this.NUM_Y2.TabIndex = 1;
            this.NUM_Y2.ValueChanged += new System.EventHandler(this.numericUpDown4_ValueChanged);
            // 
            // NUM_X2
            // 
            this.NUM_X2.Location = new System.Drawing.Point(30, 20);
            this.NUM_X2.Maximum = new decimal(new int[] {
            29,
            0,
            0,
            0});
            this.NUM_X2.Name = "NUM_X2";
            this.NUM_X2.Size = new System.Drawing.Size(91, 20);
            this.NUM_X2.TabIndex = 0;
            this.NUM_X2.ValueChanged += new System.EventHandler(this.numericUpDown3_ValueChanged);
            // 
            // lblFWModelType
            // 
            this.lblFWModelType.Location = new System.Drawing.Point(6, 13);
            this.lblFWModelType.Name = "lblFWModelType";
            this.lblFWModelType.Size = new System.Drawing.Size(329, 16);
            this.lblFWModelType.TabIndex = 14;
            this.lblFWModelType.Text = "Model Type found in OSD: Unknown";
            // 
            // lblModelType
            // 
            this.lblModelType.AutoSize = true;
            this.lblModelType.Location = new System.Drawing.Point(6, 16);
            this.lblModelType.Name = "lblModelType";
            this.lblModelType.Size = new System.Drawing.Size(112, 13);
            this.lblModelType.TabIndex = 13;
            this.lblModelType.Text = "Presented model type:";
            // 
            // cbxModelType
            // 
            this.cbxModelType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxModelType.FormattingEnabled = true;
            this.cbxModelType.Location = new System.Drawing.Point(123, 13);
            this.cbxModelType.Margin = new System.Windows.Forms.Padding(2);
            this.cbxModelType.Name = "cbxModelType";
            this.cbxModelType.Size = new System.Drawing.Size(126, 21);
            this.cbxModelType.TabIndex = 12;
            this.cbxModelType.SelectedIndexChanged += new System.EventHandler(this.cbxModelType_SelectedIndexChanged);
            // 
            // btnGeneratePanelsFile
            // 
            this.btnGeneratePanelsFile.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnGeneratePanelsFile.Location = new System.Drawing.Point(1, 508);
            this.btnGeneratePanelsFile.Name = "btnGeneratePanelsFile";
            this.btnGeneratePanelsFile.Size = new System.Drawing.Size(125, 23);
            this.btnGeneratePanelsFile.TabIndex = 15;
            this.btnGeneratePanelsFile.Text = "Generate Panels File";
            this.btnGeneratePanelsFile.UseVisualStyleBackColor = true;
            this.btnGeneratePanelsFile.Visible = false;
            this.btnGeneratePanelsFile.Click += new System.EventHandler(this.btnGeneratePanelsFile_Click);
            // 
            // lblPresentedCharset
            // 
            this.lblPresentedCharset.AutoSize = true;
            this.lblPresentedCharset.Location = new System.Drawing.Point(7, 40);
            this.lblPresentedCharset.Name = "lblPresentedCharset";
            this.lblPresentedCharset.Size = new System.Drawing.Size(97, 13);
            this.lblPresentedCharset.TabIndex = 6;
            this.lblPresentedCharset.Text = "Presented Charset:";
            this.lblPresentedCharset.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(266, 513);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(58, 13);
            this.label5.TabIndex = 16;
            this.label5.Text = "Serial Port:";
            // 
            // lblLatestCharsetUploaded
            // 
            this.lblLatestCharsetUploaded.Location = new System.Drawing.Point(6, 40);
            this.lblLatestCharsetUploaded.Name = "lblLatestCharsetUploaded";
            this.lblLatestCharsetUploaded.Size = new System.Drawing.Size(329, 13);
            this.lblLatestCharsetUploaded.TabIndex = 17;
            this.lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: Unknown";
            // 
            // groupBox11
            // 
            this.groupBox11.Controls.Add(this.lblModelType);
            this.groupBox11.Controls.Add(this.cbxModelType);
            this.groupBox11.Controls.Add(this.lblPresentedCharset);
            this.groupBox11.Location = new System.Drawing.Point(1, 26);
            this.groupBox11.Name = "groupBox11";
            this.groupBox11.Size = new System.Drawing.Size(334, 65);
            this.groupBox11.TabIndex = 18;
            this.groupBox11.TabStop = false;
            this.groupBox11.Text = "CT Tool Status:";
            // 
            // groupBox12
            // 
            this.groupBox12.Controls.Add(this.lblFWModelType);
            this.groupBox12.Controls.Add(this.lblLatestCharsetUploaded);
            this.groupBox12.Location = new System.Drawing.Point(341, 26);
            this.groupBox12.Name = "groupBox12";
            this.groupBox12.Size = new System.Drawing.Size(347, 65);
            this.groupBox12.TabIndex = 19;
            this.groupBox12.TabStop = false;
            this.groupBox12.Text = "OSD Status:";
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.cbxShowUpdateDialog);
            this.tabPage3.Controls.Add(this.cbxAutoUpdate);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(679, 381);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "CT Tool";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // cbxAutoUpdate
            // 
            this.cbxAutoUpdate.AutoSize = true;
            this.cbxAutoUpdate.Checked = true;
            this.cbxAutoUpdate.CheckState = System.Windows.Forms.CheckState.Checked;
            this.cbxAutoUpdate.Location = new System.Drawing.Point(7, 6);
            this.cbxAutoUpdate.Name = "cbxAutoUpdate";
            this.cbxAutoUpdate.Size = new System.Drawing.Size(160, 17);
            this.cbxAutoUpdate.TabIndex = 0;
            this.cbxAutoUpdate.Text = "Check for updates at startup";
            this.cbxAutoUpdate.UseVisualStyleBackColor = true;
            this.cbxAutoUpdate.CheckedChanged += new System.EventHandler(this.cbxAutoUpdate_CheckedChanged);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.pictureBox1.Location = new System.Drawing.Point(178, 17);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(497, 339);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseDown);
            this.pictureBox1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseMove);
            this.pictureBox1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseUp);
            // 
            // pictureBox2
            // 
            this.pictureBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pictureBox2.Location = new System.Drawing.Point(178, 17);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(497, 339);
            this.pictureBox2.TabIndex = 3;
            this.pictureBox2.TabStop = false;
            this.pictureBox2.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureBox2_MouseDown);
            this.pictureBox2.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureBox2_MouseMove);
            this.pictureBox2.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pictureBox2_MouseUp);
            // 
            // saveToFileToolStripMenuItem
            // 
            this.saveToFileToolStripMenuItem.Image = global::OSD.Properties.Resources.saveHS;
            this.saveToFileToolStripMenuItem.Name = "saveToFileToolStripMenuItem";
            this.saveToFileToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.S)));
            this.saveToFileToolStripMenuItem.Size = new System.Drawing.Size(206, 22);
            this.saveToFileToolStripMenuItem.Text = "Save OSD file...";
            this.saveToFileToolStripMenuItem.Click += new System.EventHandler(this.saveToFileToolStripMenuItem_Click);
            // 
            // loadFromFileToolStripMenuItem
            // 
            this.loadFromFileToolStripMenuItem.Image = global::OSD.Properties.Resources.openHS;
            this.loadFromFileToolStripMenuItem.Name = "loadFromFileToolStripMenuItem";
            this.loadFromFileToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.O)));
            this.loadFromFileToolStripMenuItem.Size = new System.Drawing.Size(206, 22);
            this.loadFromFileToolStripMenuItem.Text = "Open OSD File...";
            this.loadFromFileToolStripMenuItem.Click += new System.EventHandler(this.loadFromFileToolStripMenuItem_Click);
            // 
            // cbxShowUpdateDialog
            // 
            this.cbxShowUpdateDialog.AutoSize = true;
            this.cbxShowUpdateDialog.Checked = true;
            this.cbxShowUpdateDialog.CheckState = System.Windows.Forms.CheckState.Checked;
            this.cbxShowUpdateDialog.Location = new System.Drawing.Point(7, 29);
            this.cbxShowUpdateDialog.Name = "cbxShowUpdateDialog";
            this.cbxShowUpdateDialog.Size = new System.Drawing.Size(157, 17);
            this.cbxShowUpdateDialog.TabIndex = 1;
            this.cbxShowUpdateDialog.Text = "Prompt for update at startup";
            this.cbxShowUpdateDialog.UseVisualStyleBackColor = true;
            this.cbxShowUpdateDialog.CheckedChanged += new System.EventHandler(this.cbxShowUpdateDialog_CheckedChanged);
            // 
            // OSD
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(688, 558);
            this.Controls.Add(this.groupBox12);
            this.Controls.Add(this.groupBox11);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.btnGeneratePanelsFile);
            this.Controls.Add(this.PANEL_tabs);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.BUT_ReadOSD);
            this.Controls.Add(this.CMB_ComPort);
            this.Controls.Add(this.BUT_WriteOSD);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "OSD";
            this.Text = "MinimOSD-Extra Config Tool";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.OSD_FormClosed);
            this.Load += new System.EventHandler(this.OSD_Load);
            this.MouseUp += new System.Windows.Forms.MouseEventHandler(this.OSD_MouseUp);
            this.Resize += new System.EventHandler(this.OSD_Resize);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_Y)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.PANEL_tabs.ResumeLayout(false);
            this.tabPageConfig.ResumeLayout(false);
            this.groupBox10.ResumeLayout(false);
            this.groupBox10.PerformLayout();
            this.groupBox9.ResumeLayout(false);
            this.groupBox9.PerformLayout();
            this.groupBox8.ResumeLayout(false);
            this.groupBox8.PerformLayout();
            this.groupBox7.ResumeLayout(false);
            this.groupBox7.PerformLayout();
            this.groupBox6.ResumeLayout(false);
            this.groupBox6.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.OVERSPEED_numeric)).EndInit();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.BATT_WARNnumeric)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.MINVOLT_numeric)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.STALL_numeric)).EndInit();
            this.groupBoxRSSI.ResumeLayout(false);
            this.groupBoxRSSI.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_WARNnumeric)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_numeric_max)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_numeric_min)).EndInit();
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_Y2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X2)).EndInit();
            this.groupBox11.ResumeLayout(false);
            this.groupBox11.PerformLayout();
            this.groupBox12.ResumeLayout(false);
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.NumericUpDown NUM_Y;
        private System.Windows.Forms.NumericUpDown NUM_X;
        private System.Windows.Forms.Button BUT_WriteOSD;
        private System.Windows.Forms.ComboBox CMB_ComPort;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button BUT_ReadOSD;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripProgressBar toolStripProgressBar1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem videoModeToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem CHK_ntsc;
        private System.Windows.Forms.ToolStripMenuItem CHK_pal;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem saveToFileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem loadFromFileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem loadDefaultsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem optionsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem checkBox1;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem updateFirmwareToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem customBGPictureToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sendTLogToolStripMenuItem;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.ToolStripMenuItem updateFontToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.TabControl PANEL_tabs;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown NUM_Y2;
        private System.Windows.Forms.NumericUpDown NUM_X2;
        private System.Windows.Forms.TabPage tabPageConfig;
        private System.Windows.Forms.GroupBox groupBoxRSSI;
        private System.Windows.Forms.Label lblRSSIMax;
        private System.Windows.Forms.Label lblRSSIMin;
        private System.Windows.Forms.NumericUpDown RSSI_numeric_max;
        private System.Windows.Forms.NumericUpDown RSSI_numeric_min;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.NumericUpDown MINVOLT_numeric;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label STALL_label;
        private System.Windows.Forms.NumericUpDown STALL_numeric;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Label OVERSPEED_label;
        private System.Windows.Forms.NumericUpDown OVERSPEED_numeric;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.ComboBox UNITS_combo;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.GroupBox groupBox7;
        private System.Windows.Forms.ComboBox ONOFF_combo;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.CheckBox RSSI_RAW;
        private System.Windows.Forms.CheckBox TOGGLE_BEH;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.NumericUpDown RSSI_WARNnumeric;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.NumericUpDown BATT_WARNnumeric;
        private System.Windows.Forms.GroupBox groupBox8;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.MaskedTextBox CALLSIGNmaskedText;
        private System.Windows.Forms.GroupBox groupBox9;
        private System.Windows.Forms.ComboBox BRIGHTNESScomboBox;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gettingStartedToolStripMenuItem;
        private System.Windows.Forms.RadioButton rbtBatterymAh;
        private System.Windows.Forms.RadioButton rbtBatteryPercent;
        private System.Windows.Forms.RadioButton rbtSortCategory;
        private System.Windows.Forms.RadioButton rbtSortAlphabetic;
        private System.Windows.Forms.RadioButton rbtSortCategory2;
        private System.Windows.Forms.RadioButton rbtSortAlphabetic2;
        private System.Windows.Forms.TreeView LIST_items;
        private System.Windows.Forms.TreeView LIST_items2;
        private System.Windows.Forms.Label lblModelType;
        private System.Windows.Forms.ComboBox cbxModelType;
        private System.Windows.Forms.ComboBox cbxWarningsAutoPanelSwitch;
        private System.Windows.Forms.Label lblWarningsAutoPanelSwitch;
        private System.Windows.Forms.Label lblFWModelType;
        private System.Windows.Forms.CheckBox cbxAirSpeedSign;
        private System.Windows.Forms.GroupBox groupBox10;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.CheckBox cbxMslAltitudeSign;
        private System.Windows.Forms.CheckBox cbxHomeAltitudeSign;
        private System.Windows.Forms.CheckBox cbxGroundSpeedSign;
        private System.Windows.Forms.Button btnGeneratePanelsFile;
        private System.Windows.Forms.ToolStripMenuItem setSketchesPathToolStripMenuItem;
        private System.Windows.Forms.ComboBox cbxRSSIChannel;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.ToolStripMenuItem presentCustomCharsetToolStripMenuItem;
        private System.Windows.Forms.Label lblPresentedCharset;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label lblLatestCharsetUploaded;
        private System.Windows.Forms.GroupBox groupBox11;
        private System.Windows.Forms.GroupBox groupBox12;
        private System.Windows.Forms.ToolStripMenuItem updateCharsetDevToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem updateCharsetcustomFwToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem getFwFromOSDToolStripMenuItem;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.CheckBox cbxAutoUpdate;
        private System.Windows.Forms.CheckBox cbxShowUpdateDialog;
    }
}

