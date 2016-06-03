1./OSD can get RSSI from 5 available sources: MAVlink, RC channel 8, 3DR modems and from pin "RSSI", available on some boards, in analog or PWM form.

To use RSSI via MAVlink You need to enable this function in APM. Go to MP than look for it in advanced parameters.

I have changed it to 6 as I use analog port 6. If you use a different port, replace 6 with your analog port number.

After this you can compile and upload.

2./
You have to teach OSD to "read your receiver".

http://gabek.dyndns.org:28/wiki/7.PNG

Open Config. Tool check the "RSSI Enable Raw" check-box so when you power up your OSD with APM, you will see the raw values. After APM have booted up and you have your TX working (antenna pulled out), than it will show the raw value that you set in "RSSI Max Value" box.
Than turn your tx off, so it will show the raw value that you set in "RSSI Min Value" box. This value can be more than "RSSI Max Value", it is normal.

Than plug your OSD to FTDI again, and uncheck "RSSI Raw Value" check-box, than save it to OSD.
After this OSD will show RSSI in percents.
