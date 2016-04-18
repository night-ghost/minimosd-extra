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
		public Func<int,int,int,int,int>show;
        public int Altf;
        public string alt_text;
		//public TreeNode node;
		
		public Panel(String aname, Func<int,int,int,int,int>ashow, int ax, int ay, int apos, int  asign=-1, int fAlt=-1, string text="") {
			name = aname;
			show = ashow;
			x = ax;
			y = ay;
			pos = apos;
			sign = asign;
            Altf = fAlt;
            alt_text=text;
		}
	}
}

