#include "../compat.h"

#define ToDeg(x) (x*57.2957795131) // *180/pi


extern struct loc_flags lflags;  // все булевые флаги кучей


/* перенастраивать оборудование без спроса - моветон
void request_mavlink_rates()
{
    const uint8_t  maxStreams = 6;
    
    const uint8_t MAVStreams[maxStreams] = {
        MAV_DATA_STREAM_RAW_SENSORS,
        MAV_DATA_STREAM_EXTENDED_STATUS,
        MAV_DATA_STREAM_RC_CHANNELS,
        MAV_DATA_STREAM_POSITION,
        MAV_DATA_STREAM_EXTRA1, 
        MAV_DATA_STREAM_EXTRA2};

    const uint16_t MAVRates[maxStreams] = {0x02, 0x02, 0x05, 0x02, 0x10, 0x02};
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
    byte cnt=0;

#ifdef DEBUG
    long mav_time = millis();

    // Update global packet drops counter
    status.packet_rx_drop_count = 0;

#endif

    //grabing data 
    while(Serial.available_S()) {
        uint8_t c = Serial.read_S();
        byte apm_mav_type;

#ifdef DEBUG
	bytes_comes+=1;
#endif
        //trying to grab msg  Mavlink library patched and buffer is static
        if(mavlink_parse_char(MAVLINK_COMM_0, c, NULL, &status)) {

            set_data_got(); //lastMAVBeat = millis();

#ifdef DEBUG
//   Serial.printf_P(PSTR("\ngot id=%d\n"), msg.m.msgid);
#endif

            lflags.mavlink_active = 1;

#ifdef MAVLINK_CONFIG
DBG_PRINTVARLN(msg.m.msgid);
DBG_PRINTVARLN(msg.m.sysid);
DBG_PRINTVARLN(msg.m.compid);

	    if(msg.m.msgid == MAVLINK_MSG_ID_ENCAPSULATED_DATA && 
	       msg.m.sysid == mav_gcs_id &&
	       msg.m.compid == MAV_COMP_ID_CAMERA ) { // stole this ID
		uint16_t seq=mavlink_msg_encapsulated_data_get_seqnr(&msg.m);

DBG_PRINTVARLN(seq);

		if(seq!=last_seq_n) {
		    last_seq_n = seq;
        	    parse_osd_packet(((byte *)&msg.m) + sizeof(uint16_t)+8 ); // direct access to message buffer - no memory for copy
        	}

	    // mavlink_msg_encapsulated_data_get_data
	       
	    }
#endif

	    if( msg.m.msgid!=MAVLINK_MSG_ID_HEARTBEAT &&                // not heartbeat
		apm_mav_system && apm_mav_system != msg.m.sysid) {       // another system
#ifdef DEBUG
    packets_skip+=1;
    Serial.printf_P(PSTR("\npacket skip want=%d got %d\n"), apm_mav_system, msg.m.sysid);
#endif
		    break; // skip packet and exit 
		}

#ifdef DEBUG
	packets_got+=1;
#endif


	    cnt++;
	    
            //handle msg
            switch(msg.m.msgid) {
            case MAVLINK_MSG_ID_HEARTBEAT:
                apm_mav_type = mavlink_msg_heartbeat_get_type(&msg.m);  // quad hexa octo etc
                if(apm_mav_type == 6) { // MAV_TYPE_GCS
#ifdef MAVLINK_CONFIG
DBG_PRINTLN("GCS heartbeat!");

            	    mav_gcs_id = msg.m.sysid; // store GCS ID
DBG_PRINTVARLN(mav_gcs_id);            	    
            	    last_seq_n = 0; // reset sequence
#endif
            	    goto skip_packet;
                }
                if(apm_mav_type == 5 || apm_mav_type == 26 ) { //  MAV_TYPE_ANTENNA_TRACKER || MAV_TYPE_GIMBAL
skip_packet:
#ifdef DEBUG
    packets_skip+=1;
    Serial.printf_P(PSTR("\nHEARTBEAT skip type=%d\n"), apm_mav_type);
#endif
		    break;

                }


                osd_autopilot = mavlink_msg_heartbeat_get_autopilot(&msg.m);
                //Mode (arducoper armed/disarmed)
                base_mode = mavlink_msg_heartbeat_get_base_mode(&msg.m);


#ifdef DEBUG
	if(apm_mav_system  != msg.m.sysid){
	    byte status=mavlink_msg_heartbeat_get_system_status(&msg.m);
	    Serial.printf_P(PSTR("\nHEARTBEAT type=%d sysid=%d pilot=%d component=%d status=%d\n"), apm_mav_type,  msg.m.sysid, osd_autopilot, msg.m.compid, status);
	}
#endif

                lflags.motor_armed = getBit(base_mode,7);

                osd_mode = (uint8_t)mavlink_msg_heartbeat_get_custom_mode(&msg.m);
                apm_mav_system    = msg.m.sysid; // store ID to filter out alien messages
                // apm_mav_component = msg.m.compid;

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
                gps_norm(osd_pos.lat,mavlink_msg_gps_raw_int_get_lat(&msg.m));
                gps_norm(osd_pos.lon,mavlink_msg_gps_raw_int_get_lon(&msg.m));
                osd_fix_type = mavlink_msg_gps_raw_int_get_fix_type(&msg.m);
                osd_satellites_visible = mavlink_msg_gps_raw_int_get_satellites_visible(&msg.m);
                if(osd_fix_type>0)
                    osd_pos.alt = mavlink_msg_gps_raw_int_get_alt(&msg.m);  // *1000
                else
                    osd_pos.alt=osd_alt_mav * 1000;
                osd_cog = mavlink_msg_gps_raw_int_get_cog(&msg.m);
                eph = mavlink_msg_gps_raw_int_get_eph(&msg.m);

#ifdef DEBUG
Serial.printf_P(PSTR("MAVLINK_MSG_ID_GPS_RAW_INT fix=%d\n"), osd_fix_type);
#endif

                break; 

            case MAVLINK_MSG_ID_VFR_HUD: // todo copy at once
/*
float airspeed; ///< Current airspeed in m/s
 float groundspeed; ///< Current ground speed in m/s
 float alt; ///< Current altitude (MSL), in meters
 float climb; ///< Current climb rate in meters/second
 int16_t heading; ///< Current heading in degrees, in compass units (0..360, 0=north)
 uint16_t throttle; ///< Current throttle setting in integer percent, 0 to 100
*/
                osd_airspeed = mavlink_msg_vfr_hud_get_airspeed(&msg.m);
                if(osd_fix_type>0)
                    osd_groundspeed = mavlink_msg_vfr_hud_get_groundspeed(&msg.m);
                else
                    osd_groundspeed = loc_speed;
                osd_heading = mavlink_msg_vfr_hud_get_heading(&msg.m); // 0..360 deg, 0=north
                osd_throttle = (uint8_t)mavlink_msg_vfr_hud_get_throttle(&msg.m);
                osd_alt_mav = mavlink_msg_vfr_hud_get_alt(&msg.m);  //  Current altitude (MSL), in meters
                osd_climb = mavlink_msg_vfr_hud_get_climb(&msg.m);
                break;

