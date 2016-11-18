using System;
using System.Windows.Forms;

namespace OSD {

    public enum UI_Mode {
        UI_Checkbox = 0, // all flags as checkboxes      
        UI_Combo, // combo with channel number
        UI_Combo_Cb, // Altf as checkbox, all others as combo with channel
        UI_Combo_Cb_Strings, // as above plus strings
        UI_Checkbox_1, // all flags as checkboxes plus 1 checkbox as screen flags
        UI_Filter,    // one combo in 4 values
        UI_Combo_Time, // one combo with times
    };

    // проще и лучше чем эти туплы :)

    [Serializable]// "Pitch", pan.panPitch, 22, 10, panPitch_en_ADDR, panPitch_x_ADDR, panPitch_y_ADDR
	public class Panel { 
		public string name;
		public int x, y;
		public int pos;
		public int sign; // 0=no 1=yes -1=disabled
        //public Func<int, int, int, int, int> show;
        public delegate int ShowPanel(int x, int y, int sign, int fAlt, Panel p);
        public ShowPanel show;
        public int Altf;
        public string alt_text;
        public int Alt2;
        public string alt2_text;
        public int Alt3;
        public string alt3_text;
        public int Alt4;
        public string alt4_text;
        public UI_Mode ui_mode;
        public int string_id, string_count;
        public string strings;
        public int Alt5;
        public int Alt5_mask;
        public string alt5_text;
        public int Alt6;
        public int Alt6_mask;
        public string alt6_text;

        //public TreeNode node;

        //public Panel(String aname, Func<int, int, int, int, int, Panel> ashow, int ax, int ay, int apos, int asign = -1, UI_Mode uim = UI_Mode.UI_Checkbox, int fAlt = -1, string text = "", int fAlt2 = -1, string text2 = "", int fAlt3 = -1, string text3 = "", int fAlt4 = -1, string text4 = "", int str_id=0, int str_count=0, string strings="") {
        public Panel(String aname, ShowPanel ashow, int ax, int ay, int apos, int asign = -1, UI_Mode uim = UI_Mode.UI_Checkbox, int fAlt = -1, string text = "", int fAlt2 = -1, string text2 = "", int fAlt3 = -1, string text3 = "", int fAlt4 = -1, string text4 = "", int str_id = 0, int str_count = 0, string strings = "", int mAlt5_mask = 0, string text5 = "", int mAlt6_mask = 0, string text6 = "") {    
			name = aname;
			show = ashow;
			x = ax;
			y = ay;
			pos = apos;
			sign = asign;
            Altf = fAlt;
            alt_text=text;
            Alt2 = fAlt2;
            alt2_text = text2;
            Alt3 = fAlt3;
            alt3_text = text3;
            Alt4 = fAlt4;
            alt4_text = text4;
            ui_mode = uim;

            string_id=str_id;
            string_count=str_count;
            this.strings = strings;

            Alt5 = 0;
            alt5_text = text5;
            Alt5_mask = mAlt5_mask;

            Alt6 = 0;
            alt6_text = text6;
            Alt6_mask = mAlt6_mask;

            //OSD.osd_switch_once updatePanelStrings(string_id, str_count, strings);
            
        }

        public void copyFrom(Panel other) {
            name = other.name;
            x = other.x;
            y = other.y;
            pos = other.pos;
            sign = other.sign;
            show = other.show;
            Altf = other.Altf;
            alt_text = other.alt_text;
            Alt2 = other.Alt2;
            alt2_text = other.alt2_text;
            Alt3 = other.Alt3;
            alt3_text = other.alt3_text;
            Alt4 = other.Alt4;
            alt4_text = other.alt4_text;
            ui_mode = other.ui_mode;

            Alt5 = other.Alt5;
            alt5_text = other.alt5_text;
            Alt5_mask = other.Alt5_mask;

            Alt6 = other.Alt6;
            alt6_text = other.alt6_text;
            Alt6_mask = other.Alt6_mask;

            string_id = other.string_id;
            string_count = other.string_count;
        }
	}
}

