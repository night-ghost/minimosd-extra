# Setting APM to communicate with MinimOSD-Extra #

There are a few requirements that have to be met, in order to be able to use MinimOSD-Extra.

1./
You need to use a Mavlink 1.0 compatible firmware on APM.

2./
You also need to have the data stream rates configured correctly. To do so, connect to Mission Planner. Go to configuration. Locate EEPROM parameters and verify that you have the following parameters configured as here;

SERIAL1\_BAUD, 57 (telemetry output at 57600)

SR1\_EXT\_STAT, 2 ( 2hz for waypoints, GPS raw, fence data, current
waypoint, etc)

SR1\_EXTRA1, 5 ( 5hz for attitude and simulation state)

SR1\_EXTRA2, 2 ( 2hz for VFR\_Hud data )

SR1\_EXTRA3, 3 ( 3hz for AHRS, Hardware Status, Wind )

SR1\_POSITION, 2 ( 2hz for location data )

SR1\_RAW\_SENS, 2 ( 2hz for raw imu sensor data )

SR1\_RC\_CHAN, 5 ( 5hz for radio input or radio output data )


If you fly copter than you also need to set SR0 also:

SR0\_EXT\_STAT, 2

SR0\_EXTRA1, 5

SR0\_EXTRA2, 2

SR0\_EXTRA3, 3

SR0\_POSITION, 2

SR0\_RAW\_SENS, 2

SR0\_RC\_CHAN, 5


Change accordingly and save the parameters to APM.

If you follow this steps, MinimOSD-Extra should work fine!