using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Net;
using System.Diagnostics;
using System.Text.RegularExpressions;

//Get web file list 
//http://stackoverflow.com/questions/124492/c-sharp-httpwebrequest-command-to-get-directory-listing

//Download web file
//http://social.msdn.microsoft.com/Forums/en-US/b489fe1d-a237-48ac-b58a-f901e1b03bde/file-download-how-to-use-httpwebrequestrespone?forum=vssmartdevicesvbcs

namespace CTToolUpdater
{
    class Program
    {
        static string webUrl = "http://89.133.194.55:28/ct/ct/Stable/";
        static string localDestnDir = AppDomain.CurrentDomain.BaseDirectory;

        static void Main(string[] args)
        {
            string[] files = GetFileList();
            if(!Directory.Exists(localDestnDir + @"\Temp\"))
            {
                Directory.CreateDirectory(localDestnDir + @"\Temp\");
            }
            foreach (string file in files)
            {
                DownloadFile(webUrl + file, localDestnDir + @"\Temp\" + file);
            }
            foreach (string file in Directory.GetFiles(localDestnDir + @"Temp\"))
            {
                File.Copy(file, localDestnDir + Path.GetFileName(file), true);
            }
            Process.Start(localDestnDir + @"\OSD_Config.exe");
        }

        public static string GetDirectoryListingRegexForUrl(string url)
        {
            if (url.Equals("http://89.133.194.55:28/ct/ct/Stable/"))
            {
                return "<a href=\".*\">(?<name>.*)</a>";
            }
            throw new NotSupportedException();
        }

        private static string[] GetFileList()
        {
            List<string> downloadFiles = new List<string>();
            StringBuilder result = new StringBuilder();
            //WebResponse response = null;
            //StreamReader reader = null;
            HttpWebResponse response = null;
            StreamReader reader = null;
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(webUrl);
                using (response = (HttpWebResponse)request.GetResponse())
                {
                    using (reader = new StreamReader(response.GetResponseStream()))
                    {
                        string html = reader.ReadToEnd();
                        Regex regex = new Regex(GetDirectoryListingRegexForUrl(webUrl));
                        MatchCollection matches = regex.Matches(html);
                        if (matches.Count > 0)
                        {
                            foreach (Match match in matches)
                            {
                                if (match.Success)
                                {
                                    if ((match.Groups["name"].ToString() != "Description") && (match.Groups["name"].ToString() != "Parent Directory"))
                                        downloadFiles.Add(match.Groups["name"].ToString());
                                }
                            }
                        }
                    }
                }
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
                downloadFiles = new List<string>();
            }
            return downloadFiles.ToArray();
        }

        public static int DownloadFile(String remoteFilename, String localFilename)
        {
            // Function will return the number of bytes processed
            // to the caller. Initialize to 0 here.
            int bytesProcessed = 0;

            // Assign values to these objects here so that they can
            // be referenced in the finally block
            Stream remoteStream = null;
            Stream localStream = null;
            WebResponse response = null;

            // Use a try/catch/finally block as both the WebRequest and Stream
            // classes throw exceptions upon error
            try
            {
                // Create a request for the specified remote file name
                WebRequest request = WebRequest.Create(remoteFilename);
                if (request != null)
                {
                    // Send the request to the server and retrieve the
                    // WebResponse object 
                    response = request.GetResponse();
                    if (response != null)
                    {
                        // Once the WebResponse object has been retrieved,
                        // get the stream object associated with the response's data
                        remoteStream = response.GetResponseStream();

                        // Create the local file
                        localStream = File.Create(localFilename);

                        // Allocate a 1k buffer
                        byte[] buffer = new byte[1024];
                        int bytesRead;

                        // Simple do/while loop to read from stream until
                        // no bytes are returned
                        do
                        {
                            // Read data (up to 1k) from the stream
                            bytesRead = remoteStream.Read(buffer, 0, buffer.Length);

                            // Write the data to the local file
                            localStream.Write(buffer, 0, bytesRead);

                            // Increment total bytes processed
                            bytesProcessed += bytesRead;
                        } while (bytesRead > 0);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                // Close the response and streams objects here 
                // to make sure they're closed even if an exception
                // is thrown at some point
                if (response != null) response.Close();
                if (remoteStream != null) remoteStream.Close();
                if (localStream != null) localStream.Close();
            }

            // Return total bytes processed to caller.
            return bytesProcessed;
        }
    }
}
