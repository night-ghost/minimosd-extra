using System;

namespace OSD {
	//[StructLayout(LayoutKind.Sequential, Pack=1)]
	public struct Pos {
		public byte x;
		public byte y;
/*		bool is_on(){
			return y<0x80;
		}*/
		public Pos(int ax, int ay) {
			x = (byte)ax;
			y = (byte)ay;
		}
	}

}

