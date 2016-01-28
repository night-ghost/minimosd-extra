#include "compat.h"

#include "../GCS_MAVLink/include/mavlink/v1.0/mavlink_types.h"
#include "../GCS_MAVLink/include/mavlink/v1.0/ardupilotmega/mavlink.h"

#define ToDeg(x) (x*57.2957795131) // *180/pi



// true when we have received at least 1 MAVLink packet
//static bool mavlink_active = 0; // флаг активности (навсегда)
static uint8_t crlf_count = 0;

// static int packet_drops = 0; unused
// static int parse_error = 0; unused

extern struct loc_flags lflags;  // все булевые флаги кучей

//uint8_t mavlink_got = 0; // флаг получения пакета
//uint8_t mavlink_on = 0;  // флаг активности (сбрасывается по таймауту)


/*
void request_mavlink_rates()
{
    const uint8_t  maxStreams = 6;
    
    const uint8_t MAVStreams[maxStreams] = {MAV_DATA_STREAM_RAW_SENSORS,
        MAV_DATA_STREAM_EXTENDED_STATUS,
        MAV_DATA_STREAM_RC_CHANNELS,
        MAV_DATA_STREAM_POSITION,
        MAV_DATA_STREAM_EXTRA1, 
        MAV_DATA_STREAM_EXTRA2};

    const uint16_t MAVRates[maxStreams] = {0x02, 0x02, 0x05, 0x02, 0x05, 0x02};
    for (int i=0; i < maxStreams; i++) {
        mavlink_msg_request_data_stream_send(MAVLINK_COMM_0,
            apm_mav_system, apm_mav_component,
            MAVStreams[i], MAVRates[i], 1);
    }
}
*/

