#ifdef SLAVE_BUILD

mavlink_param_value_t * params_list=0;

/*
    parameters:
    
    
    we send PARAM_REQUEST_LIST
    AP answers with PARAM_VALUE for each parameter
    
    or for one param send PARAM_REQUEST_READ, AP answers with  PARAM_VALUE


    if param_index == -1 then this is unsolicit parameter sending

*/


/*
typedef struct __mavlink_param_value_t
{
 float param_value;    ///< Onboard parameter value
 uint16_t param_count; ///< Total number of onboard parameters
 uint16_t param_index; ///< Index of this onboard parameter
 char param_id[16];    ///< Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination (NULL) b
 uint8_t param_type;   ///< Onboard parameter type: see the MAV_PARAM_TYPE enum for supported data types.
} mavlink_param_value_t;
                
*/

uint16_t param_remains;

void push_parameter(mavlink_param_value_t *param){
    if(param->param_index==65535) { // auto-send params
        if(params_list == NULL) return; // no loaded params - just ignore
        
        // prams already loaded, find and set new value
        for(uint16_t i=0; i<param->param_count; i++){
            if(strncmp(param->param_id, params_list[i].param_id, 16) == 0){ // found!
                params_list[i].param_value = param->param_value;
                break;
            }
        }
        return;
    }
    // parameters from list
    if(params_list == NULL) { // the first parameter so allocate memory
        params_list = (mavlink_param_value_t *)malloc(param->param_count * sizeof(mavlink_param_value_t));
        if(params_list == NULL) return; // no memory
        
        param_remains = param->param_count - 1; // remember
    }
    
    memmove(&params_list[param->param_index], param, sizeof(mavlink_param_value_t) );
    
    param_remains--;
    
    
    OSD::setPanel(20, 1);
    osd_printi_1("%3d%%",  ((param->param_count - param_remains) * 100 + param->param_count/2) / param->param_count);
}


void setup_params(){
    if(params_list == NULL){ // only once 
        mavlink_msg_param_request_list_send(MAVLINK_COMM_0, apm_mav_system, apm_mav_component);
    }
    
}

#endif