#include "../GCS_MAVLink/include/mavlink/v1.0/mavlink_types.h"

// see https://librepilot.atlassian.net/wiki/display/LPDOC/UavObjects

#if defined(USE_UAVTALK)
#include "UAVTalk.h"
#endif

#define MAVLINK_EXTERNAL_RX_BUFFER 1
#define m_mavlink_message 1


union {
    mavlink_message_t m;
#if defined(USE_UAVTALK)
    uavtalk_message_t u;
#endif
} msg;



//mavlink_message_t *m_mavlink_buffer = &msg.mv.m;
#define  m_mavlink_buffer (&msg.m)

#include "GCS_MAVLink.h"



