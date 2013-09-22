/*
Mission Planner values :
0:Disabled
830:Default (ATT_MED / GPS / PM / CTUN / NTUN / CMD / CURRENT
958:Default+IMU
1854:Default+Motors
17214:Default+INav
*/
#define MASK_LOG_ATTITUDE_FAST          (1<<0) //1
#define MASK_LOG_ATTITUDE_MED           (1<<1) //2 X
#define MASK_LOG_GPS                    (1<<2) //4 X
#define MASK_LOG_PM                     (1<<3) //8 X
#define MASK_LOG_CTUN                   (1<<4) //16 X
#define MASK_LOG_NTUN                   (1<<5) //32 X
#define MASK_LOG_MODE                   (1<<6) //64 // not used
#define MASK_LOG_IMU                    (1<<7) //128
#define MASK_LOG_CMD                    (1<<8) //256 X
#define MASK_LOG_CURRENT                (1<<9) //512 X
#define MASK_LOG_MOTORS                 (1<<10) //1024
//#define MASK_LOG_OPTFLOW                (1<<11) //2048
#define MASK_LOG_PID                    (1<<12) //4096
#define MASK_LOG_COMPASS                (1<<13) //8192
#define MASK_LOG_INAV                   (1<<14) //16384
#define MASK_LOG_DEFAULT                MASK_LOG_ATTITUDE_MED | MASK_LOG_GPS | MASK_LOG_PM | MASK_LOG_CTUN | MASK_LOG_NTUN

boolean osd_log_change_param;
const uint8_t  NUMBER_LOG_ITEM = 9;
const uint16_t LOG_SELECT_POSITION[NUMBER_LOG_ITEM]={0, MASK_LOG_DEFAULT, MASK_LOG_IMU, MASK_LOG_CMD, MASK_LOG_CURRENT, MASK_LOG_MOTORS, MASK_LOG_PID, MASK_LOG_COMPASS, MASK_LOG_INAV};
boolean osd_log_refresh_val = false;

