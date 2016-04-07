#include "compat.h"

#define ToDeg(x) (x*57.2957795131) // *180/pi


extern struct loc_flags lflags;  // все булевые флаги кучей


/* перенастраивать оборудование без спроса - моветон
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


/* in  protocols.h
union {
    struct {
	mavlink_message_t m;
	mavlink_status_t status;
    } mv;    uavtalk_message_t u;
} msg;
*/

/*      allow CLI to be started by hitting enter 3 times, if no
        heartbeat packets have been received but not more than 3 seconds 
*/

bool read_mavlink(){
    uint8_t      base_mode=0;
    mavlink_status_t status;

#ifdef DEBUG
    // Update global packet drops counter
    status.packet_rx_drop_count = 0;
#endif

    //grabing data 
    while(Serial.available_S()) {
        uint8_t c = Serial.read_S();
        byte apm_mav_type;
//LED_BLINK;

#ifdef DEBUG
	bytes_comes+=1;
#endif
//        if (!lflags.mavlink_active) try_upload_font(c);

        //trying to grab msg  Mavlink library patched and buffer is static
        if(mavlink_parse_char(MAVLINK_COMM_0, c, NULL, &status)) {

            set_data_got(); //lastMAVBeat = millis();

#ifdef DEBUG
Serial.printf_P(PSTR("\ngot id=%d\n"), msg.m.msgid);
#endif

            lflags.mavlink_active = 1;

	    if( msg.m.msgid!=MAVLINK_MSG_ID_HEARTBEAT &&                // not heartbeat
		apm_mav_system && apm_mav_system != msg.m.sysid)        // another system
		    break; // skip packet

            //handle msg
            switch(msg.m.msgid) {
            case MAVLINK_MSG_ID_HEARTBEAT:
                apm_mav_type = mavlink_msg_heartbeat_get_type(&msg.m);  // quad hexa octo etc
                if(apm_mav_type == 6) break; // GCS
                
                apm_mav_system    = msg.m.sysid;
                apm_mav_component = msg.m.compid;

                osd_autopilot = mavlink_msg_heartbeat_get_autopilot(&msg.m);
                osd_mode = (uint8_t)mavlink_msg_heartbeat_get_custom_mode(&msg.m);
                //Mode (arducoper armed/disarmed)
                base_mode = mavlink_msg_heartbeat_get_base_mode(&msg.m);

                lflags.motor_armed = getBit(base_mode,7);
                break;
                
            case MAVLINK_MSG_ID_SYS_STATUS:
                if(!flags.useExtVbattA){
                    osd_vbat_A = mavlink_msg_sys_status_get_voltage_battery(&msg.m) ; //Battery voltage, in millivolts (1 = 1 millivolt)
                    osd_battery_remaining_A = mavlink_msg_sys_status_get_battery_remaining(&msg.m); //Remaining battery energy: (0%: 0, 100%: 100)
                }
                if(!flags.useExtCurr)
                    osd_curr_A = mavlink_msg_sys_status_get_current_battery(&msg.m); //Battery current, in 10*milliamperes (1 = 10 milliampere)

                //osd_mode = apm_mav_component;//Debug
                break;

            case MAVLINK_MSG_ID_GPS_RAW_INT:
                osd_pos.alt = mavlink_msg_gps_raw_int_get_alt(&msg.m);  // *1000
                gps_norm(osd_pos.lat,mavlink_msg_gps_raw_int_get_lat(&msg.m));
                gps_norm(osd_pos.lon,mavlink_msg_gps_raw_int_get_lon(&msg.m));
                osd_fix_type = mavlink_msg_gps_raw_int_get_fix_type(&msg.m);
                osd_satellites_visible = mavlink_msg_gps_raw_int_get_satellites_visible(&msg.m);
                osd_cog = mavlink_msg_gps_raw_int_get_cog(&msg.m);
                eph = mavlink_msg_gps_raw_int_get_eph(&msg.m);
                break; 

            case MAVLINK_MSG_ID_VFR_HUD:
                osd_airspeed = mavlink_msg_vfr_hud_get_airspeed(&msg.m);
                osd_groundspeed = mavlink_msg_vfr_hud_get_groundspeed(&msg.m);
                osd_heading = mavlink_msg_vfr_hud_get_heading(&msg.m); // 0..360 deg, 0=north
                osd_throttle = (uint8_t)mavlink_msg_vfr_hud_get_throttle(&msg.m);
                osd_alt_rel = mavlink_msg_vfr_hud_get_alt(&msg.m);
                //osd_baro_alt = mavlink_msg_vfr_hud_get_alt(&msg.m);  //  Current altitude (MSL), in meters
                osd_climb = mavlink_msg_vfr_hud_get_climb(&msg.m);
                break;

            case MAVLINK_MSG_ID_ATTITUDE:
                osd_att.pitch = ToDeg(mavlink_msg_attitude_get_pitch(&msg.m));
                osd_att.roll  = ToDeg(mavlink_msg_attitude_get_roll(&msg.m));
                osd_att.yaw   = ToDeg(mavlink_msg_attitude_get_yaw(&msg.m));
//Serial.printf_P(PSTR("pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();
//LED_BLINK;
                break;

            case MAVLINK_MSG_ID_NAV_CONTROLLER_OUTPUT:
             //desired values
                wp_target_bearing = mavlink_msg_nav_controller_output_get_target_bearing(&msg.m);
                wp_dist = mavlink_msg_nav_controller_output_get_wp_dist(&msg.m);
#ifdef IS_PLANE
                nav_roll = mavlink_msg_nav_controller_output_get_nav_roll(&msg.m); // for panTune only
                nav_pitch = mavlink_msg_nav_controller_output_get_nav_pitch(&msg.m);// for panTune only
                nav_bearing = mavlink_msg_nav_controller_output_get_nav_bearing(&msg.m);
                alt_error = mavlink_msg_nav_controller_output_get_alt_error(&msg.m);
                aspd_error = mavlink_msg_nav_controller_output_get_aspd_error(&msg.m);
#endif
                xtrack_error = mavlink_msg_nav_controller_output_get_xtrack_error(&msg.m);
                break;

            case MAVLINK_MSG_ID_MISSION_CURRENT:
                wp_number = (uint8_t)mavlink_msg_mission_current_get_seq(&msg.m);
                break;

            case MAVLINK_MSG_ID_RC_CHANNELS_RAW:
                chan_raw[0] = mavlink_msg_rc_channels_raw_get_chan1_raw(&msg.m);
                chan_raw[1] = mavlink_msg_rc_channels_raw_get_chan2_raw(&msg.m);
                chan_raw[2] = mavlink_msg_rc_channels_raw_get_chan3_raw(&msg.m);
                chan_raw[3] = mavlink_msg_rc_channels_raw_get_chan4_raw(&msg.m);
                chan_raw[4] = mavlink_msg_rc_channels_raw_get_chan5_raw(&msg.m);
                chan_raw[5] = mavlink_msg_rc_channels_raw_get_chan6_raw(&msg.m);
                chan_raw[6] = mavlink_msg_rc_channels_raw_get_chan7_raw(&msg.m);
                chan_raw[7] = mavlink_msg_rc_channels_raw_get_chan8_raw(&msg.m);
                osd_rssi = mavlink_msg_rc_channels_raw_get_rssi(&msg.m);
                break;

            case MAVLINK_MSG_ID_WIND:
                osd_winddirection = mavlink_msg_wind_get_direction(&msg.m); // 0..360 deg, 0=north
                osd_windspeed = mavlink_msg_wind_get_speed(&msg.m); //m/s
//              osd_windspeedz = mavlink_msg_wind_get_speed_z(&msg.m); //m/s
                break;

            case MAVLINK_MSG_ID_SCALED_PRESSURE:
                temperature = mavlink_msg_scaled_pressure_get_temperature(&msg.m);
                break;

#if 1
            case MAVLINK_MSG_ID_SCALED_PRESSURE2:
                temperature = mavlink_msg_scaled_pressure2_get_temperature(&msg.m);
/*

packet.press_abs = press_abs;
packet.press_diff = press_diff;

*/
                break;
#endif

#ifdef IS_PLANE
            case MAVLINK_MSG_ID_GLOBAL_POSITION_INT: 
    		// height of takeoff point
                //osd_home_alt = osd_alt_rel*1000 - mavlink_msg_global_position_int_get_relative_alt(&msg.m);  // alt above ground im MM
                osd_alt_to_home = mavlink_msg_global_position_int_get_relative_alt(&msg.m) / 1000;  // alt above ground im MM
                break; 
/*
case MAVLINK_MSG_ID_GLOBAL_POSITION_INT:              // jmmods.
            {
                osd_rel_alt = mavlink_msg_global_position_int_get_relative_alt(&msg) ;   // alt above ground im MM
                // uav.relative_alt = packet.relative_alt / 1000.0; //jmtune Altitude above ground in meters, expressed as * 1000 (millimeters)   // jmmods
            }
            break;
*/
#endif

	    case MAVLINK_MSG_ID_STATUSTEXT:
                // mav_severity =  mavlink_msg_statustext_get_severity(&msg);
                //if(SEVERITY_HIGH <= mav_severity) { // обрабатываем новое системное сообщение только высокой важности
                {
                    byte len = mavlink_msg_statustext_get_text(&msg.m, (char *)mav_message);
                    mav_message[len]=0;
		    mav_msg_ttl=seconds + 10;

                }
                break;

            default:
                //Do nothing
                break;
            }
            
            //return true;
        }
        delay_byte();
#ifdef DEBUG
    // Update global packet drops counter
    packet_drops += status.packet_rx_drop_count;
#endif

    }

    return false;
}

