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
        static string webUrl = "http://89.133.194.55:28/ct/ct/Stable/";

        public static bool NewVersionExists(string currentVersion)
        { 
            string latestStableCTToolVersion = "";
            try
            {
                string localFwDir = AppDomain.CurrentDomain.BaseDirectory;

                if (!Directory.Exists(localFwDir))
                    Directory.CreateDirectory(localFwDir);
                //FileStream latestStableCTTool = new FileStream(localFwDir + "\\latestStableCTToolVersion.txt", FileMode.Create);

                DownloadFile(webUrl + "version.txt", localFwDir + "latestStableCTToolVersion.txt");

                StreamReader sr = new StreamReader(localFwDir + "latestStableCTToolVersion.txt");
                latestStableCTToolVersion = sr.ReadLine();
            }
            catch
            {
                return false;
            }
            return latestStableCTToolVersion != currentVersion;
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