void writeLoggingPanels(){
  
    if( osd_log_refresh_val ) {
      mavlink_msg_param_request_read_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, LOG_PARAM_NAME, -1);
      osd_log_refresh_val = false; 
    }
  
     if( !(osd_state_screen & MASK_OSD_LOGGING_CHECK_PWM) ) {
        osd.setPanel(3, 1);
        osd.openPanel();
        osd.printf_P(PSTR("OSD Logging activated|")); 
        uint16_t log_mask_value = (uint16_t) current_tuning_value;
        for (int i=0; i < NUMBER_LOG_ITEM; i++){
             if( i == current_tuning_item ) {
                osd.printf_P(PSTR("\x98\x99"));  //For current item position, display   =>
             } else {
                osd.printf_P(PSTR("  "));
             }
             switch(i) {
               case 0: 
                osd.printf_P(PSTR("NONE    "));
                break;
              case 1: 
                osd.printf_P(PSTR("DEFAULT "));
                break;
              case 2:  
                osd.printf_P(PSTR("IMU     "));
                break;
              case 3:  
                osd.printf_P(PSTR("CMD     "));
                break;
              case 4:  
                osd.printf_P(PSTR("CURRENT "));
                break;
              case 5:  
                osd.printf_P(PSTR("MOTORS  "));
                break;
              case 6:  
                osd.printf_P(PSTR("PID     "));
                break;
              case 7:  
                osd.printf_P(PSTR("COMPASS "));
                break;
              case 8:  
                osd.printf_P(PSTR("INAV    "));
                break;
             }
             
             //Save current logging item value with roll stick 
             
             //full right enable
             if( (rc1_roll_value > 1800) && (current_tuning_item == i) ) {
               if( i == 0 ) {
                 mavlink_msg_param_set_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, LOG_PARAM_NAME, 0, MAV_VAR_UINT16);
               } else {
                 mavlink_msg_param_set_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, LOG_PARAM_NAME, log_mask_value | LOG_SELECT_POSITION[i], MAV_VAR_UINT16);
               }
               osd_log_refresh_val = true;
             }
             //full left disable
             if( (rc1_roll_value <1200) && (current_tuning_item == i) && (i > 0)) {
               mavlink_msg_param_set_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, LOG_PARAM_NAME, log_mask_value & ~LOG_SELECT_POSITION[i], MAV_VAR_UINT16);
               osd_log_refresh_val = true;
             }
             
             if( (log_mask_value & LOG_SELECT_POSITION[i]) || (log_mask_value == 0 && i == 0) ) {
                osd.printf_P(PSTR("\x7f"));   //For current item to tune
             } else {
                osd.printf_P(PSTR(" "));
             }
             osd.printf_P(PSTR("|"));
        }
        
       
       osd.printf_P(PSTR("|LOGGING MASK \x3e")); //For item to tune display   >
       osd.printf("%5i",log_mask_value); //With current value
       osd.closePanel();  

      //Handle parameter change
        //Pitch stick forward to move up the parameter list, and if parameter a not already change
        if( (rc2_pitch_value < 1200) && !osd_log_change_param) {
            current_tuning_item--;
            current_tuning_item = max(current_tuning_item,0);
            osd_log_change_param = true;       
        //Pitch stick downward to move down the parameter list, and if parameter a not already change
        } else  if( (rc2_pitch_value > 1800) && !osd_log_change_param ) {
            current_tuning_item++;
            current_tuning_item = min(current_tuning_item, NUMBER_LOG_ITEM-1);
            osd_log_change_param = true;
        } 
        
        //When pitch stick is in middle pos., we can change another parameter
        if( abs(rc2_pitch_value - 1500) < 50 ) {
            osd_log_change_param = false;
        }
    }
    
    //Check if OSD Logging is ready
    // Throttle low ( =0 )
    // Pitch middle pos (1450 <> 1550) 
    
    //First step after checkOSD_Tuning()
    if( osd_state_screen & MASK_OSD_LOGGING_CHECK_PWM ) {
        boolean tuning_ready = true;
        osd.setPanel(3, 1);
        osd.openPanel();
        osd.printf_P(PSTR("OSD Logging ready||")); 
        osd.printf_P(PSTR("Throttle low \x3e")); 

        if( rc3_throttle_value < 1200 ) {
            osd.printf_P(PSTR("OK|")); 
        } else {
            osd.printf_P(PSTR("KO|")); 
            tuning_ready = false;
        }

        
        osd.printf_P(PSTR("Pitch mid \x3e")); 
        if( abs(rc2_pitch_value - 1500) < 50 ) {
            osd.printf_P(PSTR("OK|")); 
        } else {
            osd.printf_P(PSTR("KO|")); 
            tuning_ready = false;
        }
        
        osd.printf_P(PSTR("Roll middle \x3e")); 
        if( abs(rc1_roll_value - 1500) < 50 ) {
            osd.printf_P(PSTR("OK|")); 
        } else {
            osd.printf_P(PSTR("KO|")); 
            tuning_ready = false;
        }
        
        osd.closePanel();
        if( tuning_ready ) {
          osd.clear();
          osd_state_screen &= ~MASK_OSD_LOGGING_CHECK_PWM; 
        }
    }
    
    /*
      Close Logging configuration
    */
    if( !(channel7_value > 1800) && (osd_state_screen & MASK_OSD_LOGGING_MODE)) {
        osd.clear();
        osd_state_screen = MASK_OSD_NORMAL_MODE;
    }
}

void checkOSD_Logging() {
  /*
  Start Logging configuration with :
     - Full CH7
     - Full Throttle
     - Full Pitch (Forward)
     - Full Roll right
     - Motor not armed
     - And in Normal mode
     - And no parameter being tuned with CH6
  */
  if( !armed && channel7_value > 1800 && rc3_throttle_value > 1800 && rc2_pitch_value < 1200 && rc1_roll_value > 1800 && (osd_state_screen & MASK_OSD_NORMAL_MODE) && !(osd_state_screen & MASK_OSD_DISPLAY_CH6_VALUE)) {
        //Get last parameter to be tuned
        osd_state_screen = MASK_OSD_LOGGING_MODE | MASK_OSD_LOGGING_CHECK_PWM;
        osd_log_refresh_val = true;
        current_tuning_item = 0;
        osd.clear();     
    }
}

