#if defined(USE_MAVLINK)
#define MAVLINK_EXTERNAL_RX_BUFFER 1
#define m_mavlink_message 1

#include "../GCS_MAVLink/include/mavlink/v1.0/mavlink_types.h"
#elif defined(USE_UAVTALK)
// see https://librepilot.atlassian.net/wiki/display/LPDOC/UavObjects

#include "protocols/UAVTalk.h"
#elif defined(USE_MWII)
#include "protocols/cleanflight.h"
#elif defined(USE_LTM)
#include "protocols/LTM.h"
#endif

#define MAX_OVERLOAD_COUNT 10
#define MAX_FROZEN_COUNT 10


union {
#if defined(USE_MAVLINK)
#define PROTOCOL "MAVLink"
    mavlink_message_t m;
#elif defined(USE_UAVTALK)
#define PROTOCOL "UAVTalk"
    uavtalk_message_t u;
#elif defined(USE_MWII)
#define PROTOCOL "MSP"
    MWII_buffer mwii;
#elif defined(USE_LTM)
#define PROTOCOL "LTM"
    LTM ltm;
#elif defined(USE_NMEA)
#define PROTOCOL "NMEA"

#define NMEA_BUF_LENGTH 0x20
    char string[NMEA_BUF_LENGTH]; // for NMEA parsing
    struct {
        int32_t lat;
        int32_t lon;
        int16_t alt;
        uint16_t hdop;
        int16_t course;
        uint16_t speed;
        uint8_t fix;
        uint8_t sats;
        uint32_t time;
        uint32_t date;
    } nmea;
#endif
    byte bytes[0x40]; // for font uploading 
} msg;


#if defined(USE_MAVLINK)
#define  m_mavlink_buffer (&msg.m)
#include "../GCS_MAVLink/GCS_MAVLink.h"
#endif
