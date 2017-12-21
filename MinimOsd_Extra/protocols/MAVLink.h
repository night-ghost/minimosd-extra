#include "../compat.h"

#ifndef ToDeg
#define ToDeg(x) (x*57.2957795131) // *180/pi
#endif


extern struct loc_flags lflags;  // все булевые флаги кучей

extern bool mavlink_one_byte(char c);

bool parse_osd_packet(uint8_t *p);


#pragma pack(push,1)
typedef struct _Stream_params {
    uint8_t stream;
    uint8_t rate;
} Stream_params;

#pragma pack(pop)

#if defined(MAV_REQUEST)
void request_mavlink_rates()
{
    
    static const Stream_params PROGMEM MAVStreams[] = {
//      {  MAV_DATA_STREAM_RAW_SENSORS,  	2 },
        {  MAV_DATA_STREAM_POSITION,		1 },
        {  MAV_DATA_STREAM_EXTENDED_STATUS,	2 },
        {  MAV_DATA_STREAM_RC_CHANNELS,		5 },
        {  MAV_DATA_STREAM_EXTRA1,		10 },
        {  MAV_DATA_STREAM_EXTRA2,		2 },
        {  MAV_DATA_STREAM_EXTRA3,		1 }
    };


    for (uint8_t i=0; i < sizeof(MAVStreams)/sizeof(Stream_params); i++) {
	uint8_t rate = pgm_read_byte(&(MAVStreams[i].rate));
	if(stream_rate){
	    rate *= 4;
	    rate /= stream_rate; // нормируем на скорость соединения
	    if(rate<1) rate=1;
	}
        mavlink_msg_request_data_stream_send(MAVLINK_COMM_0,
            apm_mav_system, apm_mav_component,	// received by HEARTBEAT 
            pgm_read_byte(&(MAVStreams[i].stream)),
            rate, 1);
    }
}

#endif

// fake HEARTBEAT packet for 3DR  rssi generation
void heartBeat() { //                          type, autopilot, base_mode, custom_mode, system_status)
    if( (sets.RSSI_raw / 2) == 3) { // 3DR rssi
        uint8_t tmp=mavlink_system.sysid;
        mavlink_system.sysid=apm_mav_system; // as it was sent by FC
        mavlink_msg_heartbeat_send(MAVLINK_COMM_0, 0,    0,         0,         0,           0);
        mavlink_system.sysid = tmp;
    }
}

/* in  protocols.h
union {
    struct {
	mavlink_message_t m;
	mavlink_status_t status;
    } mv;    uavtalk_message_t u;
} msg;
*/


#ifndef SLAVE_BUILD
bool read_mavlink(){

#ifdef DEBUG
    long mav_time = millis();

    // Update global packet drops counter
//    status.packet_rx_drop_count = 0;

#endif

    //grabing data 
    while(Serial.available_S()) {
        uint8_t c = Serial.read_S();

#ifdef DEBUG
	bytes_comes+=1;
#endif
        if(mavlink_one_byte(c)) return true; // got packet

        delay_byte();

#ifdef DEBUG
    // Update global packet drops counter
//    packet_drops += status.packet_rx_drop_count;
#endif

    }

#ifdef DEBUG
    long dt = (millis() - mav_time) -2;
    if(dt>0) {
        mavlink_time += dt-2; 		// sum, 2ms when no stream
	if(dt>mavlink_dt) mavlink_dt = dt; // and max
    }
    
//    if(cnt>mavlink_cnt) mavlink_cnt=cnt;
#endif

    return false;
}
#endif



