//OSD Tuning pannel
boolean tuning_item_change;
float selected_tuning_value = -1; //Actual value of the parameter to tune with CH6, twice this value is used to set MAX_VALUE 
boolean osd_change_param;


void writeTuningPanels(){
   
    if( !(osd_state_screen & MASK_OSD_TUNING_CHECK_PWM) ) {
        osd.setPanel(3, 1);
        osd.openPanel();
        osd.printf_P(PSTR("OSD Tuning activated|")); 
        //Second step after checkOSD_Tuning()
        if( (osd_state_screen & MASK_OSD_TUNING_INIT_VALUE) && current_tuning_item > 0) {
            //Get the current value of the current tuning parameter
            //Parameter index. Send -1 to use the param ID field as identifier (else the param id will be ignored)
            mavlink_msg_param_request_read_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNING_PARAM_NAME_1[current_tuning_item], -1);
            osd_state_screen &= ~MASK_OSD_TUNING_INIT_VALUE; 
        }

        //Dsiplay all parameter that can be tuned, with the value of the selected one
        for (int i=0; i < TUNE_ITEM_NUMBER; i++){
             if( i == current_tuning_item ) {
                osd.printf_P(PSTR("\x98\x99"));  //For current item position, display   =>
             } else {
                osd.printf_P(PSTR("  "));
             }
             //osd.printf_P(PSTR(TUNING_PARAM_LABEL[i]));
             
             switch(i) {
               case 0: 
                osd.printf_P(PSTR("NONE          "));
                break;
              case 1: 
                osd.printf_P(PSTR("STABILIZE_KP  "));
                break;
              case 2:  
                osd.printf_P(PSTR("RATE_KP       "));
                break;
              case 3:  
                osd.printf_P(PSTR("RATE_KI       "));
                break;
              case 4:  
                osd.printf_P(PSTR("RATE_KD       "));
                break;
              case 5:  
                osd.printf_P(PSTR("RATE_YAW_P    "));
                break;
              case 6:  
                osd.printf_P(PSTR("ACRO_P        "));
                break;
             }
             if( i == tuning_item_selected ) {
                osd.printf_P(PSTR("\xa8\xa9"));   //For current item to tune, display   <=
             } else {
                osd.printf_P(PSTR("  "));
             }
             
             //Save current tuning item value with roll stick full left or full right
             if( (rc1_roll_value <1200 || rc1_roll_value > 1800) && current_tuning_item > 0 && current_tuning_item == i ) {
                 mavlink_msg_param_set_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNING_PARAM_NAME_1[current_tuning_item], current_tuning_value, MAV_VAR_FLOAT);
                 mavlink_msg_param_set_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNING_PARAM_NAME_2[current_tuning_item], current_tuning_value, MAV_VAR_FLOAT);
                 osd.printf_P(PSTR("\xfb")); //Display sablier
             } else {
                 osd.printf_P(PSTR(" "));
             }
             osd.printf_P(PSTR("|"));
        }   
        if( current_tuning_item > 0 ) {
            osd.printf_P(PSTR("VALUE \x3e")); //For item to tune display   >
            osd.printf("%1.4f",current_tuning_value); //With current value
        } else {
            osd.printf_P(PSTR("                       "));
        }

        osd.closePanel();    
    }
    
    
    //Handle parameter change
    if( !(osd_state_screen & MASK_OSD_TUNING_CHECK_PWM) ) {
        //Pitch stick forward to move up the parameter list, and if parameter a not already change
        if( rc2_pitch_value < 1200 && !osd_change_param) {
            current_tuning_item--;
            current_tuning_item = max(current_tuning_item,0);
            osd_change_param = true;
            //If current item is not NONE (>0), then ask for current value of the new item
            if( current_tuning_item > 0) mavlink_msg_param_request_read_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNING_PARAM_NAME_1[current_tuning_item], -1);
       
        //Pitch stick downward to move down the parameter list, and if parameter a not already change
        } else  if( rc2_pitch_value > 1800 && !osd_change_param ) {
            current_tuning_item++;
            current_tuning_item = min(current_tuning_item, TUNE_ITEM_NUMBER-1);
            osd_change_param = true;
            //Ask for current value of the new item
            mavlink_msg_param_request_read_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNING_PARAM_NAME_1[current_tuning_item], -1);
        } 
        
        //Select new parameter to tune with Throttle stick to full
        if( rc3_throttle_value > 1800 && !tuning_item_change) {
            tuning_item_change = true;
            tuning_item_selected = current_tuning_item;
            if( current_tuning_item > 0 ) {
              selected_tuning_value = current_tuning_value; 
            } else {
              selected_tuning_value = 0; 
            }
        }
        
        //When pitch stick is in middle pos., we can change another parameter
        if( abs(rc2_pitch_value - 1500) < 50 ) {
            osd_change_param = false;
        }
        
        //Ready for new selection of parameter to tune, when Throttle stick to low
        if( rc3_throttle_value < 1200 ) {
            tuning_item_change = false;
        }
    }
     
    //Check if OSD tuning is ready
    // Throttle low ( =0 )
    // Pitch middle pos (1450 <> 1550) 
    
    //First step after checkOSD_Tuning()
    if( osd_state_screen & MASK_OSD_TUNING_CHECK_PWM ) {
        boolean tuning_ready = true;
        osd.setPanel(3, 1);
        osd.openPanel();
        osd.printf_P(PSTR("OSD Tuning ready    |||")); 
        osd.printf_P(PSTR("Throttle low \x3e")); 

        if( rc3_throttle_value < 1200 ) {
            osd.printf_P(PSTR("OK|")); 
        } else {
            osd.printf_P(PSTR("KO|")); 
            tuning_ready = false;
        }

        
        osd.printf_P(PSTR("Pitch middle \x3e")); 
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
          osd_state_screen |= MASK_OSD_TUNING_INIT_VALUE; 
          osd_state_screen &= ~MASK_OSD_TUNING_CHECK_PWM; 
        }
    }
    
    /*
      Close Tuning configuration
    */
    //If OSD tuning was displayed, and closing is asked, then send new tuning request if parameter is not NONE:
    // TUNE_LOW_NAME : 
    // TUNE_HIGH_NAME : 
    // TUNE_PARAM_NAME : 
    if( !(channel7_value > 1800) && (osd_state_screen & MASK_OSD_TUNING_MODE)) {
        osd.clear();
        osd_state_screen = MASK_OSD_NORMAL_MODE;
        if( tuning_item_selected > 0 ) {
            osd_state_screen |= MASK_OSD_DISPLAY_CH6_VALUE;
            //Range from 0 to 2 times current value, so middle is current value
            //Current value is 1/1000
            mavlink_msg_param_set_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNE_LOW_NAME, 0, MAV_VAR_FLOAT);
            mavlink_msg_param_set_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNE_HIGH_NAME, selected_tuning_value * 2000.0f, MAV_VAR_FLOAT);
            
            mavlink_msg_param_set_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNE_PARAM_NAME, TUNING_OPT_ID[tuning_item_selected], MAV_VAR_INT8); 
        }
    }
    
}

void checkOSD_Tuning() {
  /*
  Start Tuning configuration with :
     - Full CH7
     - Full Throttle
     - Full Pitch (Forward)
     - Full Roll left
     - Motor not armed
     - And in Normal mode
  */
  if( !armed && channel7_value > 1800 && rc3_throttle_value > 1800 && rc2_pitch_value < 1200 && rc1_roll_value < 1200 && (osd_state_screen & MASK_OSD_NORMAL_MODE) ) {
        //Get last parameter to be tuned
        osd_state_screen = MASK_OSD_TUNING_CH6_PARAM | MASK_OSD_TUNING_MODE | MASK_OSD_TUNING_CHECK_PWM;
        mavlink_msg_param_request_read_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNE_PARAM_NAME, -1);//TUNE_PARAM_ID);

        //Disable tuning, to avoid any problem with RC6
        mavlink_msg_param_set_send( MAVLINK_COMM_0, apm_mav_system, apm_mav_component, TUNE_PARAM_NAME, 0, MAV_VAR_INT8);  
        osd.clear();     
    }
}