/*
	    case MAVLINK_MSG_ID_LOCAL_POSITION_NED: { // speed for no-GPS setups
		    float vx = mavlink_msg_local_position_ned_get_vx(&msg.m);
		    float vy = mavlink_msg_local_position_ned_get_vy(&msg.m);
		    loc_speed = distance(vx, vy);
Serial.printf_P(PSTR("MAVLINK_MSG_ID_LOCAL_POSITION_NED x=%f y=%f\n"),vx,vy);
		}break;
//*/
/*
	    case MAVLINK_MSG_ID_VISION_SPEED_ESTIMATE: {
		float vx=mavlink_msg_vision_speed_estimate_get_x(&msg.m);
		float vy=mavlink_msg_vision_speed_estimate_get_y(&msg.m);
Serial.printf_P(PSTR("MAVLINK_MSG_ID_VISION_SPEED_ESTIMATE x=%f y=%f\n"),vx,vy);
		loc_speed = distance(vx, vy);
	    } break;
*/	    


            case MAVLINK_MSG_ID_ATTITUDE:
                osd_att.pitch = ToDeg(mavlink_msg_attitude_get_pitch(&msg.m));
                osd_att.roll  = ToDeg(mavlink_msg_attitude_get_roll(&msg.m));
                osd_att.yaw   = ToDeg(mavlink_msg_attitude_get_yaw(&msg.m));
