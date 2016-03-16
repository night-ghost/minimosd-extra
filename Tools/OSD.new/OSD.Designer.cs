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
            
            this.CMB_ComPort = new System.Windows.Forms.ComboBox();
            this.BUT_ReadOSD = new System.Windows.Forms.Button();
			this.BUT_WriteOSD = new System.Windows.Forms.Button();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripProgressBar1 = new System.Windows.Forms.ToolStripProgressBar();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.saveToFileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.loadFromFileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.loadDefaultsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.videoModeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.CHK_ntsc = new System.Windows.Forms.ToolStripMenuItem();
            this.CHK_pal = new System.Windows.Forms.ToolStripMenuItem();
			this.CHK_auto = new System.Windows.Forms.ToolStripMenuItem();
            this.optionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.checkBox1 = new System.Windows.Forms.ToolStripMenuItem();
			this.resetEepromToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cbOutPin = new System.Windows.Forms.ComboBox();
            this.cbOutSource = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox15 = new System.Windows.Forms.GroupBox();
            this.groupBox16 = new System.Windows.Forms.GroupBox();
            this.label24 = new System.Windows.Forms.Label();
            this.txtPitchNtsc = new System.Windows.Forms.TextBox();
            this.label25 = new System.Windows.Forms.Label();
            this.txtRollNtsc = new System.Windows.Forms.TextBox();
            this.label26 = new System.Windows.Forms.Label();
            this.label23 = new System.Windows.Forms.Label();
            this.txtPitchPal = new System.Windows.Forms.TextBox();
            this.label22 = new System.Windows.Forms.Label();
            this.txtRollPal = new System.Windows.Forms.TextBox();
            this.label21 = new System.Windows.Forms.Label();
            this.chkILS = new System.Windows.Forms.CheckBox();
            this.chkRadar = new System.Windows.Forms.CheckBox();
            this.groupBox13 = new System.Windows.Forms.GroupBox();
            this.txtBattB_k = new System.Windows.Forms.TextBox();
            this.label28 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.numMinVoltB = new System.Windows.Forms.NumericUpDown();
            this.groupBox9 = new System.Windows.Forms.GroupBox();
            this.cbNscreens = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.numHOS = new System.Windows.Forms.NumericUpDown();
            this.numVOS = new System.Windows.Forms.NumericUpDown();
            this.label31 = new System.Windows.Forms.Label();
            this.label30 = new System.Windows.Forms.Label();
            this.label29 = new System.Windows.Forms.Label();
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
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.txtBattA_k = new System.Windows.Forms.TextBox();
            this.label27 = new System.Windows.Forms.Label();
            this.groupBox14 = new System.Windows.Forms.GroupBox();
            this.txtCurr_k = new System.Windows.Forms.TextBox();
            this.label19 = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.cbCurrentSoure = new System.Windows.Forms.ComboBox();
            this.label17 = new System.Windows.Forms.Label();
            this.cbBattA_source = new System.Windows.Forms.ComboBox();			
            this.rbtBatterymAh = new System.Windows.Forms.RadioButton();
            this.rbtBatteryPercent = new System.Windows.Forms.RadioButton();
            this.label9 = new System.Windows.Forms.Label();
            this.BATT_WARNnumeric = new System.Windows.Forms.NumericUpDown();
            this.label7 = new System.Windows.Forms.Label();
            this.MINVOLT_numeric = new System.Windows.Forms.NumericUpDown();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.OVERSPEED_label = new System.Windows.Forms.Label();
            this.OVERSPEED_numeric = new System.Windows.Forms.NumericUpDown();
            this.STALL_label = new System.Windows.Forms.Label();
            this.STALL_numeric = new System.Windows.Forms.NumericUpDown();
            this.groupBoxRSSI = new System.Windows.Forms.GroupBox();
            this.txtRSSI_k = new System.Windows.Forms.TextBox();
            this.label20 = new System.Windows.Forms.Label();
            this.cbxRSSIChannel = new System.Windows.Forms.ComboBox();
            this.label15 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.RSSI_WARNnumeric = new System.Windows.Forms.NumericUpDown();
            this.RSSI_RAW = new System.Windows.Forms.CheckBox();
            this.lblRSSIMax = new System.Windows.Forms.Label();
            this.lblRSSIMin = new System.Windows.Forms.Label();
            this.RSSI_numeric_max = new System.Windows.Forms.NumericUpDown();
            this.RSSI_numeric_min = new System.Windows.Forms.NumericUpDown();
            this.grpTLog = new System.Windows.Forms.GroupBox();
            this.lblTLog = new System.Windows.Forms.Label();
            this.btnTLog = new System.Windows.Forms.Button();
            this.label14 = new System.Windows.Forms.Label();
            this.lblFWModelType = new System.Windows.Forms.Label();
            this.lblModelType = new System.Windows.Forms.Label();
            this.cbxModelType = new System.Windows.Forms.ComboBox();
            
            this.lblPresentedCharset = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.lblLatestCharsetUploaded = new System.Windows.Forms.Label();
            this.groupBox11 = new System.Windows.Forms.GroupBox();
            this.groupBox12 = new System.Windows.Forms.GroupBox();
            this.cbxAutoUpdate = new System.Windows.Forms.CheckBox();
            this.cbxShowUpdateDialog = new System.Windows.Forms.CheckBox();
            this.chkHUD = new System.Windows.Forms.CheckBox();
            this.chkTrack = new System.Windows.Forms.CheckBox();
            this.statusStrip1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.PANEL_tabs.SuspendLayout();
            this.tabPageConfig.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox15.SuspendLayout();
            this.groupBox16.SuspendLayout();
            this.groupBox13.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numMinVoltB)).BeginInit();
            this.groupBox9.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numHOS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numVOS)).BeginInit();
            this.groupBox8.SuspendLayout();
            this.groupBox7.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox14.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.BATT_WARNnumeric)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.MINVOLT_numeric)).BeginInit();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.OVERSPEED_numeric)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.STALL_numeric)).BeginInit();
            this.groupBoxRSSI.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_WARNnumeric)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_numeric_max)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_numeric_min)).BeginInit();
            this.grpTLog.SuspendLayout();
            this.groupBox11.SuspendLayout();
            this.groupBox12.SuspendLayout();
            this.SuspendLayout();
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
            this.CHK_pal,
            this.CHK_auto});
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
            // CHK_auto
            // 
            this.CHK_auto.Name = "CHK_auto";
            this.CHK_auto.Size = new System.Drawing.Size(111, 22);
            this.CHK_auto.Text = "Auto";			
            this.CHK_auto.CheckStateChanged += new System.EventHandler(this.AUTOToolStripMenuItem_CheckStateChanged);
            this.CHK_auto.Click += new System.EventHandler(this.CHK_auto_Click);
            // 
            // optionsToolStripMenuItem
            // 
            this.optionsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            	this.checkBox1,
				this.resetEepromToolStripMenuItem,
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
            // resetEepromToolStripMenuItem
            // 
            this.resetEepromToolStripMenuItem.Name = "resetEepromToolStripMenuItem";
            this.resetEepromToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.resetEepromToolStripMenuItem.Text = "Reset EEPROM";
            this.resetEepromToolStripMenuItem.ToolTipText = "Initialize EEPROM with default values";
            this.resetEepromToolStripMenuItem.Click += new System.EventHandler(this.BUT_ResetOSD_EEPROM_click);
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
            this.sendTLogToolStripMenuItem.Text = "Load TLog.";
            this.sendTLogToolStripMenuItem.ToolTipText = "Load a Mavlink transmission log to play into the OSD to test the layout";
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
			for(int k=0;k<npanel;k++){
            	this.PANEL_tabs.Controls.Add(this.scr[k].tabPage);
			}
            //this.PANEL_tabs.Controls.Add(this.tabPage2);
            //this.PANEL_tabs.Controls.Add(this.tabPage3);
            this.PANEL_tabs.Location = new System.Drawing.Point(1, 96);
            this.PANEL_tabs.Margin = new System.Windows.Forms.Padding(2);
            this.PANEL_tabs.Name = "PANEL_tabs";
            this.PANEL_tabs.SelectedIndex = 0;
            this.PANEL_tabs.Size = new System.Drawing.Size(687, 407);
            this.PANEL_tabs.TabIndex = 0;
			this.PANEL_tabs.Selected += new System.Windows.Forms.TabControlEventHandler(this.PANEL_tabs_Selected);
            
            // 
            // tabPageConfig
            // 
            this.tabPageConfig.Controls.Add(this.groupBox1);
            this.tabPageConfig.Controls.Add(this.groupBox15);
            this.tabPageConfig.Controls.Add(this.groupBox13);
            this.tabPageConfig.Controls.Add(this.groupBox9);
            this.tabPageConfig.Controls.Add(this.groupBox8);
            this.tabPageConfig.Controls.Add(this.groupBox7);
            this.tabPageConfig.Controls.Add(this.groupBox6);
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
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.cbOutPin);
            this.groupBox1.Controls.Add(this.cbOutSource);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(328, 306);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(156, 65);
            this.groupBox1.TabIndex = 13;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Output";
            // 
            // cbOutPin
            // 
            this.cbOutPin.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbOutPin.FormattingEnabled = true;
            this.cbOutPin.Items.AddRange(new object[] {
			"none",
            "V_Bat1",
            "V_Bat2",
            "Current",
            "RSSI"});
            this.cbOutPin.Location = new System.Drawing.Point(53, 36);
            this.cbOutPin.Name = "cbOutPin";
            this.cbOutPin.Size = new System.Drawing.Size(98, 21);
            this.cbOutPin.TabIndex = 3;
            this.cbOutPin.SelectedIndexChanged += new System.EventHandler(this.cbOutPin_SelectedIndexChanged);
            // 
            // cbOutSource
            // 
            this.cbOutSource.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbOutSource.FormattingEnabled = true;
            this.cbOutSource.Items.AddRange(new object[] {
            "none",
            "Channel 6",
            "Channel 7",
            "Channel 8"});
            this.cbOutSource.Location = new System.Drawing.Point(53, 11);
            this.cbOutSource.Name = "cbOutSource";
            this.cbOutSource.Size = new System.Drawing.Size(99, 21);
            this.cbOutSource.TabIndex = 2;
            this.cbOutSource.SelectedIndexChanged += new System.EventHandler(this.cbOutSource_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(8, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(22, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Pin";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Source";
            // 
            // groupBox15
            // 
            this.groupBox15.Controls.Add(this.chkTrack);
            this.groupBox15.Controls.Add(this.chkHUD);
            this.groupBox15.Controls.Add(this.groupBox16);
            this.groupBox15.Controls.Add(this.chkILS);
            this.groupBox15.Controls.Add(this.chkRadar);
            this.groupBox15.Location = new System.Drawing.Point(490, 123);
            this.groupBox15.Name = "groupBox15";
            this.groupBox15.Size = new System.Drawing.Size(181, 249);
            this.groupBox15.TabIndex = 12;
            this.groupBox15.TabStop = false;
            this.groupBox15.Text = "Horizon";
            // 
            // groupBox16
            // 
            this.groupBox16.Controls.Add(this.label24);
            this.groupBox16.Controls.Add(this.txtPitchNtsc);
            this.groupBox16.Controls.Add(this.label25);
            this.groupBox16.Controls.Add(this.txtRollNtsc);
            this.groupBox16.Controls.Add(this.label26);
            this.groupBox16.Controls.Add(this.label23);
            this.groupBox16.Controls.Add(this.txtPitchPal);
            this.groupBox16.Controls.Add(this.label22);
            this.groupBox16.Controls.Add(this.txtRollPal);
            this.groupBox16.Controls.Add(this.label21);
            this.groupBox16.Location = new System.Drawing.Point(11, 99);
            this.groupBox16.Name = "groupBox16";
            this.groupBox16.Size = new System.Drawing.Size(161, 144);
            this.groupBox16.TabIndex = 2;
            this.groupBox16.TabStop = false;
            this.groupBox16.Text = "Angle adjust";
            // 
            // label24
            // 
            this.label24.AutoSize = true;
            this.label24.Location = new System.Drawing.Point(9, 81);
            this.label24.Name = "label24";
            this.label24.Size = new System.Drawing.Size(65, 13);
            this.label24.TabIndex = 31;
            this.label24.Text = "NTSC mode";
            // 
            // txtPitchNtsc
            // 
            this.txtPitchNtsc.Location = new System.Drawing.Point(96, 118);
            this.txtPitchNtsc.Name = "txtPitchNtsc";
            this.txtPitchNtsc.Size = new System.Drawing.Size(59, 20);
            this.txtPitchNtsc.TabIndex = 30;
            this.txtPitchNtsc.Text = "1";
            this.txtPitchNtsc.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtPitchNtsc.TextChanged += new System.EventHandler(this.txtPitchNtsc_TextChanged);
            // 
            // label25
            // 
            this.label25.AutoSize = true;
            this.label25.Location = new System.Drawing.Point(59, 121);
            this.label25.Name = "label25";
            this.label25.Size = new System.Drawing.Size(31, 13);
            this.label25.TabIndex = 29;
            this.label25.Text = "Pitch";
            // 
            // txtRollNtsc
            // 
            this.txtRollNtsc.Location = new System.Drawing.Point(96, 96);
            this.txtRollNtsc.Name = "txtRollNtsc";
            this.txtRollNtsc.Size = new System.Drawing.Size(59, 20);
            this.txtRollNtsc.TabIndex = 28;
            this.txtRollNtsc.Text = "1";
            this.txtRollNtsc.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtRollNtsc.TextChanged += new System.EventHandler(this.txtRollNtsc_TextChanged);
            // 
            // label26
            // 
            this.label26.AutoSize = true;
            this.label26.Location = new System.Drawing.Point(59, 99);
            this.label26.Name = "label26";
            this.label26.Size = new System.Drawing.Size(25, 13);
            this.label26.TabIndex = 27;
            this.label26.Text = "Roll";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Location = new System.Drawing.Point(9, 19);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(56, 13);
            this.label23.TabIndex = 26;
            this.label23.Text = "PAL mode";
            // 
            // txtPitchPal
            // 
            this.txtPitchPal.Location = new System.Drawing.Point(96, 55);
            this.txtPitchPal.Name = "txtPitchPal";
            this.txtPitchPal.Size = new System.Drawing.Size(59, 20);
            this.txtPitchPal.TabIndex = 25;
            this.txtPitchPal.Text = "1";
            this.txtPitchPal.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtPitchPal.TextChanged += new System.EventHandler(this.txtPitchPal_TextChanged);
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Location = new System.Drawing.Point(59, 58);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(31, 13);
            this.label22.TabIndex = 24;
            this.label22.Text = "Pitch";
            // 
            // txtRollPal
            // 
            this.txtRollPal.Location = new System.Drawing.Point(96, 33);
            this.txtRollPal.Name = "txtRollPal";
            this.txtRollPal.Size = new System.Drawing.Size(59, 20);
            this.txtRollPal.TabIndex = 23;
            this.txtRollPal.Text = "1";
            this.txtRollPal.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtRollPal.TextChanged += new System.EventHandler(this.txtRollPal_TextChanged);
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Location = new System.Drawing.Point(59, 36);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(25, 13);
            this.label21.TabIndex = 22;
            this.label21.Text = "Roll";
            // 
            // chkILS
            // 
            this.chkILS.AutoSize = true;
            this.chkILS.Location = new System.Drawing.Point(9, 42);
            this.chkILS.Name = "chkILS";
            this.chkILS.Size = new System.Drawing.Size(70, 17);
            this.chkILS.TabIndex = 1;
            this.chkILS.Text = "show ILS";
            this.chkILS.UseVisualStyleBackColor = true;
            this.chkILS.CheckedChanged += new System.EventHandler(this.chkILS_CheckedChanged);
            // 
            // chkRadar
            // 
            this.chkRadar.AutoSize = true;
            this.chkRadar.Location = new System.Drawing.Point(9, 22);
            this.chkRadar.Name = "chkRadar";
            this.chkRadar.Size = new System.Drawing.Size(83, 17);
            this.chkRadar.TabIndex = 0;
            this.chkRadar.Text = "show Radar";
            this.chkRadar.UseVisualStyleBackColor = true;
            this.chkRadar.CheckedChanged += new System.EventHandler(this.chkRadar_CheckedChanged);
            // 
            // groupBox13
            // 
            this.groupBox13.Controls.Add(this.txtBattB_k);
            this.groupBox13.Controls.Add(this.label28);
            this.groupBox13.Controls.Add(this.label16);
            this.groupBox13.Controls.Add(this.label6);
            this.groupBox13.Controls.Add(this.numMinVoltB);
            this.groupBox13.Location = new System.Drawing.Point(490, 5);
            this.groupBox13.Name = "groupBox13";
            this.groupBox13.Size = new System.Drawing.Size(181, 112);
            this.groupBox13.TabIndex = 11;
            this.groupBox13.TabStop = false;
            this.groupBox13.Text = "Battery B";
            // 
            // txtBattB_k
            // 
            this.txtBattB_k.Location = new System.Drawing.Point(123, 85);
            this.txtBattB_k.Name = "txtBattB_k";
            this.txtBattB_k.Size = new System.Drawing.Size(49, 20);
            this.txtBattB_k.TabIndex = 23;
            this.txtBattB_k.Text = "1";
            this.txtBattB_k.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtBattB_k.TextChanged += new System.EventHandler(this.txtBattB_k_TextChanged);
            // 
            // label28
            // 
            this.label28.AutoSize = true;
            this.label28.Location = new System.Drawing.Point(35, 90);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(82, 13);
            this.label28.TabIndex = 22;
            this.label28.Text = "Adjust pin value";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(8, 20);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(81, 13);
            this.label16.TabIndex = 5;
            this.label16.Text = "Input: Pin BattB";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(6, 44);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(118, 13);
            this.label6.TabIndex = 4;
            this.label6.Text = "Min. Battery Voltage (V)";
            // 
            // numMinVoltB
            // 
            this.numMinVoltB.DecimalPlaces = 1;
            this.numMinVoltB.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.numMinVoltB.Location = new System.Drawing.Point(8, 61);
            this.numMinVoltB.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            65536});
            this.numMinVoltB.Name = "numMinVoltB";
            this.numMinVoltB.Size = new System.Drawing.Size(91, 20);
            this.numMinVoltB.TabIndex = 3;
            this.numMinVoltB.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.numMinVoltB.ValueChanged += new System.EventHandler(this.numMinVoltB_ValueChanged);
            // 
            // groupBox9
            // 
            this.groupBox9.Controls.Add(this.cbNscreens);
            this.groupBox9.Controls.Add(this.label3);
			this.groupBox9.Controls.Add(this.numHOS);
            this.groupBox9.Controls.Add(this.numVOS);
            this.groupBox9.Controls.Add(this.label31);
            this.groupBox9.Controls.Add(this.label30);
            this.groupBox9.Controls.Add(this.label29);
            this.groupBox9.Controls.Add(this.BRIGHTNESScomboBox);
            this.groupBox9.Controls.Add(this.label13);
            this.groupBox9.Location = new System.Drawing.Point(169, 238);
            this.groupBox9.Name = "groupBox9";
            this.groupBox9.Size = new System.Drawing.Size(150, 138);
            this.groupBox9.TabIndex = 10;
            this.groupBox9.TabStop = false;
            this.groupBox9.Text = "Screen";
            // 
            // cbNscreens
            // 
            this.cbNscreens.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbNscreens.FormattingEnabled = true;
            this.cbNscreens.Items.AddRange(new object[] {
            "1",
            "2",
            "3",
            "4"});
            this.cbNscreens.Location = new System.Drawing.Point(85, 109);
            this.cbNscreens.Name = "cbNscreens";
            this.cbNscreens.Size = new System.Drawing.Size(56, 21);
            this.cbNscreens.TabIndex = 10;
            this.cbNscreens.SelectedIndexChanged += new System.EventHandler(this.cbNscreens_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(5, 112);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(77, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Screens Count";
			// 
			// numHOS
            // 
            this.numHOS.Location = new System.Drawing.Point(83, 69);
            this.numHOS.Maximum = new decimal(new int[] {
            31,
            0,
            0,
            0});
            this.numHOS.Minimum = new decimal(new int[] {
            31,
            0,
            0,
            -2147483648});
            this.numHOS.Name = "numHOS";
            this.numHOS.Size = new System.Drawing.Size(58, 20);
            this.numHOS.TabIndex = 8;
            this.numHOS.ValueChanged += new System.EventHandler(this.numHOS_ValueChanged);
            // 
            // numVOS
            // 
            this.numVOS.Location = new System.Drawing.Point(82, 48);
            this.numVOS.Maximum = new decimal(new int[] {
            15,
            0,
            0,
            0});
            this.numVOS.Minimum = new decimal(new int[] {
            15,
            0,
            0,
            -2147483648});
            this.numVOS.Name = "numVOS";
            this.numVOS.Size = new System.Drawing.Size(59, 20);
            this.numVOS.TabIndex = 7;
           this.numVOS.ValueChanged += new System.EventHandler(this.numVOS_ValueChanged);
			//
            // label31
            //
            this.label31.AutoSize = true;
            this.label31.Location = new System.Drawing.Point(51, 72);
            this.label31.Name = "label31";
            this.label31.Size = new System.Drawing.Size(25, 13);
            this.label31.TabIndex = 6;
            this.label31.Text = "Left";
            //
            // label30
            //
            this.label30.AutoSize = true;
            this.label30.Location = new System.Drawing.Point(50, 50);
            this.label30.Name = "label30";
            this.label30.Size = new System.Drawing.Size(26, 13);
            this.label30.TabIndex = 5;
            this.label30.Text = "Top";
            // 
            // label29
            // 
            this.label29.AutoSize = true;
            this.label29.Location = new System.Drawing.Point(5, 48);
            this.label29.Name = "label29";
            this.label29.Size = new System.Drawing.Size(40, 13);
            this.label29.TabIndex = 4;
            this.label29.Text = "Offsets";
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
            this.BRIGHTNESScomboBox.Location = new System.Drawing.Point(66, 14);
            this.BRIGHTNESScomboBox.Margin = new System.Windows.Forms.Padding(2);
            this.BRIGHTNESScomboBox.Name = "BRIGHTNESScomboBox";
            this.BRIGHTNESScomboBox.Size = new System.Drawing.Size(75, 21);
            this.BRIGHTNESScomboBox.TabIndex = 3;
            this.BRIGHTNESScomboBox.SelectedIndexChanged += new System.EventHandler(this.BRIGHTNESScomboBox_SelectedIndexChanged);
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(5, 18);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(56, 13);
            this.label13.TabIndex = 2;
            this.label13.Text = "Brightness";
            // 
            // groupBox8
            // 
            this.groupBox8.Controls.Add(this.CALLSIGNmaskedText);
            this.groupBox8.Controls.Add(this.label12);
            this.groupBox8.Location = new System.Drawing.Point(169, 108);
            this.groupBox8.Name = "groupBox8";
            this.groupBox8.Size = new System.Drawing.Size(150, 60);
            this.groupBox8.TabIndex = 9;
            this.groupBox8.TabStop = false;
            // 
            // CALLSIGNmaskedText
            // 
            this.CALLSIGNmaskedText.AllowPromptAsInput = false;
            this.CALLSIGNmaskedText.AsciiOnly = true;
            this.CALLSIGNmaskedText.BeepOnError = true;
            this.CALLSIGNmaskedText.Location = new System.Drawing.Point(35, 26);
            this.CALLSIGNmaskedText.Margin = new System.Windows.Forms.Padding(2);
            this.CALLSIGNmaskedText.Mask = "CCCCCCCC";
            this.CALLSIGNmaskedText.Name = "CALLSIGNmaskedText";
            this.CALLSIGNmaskedText.Size = new System.Drawing.Size(102, 20);
            this.CALLSIGNmaskedText.TabIndex = 11;
          
            this.CALLSIGNmaskedText.Validating += new System.ComponentModel.CancelEventHandler(this.CALLSIGNmaskedText_Validating);
            this.CALLSIGNmaskedText.Validated += new System.EventHandler(this.CALLSIGNmaskedText_Validated);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(7, 11);
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
            this.groupBox7.Location = new System.Drawing.Point(8, 232);
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
	            "Ch 8",
            "External PWM"});
            this.ONOFF_combo.Location = new System.Drawing.Point(7, 90);
            this.ONOFF_combo.Margin = new System.Windows.Forms.Padding(2);
            this.ONOFF_combo.Name = "ONOFF_combo";
            this.ONOFF_combo.Size = new System.Drawing.Size(120, 21);
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
            this.groupBox6.Location = new System.Drawing.Point(169, 169);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(150, 57);
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
            this.UNITS_combo.Location = new System.Drawing.Point(35, 29);
            this.UNITS_combo.Margin = new System.Windows.Forms.Padding(2);
            this.UNITS_combo.Name = "UNITS_combo";
            this.UNITS_combo.Size = new System.Drawing.Size(102, 21);
            this.UNITS_combo.TabIndex = 3;
            this.UNITS_combo.SelectedIndexChanged += new System.EventHandler(this.UNITS_combo_SelectedIndexChanged);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(8, 13);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(31, 13);
            this.label10.TabIndex = 2;
            this.label10.Text = "Units";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.txtBattA_k);
            this.groupBox4.Controls.Add(this.label27);
            this.groupBox4.Controls.Add(this.groupBox14);
            this.groupBox4.Controls.Add(this.label17);
            this.groupBox4.Controls.Add(this.cbBattA_source);
            this.groupBox4.Controls.Add(this.rbtBatterymAh);
            this.groupBox4.Controls.Add(this.rbtBatteryPercent);
            this.groupBox4.Controls.Add(this.label9);
            this.groupBox4.Controls.Add(this.BATT_WARNnumeric);
            this.groupBox4.Controls.Add(this.label7);
            this.groupBox4.Controls.Add(this.MINVOLT_numeric);
            this.groupBox4.Location = new System.Drawing.Point(325, 5);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(160, 291);
            this.groupBox4.TabIndex = 5;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Battery A";
            // 
            // txtBattA_k
            // 
            this.txtBattA_k.Location = new System.Drawing.Point(100, 176);
            this.txtBattA_k.Name = "txtBattA_k";
            this.txtBattA_k.Size = new System.Drawing.Size(49, 20);
            this.txtBattA_k.TabIndex = 23;
            this.txtBattA_k.Text = "1";
            this.txtBattA_k.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtBattA_k.TextChanged += new System.EventHandler(this.txtBattA_k_TextChanged);
            // 
            // label27
            // 
            this.label27.AutoSize = true;
            this.label27.Location = new System.Drawing.Point(9, 179);
            this.label27.Name = "label27";
            this.label27.Size = new System.Drawing.Size(82, 13);
            this.label27.TabIndex = 22;
            this.label27.Text = "Adjust pin value";
            // 
            // groupBox14
            // 
            this.groupBox14.Controls.Add(this.txtCurr_k);
            this.groupBox14.Controls.Add(this.label19);
            this.groupBox14.Controls.Add(this.label18);
            this.groupBox14.Controls.Add(this.cbCurrentSoure);
            this.groupBox14.Location = new System.Drawing.Point(0, 207);
            this.groupBox14.Name = "groupBox14";
            this.groupBox14.Size = new System.Drawing.Size(159, 83);
            this.groupBox14.TabIndex = 18;
            this.groupBox14.TabStop = false;
            this.groupBox14.Text = "Current";
            // 
            // txtCurr_k
            // 
            this.txtCurr_k.Location = new System.Drawing.Point(100, 52);
            this.txtCurr_k.Name = "txtCurr_k";
            this.txtCurr_k.Size = new System.Drawing.Size(49, 20);
            this.txtCurr_k.TabIndex = 21;
            this.txtCurr_k.Text = "1";
            this.txtCurr_k.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtCurr_k.TextChanged += new System.EventHandler(this.txtCurr_k_TextChanged);
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Location = new System.Drawing.Point(9, 55);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(82, 13);
            this.label19.TabIndex = 20;
            this.label19.Text = "Adjust pin value";
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(7, 27);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(34, 13);
            this.label18.TabIndex = 19;
            this.label18.Text = "Input:";
            // 
            // cbCurrentSoure
            // 
            this.cbCurrentSoure.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbCurrentSoure.FormattingEnabled = true;
            this.cbCurrentSoure.Items.AddRange(new object[] {
            "Mavlink",
            "Pin Current"});
            this.cbCurrentSoure.Location = new System.Drawing.Point(51, 22);
            this.cbCurrentSoure.Name = "cbCurrentSoure";
            this.cbCurrentSoure.Size = new System.Drawing.Size(98, 21);
            this.cbCurrentSoure.TabIndex = 18;
            this.cbCurrentSoure.SelectedIndexChanged += new System.EventHandler(this.cbCurrentSoure_SelectedIndexChanged);
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(7, 21);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(34, 13);
            this.label17.TabIndex = 17;
            this.label17.Text = "Input:";
            // 
            // cbBattA_source
            // 
            this.cbBattA_source.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbBattA_source.FormattingEnabled = true;
            this.cbBattA_source.Items.AddRange(new object[] {
            "Mavlink Voltage",
            "Pin BattA"});
            this.cbBattA_source.Location = new System.Drawing.Point(51, 16);
            this.cbBattA_source.Name = "cbBattA_source";
            this.cbBattA_source.Size = new System.Drawing.Size(98, 21);
            this.cbBattA_source.TabIndex = 16;
            this.cbBattA_source.SelectedIndexChanged += new System.EventHandler(this.cbBattA_source_SelectedIndexChanged);
            // 
            // rbtBatterymAh
            // 
            this.rbtBatterymAh.AutoSize = true;
            this.rbtBatterymAh.Location = new System.Drawing.Point(6, 144);
            this.rbtBatterymAh.Name = "rbtBatterymAh";
            this.rbtBatterymAh.Size = new System.Drawing.Size(102, 17);
            this.rbtBatterymAh.TabIndex = 15;
            this.rbtBatterymAh.Text = "Show used mAh";
            this.rbtBatterymAh.UseVisualStyleBackColor = true;
            this.rbtBatterymAh.CheckedChanged += new System.EventHandler(this.rbtBatterymAh_CheckedChanged);
            // 
            // rbtBatteryPercent
            // 
            this.rbtBatteryPercent.AutoSize = true;
            this.rbtBatteryPercent.Checked = true;
            this.rbtBatteryPercent.Location = new System.Drawing.Point(6, 129);
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
            this.label9.Location = new System.Drawing.Point(4, 85);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(146, 13);
            this.label9.TabIndex = 13;
            this.label9.Text = "Bat. Remain. Warn. Level (%)";
            // 
            // BATT_WARNnumeric
            // 
            this.BATT_WARNnumeric.Location = new System.Drawing.Point(58, 101);
            this.BATT_WARNnumeric.Name = "BATT_WARNnumeric";
            this.BATT_WARNnumeric.Size = new System.Drawing.Size(91, 20);
            this.BATT_WARNnumeric.TabIndex = 12;
            this.BATT_WARNnumeric.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.BATT_WARNnumeric.ValueChanged += new System.EventHandler(this.BATT_WARNnumeric_ValueChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(5, 45);
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
            this.MINVOLT_numeric.Location = new System.Drawing.Point(58, 61);
            this.MINVOLT_numeric.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            65536});
            this.MINVOLT_numeric.Name = "MINVOLT_numeric";
            this.MINVOLT_numeric.Size = new System.Drawing.Size(91, 20);
            this.MINVOLT_numeric.TabIndex = 0;
            this.MINVOLT_numeric.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.MINVOLT_numeric.ValueChanged += new System.EventHandler(this.MINVOLT_numeric_ValueChanged);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.OVERSPEED_label);
            this.groupBox3.Controls.Add(this.OVERSPEED_numeric);
            this.groupBox3.Controls.Add(this.STALL_label);
            this.groupBox3.Controls.Add(this.STALL_numeric);
            this.groupBox3.Location = new System.Drawing.Point(169, 5);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(150, 103);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            // 
            // OVERSPEED_label
            // 
            this.OVERSPEED_label.AutoSize = true;
            this.OVERSPEED_label.Location = new System.Drawing.Point(9, 57);
            this.OVERSPEED_label.Name = "OVERSPEED_label";
            this.OVERSPEED_label.Size = new System.Drawing.Size(93, 13);
            this.OVERSPEED_label.TabIndex = 4;
            this.OVERSPEED_label.Text = "Overspeed (km/h)";
            // 
            // OVERSPEED_numeric
            // 
            this.OVERSPEED_numeric.Location = new System.Drawing.Point(38, 74);
            this.OVERSPEED_numeric.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.OVERSPEED_numeric.Name = "OVERSPEED_numeric";
            this.OVERSPEED_numeric.Size = new System.Drawing.Size(99, 20);
            this.OVERSPEED_numeric.TabIndex = 3;
            this.OVERSPEED_numeric.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.OVERSPEED_numeric.ValueChanged += new System.EventHandler(this.OVERSPEED_numeric_ValueChanged);
            // 
            // STALL_label
            // 
            this.STALL_label.AutoSize = true;
            this.STALL_label.Location = new System.Drawing.Point(7, 12);
            this.STALL_label.Name = "STALL_label";
            this.STALL_label.Size = new System.Drawing.Size(95, 13);
            this.STALL_label.TabIndex = 2;
            this.STALL_label.Text = "Stall Speed (km/h)";
            // 
            // STALL_numeric
            // 
            this.STALL_numeric.Location = new System.Drawing.Point(36, 28);
            this.STALL_numeric.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.STALL_numeric.Name = "STALL_numeric";
            this.STALL_numeric.Size = new System.Drawing.Size(91, 20);
            this.STALL_numeric.TabIndex = 0;
            this.STALL_numeric.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.STALL_numeric.ValueChanged += new System.EventHandler(this.STALL_numeric_ValueChanged);
            // 
            // groupBoxRSSI
            // 
            this.groupBoxRSSI.Controls.Add(this.txtRSSI_k);
            this.groupBoxRSSI.Controls.Add(this.label20);
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
            this.groupBoxRSSI.Size = new System.Drawing.Size(150, 221);
            this.groupBoxRSSI.TabIndex = 3;
            this.groupBoxRSSI.TabStop = false;
            // 
            // txtRSSI_k
            //
            this.txtRSSI_k.Location = new System.Drawing.Point(97, 194);
            this.txtRSSI_k.Name = "txtRSSI_k";
            this.txtRSSI_k.Size = new System.Drawing.Size(47, 20);
            this.txtRSSI_k.TabIndex = 23;
            this.txtRSSI_k.Text = "1";
            this.txtRSSI_k.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtRSSI_k.TextChanged += new System.EventHandler(this.txtRSSI_k_TextChanged);
            //
            // label20
            //
            this.label20.AutoSize = true;
            this.label20.Location = new System.Drawing.Point(9, 197);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(82, 13);
            this.label20.TabIndex = 22;
            this.label20.Text = "Adjust pin value";
            // 
            // cbxRSSIChannel
            // 
            this.cbxRSSIChannel.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxRSSIChannel.FormattingEnabled = true;
            this.cbxRSSIChannel.Items.AddRange(new object[] {
            "Mavlink RSSI",
            "Channel 8",
            "Pin RSSI analog",
            "Pin RSSI PWM"});
            this.cbxRSSIChannel.Location = new System.Drawing.Point(9, 27);
            this.cbxRSSIChannel.Margin = new System.Windows.Forms.Padding(2);
            this.cbxRSSIChannel.Name = "cbxRSSIChannel";
            this.cbxRSSIChannel.Size = new System.Drawing.Size(118, 21);
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
            this.label8.Location = new System.Drawing.Point(5, 131);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(121, 13);
            this.label8.TabIndex = 11;
            this.label8.Text = "RSSI Warning Level (%)";
            // 
            // RSSI_WARNnumeric
            // 
            this.RSSI_WARNnumeric.Location = new System.Drawing.Point(8, 147);
            this.RSSI_WARNnumeric.Name = "RSSI_WARNnumeric";
            this.RSSI_WARNnumeric.Size = new System.Drawing.Size(91, 20);
            this.RSSI_WARNnumeric.TabIndex = 10;
            this.RSSI_WARNnumeric.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.RSSI_WARNnumeric.ValueChanged += new System.EventHandler(this.RSSI_WARNnumeric_ValueChanged);
            // 
            // RSSI_RAW
            // 
            this.RSSI_RAW.AutoSize = true;
            this.RSSI_RAW.Location = new System.Drawing.Point(8, 172);
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
            this.lblRSSIMax.Location = new System.Drawing.Point(5, 90);
            this.lblRSSIMax.Name = "lblRSSIMax";
            this.lblRSSIMax.Size = new System.Drawing.Size(85, 13);
            this.lblRSSIMax.TabIndex = 3;
            this.lblRSSIMax.Text = "RSSI Max Value";
            // 
            // lblRSSIMin
            // 
            this.lblRSSIMin.AutoSize = true;
            this.lblRSSIMin.Location = new System.Drawing.Point(5, 51);
            this.lblRSSIMin.Name = "lblRSSIMin";
            this.lblRSSIMin.Size = new System.Drawing.Size(82, 13);
            this.lblRSSIMin.TabIndex = 2;
            this.lblRSSIMin.Text = "RSSI Min Value";
            // 
            // RSSI_numeric_max
            // 
            this.RSSI_numeric_max.Location = new System.Drawing.Point(8, 106);
            this.RSSI_numeric_max.Maximum = new decimal(new int[] {
            4095,
            0,
            0,
            0});
            this.RSSI_numeric_max.Name = "RSSI_numeric_max";
            this.RSSI_numeric_max.Size = new System.Drawing.Size(91, 20);
            this.RSSI_numeric_max.TabIndex = 1;
            this.RSSI_numeric_max.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.RSSI_numeric_max.Value = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.RSSI_numeric_max.ValueChanged += new System.EventHandler(this.RSSI_numeric_max_ValueChanged);
            // 
            // RSSI_numeric_min
            // 
            this.RSSI_numeric_min.Location = new System.Drawing.Point(8, 67);
            this.RSSI_numeric_min.Maximum = new decimal(new int[] {
            4095,
            0,
            0,
            0});
            this.RSSI_numeric_min.Name = "RSSI_numeric_min";
            this.RSSI_numeric_min.Size = new System.Drawing.Size(91, 20);
            this.RSSI_numeric_min.TabIndex = 0;
            this.RSSI_numeric_min.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.RSSI_numeric_min.ValueChanged += new System.EventHandler(this.RSSI_numeric_min_ValueChanged);
            // 
            // grpTLog
            // 
            this.grpTLog.Controls.Add(this.lblTLog);
            this.grpTLog.Controls.Add(this.btnTLog);
            this.grpTLog.Controls.Add(this.label14);
            this.grpTLog.Enabled = false;
            this.grpTLog.Location = new System.Drawing.Point(565, 27);
            this.grpTLog.Name = "grpTLog";
            this.grpTLog.Size = new System.Drawing.Size(119, 64);
            this.grpTLog.TabIndex = 8;
            this.grpTLog.TabStop = false;
            this.grpTLog.Text = "TLog player";
            // 
            // lblTLog
            // 
            this.lblTLog.Location = new System.Drawing.Point(38, 42);
            this.lblTLog.Name = "lblTLog";
            this.lblTLog.Size = new System.Drawing.Size(64, 18);
            this.lblTLog.TabIndex = 16;
            this.lblTLog.Text = "0";
            this.lblTLog.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // btnTLog
            // 
            this.btnTLog.Location = new System.Drawing.Point(9, 15);
            this.btnTLog.Name = "btnTLog";
            this.btnTLog.Size = new System.Drawing.Size(64, 24);
            this.btnTLog.TabIndex = 15;
            this.btnTLog.Text = "Start";
            this.btnTLog.UseVisualStyleBackColor = true;
            this.btnTLog.Click += new System.EventHandler(this.btnTLog_Click);
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(6, 15);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(0, 13);
            this.label14.TabIndex = 14;
            // 
            // lblFWModelType
            // 
            this.lblFWModelType.Location = new System.Drawing.Point(6, 13);
            this.lblFWModelType.Name = "lblFWModelType";
            this.lblFWModelType.Size = new System.Drawing.Size(269, 21);
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
            this.lblLatestCharsetUploaded.Size = new System.Drawing.Size(269, 13);
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
            this.groupBox11.Size = new System.Drawing.Size(271, 65);
            this.groupBox11.TabIndex = 18;
            this.groupBox11.TabStop = false;
            this.groupBox11.Text = "CT Tool Status:";
            // 
            // groupBox12
            // 
            this.groupBox12.Controls.Add(this.lblFWModelType);
            this.groupBox12.Controls.Add(this.lblLatestCharsetUploaded);
            this.groupBox12.Location = new System.Drawing.Point(278, 26);
            this.groupBox12.Name = "groupBox12";
            this.groupBox12.Size = new System.Drawing.Size(281, 65);
            this.groupBox12.TabIndex = 19;
            this.groupBox12.TabStop = false;
            this.groupBox12.Text = "OSD Status:";
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
            // chkHUD
            // 
            this.chkHUD.AutoSize = true;
            this.chkHUD.Location = new System.Drawing.Point(9, 61);
            this.chkHUD.Name = "chkHUD";
            this.chkHUD.Size = new System.Drawing.Size(107, 17);
            this.chkHUD.TabIndex = 3;
            this.chkHUD.Text = "show HUD frame";
            this.chkHUD.UseVisualStyleBackColor = true;
            this.chkHUD.CheckedChanged += new System.EventHandler(this.chkHUD_CheckedChanged);
            // 
            // chkTrack
            // 
            this.chkTrack.AutoSize = true;
            this.chkTrack.Location = new System.Drawing.Point(98, 24);
            this.chkTrack.Name = "chkTrack";
            this.chkTrack.Size = new System.Drawing.Size(72, 17);
            this.chkTrack.TabIndex = 4;
            this.chkTrack.Text = "with track";
            this.chkTrack.UseVisualStyleBackColor = true;
            this.chkTrack.CheckedChanged += new System.EventHandler(this.chkTrack_CheckedChanged);

	    for(int k=0;k<npanel;k++){
		this.scr[k].init();
	    }
            // 
            // OSD
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(688, 558);
            this.Controls.Add(this.groupBox12);
            this.Controls.Add(this.groupBox11);
            this.Controls.Add(this.grpTLog);
            this.Controls.Add(this.label5);
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
            this.Resize += new System.EventHandler(this.OSD_Resize);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.PANEL_tabs.ResumeLayout(false);
            this.tabPageConfig.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox15.ResumeLayout(false);
            this.groupBox15.PerformLayout();
            this.groupBox16.ResumeLayout(false);
            this.groupBox16.PerformLayout();
            this.groupBox13.ResumeLayout(false);
            this.groupBox13.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numMinVoltB)).EndInit();
			this.groupBox9.ResumeLayout(false);
            this.groupBox9.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.numHOS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numVOS)).EndInit();
            this.groupBox8.ResumeLayout(false);
            this.groupBox8.PerformLayout();
            this.groupBox7.ResumeLayout(false);
            this.groupBox7.PerformLayout();
            this.groupBox6.ResumeLayout(false);
            this.groupBox6.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox14.ResumeLayout(false);
            this.groupBox14.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.BATT_WARNnumeric)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.MINVOLT_numeric)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.OVERSPEED_numeric)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.STALL_numeric)).EndInit();
            this.groupBoxRSSI.ResumeLayout(false);
            this.groupBoxRSSI.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_WARNnumeric)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_numeric_max)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.RSSI_numeric_min)).EndInit();

	    for(int k=0;k<npanel;k++){
		this.scr[k].last_init();
	    }

            this.grpTLog.ResumeLayout(false);
            this.grpTLog.PerformLayout();
            this.groupBox11.ResumeLayout(false);
            this.groupBox11.PerformLayout();
            this.groupBox12.ResumeLayout(false);
            

            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        
        private System.Windows.Forms.Button BUT_WriteOSD;
        private System.Windows.Forms.ComboBox CMB_ComPort;

        private System.Windows.Forms.Button BUT_ReadOSD;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripProgressBar toolStripProgressBar1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem videoModeToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem CHK_ntsc;
        private System.Windows.Forms.ToolStripMenuItem CHK_pal;
		private System.Windows.Forms.ToolStripMenuItem CHK_auto;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem saveToFileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem loadFromFileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem loadDefaultsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem optionsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem checkBox1;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem resetEepromToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem updateFirmwareToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem customBGPictureToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sendTLogToolStripMenuItem;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.ToolStripMenuItem updateFontToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.TabControl PANEL_tabs;
 
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
        private System.Windows.Forms.Label lblModelType;
        private System.Windows.Forms.ComboBox cbxModelType;
        private System.Windows.Forms.ComboBox cbxWarningsAutoPanelSwitch;
        private System.Windows.Forms.Label lblWarningsAutoPanelSwitch;
        private System.Windows.Forms.Label lblFWModelType;
        
        private System.Windows.Forms.GroupBox grpTLog;
        private System.Windows.Forms.Label label14;
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
        private System.Windows.Forms.CheckBox cbxAutoUpdate;
        private System.Windows.Forms.CheckBox cbxShowUpdateDialog;
        private System.Windows.Forms.GroupBox groupBox15;
        private System.Windows.Forms.CheckBox chkRadar;
        private System.Windows.Forms.GroupBox groupBox13;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.NumericUpDown numMinVoltB;
        private System.Windows.Forms.GroupBox groupBox14;
        private System.Windows.Forms.TextBox txtCurr_k;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.ComboBox cbCurrentSoure;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.ComboBox cbBattA_source;		
        private System.Windows.Forms.TextBox txtRSSI_k;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.GroupBox groupBox16;
        private System.Windows.Forms.TextBox txtPitchPal;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.TextBox txtRollPal;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.CheckBox chkILS;
        private System.Windows.Forms.Label label24;
        private System.Windows.Forms.TextBox txtPitchNtsc;
        private System.Windows.Forms.Label label25;
        private System.Windows.Forms.TextBox txtRollNtsc;
        private System.Windows.Forms.Label label26;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.TextBox txtBattB_k;
        private System.Windows.Forms.Label label28;
        private System.Windows.Forms.TextBox txtBattA_k;
        private System.Windows.Forms.Label label27;
        private System.Windows.Forms.Label OVERSPEED_label;
        private System.Windows.Forms.NumericUpDown OVERSPEED_numeric;
		private System.Windows.Forms.Label lblTLog;
        private System.Windows.Forms.Button btnTLog;
		private System.Windows.Forms.NumericUpDown numHOS;
        private System.Windows.Forms.NumericUpDown numVOS;
        private System.Windows.Forms.Label label31;
        private System.Windows.Forms.Label label30;
        private System.Windows.Forms.Label label29;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox cbOutPin;
        private System.Windows.Forms.ComboBox cbOutSource;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbNscreens;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.CheckBox chkTrack;
        private System.Windows.Forms.CheckBox chkHUD;
    }
	
}

