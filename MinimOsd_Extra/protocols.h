#if defined(USE_MAVLINK)
#include "../GCS_MAVLink/include/mavlink/v1.0/mavlink_types.h"
#endif

// see https://librepilot.atlassian.net/wiki/display/LPDOC/UavObjects

#if defined(USE_UAVTALK)
#include "protocols/UAVTalk.h"
#endif

#if defined(USE_MWII)
#include "protocols/cleanflight.h"
#endif

#if defined(USE_LTM)
#include "protocols/LTM.h"
#endif

#define MAVLINK_EXTERNAL_RX_BUFFER 1
#define m_mavlink_message 1



union {
#if defined(USE_MAVLINK)
    mavlink_message_t m;
#endif
#if defined(USE_UAVTALK)
    uavtalk_message_t u;
#endif
#if defined(USE_MWII)
    MWII_buffer mwii;
#endif
#if defined(USE_LTM)
    LTM ltm;
#endif
} msg;


//mavlink_message_t *m_mavlink_buffer = &msg.mv.m;

#if defined(USE_MAVLINK)
#define  m_mavlink_buffer (&msg.m)
#include "../GCS_MAVLink/GCS_MAVLink.h"
#endif
