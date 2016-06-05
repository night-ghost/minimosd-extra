using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace OSD {
    public partial class CopyScreen : Form {
        private int toScreen;
        public CopyScreen(int toScreen) {
            InitializeComponent();
            this.toScreen = toScreen;
        }

        private void CopyScreen_Load(object sender, EventArgs e) {
            for (int i = 1; i < 5; ++i) {
                if (i != toScreen) {
                    ListViewItem item = new ListViewItem();
                    item.Text = "Screen " + i;
                    item.Tag = i;
                    lbScreen.Items.Add(item);
                }
            }
            lbScreen.SelectedIndex = 0;
            lbScreen.DisplayMember = "Text";
        }
        public int Selection {
            get {
                ListViewItem item = (ListViewItem) lbScreen.SelectedItem;
                return (int)item.Tag;
            }
        }
    }
}
