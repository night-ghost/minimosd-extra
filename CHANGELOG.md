v813:

* HUD borders can be turned off
* RADAR point can show track (3 points) - requires charset 2.4.1.2
* RSSI values now is 2 bytes and has no 255 limit

v816:

* Walkera telemetry output (for DEVO RX705/RX707 receivers) now working!
* Support of CleanFlight/MWII protocol (untested)
* Support of AutoQuad's MAVlink dialect (untested)
* support for new APM_Plane modes for quad-plane
* new parameters in Setup screen
* much more space optimizations

v817:

* Filtered out GCS messages translated by Plane 3.4+ and Copter 3.3+
* Auto Baud Rate!

v818

* fixed bug with battery
* fixed bug with time scale
* fixed bug with font uploading (auto-baud makes it broken)

* Character_Updater subproject now shares common codebase and can be used, also it can show current font
* SPI speed is lowered to prevent glitches in charset

v820

* bugfixes
* Charecter Updater HEX


v821
* fixed NTSC in CT
* better UAVtalk & mwii syncronization
* PWM_IN interrupt enabled only if used


v822 
* plane flight modes fixed

v823
* add new flag to all panels that turns on "alternate" mode for some panels
* WindSpeed, Airspeed and Groundspeed in Alternate mode shows speed on m/s instead of km/h
* new charset to show m/s

v824
* new altitude calculation scheme

ATTENTION! this version is NOT compatible with original MinimOSD tools!

v825
* MAVlink messages on your screen!

v826

* MAVlink message scrolled if length more than screen width

v827

* new tLog parser which knows .tlog format and not allows to lose sync
* thread-safe status in CT
* optimized looptime
* optimized memory usage
* no more "show battery percentage" checkbox and flag - this can be configured per-screen via "alternate" mode
* sensors to output arbitrary readings
* new GeoFence warnings

v828

* sensor has "pulse mode" checkbox
* some optimizations

v829

* Altitude panel can be reset to 0 on arming
* new logic of flight results show

v830

* fixed bug with HUD frame
* fixed bootloader dependency of SingleSerial

v831
* screen switch in rotation mode can be done only once

v832

* fixed bug with vertical speed in m/s

v833

* fixed bug with negative vertical speed

v834

* fixed bug with flight results
* fixed heading panel placement
* heading panel now can have icon 
* mavlink message scrolling can be turned off
* fixed placement of time panel
* time's semicolon is blinked

v835
* blinking of time can be turned off
* really fixed placement of time panel

v836
* support for LTM telemetry protocol (untested)


v837

* some code cleanup, recompiled with another GCC keys set
* fixed bug with Message panel

v838

* filtered out MAVlink messages from gimbal
* CT now can connect OSD' port to any another COM port (Options - Connect to COM port)
* fixed strange bug with errorneos cursor movements on Setup screen

v839
* fixed Vertical Speed panel broken in v838


v840
* fixed "No data" compiler's bug
* corrected panTune view
* some "eye candy" in panEff
* fixed panSetup bug an all
* natural time scale in TLOG player
* fixed CT bug with saving alternate function flag

v841
* "No GPS fix!" warning shown only when GPS is present

v842
* one good man from GCC team told me two "secret" (not mentioned in GCC --help) optimization flags so we now has ~1Kbyte of free space!
* thanks above - added 2nd, 3rd and 4th alternate checkboxes to each panel
* thanks above - all Horizon settings moved to Horison panel flags so it now can be setted per screen.
* modified FlightResults logics for plane
* all distances can be more than 99km
* gps coords can display only fractional part of coords
* fixed the screen sticking on a large data stream
* removed panGPS2, added flag to panGPS "Display in row" instead

v843
* 3DR modem RSSI can be used as RSSI source (if AP supports MAVlink routing)
* additional fields in flight results - current, vertical speed up & down
* support for GPS-less setup: Alt and Groundspeed works without GPS
* flight data shown on "no input data" screen - for setup on ground station


v844
* new panel for HDOP
* new panel for channel status - 5 steps


v845
* fixed bug in ChannelStatus panel
* CT clears message after 10s

v846

