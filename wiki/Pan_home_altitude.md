# Home Altitude #

This panel indicates your height above your home position in meters if you set metric system for units of measurement, and feet if imperial.

## It works this way: ##

When APM boots and gets GPS lock, it checks your height above sea level than calibrates you barometric pressure sensor. After this it is using barometric height by default.
From this moment, MinimOSD-Extra stores this height, than subtracts it from your actual true height. So you see the home altitude.

(You can change it in APM parameters to use only GPS to measure height, or only barometric height (this is default) or a mix of both.)