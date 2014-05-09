using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Net;

namespace OSD
{
    static class Updater
    {
        public static bool NewVersionExists(string currentVersion)
        { 
            string latestStableCTToolVersion = "";
            try
            {
                string localFwDir = AppDomain.CurrentDomain.BaseDirectory + "\\FW";

                if (!Directory.Exists(localFwDir))
                    Directory.CreateDirectory(localFwDir);
                FileStream latestStableCTTool = new FileStream(localFwDir + "\\latestStableCTToolVersion.tmp", FileMode.Create);

                FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://gabek.dyndns.org:23/Stable/version.txt"));
                request.Credentials = new NetworkCredential("ct", "secret01201");
                request.Method = WebRequestMethods.Ftp.DownloadFile;
                request.UseBinary = true;

                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                Stream ftpStream = response.GetResponseStream();
                long cl = response.ContentLength;
                int bufferSize = 2048;
                int readCount;
                byte[] buffer = new byte[bufferSize];
                readCount = ftpStream.Read(buffer, 0, bufferSize);
                while (readCount > 0)
                {
                    latestStableCTTool.Write(buffer, 0, readCount);
                    readCount = ftpStream.Read(buffer, 0, bufferSize);
                }
                ftpStream.Close();
                latestStableCTTool.Close();
                response.Close();

                StreamReader sr = new StreamReader(localFwDir + "\\latestStableCTToolVersion.tmp");
                latestStableCTToolVersion = sr.ReadLine();
            }
            catch
            {
                return false;
            }
            return latestStableCTToolVersion == currentVersion;
        }
    }
}