* panRose's scale ("icon") can be placed below
* panRose can be even size to be centered with HUD - reqires font 2.4.1.4. sacrificed characters @, ~, `

v847
* fixed NTSC inconsistency with the CT
* removed % from panRSSI in CT
* added ability to exclude MAVlink from build
* all telemetry protocol's files moved to 'protocols' folder
* fixed panel size for all distances
* fixed GPS icon for RTK modules

v848
* fixed bug with BatteryPercent in percent mode

v849
* new panel "channel scale" - graphical version of ChannelStatus

v850
* new palel "Channel value" that only shows raw value for selected channel

v851
* panel "Channel scale" now has an ability to use extended PWM range (thanks to Tonyyng)

v582
* panel "Channel status" got extended PWM range too
* screen update moved to ISR so OSD now is completely snow-free
* first try to support EEPROM streengs
* first try to make config via MAVlink
* 852a - fixed bug with flickering panels
* 852b - fixed framerate bug
* 852c - again fixed framerate bug

v853
* strings now are working! And Channel State panel uses first 5 of them

v854
* an attempt to recover a hung MAX7456

v855
* write configuration via MAVlink is now working! But only on recent verions of ArduPilot which translates GCS messages to output

v856
*fixed bug with panel's properties visibility
* 856a - fixed bug with incorrect restoring panel's flags

v857
* fixed bug with panel selection in CT
* complementary filter of panEff changed from 1/10 to 1/100
* a try to change Horizon behavior for large banks (>70grad)
* minor fixes

v858
* fixed some CT bugs
* localisation support! lang.txt file in EXE's folder, 
* support of timed screen switch (untested)
* file default.osd loaded at startup if present
* fixed bug with reverse RSSI
* Fixed Horizon behavior for large banks
* Flight Data turned off by mode switch or throttle stick
* Real Heading field width increased
* check of flash contents after write! no more bugs caused by flash write errors
* ILS now allows plane to come to runway from opposite direction
* fixed bug in ILS with HUD size
* when landing markers are not visible ILS now show arrows to help find smaller turn
* some size optimizations to fit all above :)

v859
* UAVtalk is now working!

v860
* MAVLink don't loses sync on CRC errors

v861
* some bugfixes

v862
* fixed hangup in Setup screen
* fixed no-signal UAVtalk behavior
* fixed stick direstions in Setup
* fixed sensors in Setup

v863
* project moved to per-protocol builds so now filename is MinimOsd_Extra_Uni.{version}DV-{protocol}-{built type}.hex
* reversed wind direction
* fixed panEff
* added Max Wind Speed to Flight Data panel
* some code optimizations

v864
* detects frozen datastreams and (if TX connected) tries to re-request them.

v865
* calculates adequate stream rate for current COM-port baudrate.
* detects overloaded datastreams and (if TX connected) tries to re-request them at less rate.
* minor fixes
* CT shows TLOG time


v866
* wind direction can be reversed in CT
* fixed panWarning bug
* optimized stack usage

v867
* reversed roll in horizon AKA Russian HUD

v868
* fixed lot of bugs in latest features

v869
* support for copter's Brake and Throw modes

v870
* unknown new modes shown as numbers but not as screen garbage

v871
* fixed fly time

v872
* added detected port speed to "no data" screen

v873
* 'Russian HUD' flag moved to per-screen flags
* coordinates in Flight Data panel can be shown in 2nd column
* added ability to show "%" sign for RSSI

v874
* fixed Russian HUD flag now working

v875
* UAVtalk works again!
* fixed underflow bug in panRose
* fixed lagre pitch horizon behavior

v876
* UAVtalk uses BaroAlt when no GPS.
* fixed flight time counting
* fixed RussianHUD on startup screen


v877
* new Power panel which shows mean consumed power (smoothing by complementary filter 1:10)
* maximal power added to flight results (FlightData panel)
* all complementary filters are unified
* trip distance not grows when "No input data"

v878
* Compiler downgraded to 4.8.1 so that got rid of many compiler-related bugs (rssi not works, timer stats from wrong numbers etc)
* Fixed the behavior of the overflow detector of MAVLink stream 


v879
* fixed Voltage and Altitude for UAVtalk
* added Temperature (by Baro) for UAVtalk
* if MAX7456 loses VSYNC interrupts then OSD switch to old-style refresh by timer - snow on scren is better than freeze
* Output PWM generation is doing in VSYNC

v880
* a try to get battery capacity for UAVTalk and calculate % remaining
* slightly changed the order of reinitialization when MAX hangs


v881
* efficiency can show only mah/km
* "flight data" screen after flight can be turned off
* some code cleanup
* "connect to COM-port" in CT now bidirectional
* a try to revive MSP protocol (MWII Cleanflight Betaflight INAV) - now OSD sends requests for data


v882
* fixed rounding bug in UAVtalk

v883
* fixed bug when OSD freezes
* in CT "connect to COM port" now can set port speed 
* MWII protocol now works!

v884
* fixed NTSC mode in CT
* Battery2 voltage can be get via MAVlink

v885
* voltages and current panels can be smoothed by filter by choose 1:10, 1:100 or 1:1000

v886
* added osdbuf bounds check by jussip

v887
* GeoFence warnings can be turned off
* fixed some scales in MWII protocol
* fixed non-GPS speed bug
* home position can be cleared on disarm (flag in panel HomeDistance)

v888
* filters changed to 1:10, 1:30, 1:100
* ability to show less accurate voltage and current - only tenth
* narrow size of all heights
* adjusted vertical speed in m/s mode
* fixed bug with distances more 32km

v889
* support for new ArduCopter versions which uses MAVLINK_MSG_ID_RC_CHANNELS instead of MAVLINK_MSG_ID_RC_CHANNELS_RAW

v890
* added recent MAVlink 1.0 massages
* new panels - date & time. Works only  in recent ArduPilot versions!
* panel Home Direction now has a angle in numerical form
* added filter to RSSI panel
* auto-calibration of screen switch in LEVEL switch mode
* added on/off mode to PWM output translation

v891
* fixed callsign saving
* fixed 3DR rssi problem at ground station
* added ability to turn off horizon line
* added parsing of VIBRATIONS MAVlink message

v892
* added panel Vibrations
* fixed MAVlink parsing in CT
* fixed Units selection


v893
* added selectable filter to vertical speed
* accuracy of vertical speed can be reduced to 1 decimal digit

v894
* new panel Variometer
* RADAR arrow direction now is relative to home

v895
* RSSI max value now 4096

v896
* added "twice" checkbox to variometer
* fixed some bugs

v897
* fixed efficiency

v898
* fixed bug in Vibrations panel

v899
* fixed another bug in Vibrations panel
* warnings on clear screen moved to usable place
* some memory optimizations

v900
* fixed RSSI scale
* a draft to support RadioLink telemetry output

v901
* added "*4" checkbox to variometer

v902
* added ability to change show time for messages

v903
* fixed bug with vario zero position

v904
* fixed bug with message time

v905
* fixed NTSC horizon bug
* added checkbox in RadarScale to select UAV arrow direction

v906
* fixed AutoBaudRate
* optimized EEPROM usage

v907 - TEST VERSION!
* removed usage of nested interrupts

v908
* added support for boards without connected VSYNC

v909
* fixed bug with MAVlink message

v910 - THE TEST VERSION!!!
* a try to work on myairbot's board

v911 - THE TEST VERSION!!!
* another try to work on myairbot's board and not spoil regular boards

v912
* added NMEA protocol - now this firmware can be used without any FC

v913
* added new panel - motors output
* fixed last CT bugs

v914
* separated panels for coordinates Lat and Lon

v915
* fixed bug with font uploading
* HomeAlt can use alternate altitude source

v916
* panAlt can use alternate altitude source

v917
* Variometer speed can be in m/s
* fixed variometer's 0-pos bug
* built-in font uploader can be disabled

v918
* a try to run on airbot's board - thanks vierfuffzig!

v919
* added "used mAh" to Flight Data screen

v920
* added ability to use output pin PWM_OUT as negative 

v921
*fixed bug in MAV_BATERRY2 message parsing

v922
* fixed bug with negative TZ shift

v923
fixed size issue

v924
fixed size issue again. Flash is full :(

v925
* font uploader moved out from main firmware. Use Character_Updater_FW.hex instead.
* HeartBeat packets generated only if 3DR RSSI selected

v926
* fixed startup hang after removing font uploader

v927
* added EEPROM reading via MAVlink
* fixed bug with "Reading param 12" in MP

v928
*turned off forgotten DEBUG

v929
* added ability to choose ADC refrence voltage - Vcc or 1.1v internal

v930
* fixed startup hang from v929

v931
* added baudrate setting for NMEA protocol

v932
* debug version

v933
* fixed bug in baudrate setting for NMEA protocol

v934
* code for "by 200" screen switch by Marc Merlin

v935
* fixed \r\n for NMEA protocol

v936
* added fix from MarcMerlin - https://github.com/night-ghost/minimosd-extra/issues/202

v937
* all calculations in NMEA mode are doing in float

v938
* Preliminary support for PX4 firmware

v939
* "Motor Dead" warning from Marc Merlin

v940
* filly working binaries: fixed strange GCC bug in osd::write_S

v941
* fixed bug in "Motor Dead" warning
* refusal from the Arduino's digitalWrite/pinMode gives ~600 free bytes of flash.
* added new ADSB panel, requires font update to 2.4.1.6 (experimental)

v942
* fixed bug with empty screen
* fixed bug in climbRate
* changed variometer's scale

v943
* removed integer filtration of voltage in favor of built-in filtering in float
* used filtered voltages for warnings