bool mavlink_one_byte(char c){
    uint8_t   base_mode=0;
    uint8_t cnt=0;
    uint8_t apm_mav_type;

#ifdef SLAVE_BUILD
    static mavlink_status_t status;
        // full MAVlink library
        if(mavlink_parse_char(MAVLINK_COMM_0, c, &msgbuf.m, &status)) {
#else
    mavlink_status_t status;

        //trying to grab msg  Mavlink library patched and buffer is static
        if(mavlink_parse_char(MAVLINK_COMM_0, c, NULL, &status)) {
#endif
            set_data_got();

//   DBG_PRINTF("\ngot id=%d\n", msgbuf.m.msgid);

#ifdef MAVLINK_CONFIG
//DBG_PRINTVARLN(msgbuf.m.msgid);
//DBG_PRINTVARLN(msgbuf.m.sysid);
//DBG_PRINTVARLN(msgbuf.m.compid);

	    if(msgbuf.m.msgid == MAVLINK_MSG_ID_ENCAPSULATED_DATA && 
	       msgbuf.m.sysid == mav_gcs_id &&
	       msgbuf.m.compid == MAV_COMP_ID_CAMERA ) { // stole this ID
		uint16_t seq=mavlink_msg_encapsulated_data_get_seqnr(&msgbuf.m);

//DBG_PRINTVARLN(seq);

		if(seq!=last_seq_n) {
		    uint8_t *ptr = (uint8_t *)(&(msgbuf.m.payload64[0])); // direct access to message buffer - no memory for copy
        	    if(parse_osd_packet(ptr) ){
    		        last_seq_n = seq;
    		    }
        	}
	    // mavlink_msg_encapsulated_data_get_data
	       
	    }
#endif

	    if( msgbuf.m.msgid!=MAVLINK_MSG_ID_HEARTBEAT &&                // not heartbeat
		apm_mav_system && apm_mav_system != msgbuf.m.sysid && msgbuf.m.sysid !='3') {       // another system and not 3D radio
#ifdef DEBUG
                    packets_skip+=1;
//    Serial.printf_P(PSTR("\npacket skip want=%d got %d\n"), apm_mav_system, msgbuf.m.sysid);
#endif
		    return true; // skip packet and exit 
	    }

#ifdef DEBUG
	    packets_got+=1;
#endif


	    cnt++;

//DBG_PRINTVARLN(msgbuf.m.msgid);
	    
            //handle msg
            switch(msgbuf.m.msgid) {
            case MAVLINK_MSG_ID_HEARTBEAT:
                apm_mav_type = mavlink_msg_heartbeat_get_type(&msgbuf.m);  // quad hexa octo etc
                if(apm_mav_type == 6) { // MAV_TYPE_GCS
#ifdef MAVLINK_CONFIG
//DBG_PRINTLN("GCS heartbeat!");

            	    mav_gcs_id = msgbuf.m.sysid; // store GCS ID
//DBG_PRINTVARLN(mav_gcs_id);            	    
            	    last_seq_n = 0; // reset sequence
#endif
            	    goto skip_packet;
                }
                if(apm_mav_type == 5 || apm_mav_type == 26 ) { //  MAV_TYPE_ANTENNA_TRACKER || MAV_TYPE_GIMBAL
skip_packet:
#ifdef DEBUG
    packets_skip+=1;
//    Serial.printf_P(PSTR("\nHEARTBEAT skip type=%d\n"), apm_mav_type);
#endif
		    break;

                }


                osd_autopilot = mavlink_msg_heartbeat_get_autopilot(&msgbuf.m);
                //Mode (arducoper armed/disarmed)
                base_mode = mavlink_msg_heartbeat_get_base_mode(&msgbuf.m);


#if defined(DEBUG) && 0
if(apm_mav_system  != msgbuf.m.sysid){
    byte status=mavlink_msg_heartbeat_get_system_status(&msgbuf.m);
    Serial.printf_P(PSTR("\nHEARTBEAT type=%d sysid=%d pilot=%d component=%d status=%d\n"), apm_mav_type,  msgbuf.m.sysid, osd_autopilot, msgbuf.m.compid, status);
}
#endif

                lflags.motor_armed = getBit(base_mode,7);

                osd_mode = mavlink_msg_heartbeat_get_custom_mode(&msgbuf.m);
                apm_mav_system    = msgbuf.m.sysid; // store ID to filter out alien messages
                // apm_mav_component = msgbuf.m.compid;


		if(mav_data_count==0){ // there is no data comes to OSD
		    if(mav_raw_imu_count) { // we has IMU data but not GPS - stream overload
		        if(lflags.mav_stream_overload < MAX_OVERLOAD_COUNT) 
    			    lflags.mav_stream_overload++;
    		        else {
                            lflags.mav_request_done = 0; // make new request
                            if(stream_rate<127)
                                stream_rate *=2;		// on half rate
                        }
		    } else { // no data at all
		        if(lflags.mav_data_frozen < MAX_FROZEN_COUNT) 
    			    lflags.mav_data_frozen++;
    		        else 
                            lflags.mav_request_done = 0; // make new request
                    }
		} else { // there was GPS data
		    lflags.mav_stream_overload =0; // reset counters
		    lflags.mav_data_frozen=0;
		}
		mav_data_count=0;
		mav_raw_imu_count=0;
                break;
                
    // MAV_DATA_STREAM_RAW_SENSORS - the hiest priority message
            case MAVLINK_MSG_ID_RAW_IMU:
        	mav_raw_imu_count++;
        	break;
                
    // MAV_DATA_STREAM_POSITION,
            case MAVLINK_MSG_ID_SYS_STATUS:
                if(!FLAGS.useExtVbattA){
                    osd_vbat_A = mavlink_msg_sys_status_get_voltage_battery(&msgbuf.m) ; //Battery voltage, in millivolts (1 = 1 millivolt)
                    osd_battery_remaining_A = mavlink_msg_sys_status_get_battery_remaining(&msgbuf.m); //Remaining battery energy: (0%: 0, 100%: 100)
                }
                if(!FLAGS.useExtCurr)
                    osd_curr_A = mavlink_msg_sys_status_get_current_battery(&msgbuf.m); //Battery current, in 10*milliamperes (1 = 10 milliampere)

                //osd_mode = apm_mav_component;//Debug
                break;

            case MAVLINK_MSG_ID_BATTERY2:
                if(!FLAGS.useExtVbattB){
                    osd_vbat_B = mavlink_msg_battery2_get_voltage(&msgbuf.m) ; //Battery voltage, in millivolts (1 = 1 millivolt)
                }
                break;


    // EXTENDED_STATUS
            case MAVLINK_MSG_ID_GPS_RAW_INT:
                gps_norm(osd_pos.lat,mavlink_msg_gps_raw_int_get_lat(&msgbuf.m));
                gps_norm(osd_pos.lon,mavlink_msg_gps_raw_int_get_lon(&msgbuf.m));
                osd_fix_type = mavlink_msg_gps_raw_int_get_fix_type(&msgbuf.m);
                osd_satellites_visible = mavlink_msg_gps_raw_int_get_satellites_visible(&msgbuf.m);
                if(osd_fix_type>0)
                    osd_pos.alt = mavlink_msg_gps_raw_int_get_alt(&msgbuf.m);  // *1000
                else
                    osd_pos.alt=osd_alt_mav * 1000;
                osd_cog = mavlink_msg_gps_raw_int_get_cog(&msgbuf.m);
                eph = mavlink_msg_gps_raw_int_get_eph(&msgbuf.m);

#ifdef DEBUG
//Serial.printf_P(PSTR("MAVLINK_MSG_ID_GPS_RAW_INT fix=%d\n"), osd_fix_type);
#endif
		mav_data_count++;
		lflags.mav_data_frozen=0;
                lflags.mav_stream_overload=0;
                break; 

    // EXTRA_2
            case MAVLINK_MSG_ID_VFR_HUD: // todo copy at once
/*
float airspeed; ///< Current airspeed in m/s
 float groundspeed; ///< Current ground speed in m/s
 float alt; ///< Current altitude (MSL), in meters
 float climb; ///< Current climb rate in meters/second
 int16_t heading; ///< Current heading in degrees, in compass units (0..360, 0=north)
 uint16_t throttle; ///< Current throttle setting in integer percent, 0 to 100
*/
                osd_airspeed = mavlink_msg_vfr_hud_get_airspeed(&msgbuf.m);
                if(osd_fix_type>0)
                    osd_groundspeed = mavlink_msg_vfr_hud_get_groundspeed(&msgbuf.m);
                else
                    osd_groundspeed = loc_speed;
                osd_heading = mavlink_msg_vfr_hud_get_heading(&msgbuf.m); // 0..360 deg, 0=north
                osd_throttle = (uint8_t)mavlink_msg_vfr_hud_get_throttle(&msgbuf.m);
                osd_alt_mav = mavlink_msg_vfr_hud_get_alt(&msgbuf.m);  //  Current altitude (MSL), in meters
                osd_climb   = mavlink_msg_vfr_hud_get_climb(&msgbuf.m);
                break;

/*
	    case MAVLINK_MSG_ID_LOCAL_POSITION_NED: { // speed for no-GPS setups
		    float vx = mavlink_msg_local_position_ned_get_vx(&msgbuf.m);
		    float vy = mavlink_msg_local_position_ned_get_vy(&msgbuf.m);
		    loc_speed = distance(vx, vy);
Serial.printf_P(PSTR("MAVLINK_MSG_ID_LOCAL_POSITION_NED x=%f y=%f\n"),vx,vy);
		}break;
//*/
/*
	    case MAVLINK_MSG_ID_VISION_SPEED_ESTIMATE: {
		float vx=mavlink_msg_vision_speed_estimate_get_x(&msgbuf.m);
		float vy=mavlink_msg_vision_speed_estimate_get_y(&msgbuf.m);
Serial.printf_P(PSTR("MAVLINK_MSG_ID_VISION_SPEED_ESTIMATE x=%f y=%f\n"),vx,vy);
		loc_speed = distance(vx, vy);
	    } break;
*/	    


    // EXTRA_1
            case MAVLINK_MSG_ID_ATTITUDE:
                osd_att.pitch = ToDeg(mavlink_msg_attitude_get_pitch(&msgbuf.m));
                osd_att.roll  = ToDeg(mavlink_msg_attitude_get_roll(&msgbuf.m));
                osd_att.yaw   = ToDeg(mavlink_msg_attitude_get_yaw(&msgbuf.m));
//Serial.printf_P(PSTR("pitch=%f\n"), (float)osd_att.pitch ); Serial.wait();
//LED_BLINK;
                break;

    // EXTENDED_STATUS
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
                nav_roll = mavlink_msg_nav_controller_output_get_nav_roll(&msgbuf.m);   // for panTune only
                nav_pitch = mavlink_msg_nav_controller_output_get_nav_pitch(&msgbuf.m); // for panTune only
                nav_bearing = mavlink_msg_nav_controller_output_get_nav_bearing(&msgbuf.m);
                alt_error = mavlink_msg_nav_controller_output_get_alt_error(&msgbuf.m);
                aspd_error = mavlink_msg_nav_controller_output_get_aspd_error(&msgbuf.m);
#endif
                wp_target_bearing = mavlink_msg_nav_controller_output_get_target_bearing(&msgbuf.m);
                wp_dist = mavlink_msg_nav_controller_output_get_wp_dist(&msgbuf.m);
                xtrack_error = mavlink_msg_nav_controller_output_get_xtrack_error(&msgbuf.m);

		mav_data_count++;
		lflags.mav_data_frozen=0;

                break;

            case MAVLINK_MSG_ID_MISSION_CURRENT:
                wp_number = (uint8_t)mavlink_msg_mission_current_get_seq(&msgbuf.m);
                break;

            case MAVLINK_MSG_ID_RC_CHANNELS_RAW:
                chan_raw[0] = mavlink_msg_rc_channels_raw_get_chan1_raw(&msgbuf.m);
                chan_raw[1] = mavlink_msg_rc_channels_raw_get_chan2_raw(&msgbuf.m);
                chan_raw[2] = mavlink_msg_rc_channels_raw_get_chan3_raw(&msgbuf.m);
                chan_raw[3] = mavlink_msg_rc_channels_raw_get_chan4_raw(&msgbuf.m);
                chan_raw[4] = mavlink_msg_rc_channels_raw_get_chan5_raw(&msgbuf.m);
                chan_raw[5] = mavlink_msg_rc_channels_raw_get_chan6_raw(&msgbuf.m);
                chan_raw[6] = mavlink_msg_rc_channels_raw_get_chan7_raw(&msgbuf.m);
                chan_raw[7] = mavlink_msg_rc_channels_raw_get_chan8_raw(&msgbuf.m);
                osd_rssi = mavlink_msg_rc_channels_raw_get_rssi(&msgbuf.m);
                break;

            case MAVLINK_MSG_ID_RC_CHANNELS:
                chan_raw[0] = mavlink_msg_rc_channels_get_chan1_raw(&msgbuf.m);
                chan_raw[1] = mavlink_msg_rc_channels_get_chan2_raw(&msgbuf.m);
                chan_raw[2] = mavlink_msg_rc_channels_get_chan3_raw(&msgbuf.m);
                chan_raw[3] = mavlink_msg_rc_channels_get_chan4_raw(&msgbuf.m);
                chan_raw[4] = mavlink_msg_rc_channels_get_chan5_raw(&msgbuf.m);
                chan_raw[5] = mavlink_msg_rc_channels_get_chan6_raw(&msgbuf.m);
                chan_raw[6] = mavlink_msg_rc_channels_get_chan7_raw(&msgbuf.m);
                chan_raw[7] = mavlink_msg_rc_channels_get_chan8_raw(&msgbuf.m);
                osd_rssi = mavlink_msg_rc_channels_get_rssi(&msgbuf.m);
//DBG_PRINTF("got rssi=%d\n", osd_rssi );
                break;


            case MAVLINK_MSG_ID_WIND:
                osd_winddirection = mavlink_msg_wind_get_direction(&msgbuf.m); // 0..360 deg, 0=north
//DBG_PRINTVARLN(osd_winddirection);                
//DBG_PRINTVARLN(osd_windspeed);                
                osd_windspeed = mavlink_msg_wind_get_speed(&msgbuf.m); //m/s
//DBG_PRINTF("new osd_windspeed=%f\n",osd_windspeed);                
//              osd_windspeedz = mavlink_msg_wind_get_speed_z(&msgbuf.m); //m/s
                break;

            case MAVLINK_MSG_ID_SCALED_PRESSURE:
                temperature = mavlink_msg_scaled_pressure_get_temperature(&msgbuf.m);
                break;

            case MAVLINK_MSG_ID_SCALED_PRESSURE2:
                temperature = mavlink_msg_scaled_pressure2_get_temperature(&msgbuf.m);
                break;


            case MAVLINK_MSG_ID_GLOBAL_POSITION_INT: { // coordinates are here too
                // height of takeoff point
                //osd_home_alt = osd_alt_mav*1000 - mavlink_msg_global_position_int_get_relative_alt(&msgbuf.m);  // alt above ground im MM
                osd_alt_to_home = mavlink_msg_global_position_int_get_relative_alt(&msgbuf.m) / 1000;  // alt above ground in MM
		int16_t vx = mavlink_msg_global_position_int_get_vx(&msgbuf.m); // speed for non-GPS setups
		int16_t vy = mavlink_msg_global_position_int_get_vy(&msgbuf.m);
		loc_speed = distance(vx, vy) / 100;
            } break; 



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
                mav_msg_severity = mavlink_msg_statustext_get_severity(&msgbuf.m);
                if(MAV_SEVERITY_INFO >= mav_msg_severity) { // обрабатываем новое системное сообщение
                    byte len = mavlink_msg_statustext_get_text(&msgbuf.m, (char *)mav_message);
                    mav_message[len]=0;

                    char *cp = (char *)&mav_message[len]; // remove tail spaces
                    for(;;) {
                        byte b = *(--cp);

                        if(b==0 || b==0x20){
                            len--;
                        } else {
                            cp[1]=0;
                            break;
                        }
                    }

                    point p = readPanel(ID_of(message));
                    byte n = get_alt_num(p);
                    static const PROGMEM byte delays[]= { 2, 6, 10, 15, 20, 30, 45, 60 };
		    mav_message_start(len, pgm_read_byte(&delays[n]) ); // len, time to show
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
		    mav_fence_status = mavlink_msg_fence_status_get_breach_type(&msgbuf.m);
		break;

		case MAVLINK_MSG_ID_RADIO: {// 3dr telemetry status - new 
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
		    byte rssi    = mavlink_msg_radio_get_rssi(&msgbuf.m);
		    byte remrssi = mavlink_msg_radio_get_remrssi(&msgbuf.m);
		    telem_rssi = remrssi > rssi ? rssi : remrssi;
//DBG_PRINTF("\nMAVLINK_MSG_ID_RADIO rssi=%d remrssi=%d\n", rssi, remrssi);
		} break;

		case MAVLINK_MSG_ID_RADIO_STATUS: {// 3dr telemetry status - old APM
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
		    byte rssi    = mavlink_msg_radio_status_get_rssi(&msgbuf.m);
		    byte remrssi = mavlink_msg_radio_status_get_remrssi(&msgbuf.m);
		    telem_rssi = remrssi > rssi ? rssi : remrssi;
//DBG_PRINTF("\nMAVLINK_MSG_ID_RADIO_STATUS rssi=%d remrssi=%d\n", rssi, remrssi);

		} break;

/*
               case MAVLINK_MSG_ID_RANGEFINDER:
                   //float mavlink_msg_rangefinder_get_distance(&msgbuf.m);
                   break;
*/

            case MAVLINK_MSG_ID_SYSTEM_TIME: {
                int dt = (int8_t)sets.timeOffset; /* local time */
                dt -= 20; // sign correction
                dt *= 60 * 60; // in seconds

                uint32_t sys_seconds=mavlink_msg_system_time_get_time_unix_usec(&msgbuf.m) / (1000 * 1000ULL) + dt; //uS to UNIX timestamp
                
//DBG_PRINTF("\ngot time=%ld\n", sys_seconds );
                sys_days    = sys_seconds / (24*60*60uL);
                day_seconds = sys_seconds % (24*60*60uL);
//DBG_PRINTF("day time=%ld\n", day_seconds );
//DBG_PRINTF("days=%ld\n",     sys_days );
                
                lflags.got_date= (sys_days>0);
    
                } break;

#if !defined(MODE_PX4)
            case MAVLINK_MSG_ID_VIBRATION: {
/*
typedef struct __mavlink_vibration_t {
 uint64_t time_usec; < Timestamp (micros since boot or Unix epoch)
 float vibration_x; < Vibration levels on X-axis
 float vibration_y; < Vibration levels on Y-axis
 float vibration_z; < Vibration levels on Z-axis
 uint32_t clipping_0; < first accelerometer clipping count
 uint32_t clipping_1; < second accelerometer clipping count
 uint32_t clipping_2; < third accelerometer clipping count
} mavlink_vibration_t;

*/
                vibration[0] = mavlink_msg_vibration_get_vibration_x(&msgbuf.m);
                vibration[1] = mavlink_msg_vibration_get_vibration_y(&msgbuf.m);
                vibration[2] = mavlink_msg_vibration_get_vibration_z(&msgbuf.m);
                clipping[0] = mavlink_msg_vibration_get_clipping_0(&msgbuf.m);
                clipping[1] = mavlink_msg_vibration_get_clipping_1(&msgbuf.m);
                clipping[2] = mavlink_msg_vibration_get_clipping_2(&msgbuf.m);

                } break;


            case MAVLINK_MSG_ID_SERVO_OUTPUT_RAW: {
                pwm_out[0] = mavlink_msg_servo_output_raw_get_servo1_raw(&msgbuf.m);
                pwm_out[1] = mavlink_msg_servo_output_raw_get_servo2_raw(&msgbuf.m);
                pwm_out[2] = mavlink_msg_servo_output_raw_get_servo3_raw(&msgbuf.m);
                pwm_out[3] = mavlink_msg_servo_output_raw_get_servo4_raw(&msgbuf.m);

                } break;
#endif

#ifdef USE_ADSB
            case MAVLINK_MSG_ID_ADSB_VEHICLE:{ // info about aircrafts in field of view
/*
typedef struct __mavlink_adsb_vehicle_t {
 uint32_t ICAO_address; //< ICAO address
 int32_t lat;           //< Latitude, expressed as degrees * 1E7
 int32_t lon;           //< Longitude, expressed as degrees * 1E7
 int32_t altitude;      //< Altitude(ASL) in millimeters
 uint16_t heading;      //< Course over ground in centidegrees
 uint16_t hor_velocity; //< The horizontal velocity in centimeters/second
 int16_t ver_velocity;  //< The vertical velocity in centimeters/second, positive is up
 uint16_t flags;        //< Flags to indicate various statuses including valid data fields
 uint16_t squawk;       //< Squawk code
 uint8_t altitude_type; //< Type from ADSB_ALTITUDE_TYPE enum
 char callsign[9];      //< The callsign, 8+null
 uint8_t emitter_type;  //< Type from ADSB_EMITTER_TYPE enum
 uint8_t tslc;          //< Time since last communication in seconds
}) mavlink_adsb_vehicle_t;


typedef struct ADSB_INFO {
    struct Coords coord;
    uint32_t id;
    uint8_t cnt;
} ADSB_Info;


ADSB_Info adsb[MAX_ADSB];
            
*/
                    Coords pos;

                    gps_norm(pos.lat,mavlink_msg_adsb_vehicle_get_lat(&msgbuf.m));
                    gps_norm(pos.lon,mavlink_msg_adsb_vehicle_get_lon(&msgbuf.m));
                    pos.alt = mavlink_msg_adsb_vehicle_get_altitude(&msgbuf.m);
                    
                    float dist = coord_dist(&pos, &osd_pos, true);
//                    float min_dist=1e12;
//                    float max_dist=0;
                    
                    uint32_t id = mavlink_msg_adsb_vehicle_get_ICAO_address(&msgbuf.m);
                    
                    int8_t f_id=-1;
                    
                    for(uint8_t i=0; i<MAX_ADSB; i++) {


                        if(adsb[i].cnt == 0 || adsb[i].id == id) {
                            f_id=i;
                            break;
                        }
                    }
                    if(f_id < 0){
                        for(uint8_t i=0; i<MAX_ADSB; i++) {
                            float d = coord_dist(&adsb[i].coord, &osd_pos, true);
                            if(d>dist) {
                                f_id=i;
                                break;                            
                            }
                        }
                    }
                    if(f_id >=0){
                        adsb[f_id].coord = pos;
                        adsb[f_id].id = id;
                        adsb[f_id].cnt = 15; // seconds after last message
                    }
                    
                } break;
#endif


            default:
                //Do nothing
                break;
            }
    	//    if(timeToScreen())  // если надо перерисовать экран 
            return true; // задержка на прием одного 64-байт пакета 8.8мс а кадрового гасящего - 1.6мс
        }

    return false;
}
