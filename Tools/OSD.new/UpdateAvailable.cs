using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace OSD
{
    public partial class UpdateAvailable : Form
    {
        public bool dontAskAgain = false;

        public UpdateAvailable()
        {
            InitializeComponent();
            this.DialogResult = System.Windows.Forms.DialogResult.No;
        }

        private void btnYes_Click(object sender, EventArgs e)
        {
            this.DialogResult = System.Windows.Forms.DialogResult.Yes;
            this.Close();
        }

        private void btnNo_Click(object sender, EventArgs e)
        {
            this.DialogResult = System.Windows.Forms.DialogResult.No;
            this.Close();
        }

        private void cbxDontAsk_CheckedChanged(object sender, EventArgs e)
        {
            dontAskAgain = cbxDontAsk.Checked;
        }
    }
}
