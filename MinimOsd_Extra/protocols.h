#include "../GCS_MAVLink/include/mavlink/v1.0/mavlink_types.h"

// see https://librepilot.atlassian.net/wiki/display/LPDOC/UavObjects
#include "UAVTalk.h"


#define MAVLINK_EXTERNAL_RX_BUFFER 1
#define m_mavlink_message 1


union {
    mavlink_message_t m;
    uavtalk_message_t u;
} msg;



//mavlink_message_t *m_mavlink_buffer = &msg.mv.m;
#define  m_mavlink_buffer (&msg.m)

#include "GCS_MAVLink.h"



