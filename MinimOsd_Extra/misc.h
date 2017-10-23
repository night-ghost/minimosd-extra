#if defined(USE_MAVLINK)  || defined(USE_MAVLINKPX4)

#ifdef MAVLINK_CONFIG


void mavlink_return_packet(uint8_t id, uint8_t len, uint8_t crc);

#pragma pack(push,1)
typedef struct MAV_conf { // needs to fit in 253 bytes
    uint16_t gap; // frame number
    uint8_t magick[4]; // = 0xee 'O' 'S' 'D'
    uint8_t cmd;		// command
    uint8_t id;		// number of 128-bytes block
    uint8_t len;		// real length
    uint8_t data[128];
    uint8_t crc; 		// may be
} Mav_conf;
#pragma pack(pop)

bool parse_osd_packet(uint8_t *p){
    Mav_conf *c = (Mav_conf *)p;

    if(c->magick[0] == 0xEE && c->magick[1] == 'O' && c->magick[2] == 'S' && c->magick[3] == 'D') {
	switch(c->cmd){
	case 'w':
	    eeprom_write_len((uint8_t *)&c->data, (uint16_t)(c->id) * 128,  c->len );
	    lflags.was_mav_config=1;
 #if HARDWARE_TYPE >0
            c->cmd='!'; // confirm
            mavlink_return_packet(MAVLINK_MSG_ID_ENCAPSULATED_DATA, MAVLINK_MSG_ID_ENCAPSULATED_DATA_LEN, MAVLINK_MSG_ID_ENCAPSULATED_DATA_CRC); // send packet back
 #endif
	    return true;
	
	
	case 'b':
	    if(c->len==0 && lflags.was_mav_config) {
#if defined(SLAVE_BUILD)
// just reload new values
                readSettings();

#else 
	        __asm__ __volatile__ (    // Jump to RST vector
	            "clr r30\n"
	            "clr r31\n"
	            "ijmp\n"
	        );
#endif
	    }
	    return true;
#ifdef MAVLINK_READ_EEPROM
        case 'r':
            eeprom_read_len((uint8_t *)&c->data, (uint16_t)(c->id) * 128,  c->len );

            mavlink_return_packet(MAVLINK_MSG_ID_ENCAPSULATED_DATA, MAVLINK_MSG_ID_ENCAPSULATED_DATA_LEN, MAVLINK_MSG_ID_ENCAPSULATED_DATA_CRC); // send packet back
            return true;
            
#endif


#ifdef MAVLINK_FONT_UPLOAD
        case 'f': // font via MAVlink
            osd.write_NVM(*((uint16_t *)(&c->data)), (uint8_t *)(&c->data)+2); // first 2 byte is number, all another is bitmap
 #if HARDWARE_TYPE >0
            c->cmd='!'; // confirm
            mavlink_return_packet(MAVLINK_MSG_ID_ENCAPSULATED_DATA, MAVLINK_MSG_ID_ENCAPSULATED_DATA_LEN, MAVLINK_MSG_ID_ENCAPSULATED_DATA_CRC); // send packet back
 #endif
            return true;
#endif

	default:
	    break;
	}
    }

    return false;
}

// sending in manual mode - calculate CRC and send to UART

/*
    uint16_t checksum; /// sent at end of packet
    uint8_t magic;   ///< protocol magic marker
    uint8_t len;     ///< Length of payload
    uint8_t seq;     ///< Sequence of packet
    uint8_t sysid;   ///< ID of message sender system/aircraft
    uint8_t compid;  ///< ID of the message sender component
    uint8_t msgid;   ///< ID of message in payload
    uint64_t payload64[(MAVLINK_MAX_PAYLOAD_LEN+MAVLINK_NUM_CHECKSUM_BYTES+7)/8];
*/
void mavlink_return_packet(uint8_t id, uint8_t len, uint8_t crc) {
    uint16_t checksum;
    
    msgbuf.m.magic  = MAVLINK_STX;
    msgbuf.m.len    = len;
    msgbuf.m.msgid  = id;
    msgbuf.m.sysid  = mavlink_system.sysid;
    msgbuf.m.compid = MAV_COMP_ID_CAMERA; // stole this id

    checksum = crc_calculate(((const uint8_t*)&msgbuf.m.len), MAVLINK_CORE_HEADER_LEN + len);
#if MAVLINK_CRC_EXTRA
    crc_accumulate(crc, &checksum);
#endif
//    serial_hex_dump((uint8_t *)&msgbuf.m.magic, MAVLINK_NUM_HEADER_BYTES + len);

    _mavlink_send_uart((mavlink_channel_t)0, (const char *)&msgbuf.m.magic, MAVLINK_NUM_HEADER_BYTES);
    _mavlink_send_uart((mavlink_channel_t)0, (const char *)&msgbuf.m.payload64, len );
    _mavlink_send_uart((mavlink_channel_t)0, (const char *)&checksum, 2);    
}


#endif

#endif

