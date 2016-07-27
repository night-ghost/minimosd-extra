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
            this.components = new System.ComponentModel.Container();
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
            this.connectComPortToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.updateFontToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.updateCharsetDevToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.updateCharsetcustomFwToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.presentCustomCharsetToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.MavlinkModeMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.getFwFromOSDToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gettingStartedToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.PANEL_tabs = new System.Windows.Forms.TabControl();
            this.tabPageConfig = new System.Windows.Forms.TabPage();
            this.chkILS = new System.Windows.Forms.CheckBox();
            this.chkTrack = new System.Windows.Forms.CheckBox();
            this.chkRusHUD = new System.Windows.Forms.CheckBox();
            this.groupBox14 = new System.Windows.Forms.GroupBox();
            this.txtCurr_k = new System.Windows.Forms.TextBox();
            this.label19 = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.cbCurrentSoure = new System.Windows.Forms.ComboBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.txtSAdd4 = new System.Windows.Forms.TextBox();
            this.txtSAdd3 = new System.Windows.Forms.TextBox();
            this.txtSAdd2 = new System.Windows.Forms.TextBox();
            this.txtSAdd1 = new System.Windows.Forms.TextBox();
            this.label41 = new System.Windows.Forms.Label();
            this.label40 = new System.Windows.Forms.Label();
            this.label39 = new System.Windows.Forms.Label();
            this.label38 = new System.Windows.Forms.Label();
            this.label33 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label37 = new System.Windows.Forms.Label();
            this.txtFactor4 = new System.Windows.Forms.TextBox();
            this.txtFormat4 = new System.Windows.Forms.TextBox();
            this.label36 = new System.Windows.Forms.Label();
            this.txtFactor3 = new System.Windows.Forms.TextBox();
            this.txtFormat3 = new System.Windows.Forms.TextBox();
            this.label35 = new System.Windows.Forms.Label();
            this.txtFactor2 = new System.Windows.Forms.TextBox();
            this.txtFormat2 = new System.Windows.Forms.TextBox();
            this.label34 = new System.Windows.Forms.Label();
            this.txtFactor1 = new System.Windows.Forms.TextBox();
            this.txtFormat1 = new System.Windows.Forms.TextBox();
            this.label32 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cbOutPin = new System.Windows.Forms.ComboBox();
            this.cbOutSource = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
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
            this.groupBox7 = new System.Windows.Forms.GroupBox();
            this.txtTime3 = new System.Windows.Forms.TextBox();
            this.txtTime2 = new System.Windows.Forms.TextBox();
            this.txtTime1 = new System.Windows.Forms.TextBox();
            this.txtTime0 = new System.Windows.Forms.TextBox();
            this.lblTimes = new System.Windows.Forms.Label();
            this.chkDiap = new System.Windows.Forms.CheckBox();
            this.TOGGLE_BEH = new System.Windows.Forms.CheckBox();
            this.ONOFF_combo = new System.Windows.Forms.ComboBox();
            this.label11 = new System.Windows.Forms.Label();
            this.chkSwitchOnce = new System.Windows.Forms.CheckBox();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.UNITS_combo = new System.Windows.Forms.ComboBox();
            this.label10 = new System.Windows.Forms.Label();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.txtBattA_k = new System.Windows.Forms.TextBox();
            this.label27 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.cbBattA_source = new System.Windows.Forms.ComboBox();
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
            this.lblTime = new System.Windows.Forms.Label();
            this.btnListen = new System.Windows.Forms.Button();
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
            this.BUT_CopyScreen = new System.Windows.Forms.Button();
            this.BUT_ClearScreen = new System.Windows.Forms.Button();
            this.hint = new System.Windows.Forms.ToolTip(this.components);
            this.statusStrip1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.PANEL_tabs.SuspendLayout();
            this.tabPageConfig.SuspendLayout();
            this.groupBox14.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
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
            this.connectComPortToolStripMenuItem,
            this.updateFontToolStripMenuItem,
            this.updateCharsetDevToolStripMenuItem,
            this.updateCharsetcustomFwToolStripMenuItem,
            this.presentCustomCharsetToolStripMenuItem,
            this.MavlinkModeMenuItem,
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
            // connectComPortToolStripMenuItem
            // 
            this.connectComPortToolStripMenuItem.Name = "connectComPortToolStripMenuItem";
            this.connectComPortToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.connectComPortToolStripMenuItem.Text = "Connect to COM port";
            this.connectComPortToolStripMenuItem.ToolTipText = "Transmit all data from selected port to OSD to test how it works";
            this.connectComPortToolStripMenuItem.Click += new System.EventHandler(this.connectComPortToolStripMenuItem_Click);
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
            // MavlinkModeMenuItem
            // 
            this.MavlinkModeMenuItem.CheckOnClick = true;
            this.MavlinkModeMenuItem.Name = "MavlinkModeMenuItem";
            this.MavlinkModeMenuItem.Size = new System.Drawing.Size(233, 22);
            this.MavlinkModeMenuItem.Text = "MAVlink mode";
            this.MavlinkModeMenuItem.CheckedChanged += new System.EventHandler(this.MavlinkModeMenuItem_Click);
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
            this.tabPageConfig.Controls.Add(this.chkILS);
            this.tabPageConfig.Controls.Add(this.chkTrack);
            this.tabPageConfig.Controls.Add(this.chkRusHUD);
            this.tabPageConfig.Controls.Add(this.groupBox14);
            this.tabPageConfig.Controls.Add(this.groupBox2);
            this.tabPageConfig.Controls.Add(this.groupBox1);
            this.tabPageConfig.Controls.Add(this.groupBox16);
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
            // chkILS
            // 
            this.chkILS.AutoSize = true;
            this.chkILS.Location = new System.Drawing.Point(490, 315);
            this.chkILS.Name = "chkILS";
            this.chkILS.Size = new System.Drawing.Size(70, 17);
            this.chkILS.TabIndex = 1;
            this.chkILS.Text = "show ILS";
            this.chkILS.UseVisualStyleBackColor = true;
            this.chkILS.Visible = false;
            this.chkILS.CheckedChanged += new System.EventHandler(this.chkILS_CheckedChanged);
            // 
            // chkTrack
            // 
            this.chkTrack.AutoSize = true;
            this.chkTrack.Location = new System.Drawing.Point(578, 307);
            this.chkTrack.Name = "chkTrack";
            this.chkTrack.Size = new System.Drawing.Size(72, 17);
            this.chkTrack.TabIndex = 4;
            this.chkTrack.Text = "with track";
            this.chkTrack.UseVisualStyleBackColor = true;
            this.chkTrack.Visible = false;
            this.chkTrack.CheckedChanged += new System.EventHandler(this.chkTrack_CheckedChanged);
            // 
            // chkRusHUD
            // 
            this.chkRusHUD.AutoSize = true;
            this.chkRusHUD.Location = new System.Drawing.Point(497, 296);
            this.chkRusHUD.Name = "chkRusHUD";
            this.chkRusHUD.Size = new System.Drawing.Size(91, 17);
            this.chkRusHUD.TabIndex = 0;
            this.chkRusHUD.Text = "Russian HUD";
            this.chkRusHUD.UseVisualStyleBackColor = true;
            this.chkRusHUD.Visible = false;
            this.chkRusHUD.CheckedChanged += new System.EventHandler(this.chkRusHUD_CheckedChanged);
            // 
            // groupBox14
            // 
            this.groupBox14.Controls.Add(this.txtCurr_k);
            this.groupBox14.Controls.Add(this.label19);
            this.groupBox14.Controls.Add(this.label18);
            this.groupBox14.Controls.Add(this.cbCurrentSoure);
            this.groupBox14.Location = new System.Drawing.Point(325, 160);
            this.groupBox14.Name = "groupBox14";
            this.groupBox14.Size = new System.Drawing.Size(160, 83);
            this.groupBox14.TabIndex = 20;
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
            this.hint.SetToolTip(this.txtCurr_k, "Factor to fine tuning");
            this.txtCurr_k.Leave += new System.EventHandler(this.txtCurr_k_TextChanged);
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
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txtSAdd4);
            this.groupBox2.Controls.Add(this.txtSAdd3);
            this.groupBox2.Controls.Add(this.txtSAdd2);
            this.groupBox2.Controls.Add(this.txtSAdd1);
            this.groupBox2.Controls.Add(this.label41);
            this.groupBox2.Controls.Add(this.label40);
            this.groupBox2.Controls.Add(this.label39);
            this.groupBox2.Controls.Add(this.label38);
            this.groupBox2.Controls.Add(this.label33);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.label37);
            this.groupBox2.Controls.Add(this.txtFactor4);
            this.groupBox2.Controls.Add(this.txtFormat4);
            this.groupBox2.Controls.Add(this.label36);
            this.groupBox2.Controls.Add(this.txtFactor3);
            this.groupBox2.Controls.Add(this.txtFormat3);
            this.groupBox2.Controls.Add(this.label35);
            this.groupBox2.Controls.Add(this.txtFactor2);
            this.groupBox2.Controls.Add(this.txtFormat2);
            this.groupBox2.Controls.Add(this.label34);
            this.groupBox2.Controls.Add(this.txtFactor1);
            this.groupBox2.Controls.Add(this.txtFormat1);
            this.groupBox2.Controls.Add(this.label32);
            this.groupBox2.Controls.Add(this.label12);
            this.groupBox2.Location = new System.Drawing.Point(5, 236);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(316, 142);
            this.groupBox2.TabIndex = 14;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Sensors";
            // 
            // txtSAdd4
            // 
            this.txtSAdd4.Location = new System.Drawing.Point(249, 113);
            this.txtSAdd4.Name = "txtSAdd4";
            this.txtSAdd4.Size = new System.Drawing.Size(40, 20);
            this.txtSAdd4.TabIndex = 33;
            this.txtSAdd4.Text = "0";
            this.txtSAdd4.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtSAdd4.Leave += new System.EventHandler(this.txtFactor1_TextChanged);
            // 
            // txtSAdd3
            // 
            this.txtSAdd3.Location = new System.Drawing.Point(249, 88);
            this.txtSAdd3.Name = "txtSAdd3";
            this.txtSAdd3.Size = new System.Drawing.Size(40, 20);
            this.txtSAdd3.TabIndex = 32;
            this.txtSAdd3.Text = "0";
            this.txtSAdd3.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtSAdd3.Leave += new System.EventHandler(this.txtFactor1_TextChanged);
            // 
            // txtSAdd2
            // 
            this.txtSAdd2.Location = new System.Drawing.Point(249, 62);
            this.txtSAdd2.Name = "txtSAdd2";
            this.txtSAdd2.Size = new System.Drawing.Size(40, 20);
            this.txtSAdd2.TabIndex = 31;
            this.txtSAdd2.Text = "0";
            this.txtSAdd2.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtSAdd2.Leave += new System.EventHandler(this.txtFactor1_TextChanged);
            // 
            // txtSAdd1
            // 
            this.txtSAdd1.Location = new System.Drawing.Point(249, 37);
            this.txtSAdd1.Name = "txtSAdd1";
            this.txtSAdd1.Size = new System.Drawing.Size(40, 20);
            this.txtSAdd1.TabIndex = 30;
            this.txtSAdd1.Text = "0";
            this.txtSAdd1.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtSAdd1.Leave += new System.EventHandler(this.txtFactor1_TextChanged);
            // 
            // label41
            // 
            this.label41.AutoSize = true;
            this.label41.Location = new System.Drawing.Point(251, 18);
            this.label41.Name = "label41";
            this.label41.Size = new System.Drawing.Size(25, 13);
            this.label41.TabIndex = 29;
            this.label41.Text = "add";
            // 
            // label40
            // 
            this.label40.AutoSize = true;
            this.label40.Location = new System.Drawing.Point(26, 18);
            this.label40.Name = "label40";
            this.label40.Size = new System.Drawing.Size(22, 13);
            this.label40.TabIndex = 28;
            this.label40.Text = "Pin";
            // 
            // label39
            // 
            this.label39.AutoSize = true;
            this.label39.Location = new System.Drawing.Point(26, 115);
            this.label39.Name = "label39";
            this.label39.Size = new System.Drawing.Size(32, 13);
            this.label39.TabIndex = 27;
            this.label39.Text = "RSSI";
            // 
            // label38
            // 
            this.label38.AutoSize = true;
            this.label38.Location = new System.Drawing.Point(25, 90);
            this.label38.Name = "label38";
            this.label38.Size = new System.Drawing.Size(41, 13);
            this.label38.TabIndex = 26;
            this.label38.Text = "Current";
            // 
            // label33
            // 
            this.label33.AutoSize = true;
            this.label33.Location = new System.Drawing.Point(26, 64);
            this.label33.Name = "label33";
            this.label33.Size = new System.Drawing.Size(20, 13);
            this.label33.TabIndex = 25;
            this.label33.Text = "V2";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(26, 39);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(20, 13);
            this.label4.TabIndex = 24;
            this.label4.Text = "V1";
            // 
            // label37
            // 
            this.label37.AutoSize = true;
            this.label37.Location = new System.Drawing.Point(13, 114);
            this.label37.Name = "label37";
            this.label37.Size = new System.Drawing.Size(13, 13);
            this.label37.TabIndex = 23;
            this.label37.Text = "4";
            // 
            // txtFactor4
            // 
            this.txtFactor4.Location = new System.Drawing.Point(196, 112);
            this.txtFactor4.Name = "txtFactor4";
            this.txtFactor4.Size = new System.Drawing.Size(47, 20);
            this.txtFactor4.TabIndex = 22;
            this.txtFactor4.Text = "1";
            this.txtFactor4.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtFactor4.Leave += new System.EventHandler(this.txtFactor1_TextChanged);
            // 
            // txtFormat4
            // 
            this.txtFormat4.Location = new System.Drawing.Point(77, 112);
            this.txtFormat4.MaxLength = 16;
            this.txtFormat4.Name = "txtFormat4";
            this.txtFormat4.ShortcutsEnabled = false;
            this.txtFormat4.Size = new System.Drawing.Size(112, 20);
            this.txtFormat4.TabIndex = 21;
            this.txtFormat4.Text = "gh%5.2fKM";
            // 
            // label36
            // 
            this.label36.AutoSize = true;
            this.label36.Location = new System.Drawing.Point(13, 89);
            this.label36.Name = "label36";
            this.label36.Size = new System.Drawing.Size(13, 13);
            this.label36.TabIndex = 18;
            this.label36.Text = "3";
            // 
            // txtFactor3
            // 
            this.txtFactor3.Location = new System.Drawing.Point(196, 87);
            this.txtFactor3.Name = "txtFactor3";
            this.txtFactor3.Size = new System.Drawing.Size(47, 20);
            this.txtFactor3.TabIndex = 17;
            this.txtFactor3.Text = "1";
            this.txtFactor3.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtFactor3.Leave += new System.EventHandler(this.txtFactor1_TextChanged);
            // 
            // txtFormat3
            // 
            this.txtFormat3.Location = new System.Drawing.Point(77, 87);
            this.txtFormat3.MaxLength = 16;
            this.txtFormat3.Name = "txtFormat3";
            this.txtFormat3.ShortcutsEnabled = false;
            this.txtFormat3.Size = new System.Drawing.Size(112, 20);
            this.txtFormat3.TabIndex = 16;
            this.txtFormat3.Text = "ef%5.2f%%";
            // 
            // label35
            // 
            this.label35.AutoSize = true;
            this.label35.Location = new System.Drawing.Point(13, 63);
            this.label35.Name = "label35";
            this.label35.Size = new System.Drawing.Size(13, 13);
            this.label35.TabIndex = 13;
            this.label35.Text = "2";
            // 
            // txtFactor2
            // 
            this.txtFactor2.Location = new System.Drawing.Point(196, 61);
            this.txtFactor2.Name = "txtFactor2";
            this.txtFactor2.Size = new System.Drawing.Size(47, 20);
            this.txtFactor2.TabIndex = 12;
            this.txtFactor2.Text = "10";
            this.txtFactor2.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtFactor2.Leave += new System.EventHandler(this.txtFactor1_TextChanged);
            // 
            // txtFormat2
            // 
            this.txtFormat2.Location = new System.Drawing.Point(77, 61);
            this.txtFormat2.MaxLength = 16;
            this.txtFormat2.Name = "txtFormat2";
            this.txtFormat2.ShortcutsEnabled = false;
            this.txtFormat2.Size = new System.Drawing.Size(112, 20);
            this.txtFormat2.TabIndex = 11;
            this.txtFormat2.Text = "cd%5.2fmv";
            // 
            // label34
            // 
            this.label34.AutoSize = true;
            this.label34.Location = new System.Drawing.Point(13, 38);
            this.label34.Name = "label34";
            this.label34.Size = new System.Drawing.Size(13, 13);
            this.label34.TabIndex = 8;
            this.label34.Text = "1";
            // 
            // txtFactor1
            // 
            this.txtFactor1.Location = new System.Drawing.Point(196, 36);
            this.txtFactor1.Name = "txtFactor1";
            this.txtFactor1.Size = new System.Drawing.Size(47, 20);
            this.txtFactor1.TabIndex = 7;
            this.txtFactor1.Text = "10";
            this.txtFactor1.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtFactor1.Leave += new System.EventHandler(this.txtFactor1_TextChanged);
            // 
            // txtFormat1
            // 
            this.txtFormat1.Location = new System.Drawing.Point(77, 36);
            this.txtFormat1.MaxLength = 16;
            this.txtFormat1.Name = "txtFormat1";
            this.txtFormat1.ShortcutsEnabled = false;
            this.txtFormat1.Size = new System.Drawing.Size(112, 20);
            this.txtFormat1.TabIndex = 6;
            this.txtFormat1.Text = "ab%5.2f\\x10";
            // 
            // label32
            // 
            this.label32.AutoSize = true;
            this.label32.Location = new System.Drawing.Point(198, 17);
            this.label32.Name = "label32";
            this.label32.Size = new System.Drawing.Size(34, 13);
            this.label32.TabIndex = 2;
            this.label32.Text = "factor";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(93, 17);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(36, 13);
            this.label12.TabIndex = 1;
            this.label12.Text = "format";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.cbOutPin);
            this.groupBox1.Controls.Add(this.cbOutSource);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(190, 54);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(131, 63);
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
            this.cbOutPin.Location = new System.Drawing.Point(48, 35);
            this.cbOutPin.Name = "cbOutPin";
            this.cbOutPin.Size = new System.Drawing.Size(77, 21);
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
            this.cbOutSource.Location = new System.Drawing.Point(48, 11);
            this.cbOutSource.Name = "cbOutSource";
            this.cbOutSource.Size = new System.Drawing.Size(78, 21);
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
            this.groupBox16.Location = new System.Drawing.Point(6, 119);
            this.groupBox16.Name = "groupBox16";
            this.groupBox16.Size = new System.Drawing.Size(178, 116);
            this.groupBox16.TabIndex = 2;
            this.groupBox16.TabStop = false;
            this.groupBox16.Text = "Horizon Angle adjust";
            // 
            // label24
            // 
            this.label24.AutoSize = true;
            this.label24.Location = new System.Drawing.Point(2, 73);
            this.label24.Name = "label24";
            this.label24.Size = new System.Drawing.Size(65, 13);
            this.label24.TabIndex = 31;
            this.label24.Text = "NTSC mode";
            // 
            // txtPitchNtsc
            // 
            this.txtPitchNtsc.Location = new System.Drawing.Point(113, 90);
            this.txtPitchNtsc.Name = "txtPitchNtsc";
            this.txtPitchNtsc.Size = new System.Drawing.Size(50, 20);
            this.txtPitchNtsc.TabIndex = 30;
            this.txtPitchNtsc.Text = "1";
            this.txtPitchNtsc.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtPitchNtsc.Leave += new System.EventHandler(this.txtPitchNtsc_TextChanged);
            // 
            // label25
            // 
            this.label25.AutoSize = true;
            this.label25.Location = new System.Drawing.Point(78, 93);
            this.label25.Name = "label25";
            this.label25.Size = new System.Drawing.Size(31, 13);
            this.label25.TabIndex = 29;
            this.label25.Text = "Pitch";
            // 
            // txtRollNtsc
            // 
            this.txtRollNtsc.Location = new System.Drawing.Point(113, 68);
            this.txtRollNtsc.Name = "txtRollNtsc";
            this.txtRollNtsc.Size = new System.Drawing.Size(50, 20);
            this.txtRollNtsc.TabIndex = 28;
            this.txtRollNtsc.Text = "1";
            this.txtRollNtsc.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtRollNtsc.Leave += new System.EventHandler(this.txtRollNtsc_TextChanged);
            // 
            // label26
            // 
            this.label26.AutoSize = true;
            this.label26.Location = new System.Drawing.Point(78, 71);
            this.label26.Name = "label26";
            this.label26.Size = new System.Drawing.Size(25, 13);
            this.label26.TabIndex = 27;
            this.label26.Text = "Roll";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Location = new System.Drawing.Point(2, 18);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(56, 13);
            this.label23.TabIndex = 26;
            this.label23.Text = "PAL mode";
            // 
            // txtPitchPal
            // 
            this.txtPitchPal.Location = new System.Drawing.Point(113, 39);
            this.txtPitchPal.Name = "txtPitchPal";
            this.txtPitchPal.Size = new System.Drawing.Size(50, 20);
            this.txtPitchPal.TabIndex = 25;
            this.txtPitchPal.Text = "1";
            this.txtPitchPal.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtPitchPal.Leave += new System.EventHandler(this.txtPitchPal_TextChanged);
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Location = new System.Drawing.Point(78, 42);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(31, 13);
            this.label22.TabIndex = 24;
            this.label22.Text = "Pitch";
            // 
            // txtRollPal
            // 
            this.txtRollPal.Location = new System.Drawing.Point(113, 17);
            this.txtRollPal.Name = "txtRollPal";
            this.txtRollPal.Size = new System.Drawing.Size(50, 20);
            this.txtRollPal.TabIndex = 23;
            this.txtRollPal.Text = "1";
            this.txtRollPal.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtRollPal.Leave += new System.EventHandler(this.txtRollPal_TextChanged);
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Location = new System.Drawing.Point(78, 20);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(25, 13);
            this.label21.TabIndex = 22;
            this.label21.Text = "Roll";
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
            this.hint.SetToolTip(this.txtBattB_k, "Factor to fine tuning");
            this.txtBattB_k.Leave += new System.EventHandler(this.txtBattB_k_TextChanged);
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
            this.label6.Size = new System.Drawing.Size(147, 13);
            this.label6.TabIndex = 4;
            this.label6.Text = "Warn Min. Battery Voltage (V)";
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
            this.hint.SetToolTip(this.numMinVoltB, "Warning level, 0 to turn off");
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
            this.groupBox9.Location = new System.Drawing.Point(325, 247);
            this.groupBox9.Name = "groupBox9";
            this.groupBox9.Size = new System.Drawing.Size(160, 128);
            this.groupBox9.TabIndex = 10;
            this.groupBox9.TabStop = false;
            this.groupBox9.Text = "Screen";
            // 
            // cbNscreens
            // 
            this.cbNscreens.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbNscreens.FormattingEnabled = true;
            this.cbNscreens.Items.AddRange(new object[] {
            "0 - no switch",
            "1",
            "2",
            "3",
            "4"});
            this.cbNscreens.Location = new System.Drawing.Point(83, 98);
            this.cbNscreens.Name = "cbNscreens";
            this.cbNscreens.Size = new System.Drawing.Size(66, 21);
            this.cbNscreens.TabIndex = 10;
            this.cbNscreens.SelectedIndexChanged += new System.EventHandler(this.cbNscreens_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(3, 101);
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
            this.numHOS.Size = new System.Drawing.Size(66, 20);
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
            this.numVOS.Size = new System.Drawing.Size(67, 20);
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
            this.BRIGHTNESScomboBox.Size = new System.Drawing.Size(83, 21);
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
            this.groupBox8.Location = new System.Drawing.Point(490, 331);
            this.groupBox8.Name = "groupBox8";
            this.groupBox8.Size = new System.Drawing.Size(181, 41);
            this.groupBox8.TabIndex = 9;
            this.groupBox8.TabStop = false;
            this.groupBox8.Text = "Call Sign";
            // 
            // CALLSIGNmaskedText
            // 
            this.CALLSIGNmaskedText.AllowPromptAsInput = false;
            this.CALLSIGNmaskedText.AsciiOnly = true;
            this.CALLSIGNmaskedText.BeepOnError = true;
            this.CALLSIGNmaskedText.Location = new System.Drawing.Point(63, 14);
            this.CALLSIGNmaskedText.Margin = new System.Windows.Forms.Padding(2);
            this.CALLSIGNmaskedText.Mask = "CCCCCCCC";
            this.CALLSIGNmaskedText.Name = "CALLSIGNmaskedText";
            this.CALLSIGNmaskedText.Size = new System.Drawing.Size(109, 20);
            this.CALLSIGNmaskedText.TabIndex = 11;
            this.CALLSIGNmaskedText.Validating += new System.ComponentModel.CancelEventHandler(this.CALLSIGNmaskedText_Validating);
            this.CALLSIGNmaskedText.Validated += new System.EventHandler(this.CALLSIGNmaskedText_Validated);
            // 
            // groupBox7
            // 
            this.groupBox7.Controls.Add(this.txtTime3);
            this.groupBox7.Controls.Add(this.txtTime2);
            this.groupBox7.Controls.Add(this.txtTime1);
            this.groupBox7.Controls.Add(this.txtTime0);
            this.groupBox7.Controls.Add(this.lblTimes);
            this.groupBox7.Controls.Add(this.chkDiap);
            this.groupBox7.Controls.Add(this.TOGGLE_BEH);
            this.groupBox7.Controls.Add(this.ONOFF_combo);
            this.groupBox7.Controls.Add(this.label11);
            this.groupBox7.Controls.Add(this.chkSwitchOnce);
            this.groupBox7.Location = new System.Drawing.Point(5, 5);
            this.groupBox7.Name = "groupBox7";
            this.groupBox7.Size = new System.Drawing.Size(179, 112);
            this.groupBox7.TabIndex = 8;
            this.groupBox7.TabStop = false;
            this.groupBox7.Text = "OSD Toggle Channel";
            // 
            // txtTime3
            // 
            this.txtTime3.Location = new System.Drawing.Point(125, 84);
            this.txtTime3.Name = "txtTime3";
            this.txtTime3.Size = new System.Drawing.Size(32, 20);
            this.txtTime3.TabIndex = 32;
            this.txtTime3.Text = "1";
            this.txtTime3.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtTime3.Visible = false;
            // 
            // txtTime2
            // 
            this.txtTime2.Location = new System.Drawing.Point(87, 84);
            this.txtTime2.Name = "txtTime2";
            this.txtTime2.Size = new System.Drawing.Size(32, 20);
            this.txtTime2.TabIndex = 31;
            this.txtTime2.Text = "1";
            this.txtTime2.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtTime2.Visible = false;
            // 
            // txtTime1
            // 
            this.txtTime1.Location = new System.Drawing.Point(49, 84);
            this.txtTime1.Name = "txtTime1";
            this.txtTime1.Size = new System.Drawing.Size(32, 20);
            this.txtTime1.TabIndex = 30;
            this.txtTime1.Text = "1";
            this.txtTime1.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtTime1.Visible = false;
            // 
            // txtTime0
            // 
            this.txtTime0.Location = new System.Drawing.Point(11, 84);
            this.txtTime0.Name = "txtTime0";
            this.txtTime0.Size = new System.Drawing.Size(32, 20);
            this.txtTime0.TabIndex = 29;
            this.txtTime0.Text = "1";
            this.txtTime0.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.hint.SetToolTip(this.txtTime0, "Time to show screen. If 0 then this screen will not be in auto-switch and will be" +
        " available by manual switching");
            this.txtTime0.Visible = false;
            // 
            // lblTimes
            // 
            this.lblTimes.AutoSize = true;
            this.lblTimes.Location = new System.Drawing.Point(13, 68);
            this.lblTimes.Name = "lblTimes";
            this.lblTimes.Size = new System.Drawing.Size(142, 13);
            this.lblTimes.TabIndex = 13;
            this.lblTimes.Text = "Auto-switch times per screen";
            this.lblTimes.Visible = false;
            // 
            // chkDiap
            // 
            this.chkDiap.AutoSize = true;
            this.chkDiap.Location = new System.Drawing.Point(107, 22);
            this.chkDiap.Name = "chkDiap";
            this.chkDiap.Size = new System.Drawing.Size(61, 17);
            this.chkDiap.TabIndex = 12;
            this.chkDiap.Text = "by  200";
            this.hint.SetToolTip(this.chkDiap, "Turn by small change - not full channel range");
            this.chkDiap.UseVisualStyleBackColor = true;
            // 
            // TOGGLE_BEH
            // 
            this.TOGGLE_BEH.AutoSize = true;
            this.TOGGLE_BEH.Location = new System.Drawing.Point(11, 48);
            this.TOGGLE_BEH.Margin = new System.Windows.Forms.Padding(2);
            this.TOGGLE_BEH.Name = "TOGGLE_BEH";
            this.TOGGLE_BEH.Size = new System.Drawing.Size(101, 17);
            this.TOGGLE_BEH.TabIndex = 10;
            this.TOGGLE_BEH.Text = "Rotation Switch";
            this.hint.SetToolTip(this.TOGGLE_BEH, "Go to next screen on each switch");
            this.TOGGLE_BEH.UseVisualStyleBackColor = true;
            this.TOGGLE_BEH.CheckedChanged += new System.EventHandler(this.TOGGLE_BEHChanged);
            // 
            // ONOFF_combo
            // 
            this.ONOFF_combo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.ONOFF_combo.FormattingEnabled = true;
            this.ONOFF_combo.Items.AddRange(new object[] {
            "Disabled",
            "By time",
            "External PWM",
            "Mode Switch",
            "Ch 5",
            "Ch 6",
            "Ch 7",
            "Ch 8"});
            this.ONOFF_combo.Location = new System.Drawing.Point(11, 20);
            this.ONOFF_combo.Margin = new System.Windows.Forms.Padding(2);
            this.ONOFF_combo.Name = "ONOFF_combo";
            this.ONOFF_combo.Size = new System.Drawing.Size(84, 21);
            this.ONOFF_combo.TabIndex = 3;
            this.ONOFF_combo.SelectedIndexChanged += new System.EventHandler(this.ONOFF_combo_SelectedIndexChanged);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(5, 10);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(0, 13);
            this.label11.TabIndex = 2;
            // 
            // chkSwitchOnce
            // 
            this.chkSwitchOnce.AutoSize = true;
            this.chkSwitchOnce.Location = new System.Drawing.Point(116, 48);
            this.chkSwitchOnce.Name = "chkSwitchOnce";
            this.chkSwitchOnce.Size = new System.Drawing.Size(52, 17);
            this.chkSwitchOnce.TabIndex = 11;
            this.chkSwitchOnce.Text = "Once";
            this.hint.SetToolTip(this.chkSwitchOnce, "Turn off autorepeat");
            this.chkSwitchOnce.UseVisualStyleBackColor = true;
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.UNITS_combo);
            this.groupBox6.Controls.Add(this.label10);
            this.groupBox6.Location = new System.Drawing.Point(190, 5);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(131, 46);
            this.groupBox6.TabIndex = 7;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Units";
            // 
            // UNITS_combo
            // 
            this.UNITS_combo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.UNITS_combo.FormattingEnabled = true;
            this.UNITS_combo.Items.AddRange(new object[] {
            "Metric",
            "Imperial"});
            this.UNITS_combo.Location = new System.Drawing.Point(40, 17);
            this.UNITS_combo.Margin = new System.Windows.Forms.Padding(2);
            this.UNITS_combo.Name = "UNITS_combo";
            this.UNITS_combo.Size = new System.Drawing.Size(86, 21);
            this.UNITS_combo.TabIndex = 3;
            this.UNITS_combo.SelectedIndexChanged += new System.EventHandler(this.UNITS_combo_SelectedIndexChanged);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(8, 13);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(0, 13);
            this.label10.TabIndex = 2;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.txtBattA_k);
            this.groupBox4.Controls.Add(this.label27);
            this.groupBox4.Controls.Add(this.label17);
            this.groupBox4.Controls.Add(this.cbBattA_source);
            this.groupBox4.Controls.Add(this.label9);
            this.groupBox4.Controls.Add(this.BATT_WARNnumeric);
            this.groupBox4.Controls.Add(this.label7);
            this.groupBox4.Controls.Add(this.MINVOLT_numeric);
            this.groupBox4.Location = new System.Drawing.Point(325, 5);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(160, 155);
            this.groupBox4.TabIndex = 5;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Battery A";
            // 
            // txtBattA_k
            // 
            this.txtBattA_k.Location = new System.Drawing.Point(100, 126);
            this.txtBattA_k.Name = "txtBattA_k";
            this.txtBattA_k.Size = new System.Drawing.Size(49, 20);
            this.txtBattA_k.TabIndex = 23;
            this.txtBattA_k.Text = "1";
            this.txtBattA_k.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.hint.SetToolTip(this.txtBattA_k, "Factor to fine tuning");
            this.txtBattA_k.Leave += new System.EventHandler(this.txtBattA_k_TextChanged);
            // 
            // label27
            // 
            this.label27.AutoSize = true;
            this.label27.Location = new System.Drawing.Point(9, 129);
            this.label27.Name = "label27";
            this.label27.Size = new System.Drawing.Size(82, 13);
            this.label27.TabIndex = 22;
            this.label27.Text = "Adjust pin value";
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
            this.hint.SetToolTip(this.BATT_WARNnumeric, "Warning level, 0 to turn off");
            this.BATT_WARNnumeric.ValueChanged += new System.EventHandler(this.BATT_WARNnumeric_ValueChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(5, 45);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(147, 13);
            this.label7.TabIndex = 2;
            this.label7.Text = "Warn Min. Battery Voltage (V)";
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
            this.hint.SetToolTip(this.MINVOLT_numeric, "Warning level, 0 to turn off");
            this.MINVOLT_numeric.ValueChanged += new System.EventHandler(this.MINVOLT_numeric_ValueChanged);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.OVERSPEED_label);
            this.groupBox3.Controls.Add(this.OVERSPEED_numeric);
            this.groupBox3.Controls.Add(this.STALL_label);
            this.groupBox3.Controls.Add(this.STALL_numeric);
            this.groupBox3.Location = new System.Drawing.Point(190, 119);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(131, 116);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Warnings";
            // 
            // OVERSPEED_label
            // 
            this.OVERSPEED_label.AutoSize = true;
            this.OVERSPEED_label.Location = new System.Drawing.Point(8, 71);
            this.OVERSPEED_label.Name = "OVERSPEED_label";
            this.OVERSPEED_label.Size = new System.Drawing.Size(93, 13);
            this.OVERSPEED_label.TabIndex = 4;
            this.OVERSPEED_label.Text = "Overspeed (km/h)";
            // 
            // OVERSPEED_numeric
            // 
            this.OVERSPEED_numeric.Location = new System.Drawing.Point(37, 87);
            this.OVERSPEED_numeric.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.OVERSPEED_numeric.Name = "OVERSPEED_numeric";
            this.OVERSPEED_numeric.Size = new System.Drawing.Size(88, 20);
            this.OVERSPEED_numeric.TabIndex = 3;
            this.OVERSPEED_numeric.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.OVERSPEED_numeric.ValueChanged += new System.EventHandler(this.OVERSPEED_numeric_ValueChanged);
            // 
            // STALL_label
            // 
            this.STALL_label.AutoSize = true;
            this.STALL_label.Location = new System.Drawing.Point(6, 26);
            this.STALL_label.Name = "STALL_label";
            this.STALL_label.Size = new System.Drawing.Size(95, 13);
            this.STALL_label.TabIndex = 2;
            this.STALL_label.Text = "Stall Speed (km/h)";
            // 
            // STALL_numeric
            // 
            this.STALL_numeric.Location = new System.Drawing.Point(35, 41);
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
            this.groupBoxRSSI.Location = new System.Drawing.Point(490, 119);
            this.groupBoxRSSI.Name = "groupBoxRSSI";
            this.groupBoxRSSI.Size = new System.Drawing.Size(181, 159);
            this.groupBoxRSSI.TabIndex = 3;
            this.groupBoxRSSI.TabStop = false;
            this.groupBoxRSSI.Text = "RSSI";
            // 
            // txtRSSI_k
            // 
            this.txtRSSI_k.Location = new System.Drawing.Point(125, 128);
            this.txtRSSI_k.Name = "txtRSSI_k";
            this.txtRSSI_k.Size = new System.Drawing.Size(47, 20);
            this.txtRSSI_k.TabIndex = 23;
            this.txtRSSI_k.Text = "1";
            this.txtRSSI_k.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.hint.SetToolTip(this.txtRSSI_k, "Factor to fine tuning");
            this.txtRSSI_k.Leave += new System.EventHandler(this.txtRSSI_k_TextChanged);
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Location = new System.Drawing.Point(33, 131);
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
            "Pin RSSI PWM",
            "3DR modem RSSI"});
            this.cbxRSSIChannel.Location = new System.Drawing.Point(81, 9);
            this.cbxRSSIChannel.Margin = new System.Windows.Forms.Padding(2);
            this.cbxRSSIChannel.Name = "cbxRSSIChannel";
            this.cbxRSSIChannel.Size = new System.Drawing.Size(91, 21);
            this.cbxRSSIChannel.TabIndex = 13;
            this.cbxRSSIChannel.SelectedIndexChanged += new System.EventHandler(this.cbxRSSIChannel_SelectedIndexChanged);
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(34, 12);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(45, 13);
            this.label15.TabIndex = 12;
            this.label15.Text = "source: ";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(5, 89);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(93, 13);
            this.label8.TabIndex = 11;
            this.label8.Text = "Warning Level (%)";
            // 
            // RSSI_WARNnumeric
            // 
            this.RSSI_WARNnumeric.Location = new System.Drawing.Point(111, 85);
            this.RSSI_WARNnumeric.Name = "RSSI_WARNnumeric";
            this.RSSI_WARNnumeric.Size = new System.Drawing.Size(61, 20);
            this.RSSI_WARNnumeric.TabIndex = 10;
            this.RSSI_WARNnumeric.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.hint.SetToolTip(this.RSSI_WARNnumeric, "0 to turn off");
            this.RSSI_WARNnumeric.ValueChanged += new System.EventHandler(this.RSSI_WARNnumeric_ValueChanged);
            // 
            // RSSI_RAW
            // 
            this.RSSI_RAW.AutoSize = true;
            this.RSSI_RAW.Location = new System.Drawing.Point(8, 106);
            this.RSSI_RAW.Margin = new System.Windows.Forms.Padding(2);
            this.RSSI_RAW.Name = "RSSI_RAW";
            this.RSSI_RAW.Size = new System.Drawing.Size(102, 17);
            this.RSSI_RAW.TabIndex = 9;
            this.RSSI_RAW.Text = "Show raw value";
            this.RSSI_RAW.UseVisualStyleBackColor = true;
            this.RSSI_RAW.CheckedChanged += new System.EventHandler(this.checkBox2_CheckedChanged);
            // 
            // lblRSSIMax
            // 
            this.lblRSSIMax.AutoSize = true;
            this.lblRSSIMax.Location = new System.Drawing.Point(4, 65);
            this.lblRSSIMax.Name = "lblRSSIMax";
            this.lblRSSIMax.Size = new System.Drawing.Size(57, 13);
            this.lblRSSIMax.TabIndex = 3;
            this.lblRSSIMax.Text = "Max Value";
            // 
            // lblRSSIMin
            // 
            this.lblRSSIMin.AutoSize = true;
            this.lblRSSIMin.Location = new System.Drawing.Point(4, 37);
            this.lblRSSIMin.Name = "lblRSSIMin";
            this.lblRSSIMin.Size = new System.Drawing.Size(54, 13);
            this.lblRSSIMin.TabIndex = 2;
            this.lblRSSIMin.Text = "Min Value";
            // 
            // RSSI_numeric_max
            // 
            this.RSSI_numeric_max.Location = new System.Drawing.Point(81, 61);
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
            this.RSSI_numeric_min.Location = new System.Drawing.Point(81, 35);
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
            this.grpTLog.Controls.Add(this.lblTime);
            this.grpTLog.Controls.Add(this.btnListen);
            this.grpTLog.Controls.Add(this.lblTLog);
            this.grpTLog.Controls.Add(this.btnTLog);
            this.grpTLog.Controls.Add(this.label14);
            this.grpTLog.Location = new System.Drawing.Point(478, 27);
            this.grpTLog.Name = "grpTLog";
            this.grpTLog.Size = new System.Drawing.Size(206, 74);
            this.grpTLog.TabIndex = 8;
            this.grpTLog.TabStop = false;
            this.grpTLog.Text = "TLog player";
            // 
            // lblTime
            // 
            this.lblTime.Location = new System.Drawing.Point(125, 21);
            this.lblTime.Name = "lblTime";
            this.lblTime.Size = new System.Drawing.Size(73, 18);
            this.lblTime.TabIndex = 18;
            // 
            // btnListen
            // 
            this.btnListen.Location = new System.Drawing.Point(9, 44);
            this.btnListen.Name = "btnListen";
            this.btnListen.Size = new System.Drawing.Size(47, 20);
            this.btnListen.TabIndex = 17;
            this.btnListen.Text = "Listen";
            this.btnListen.UseVisualStyleBackColor = true;
            this.btnListen.Visible = false;
            this.btnListen.Click += new System.EventHandler(this.btnListen_Click);
            // 
            // lblTLog
            // 
            this.lblTLog.Location = new System.Drawing.Point(56, 18);
            this.lblTLog.Name = "lblTLog";
            this.lblTLog.Size = new System.Drawing.Size(59, 18);
            this.lblTLog.TabIndex = 16;
            this.lblTLog.Text = "0";
            this.lblTLog.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // btnTLog
            // 
            this.btnTLog.Enabled = false;
            this.btnTLog.Location = new System.Drawing.Point(9, 15);
            this.btnTLog.Name = "btnTLog";
            this.btnTLog.Size = new System.Drawing.Size(47, 24);
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
            this.lblFWModelType.Size = new System.Drawing.Size(200, 21);
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
            this.cbxModelType.Location = new System.Drawing.Point(134, 13);
            this.cbxModelType.Margin = new System.Windows.Forms.Padding(2);
            this.cbxModelType.Name = "cbxModelType";
            this.cbxModelType.Size = new System.Drawing.Size(107, 21);
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
            this.lblLatestCharsetUploaded.Size = new System.Drawing.Size(206, 13);
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
            this.groupBox11.Size = new System.Drawing.Size(247, 65);
            this.groupBox11.TabIndex = 18;
            this.groupBox11.TabStop = false;
            this.groupBox11.Text = "CT Tool Status:";
            // 
            // groupBox12
            // 
            this.groupBox12.Controls.Add(this.lblFWModelType);
            this.groupBox12.Controls.Add(this.lblLatestCharsetUploaded);
            this.groupBox12.Location = new System.Drawing.Point(254, 26);
            this.groupBox12.Name = "groupBox12";
            this.groupBox12.Size = new System.Drawing.Size(218, 65);
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
            // BUT_CopyScreen
            // 
            this.BUT_CopyScreen.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.BUT_CopyScreen.Location = new System.Drawing.Point(142, 508);
            this.BUT_CopyScreen.Name = "BUT_CopyScreen";
            this.BUT_CopyScreen.Size = new System.Drawing.Size(100, 23);
            this.BUT_CopyScreen.TabIndex = 20;
            this.BUT_CopyScreen.Text = "Copy from Screen";
            this.BUT_CopyScreen.UseVisualStyleBackColor = true;
            this.BUT_CopyScreen.Click += new System.EventHandler(this.BUT_CopyScreen_Click);
            // 
            // BUT_ClearScreen
            // 
            this.BUT_ClearScreen.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.BUT_ClearScreen.Location = new System.Drawing.Point(26, 508);
            this.BUT_ClearScreen.Name = "BUT_ClearScreen";
            this.BUT_ClearScreen.Size = new System.Drawing.Size(100, 23);
            this.BUT_ClearScreen.TabIndex = 20;
            this.BUT_ClearScreen.Text = "Clear Screen";
            this.BUT_ClearScreen.UseVisualStyleBackColor = true;
            this.BUT_ClearScreen.Click += new System.EventHandler(this.BUT_ClearScreen_Click);
            // 
            // OSD
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(688, 558);
            this.Controls.Add(this.BUT_ClearScreen);
            this.Controls.Add(this.BUT_CopyScreen);
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
            this.tabPageConfig.PerformLayout();
            this.groupBox14.ResumeLayout(false);
            this.groupBox14.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
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
        public System.Windows.Forms.ComboBox CMB_ComPort;

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
        private System.Windows.Forms.ToolStripMenuItem connectComPortToolStripMenuItem;
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
        private System.Windows.Forms.MaskedTextBox CALLSIGNmaskedText;
        private System.Windows.Forms.GroupBox groupBox9;
        private System.Windows.Forms.ComboBox BRIGHTNESScomboBox;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gettingStartedToolStripMenuItem;