void read_mavlink(){
    mavlink_message_t msg; 
    mavlink_status_t status;

    uint8_t      base_mode=0;

    lflags.mavlink_got=0;	// нет данных


    //grabing data 
    while(Serial.available() > 0) { 
        uint8_t c = Serial.read();


        /* allow CLI to be started by hitting enter 3 times, if no
        heartbeat packets have been received */
        if (!lflags.mavlink_active && millis() < 20000 && millis() > 3000) {
            if (c == '\n' || c == '\r') {
                crlf_count++;
            } else {
                crlf_count = 0;
            }
            if (crlf_count >= 3) {
                uploadFont();
            }
        }

        //trying to grab msg  
        if(mavlink_parse_char(MAVLINK_COMM_0, c, &msg, &status)) {
            lastMAVBeat = millis();
            lflags.mavlink_active = lflags.mavlink_on = lflags.mavlink_got = 1;

//digitalWrite(LEDPIN, !digitalRead(LEDPIN)); // Эта строка мигает светодиодом на плате. Удобно и прикольно :)

            //handle msg
            switch(msg.msgid) {
            case MAVLINK_MSG_ID_HEARTBEAT:
                {
                    lflags.mavbeat = 1;
                    apm_mav_system    = msg.sysid;
                    apm_mav_component = msg.compid;
                 //   apm_mav_type      = mavlink_msg_heartbeat_get_type(&msg);            
                    osd_mode = (uint8_t)mavlink_msg_heartbeat_get_custom_mode(&msg);
                    //Mode (arducoper armed/disarmed)
                    base_mode = mavlink_msg_heartbeat_get_base_mode(&msg);

                    lflags.motor_armed = getBit(base_mode,7);
                }
                break;
                
            case MAVLINK_MSG_ID_SYS_STATUS:
                {
                    if(!flags.useExtVbattA){
                        osd_vbat_A = mavlink_msg_sys_status_get_voltage_battery(&msg) ; //Battery voltage, in millivolts (1 = 1 millivolt)
                        osd_battery_remaining_A = mavlink_msg_sys_status_get_battery_remaining(&msg); //Remaining battery energy: (0%: 0, 100%: 100)
                    }
                    if (!flags.useExtCurr)
                        osd_curr_A = mavlink_msg_sys_status_get_current_battery(&msg); //Battery current, in 10*milliamperes (1 = 10 milliampere)

                    //osd_mode = apm_mav_component;//Debug
                }
                break;

            case MAVLINK_MSG_ID_GPS_RAW_INT:
                {
                    osd_alt_gps = mavlink_msg_gps_raw_int_get_alt(&msg);  // *1000
                    osd_lat = mavlink_msg_gps_raw_int_get_lat(&msg) / 10000000.0f;
                    osd_lon = mavlink_msg_gps_raw_int_get_lon(&msg) / 10000000.0f;
                    osd_fix_type = mavlink_msg_gps_raw_int_get_fix_type(&msg);
                    osd_satellites_visible = mavlink_msg_gps_raw_int_get_satellites_visible(&msg);
                    osd_cog = mavlink_msg_gps_raw_int_get_cog(&msg);
                    eph = mavlink_msg_gps_raw_int_get_eph(&msg);
                }
                break; 

            case MAVLINK_MSG_ID_VFR_HUD:
                {
                    osd_airspeed = mavlink_msg_vfr_hud_get_airspeed(&msg);
                    osd_groundspeed = mavlink_msg_vfr_hud_get_groundspeed(&msg);
                    osd_heading = mavlink_msg_vfr_hud_get_heading(&msg); // 0..360 deg, 0=north
                    osd_throttle = (uint8_t)mavlink_msg_vfr_hud_get_throttle(&msg);
                    osd_alt_rel = mavlink_msg_vfr_hud_get_alt(&msg);
                    osd_climb = mavlink_msg_vfr_hud_get_climb(&msg);
                }
                break;

            case MAVLINK_MSG_ID_ATTITUDE:
                {
                    osd_pitch = ToDeg(mavlink_msg_attitude_get_pitch(&msg));
                    osd_roll = ToDeg(mavlink_msg_attitude_get_roll(&msg));
//                    osd_yaw = ToDeg(mavlink_msg_attitude_get_yaw(&msg));
                }
                break;
            case MAVLINK_MSG_ID_NAV_CONTROLLER_OUTPUT:
                { //desired values
                  wp_target_bearing = mavlink_msg_nav_controller_output_get_target_bearing(&msg);
                  wp_dist = mavlink_msg_nav_controller_output_get_wp_dist(&msg);
#ifdef IS_PLANE
                  nav_roll = mavlink_msg_nav_controller_output_get_nav_roll(&msg);
                  nav_pitch = mavlink_msg_nav_controller_output_get_nav_pitch(&msg);
                  nav_bearing = mavlink_msg_nav_controller_output_get_nav_bearing(&msg);
                  alt_error = mavlink_msg_nav_controller_output_get_alt_error(&msg);
                  aspd_error = mavlink_msg_nav_controller_output_get_aspd_error(&msg);
#endif
                  xtrack_error = mavlink_msg_nav_controller_output_get_xtrack_error(&msg);
                }
                break;

            case MAVLINK_MSG_ID_MISSION_CURRENT:
                {
                    wp_number = (uint8_t)mavlink_msg_mission_current_get_seq(&msg);
                }
                break;

            case MAVLINK_MSG_ID_RC_CHANNELS_RAW:
                {
                    chan_raw[0] = mavlink_msg_rc_channels_raw_get_chan1_raw(&msg);
                    chan_raw[1] = mavlink_msg_rc_channels_raw_get_chan2_raw(&msg);
                    chan_raw[2] = mavlink_msg_rc_channels_raw_get_chan3_raw(&msg);
                    chan_raw[3] = mavlink_msg_rc_channels_raw_get_chan4_raw(&msg);
                    chan_raw[4] = mavlink_msg_rc_channels_raw_get_chan5_raw(&msg);
                    chan_raw[5] = mavlink_msg_rc_channels_raw_get_chan6_raw(&msg);
                    chan_raw[6] = mavlink_msg_rc_channels_raw_get_chan7_raw(&msg);
                    chan_raw[7] = mavlink_msg_rc_channels_raw_get_chan8_raw(&msg);
                    osd_rssi = mavlink_msg_rc_channels_raw_get_rssi(&msg);
                }
                break;           

            case MAVLINK_MSG_ID_WIND:
                {
                    osd_winddirection = mavlink_msg_wind_get_direction(&msg); // 0..360 deg, 0=north
                    osd_windspeed = mavlink_msg_wind_get_speed(&msg); //m/s
//                    osd_windspeedz = mavlink_msg_wind_get_speed_z(&msg); //m/s
                }
                break;

            case MAVLINK_MSG_ID_SCALED_PRESSURE:
                {
                    temperature = mavlink_msg_scaled_pressure_get_temperature(&msg);
/*

packet.press_abs = press_abs;
packet.press_diff = press_diff;

*/
                    
                }
                break;

#if 0
            case MAVLINK_MSG_ID_SCALED_PRESSURE2:
                    temperature = mavlink_msg_scaled_pressure2_get_temperature(&msg);
/*

packet.press_abs = press_abs;
packet.press_diff = press_diff;

*/
                break;
#endif

#ifdef IS_PLANE
            case MAVLINK_MSG_ID_GLOBAL_POSITION_INT: 
                { 
                    //osd_home_alt = osd_alt - (mavlink_msg_global_position_int_get_relative_alt(&msg)*0.001); 
                    //Commented because it seems that we only get relative alt when we have GPS lock.
                    //That shouldn't be because we may rely only on baro. So using vfr hud alt (testing)
                    //osd_alt_rel = (mavlink_msg_global_position_int_get_relative_alt(&msg)*0.001);
                    
                    osd_home_alt = osd_alt_rel - mavlink_msg_global_position_int_get_relative_alt(&msg);
                }
                break; 
#endif
            default:
                //Do nothing
                break;
            }
        }
        delayMicroseconds(138);
        //next one
    }
    // Update global packet drops counter
//    packet_drops += status.packet_rx_drop_count;
//    parse_error += status.parse_error;

}