//Serial.printf_P(PSTR("pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();
//LED_BLINK;
                break;

            case MAVLINK_MSG_ID_NAV_CONTROLLER_OUTPUT:
/*
 float nav_roll; ///< Current desired roll in degrees
 float nav_pitch; ///< Current desired pitch in degrees
 float alt_error; ///< Current altitude error in meters
 float aspd_error; ///< Current airspeed error in meters/second
 float xtrack_error; ///< Current crosstrack error on x-y plane in meters
 int16_t nav_bearing; ///< Current desired heading in degrees
 int16_t target_bearing; ///< Bearing to current MISSION/target in degrees
 uint16_t wp_dist; ///< Distance to active MISSION in meters
*/
             //desired values
#ifdef IS_PLANE
                nav_roll = mavlink_msg_nav_controller_output_get_nav_roll(&msg.m);   // for panTune only
                nav_pitch = mavlink_msg_nav_controller_output_get_nav_pitch(&msg.m); // for panTune only
                nav_bearing = mavlink_msg_nav_controller_output_get_nav_bearing(&msg.m);
                alt_error = mavlink_msg_nav_controller_output_get_alt_error(&msg.m);
                aspd_error = mavlink_msg_nav_controller_output_get_aspd_error(&msg.m);
#endif
                wp_target_bearing = mavlink_msg_nav_controller_output_get_target_bearing(&msg.m);
                wp_dist = mavlink_msg_nav_controller_output_get_wp_dist(&msg.m);
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
/*
	    case MAVLINK_MSG_ID_RC_CHANNELS: // 1-18 but in not sent :(
		break;
*/


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

//#ifdef IS_PLANE
            case MAVLINK_MSG_ID_GLOBAL_POSITION_INT: {
                    // height of takeoff point
                    //osd_home_alt = osd_alt_mav*1000 - mavlink_msg_global_position_int_get_relative_alt(&msg.m);  // alt above ground im MM
                    osd_alt_to_home = mavlink_msg_global_position_int_get_relative_alt(&msg.m) / 1000;  // alt above ground im MM
		    int16_t vx = mavlink_msg_global_position_int_get_vx(&msg.m);
		    int16_t vy = mavlink_msg_global_position_int_get_vx(&msg.m);
		    loc_speed = distance(vx, vy) / 100;
                } break; 
/*
case MAVLINK_MSG_ID_GLOBAL_POSITION_INT:              // jmmods.
            {
                osd_rel_alt = mavlink_msg_global_position_int_get_relative_alt(&msg) ;   // alt above ground im MM
                // uav.relative_alt = packet.relative_alt / 1000.0; //jmtune Altitude above ground in meters, expressed as * 1000 (millimeters)   // jmmods
            }
            break;
*/
//#endif

/*
    MAV_SEVERITY_EMERGENCY=0,  System is unusable. This is a "panic" condition. | 
    MAV_SEVERITY_ALERT=1,      Action should be taken immediately. Indicates error in non-critical systems. | 
    MAV_SEVERITY_CRITICAL=2,   Action must be taken immediately. Indicates failure in a primary system. | 
    MAV_SEVERITY_ERROR=3,      Indicates an error in secondary/redundant systems. |
    MAV_SEVERITY_WARNING=4,    Indicates about a possible future error if this is not resolved within a given timeframe. Example would be a low battery
    MAV_SEVERITY_NOTICE=5,     An unusual event has occured, though not an error condition. This should be investigated for the root cause. | 
    
    MAV_SEVERITY_INFO=6,       Normal operational messages. Useful for logging. No action is required for these messages. |
    
    MAV_SEVERITY_DEBUG=7,      Useful non-operational messages that can assist in debugging. These should not occur during normal operation. | 
*/
	    case MAVLINK_MSG_ID_STATUSTEXT:
                mav_msg_severity = mavlink_msg_statustext_get_severity(&msg.m);
                if(MAV_SEVERITY_INFO >= mav_msg_severity) { // обрабатываем новое системное сообщение
                    byte len = mavlink_msg_statustext_get_text(&msg.m, (char *)mav_message);
                    mav_message[len]=0;

                    char *cp = (char *)&mav_message[len]; // remove tail spaces
                    for(;;) {
                        byte c = *(--cp);

                        if(c==0 || c==0x20){
                            len--;
                        } else {
                            cp[1]=0;
                            break;
                        }
                    }

		    mav_message_start(len, 6); // len, time to show
                }
                break;

