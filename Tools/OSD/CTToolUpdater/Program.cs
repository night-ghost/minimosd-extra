using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Net;
using System.Diagnostics;

//Get Files
//http://social.msdn.microsoft.com/Forums/en-US/079fb811-3c55-4959-85c4-677e4b20bea3/downloading-all-files-in-directory-ftp-and-c?forum=ncl

namespace CTToolUpdater
{
    class Program
    {
        static string ftpServerIP = "";
        static string remoteDir = "Stable";
        static string ftpUserID = "";
        static string ftpPassword = "";
        static string localDestnDir = AppDomain.CurrentDomain.BaseDirectory;

        static void Main(string[] args)
        {
            string[] files = GetFileList();
            foreach (string file in files)
            {
                Download(file);
            }
            Process.Start(localDestnDir + @"\OSD_Config.exe");
        }

        private static string[] GetFileList()
        {
            string[] downloadFiles;
            StringBuilder result = new StringBuilder();
            WebResponse response = null;
            StreamReader reader = null;
            try
            {
                FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + ftpServerIP + "/" + remoteDir + "/"));
                request.Credentials = new NetworkCredential(ftpUserID, ftpPassword);
                request.Method = WebRequestMethods.Ftp.ListDirectory;
                request.UseBinary = true;
                request.Proxy = null;
                request.KeepAlive = false;
                request.UsePassive = false;
                response = request.GetResponse();
                reader = new StreamReader(response.GetResponseStream());
                string line = reader.ReadLine();
                while (line != null)
                {
                    result.Append(line);
                    result.Append("\n");
                    line = reader.ReadLine();
                }
                // to remove the trailing '\n'
                result.Remove(result.ToString().LastIndexOf('\n'), 1);
                return result.ToString().Split('\n');
            }
            catch (Exception ex)
            {
                if (reader != null)
                {
                    reader.Close();
                }
                if (response != null)
                {
                    response.Close();
                }                
                downloadFiles = null;
                return downloadFiles;
            }
        }

        private static void Download(string file)
        {                       
            try
            {                
                string uri = "ftp://" + ftpServerIP + "/" + remoteDir + "/" + file;
                Uri serverUri = new Uri(uri);
                if (serverUri.Scheme != Uri.UriSchemeFtp)
                {
                    return;
                }       
                FtpWebRequest reqFTP;                
                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri(uri));                                
                reqFTP.Credentials = new NetworkCredential(ftpUserID, ftpPassword);                
                reqFTP.KeepAlive = false;                
                reqFTP.Method = WebRequestMethods.Ftp.DownloadFile;                                
                reqFTP.UseBinary = true;
                reqFTP.Proxy = null;                 
                reqFTP.UsePassive = false;
                FtpWebResponse response = (FtpWebResponse)reqFTP.GetResponse();
                Stream responseStream = response.GetResponseStream();
                FileStream writeStream = new FileStream(localDestnDir + @"\" + file, FileMode.Create);                
                
                int Length = 2048;
                Byte[] buffer = new Byte[Length];
                int bytesRead = responseStream.Read(buffer, 0, Length);               
                while (bytesRead > 0)
                {
                    writeStream.Write(buffer, 0, bytesRead);
                    bytesRead = responseStream.Read(buffer, 0, Length);
                }                
                writeStream.Close();
                response.Close(); 
            }
            catch (WebException wEx)
            {
                Console.WriteLine(wEx.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message, "Download Error");
            }
        }
    }
}
