using System;
using System.Windows.Forms;

namespace OSD {
	
	// проще и лучше чем эти туплы :)
	
	[Serializable]// "Pitch", pan.panPitch, 22, 10, panPitch_en_ADDR, panPitch_x_ADDR, panPitch_y_ADDR
	public class Panel { 
		public string name;
		public int x, y;
		public int pos;
		public int sign; // 0=no 1=yes -1=disabled
        public Func<int, int, int, int, int> show;
        public int Altf;
        public string alt_text;
        public int Alt2;
        public string alt2_text;
        public int Alt3;
        public string alt3_text;
        public int Alt4;
        public string alt4_text;



		//public TreeNode node;

        public Panel(String aname, Func<int, int, int, int, int> ashow, int ax, int ay, int apos, int asign = -1, int fAlt = -1, string text = "", int fAlt2 = -1, string text2 = "", int fAlt3 = -1, string text3 = "", int fAlt4 = -1, string text4 = "") {
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
        }
	}
}