//        private System.Windows.Forms.RadioButton rbtBatterymAh;
//        private System.Windows.Forms.RadioButton rbtBatteryPercent;
        private System.Windows.Forms.Label lblModelType;
        private System.Windows.Forms.ComboBox cbxModelType;
        private System.Windows.Forms.Label lblFWModelType;
        
        private System.Windows.Forms.GroupBox grpTLog;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.ToolStripMenuItem MavlinkModeMenuItem;
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
        
        private System.Windows.Forms.CheckBox chkRusHUD;
        private System.Windows.Forms.GroupBox groupBox13;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.NumericUpDown numMinVoltB;
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
        private System.Windows.Forms.GroupBox groupBox2;
        public System.Windows.Forms.TextBox txtFormat1;
        private System.Windows.Forms.Label label32;
        private System.Windows.Forms.Label label12;
        public System.Windows.Forms.TextBox txtFactor1;
        private System.Windows.Forms.Label label37;
        public System.Windows.Forms.TextBox txtFactor4;
        public System.Windows.Forms.TextBox txtFormat4;
        private System.Windows.Forms.Label label36;
        public System.Windows.Forms.TextBox txtFactor3;
        public System.Windows.Forms.TextBox txtFormat3;
        private System.Windows.Forms.Label label35;
        public System.Windows.Forms.TextBox txtFactor2;
        public System.Windows.Forms.TextBox txtFormat2;
        private System.Windows.Forms.Label label34;
        private System.Windows.Forms.Label label40;
        private System.Windows.Forms.Label label39;
        private System.Windows.Forms.Label label38;
        private System.Windows.Forms.Label label33;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox14;
        private System.Windows.Forms.TextBox txtCurr_k;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.ComboBox cbCurrentSoure;
        public System.Windows.Forms.TextBox txtSAdd4;
        public System.Windows.Forms.TextBox txtSAdd3;
        public System.Windows.Forms.TextBox txtSAdd2;
        public System.Windows.Forms.TextBox txtSAdd1;
        private System.Windows.Forms.Label label41;
        private System.Windows.Forms.CheckBox chkSwitchOnce;
        private System.Windows.Forms.Button BUT_CopyScreen;
        private System.Windows.Forms.Button BUT_ClearScreen;
        private System.Windows.Forms.TextBox txtTime3;
        private System.Windows.Forms.TextBox txtTime2;
        private System.Windows.Forms.TextBox txtTime1;
        private System.Windows.Forms.TextBox txtTime0;
        private System.Windows.Forms.Label lblTimes;
        private System.Windows.Forms.CheckBox chkDiap;
        private System.Windows.Forms.ToolTip hint;
        private System.Windows.Forms.Button btnListen;
        private System.Windows.Forms.Label lblTime;
    }

}

