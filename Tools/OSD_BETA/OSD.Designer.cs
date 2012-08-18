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
            this.LIST_items = new System.Windows.Forms.CheckedListBox();
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
            this.saveToFileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.loadFromFileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.loadDefaultsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.videoModeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.nTSCToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.CHK_pal = new System.Windows.Forms.ToolStripMenuItem();
            this.optionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.checkBox1 = new System.Windows.Forms.ToolStripMenuItem();
            this.updateFirmwareToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.customBGPictureToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sendTLogToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.updateFontToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.NUM_Y2 = new System.Windows.Forms.NumericUpDown();
            this.NUM_X2 = new System.Windows.Forms.NumericUpDown();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.LIST_items2 = new System.Windows.Forms.CheckedListBox();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_Y)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X)).BeginInit();
            this.statusStrip1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_Y2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // LIST_items
            // 
            this.LIST_items.FormattingEnabled = true;
            this.LIST_items.Location = new System.Drawing.Point(4, 4);
            this.LIST_items.Margin = new System.Windows.Forms.Padding(4);
            this.LIST_items.Name = "LIST_items";
            this.LIST_items.Size = new System.Drawing.Size(183, 361);
            this.LIST_items.TabIndex = 1;
            this.LIST_items.ItemCheck += new System.Windows.Forms.ItemCheckEventHandler(this.checkedListBox1_ItemCheck);
            this.LIST_items.SelectedIndexChanged += new System.EventHandler(this.checkedListBox1_SelectedIndexChanged);
            this.LIST_items.SelectedValueChanged += new System.EventHandler(this.checkedListBox1_SelectedValueChanged);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.NUM_Y);
            this.groupBox1.Controls.Add(this.NUM_X);
            this.groupBox1.Location = new System.Drawing.Point(4, 351);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox1.Size = new System.Drawing.Size(184, 101);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(9, 59);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(17, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Y";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 25);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(17, 17);
            this.label1.TabIndex = 2;
            this.label1.Text = "X";
            // 
            // NUM_Y
            // 
            this.NUM_Y.Location = new System.Drawing.Point(40, 57);
            this.NUM_Y.Margin = new System.Windows.Forms.Padding(4);
            this.NUM_Y.Maximum = new decimal(new int[] {
            15,
            0,
            0,
            0});
            this.NUM_Y.Name = "NUM_Y";
            this.NUM_Y.Size = new System.Drawing.Size(121, 22);
            this.NUM_Y.TabIndex = 1;
            this.NUM_Y.ValueChanged += new System.EventHandler(this.numericUpDown2_ValueChanged);
            // 
            // NUM_X
            // 
            this.NUM_X.Location = new System.Drawing.Point(40, 25);
            this.NUM_X.Margin = new System.Windows.Forms.Padding(4);
            this.NUM_X.Maximum = new decimal(new int[] {
            29,
            0,
            0,
            0});
            this.NUM_X.Name = "NUM_X";
            this.NUM_X.Size = new System.Drawing.Size(121, 22);
            this.NUM_X.TabIndex = 0;
            this.NUM_X.ValueChanged += new System.EventHandler(this.numericUpDown1_ValueChanged);
            // 
            // BUT_WriteOSD
            // 
            this.BUT_WriteOSD.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.BUT_WriteOSD.Location = new System.Drawing.Point(740, 522);
            this.BUT_WriteOSD.Margin = new System.Windows.Forms.Padding(4);
            this.BUT_WriteOSD.Name = "BUT_WriteOSD";
            this.BUT_WriteOSD.Size = new System.Drawing.Size(133, 28);
            this.BUT_WriteOSD.TabIndex = 2;
            this.BUT_WriteOSD.Text = "Save to OSD";
            this.BUT_WriteOSD.UseVisualStyleBackColor = true;
            this.BUT_WriteOSD.Click += new System.EventHandler(this.BUT_WriteOSD_Click);
            // 
            // CMB_ComPort
            // 
            this.CMB_ComPort.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.CMB_ComPort.FormattingEnabled = true;
            this.CMB_ComPort.Location = new System.Drawing.Point(461, 522);
            this.CMB_ComPort.Margin = new System.Windows.Forms.Padding(4);
            this.CMB_ComPort.Name = "CMB_ComPort";
            this.CMB_ComPort.Size = new System.Drawing.Size(129, 24);
            this.CMB_ComPort.TabIndex = 4;
            this.CMB_ComPort.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            this.CMB_ComPort.Click += new System.EventHandler(this.comboBox1_Click);
            // 
            // BUT_ReadOSD
            // 
            this.BUT_ReadOSD.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.BUT_ReadOSD.Location = new System.Drawing.Point(599, 522);
            this.BUT_ReadOSD.Margin = new System.Windows.Forms.Padding(4);
            this.BUT_ReadOSD.Name = "BUT_ReadOSD";
            this.BUT_ReadOSD.Size = new System.Drawing.Size(133, 28);
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
            this.statusStrip1.Location = new System.Drawing.Point(0, 556);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Padding = new System.Windows.Forms.Padding(1, 0, 19, 0);
            this.statusStrip1.Size = new System.Drawing.Size(889, 26);
            this.statusStrip1.TabIndex = 8;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripProgressBar1
            // 
            this.toolStripProgressBar1.Name = "toolStripProgressBar1";
            this.toolStripProgressBar1.Size = new System.Drawing.Size(667, 20);
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(0, 21);
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
            this.menuStrip1.Padding = new System.Windows.Forms.Padding(8, 2, 0, 2);
            this.menuStrip1.Size = new System.Drawing.Size(889, 28);
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
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(44, 24);
            this.fileToolStripMenuItem.Text = "File";
            // 
            // saveToFileToolStripMenuItem
            // 
            this.saveToFileToolStripMenuItem.Image = global::OSD.Properties.Resources.saveHS;
            this.saveToFileToolStripMenuItem.Name = "saveToFileToolStripMenuItem";
            this.saveToFileToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.S)));
            this.saveToFileToolStripMenuItem.Size = new System.Drawing.Size(237, 24);
            this.saveToFileToolStripMenuItem.Text = "Save OSD file...";
            this.saveToFileToolStripMenuItem.Click += new System.EventHandler(this.saveToFileToolStripMenuItem_Click);
            // 
            // loadFromFileToolStripMenuItem
            // 
            this.loadFromFileToolStripMenuItem.Image = global::OSD.Properties.Resources.openHS;
            this.loadFromFileToolStripMenuItem.Name = "loadFromFileToolStripMenuItem";
            this.loadFromFileToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.O)));
            this.loadFromFileToolStripMenuItem.Size = new System.Drawing.Size(237, 24);
            this.loadFromFileToolStripMenuItem.Text = "Open OSD File...";
            this.loadFromFileToolStripMenuItem.Click += new System.EventHandler(this.loadFromFileToolStripMenuItem_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(234, 6);
            // 
            // loadDefaultsToolStripMenuItem
            // 
            this.loadDefaultsToolStripMenuItem.Name = "loadDefaultsToolStripMenuItem";
            this.loadDefaultsToolStripMenuItem.Size = new System.Drawing.Size(237, 24);
            this.loadDefaultsToolStripMenuItem.Text = "Load Defaults";
            this.loadDefaultsToolStripMenuItem.Click += new System.EventHandler(this.loadDefaultsToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(234, 6);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.F4)));
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(237, 24);
            this.exitToolStripMenuItem.Text = "Exit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // videoModeToolStripMenuItem
            // 
            this.videoModeToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.nTSCToolStripMenuItem,
            this.CHK_pal});
            this.videoModeToolStripMenuItem.Name = "videoModeToolStripMenuItem";
            this.videoModeToolStripMenuItem.Size = new System.Drawing.Size(103, 24);
            this.videoModeToolStripMenuItem.Text = "Video Mode";
            // 
            // nTSCToolStripMenuItem
            // 
            this.nTSCToolStripMenuItem.CheckOnClick = true;
            this.nTSCToolStripMenuItem.Name = "nTSCToolStripMenuItem";
            this.nTSCToolStripMenuItem.Size = new System.Drawing.Size(114, 24);
            this.nTSCToolStripMenuItem.Text = "NTSC";
            this.nTSCToolStripMenuItem.CheckStateChanged += new System.EventHandler(this.nTSCToolStripMenuItem_CheckStateChanged);
            // 
            // CHK_pal
            // 
            this.CHK_pal.Checked = true;
            this.CHK_pal.CheckOnClick = true;
            this.CHK_pal.CheckState = System.Windows.Forms.CheckState.Checked;
            this.CHK_pal.Name = "CHK_pal";
            this.CHK_pal.Size = new System.Drawing.Size(114, 24);
            this.CHK_pal.Text = "PAL";
            this.CHK_pal.CheckedChanged += new System.EventHandler(this.CHK_pal_CheckedChanged);
            this.CHK_pal.CheckStateChanged += new System.EventHandler(this.pALToolStripMenuItem_CheckStateChanged);
            // 
            // optionsToolStripMenuItem
            // 
            this.optionsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.checkBox1,
            this.updateFirmwareToolStripMenuItem,
            this.customBGPictureToolStripMenuItem,
            this.sendTLogToolStripMenuItem,
            this.updateFontToolStripMenuItem});
            this.optionsToolStripMenuItem.Name = "optionsToolStripMenuItem";
            this.optionsToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.G)));
            this.optionsToolStripMenuItem.ShowShortcutKeys = false;
            this.optionsToolStripMenuItem.Size = new System.Drawing.Size(73, 24);
            this.optionsToolStripMenuItem.Text = "Options";
            // 
            // checkBox1
            // 
            this.checkBox1.Checked = true;
            this.checkBox1.CheckOnClick = true;
            this.checkBox1.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(212, 24);
            this.checkBox1.Text = "Show Grid";
            this.checkBox1.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // updateFirmwareToolStripMenuItem
            // 
            this.updateFirmwareToolStripMenuItem.Name = "updateFirmwareToolStripMenuItem";
            this.updateFirmwareToolStripMenuItem.Size = new System.Drawing.Size(212, 24);
            this.updateFirmwareToolStripMenuItem.Text = "Update Firmware...";
            this.updateFirmwareToolStripMenuItem.ToolTipText = "Re-Flash the OSD with a new firmware image";
            this.updateFirmwareToolStripMenuItem.Click += new System.EventHandler(this.updateFirmwareToolStripMenuItem_Click);
            // 
            // customBGPictureToolStripMenuItem
            // 
            this.customBGPictureToolStripMenuItem.Name = "customBGPictureToolStripMenuItem";
            this.customBGPictureToolStripMenuItem.Size = new System.Drawing.Size(212, 24);
            this.customBGPictureToolStripMenuItem.Text = "Background Image...";
            this.customBGPictureToolStripMenuItem.Click += new System.EventHandler(this.customBGPictureToolStripMenuItem_Click);
            // 
            // sendTLogToolStripMenuItem
            // 
            this.sendTLogToolStripMenuItem.Name = "sendTLogToolStripMenuItem";
            this.sendTLogToolStripMenuItem.Size = new System.Drawing.Size(212, 24);
            this.sendTLogToolStripMenuItem.Text = "Send TLog...";
            this.sendTLogToolStripMenuItem.ToolTipText = "Send a Mavlink transmission log to the OSD to test the layout";
            this.sendTLogToolStripMenuItem.Click += new System.EventHandler(this.sendTLogToolStripMenuItem_Click);
            // 
            // updateFontToolStripMenuItem
            // 
            this.updateFontToolStripMenuItem.Name = "updateFontToolStripMenuItem";
            this.updateFontToolStripMenuItem.Size = new System.Drawing.Size(212, 24);
            this.updateFontToolStripMenuItem.Text = "Update CharSet...";
            this.updateFontToolStripMenuItem.ToolTipText = "Update the font file on the OSD";
            this.updateFontToolStripMenuItem.Click += new System.EventHandler(this.updateFontToolStripMenuItem_Click);
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(53, 24);
            this.helpToolStripMenuItem.Text = "Help";
            this.helpToolStripMenuItem.Click += new System.EventHandler(this.helpToolStripMenuItem_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pictureBox1.Location = new System.Drawing.Point(206, 17);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(4);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(663, 422);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseDown);
            this.pictureBox1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseMove);
            this.pictureBox1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseUp);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(0, 30);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(889, 485);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.LIST_items);
            this.tabPage1.Controls.Add(this.groupBox1);
            this.tabPage1.Controls.Add(this.pictureBox1);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Size = new System.Drawing.Size(881, 456);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Panel 1";
            this.tabPage1.UseVisualStyleBackColor = true;
            this.tabPage1.Click += new System.EventHandler(this.tabPage1_Click);
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.LIST_items2);
            this.tabPage2.Controls.Add(this.groupBox2);
            this.tabPage2.Controls.Add(this.pictureBox2);
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Size = new System.Drawing.Size(881, 456);
            this.tabPage2.TabIndex = 0;
            this.tabPage2.Text = "Panel 2";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.NUM_Y2);
            this.groupBox2.Controls.Add(this.NUM_X2);
            this.groupBox2.Location = new System.Drawing.Point(4, 351);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox2.Size = new System.Drawing.Size(184, 101);
            this.groupBox2.TabIndex = 4;
            this.groupBox2.TabStop = false;
            this.groupBox2.Enter += new System.EventHandler(this.groupBox2_Enter);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(9, 59);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(17, 17);
            this.label3.TabIndex = 3;
            this.label3.Text = "Y";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(9, 25);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(17, 17);
            this.label4.TabIndex = 2;
            this.label4.Text = "X";
            // 
            // NUM_Y2
            // 
            this.NUM_Y2.Location = new System.Drawing.Point(40, 57);
            this.NUM_Y2.Margin = new System.Windows.Forms.Padding(4);
            this.NUM_Y2.Maximum = new decimal(new int[] {
            15,
            0,
            0,
            0});
            this.NUM_Y2.Name = "NUM_Y2";
            this.NUM_Y2.Size = new System.Drawing.Size(121, 22);
            this.NUM_Y2.TabIndex = 1;
            this.NUM_Y2.ValueChanged += new System.EventHandler(this.numericUpDown4_ValueChanged);
            // 
            // NUM_X2
            // 
            this.NUM_X2.Location = new System.Drawing.Point(40, 25);
            this.NUM_X2.Margin = new System.Windows.Forms.Padding(4);
            this.NUM_X2.Maximum = new decimal(new int[] {
            29,
            0,
            0,
            0});
            this.NUM_X2.Name = "NUM_X2";
            this.NUM_X2.Size = new System.Drawing.Size(121, 22);
            this.NUM_X2.TabIndex = 0;
            this.NUM_X2.ValueChanged += new System.EventHandler(this.numericUpDown3_ValueChanged);
            // 
            // pictureBox2
            // 
            this.pictureBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pictureBox2.Location = new System.Drawing.Point(206, 17);
            this.pictureBox2.Margin = new System.Windows.Forms.Padding(4);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(663, 422);
            this.pictureBox2.TabIndex = 3;
            this.pictureBox2.TabStop = false;
            this.pictureBox2.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureBox2_MouseDown);
            this.pictureBox2.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureBox2_MouseMove);
            this.pictureBox2.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pictureBox2_MouseUp);
            // 
            // LIST_items2
            // 
            this.LIST_items2.FormattingEnabled = true;
            this.LIST_items2.Location = new System.Drawing.Point(4, 4);
            this.LIST_items2.Margin = new System.Windows.Forms.Padding(4);
            this.LIST_items2.Name = "LIST_items2";
            this.LIST_items2.Size = new System.Drawing.Size(183, 361);
            this.LIST_items2.TabIndex = 2;
            this.LIST_items2.ItemCheck += new System.Windows.Forms.ItemCheckEventHandler(this.checkedListBox2_ItemCheck);
            this.LIST_items2.SelectedIndexChanged += new System.EventHandler(this.checkedListBox2_SelectedIndexChanged);
            this.LIST_items2.SelectedValueChanged += new System.EventHandler(this.checkedListBox2_SelectedValueChanged);
            // 
            // OSD
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(889, 582);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.BUT_ReadOSD);
            this.Controls.Add(this.CMB_ComPort);
            this.Controls.Add(this.BUT_WriteOSD);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "OSD";
            this.Text = "ArduCAM OSD Config - By Michael Oborne";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.OSD_FormClosed);
            this.Load += new System.EventHandler(this.OSD_Load);
            this.Resize += new System.EventHandler(this.OSD_Resize);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_Y)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_Y2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM_X2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.CheckedListBox LIST_items;
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
        private System.Windows.Forms.ToolStripMenuItem nTSCToolStripMenuItem;
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
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.CheckedListBox LIST_items2;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown NUM_Y2;
        private System.Windows.Forms.NumericUpDown NUM_X2;
    }
}