/*
typedef enum FENCE_BREACH{
 FENCE_BREACH_NONE=0,  No last fence breach | 
 FENCE_BREACH_MINALT=1,  Breached minimum altitude | 
 FENCE_BREACH_MAXALT=2,  Breached maximum altitude | 
 FENCE_BREACH_BOUNDARY=3,  Breached fence boundary | 
 FENCE_BREACH_ENUM_END=4,  | 
} FENCE_BREACH;

*/
		case MAVLINK_MSG_ID_FENCE_STATUS:
		    mav_fence_status = mavlink_msg_fence_status_get_breach_type(&msg.m);
		break;

		case MAVLINK_MSG_ID_RADIO: {// 3dr telemetry status
/*
typedef struct __mavlink_radio_t
{
 uint16_t rxerrors; ///< receive errors
 uint16_t fixed; ///< count of error corrected packets
 uint8_t rssi; ///< local signal strength
 uint8_t remrssi; ///< remote signal strength
 uint8_t txbuf; ///< how full the tx buffer is as a percentage
 uint8_t noise; ///< background noise level
 uint8_t remnoise; ///< remote background noise level
*/
		    byte rssi    = mavlink_msg_radio_get_rssi(&msg.m);
		    byte remrssi = mavlink_msg_radio_get_remrssi(&msg.m);
		    telem_rssi = remrssi > rssi ? rssi : remrssi;

#ifdef DEBUG
Serial.printf_P(PSTR("\nMAVLINK_MSG_ID_RADIO rssi=%d remrssi=%d\n"), rssi, remrssi);
#endif

		} break;

		case MAVLINK_MSG_ID_RADIO_STATUS: {// 3dr telemetry status
/*
typedef struct __mavlink_radio_status_t
{
 uint16_t rxerrors; ///< receive errors
 uint16_t fixed; ///< count of error corrected packets
 uint8_t rssi; ///< local signal strength
 uint8_t remrssi; ///< remote signal strength
 uint8_t txbuf; ///< how full the tx buffer is as a percentage
 uint8_t noise; ///< background noise level
 uint8_t remnoise; ///< remote background noise level
} mavlink_radio_status_t;
*/
		    byte rssi    = mavlink_msg_radio_status_get_rssi(&msg.m);
		    byte remrssi = mavlink_msg_radio_status_get_remrssi(&msg.m);
		    telem_rssi = remrssi > rssi ? rssi : remrssi;
#ifdef DEBUG
Serial.printf_P(PSTR("\nMAVLINK_MSG_ID_RADIO_STATUS rssi=%d remrssi=%d\n"), rssi, remrssi);
#endif

		} break;
		
            default:
                //Do nothing
                break;
            }
    	//    if(timeToScreen())  // если надо перерисовать экран 
                return true; // задержка на прием одного 64-байт пакета 8.8мс а кадрового гасящего - 1.6мс
        }
        delay_byte();

#ifdef DEBUG
    // Update global packet drops counter
    packet_drops += status.packet_rx_drop_count;
#endif

    }

#ifdef DEBUG
    long dt = (millis() - mav_time) -2;
    if(dt>0) {
        mavlink_time += dt-2; 		// sum, 2ms when no stream
	if(dt>mavlink_dt) mavlink_dt = dt; // and max
    }
    
    if(cnt>mavlink_cnt) mavlink_cnt=cnt;
#endif

    return false;
}

