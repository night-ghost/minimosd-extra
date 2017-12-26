#ifdef SLAVE_BUILD

mavlink_param_value_t * params_list=0;

/*
    parameters:
    
    
    we send PARAM_REQUEST_LIST
    AP answers with PARAM_VALUE for each parameter
    
    or for one param send PARAM_REQUEST_READ, AP answers with  PARAM_VALUE


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
    if(params_list == NULL) { // the first parameter so allocate memory
        param_list = (mavlink_param_value_t *)malloc(param->param_count * sizeof(mavlink_param_value_t));
        if(params_list == NULL) return; // no memory
        
        param_remains = param->param_count - 1; // remember
    }
    
    memmove(&params_list[param_index], param, sizeof(mavlink_param_value_t) );
    
    param_remains--;
}


void setup_params(){
    mavlink_msg_param_request_list_send(MAVLINK_COMM_0, apm_mav_system, apm_mav_component);
    
}

#endif