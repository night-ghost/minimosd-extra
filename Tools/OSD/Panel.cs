using System;

namespace OSD {
	
	[Serializable]// "Pitch", pan.panPitch, 22, 10, panPitch_en_ADDR, panPitch_x_ADDR, panPitch_y_ADDR
	public class Panel {
		public string name;
		public int x, y;
		public int pos;
		public Func<int,int,int>show;
		
		public Panel(String aname, Func<int,int,int>ashow, int ax, int ay, int apos) {
			name = aname;
			show = ashow;
			x = ax;
			y = ay;
			pos = apos;
		}
	}
}

