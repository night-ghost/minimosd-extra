# Introduction #


Added to MinimOSD-extra:


- Combined plane and copter, the choice is made on the value of the EEPROM and can be changed on the fly! Eg. for VTOL

- Visibility of each panel's icon is configured individually, per screen

- Voltages, current and RSSI can be read with external inputs (with 8-points Moving average).
the source and the correction factors are specified in the configuration

- Battery2 measurement on additional pin "Batt2"

- Current Draw can be measured on additional pin "Current"

- RSSI can be measured on additional pin "RSSI" as analog or PWM

- Screen switching can be performed by an external PWM  - for use with channel numbers above 8

- PAL / NTSC switch is performed "on the fly", without rebooting - allowing the use of two cameras of different formats

- The Config tool has TLOG player - now you can check the operation of the OSD without the aircraft/copter.

- screen offsets is adjustable by Config tool.

- OSD can translate any RC channel out in PWM form - eg. for camera switching.

- Radar (like in MiniNazaOSD) and ILS (Instrumental Landing System) add-ons on HUD. Visibility is set individually.

- Changed logic of the "panels" generation so now the smaller panels can use the unused areas of the large panels.
This allowed to draw the radar, ILS and center marker within the artificial horizon

- up to 4 different screens

- Adjustable horizon. The correction factors (independent for PAL and NTSC) sets in config tool.

- GPS coordinates can be in column or in row

- coefficients for the fine-tuning of all measurements

- "Flight Results" screen is now a panel and can be placed on any screen.


This functions can be turned on and off, and placed on different screens now, using the Config. tool.


Enjoy
