#if defined(USE_MAVLINK)

#ifdef MAVLINK_CONFIG


void mavlink_return_packet(uint8_t id, uint8_t len, uint8_t crc);

struct Mav_conf { // needs to fit in 253 bytes
    byte magick[4]; // = 0xee 'O' 'S' 'D'
    byte cmd;		// command
    byte id;		// number of 128-bytes block
    byte len;		// real length
    byte data[128];
    byte crc; 		// may be
};

void parse_osd_packet(byte *p){
    struct Mav_conf *c = (struct Mav_conf *)p;

    if(c->magick[0] == 0xEE && c->magick[1] == 'O' && c->magick[2] == 'S' && c->magick[3] == 'D') {
	switch(c->cmd){
	case 'w':
	    eeprom_write_len((byte *)&c->data, (uint16_t)(c->id) * 128,  c->len );
	    lflags.was_mav_config=1;
	    break;
	
	
	case 'b':
	    if(c->len==0 && lflags.was_mav_config) {
#if defined(SLAVE_BUILD)
// nothing to do
#else 
	        __asm__ __volatile__ (    // Jump to RST vector
	            "clr r30\n"
	            "clr r31\n"
	            "ijmp\n"
	        );
#endif
	    }
	    break;
#ifdef MAVLINK_READ_EEPROM
        case 'r':
            eeprom_read_len((byte *)&c->data, (uint16_t)(c->id) * 128,  c->len );

            mavlink_return_packet(MAVLINK_MSG_ID_ENCAPSULATED_DATA, MAVLINK_MSG_ID_ENCAPSULATED_DATA_LEN, MAVLINK_MSG_ID_ENCAPSULATED_DATA_CRC); // send packet back
            break;
            
#endif


#ifdef MAVLINK_FONT_UPLOAD
        case 'f': // font via MAVlink
            osd.write_NVM(*((uint16_t *)(&c->data)), (uint8_t *)(&c->data)+2); // first 2 byte is number, all another is bitmap
            break;
#endif

	default:
	    break;
	}
    }

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
    
    msg.m.magic  = MAVLINK_STX;
    msg.m.len    = len;
    msg.m.msgid  = id;
    msg.m.sysid  = mavlink_system.sysid;
    msg.m.compid = MAV_COMP_ID_CAMERA; // stole this id

    checksum = crc_calculate(((const uint8_t*)&msg.m.len), MAVLINK_CORE_HEADER_LEN + len);
#if MAVLINK_CRC_EXTRA
    crc_accumulate(crc, &checksum);
#endif
//    serial_hex_dump((byte *)&msg.m.magic, MAVLINK_NUM_HEADER_BYTES + len);

    _mavlink_send_uart((mavlink_channel_t)0, (const char *)&msg.m.magic, MAVLINK_NUM_HEADER_BYTES);
    _mavlink_send_uart((mavlink_channel_t)0, (const char *)&msg.m.payload64, len );
    _mavlink_send_uart((mavlink_channel_t)0, (const char *)&checksum, 2);    
}


#endif

#endif

