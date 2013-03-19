using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Drawing;

namespace OSD
{
    class mcm
    {

        public static Bitmap[] readMCM(string file)
        {
            Bitmap[] imagearray = new Bitmap[256];

            if (!File.Exists(file))
            {
                System.Windows.Forms.MessageBox.Show("Font file does not exist : " + file);
                return imagearray;
            }

            for (int a = 0; a < imagearray.Length; a++)
            {
                imagearray[a] = new Bitmap(12, 18);
            }

            StreamReader sr = new StreamReader(file);

            string device = sr.ReadLine();

            // 00 black   10 white   x1 = trans/grey

            int x = 0, y = 0;

            int image = 0;

            while (!sr.EndOfStream)
            {
                string line = "";
                y = 0;
                while (y < 18)
                {
                    x = 0;
                    while (x < 12)
                    {
                        if (x == 0 || x == 4 || x == 8)
                        {
                            //Console.WriteLine("line");
                            line = sr.ReadLine();
                            if (line == null)
                                return imagearray;
                        }

                        string i1 = line.Substring((x % 4) * 2, 2);

                        //Console.WriteLine(image + " " + line + " " + i1 + " " + x + " " + y);

                        if (i1 == "01" || i1 == "11")
                        {
                            imagearray[image].SetPixel(x, y, Color.Transparent);
                        }
                        else if (i1 == "00")
                        {
                            imagearray[image].SetPixel(x, y, Color.Black);
                        }
                        else if (i1 == "10")
                        {
                            imagearray[image].SetPixel(x, y, Color.White);
                        }

                        x++;
                    }
                    y++;
                }

                // left
                int left = 256 - 216;
                while ((left / 4) > 0)
                {
                    sr.ReadLine(); // 1
                    left -= 4;
                }

                image++;
            }

            return imagearray;
        }
    }
}
