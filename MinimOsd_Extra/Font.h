
static NOINLINE void serial_print_S(PGM_P f){
    Serial.println_P(f);
}

static void NOINLINE print_rff(){
    serial_print_S(PSTR("RFF"));
}

static void font_state(){
        OSD::setPanel(5, 5);
        osd_print_S(PSTR("font uploading "));
        OSD::update();// Show it
}

static void uploadFont() {
    
    SPCR |= (1<<SPR0) | (1<<SPR1); // slow down SPI

    byte byte_count = 0;
    byte bit_count=0;

//  move these local to prevent ram usage
//    uint8_t character_bitmap[0x40];
// protocols buffers don't used when uploading fonts
#define character_bitmap ((byte *)&msgbuf.bytes[0])  

    int font_count = 0;

    print_rff();

    byte chk=0;
    byte got_any_data=0;
    byte c=0;
    byte last_c;
    
    byte b=0;
    
    byte cnt=0;
    
    font_state();
    
    while(font_count < 256) {
	if(Serial.available_S()){ // absense of this is not a good
            last_c = c;
            c = Serial.read_S();
            
            switch(c){ // parse and decode mcm file
            case 0x0A: // line feed - skip
                if(last_c == 0x0d) continue;
                // lf without cr cause line end

            case 0x0d: // carridge return, end of line
                if(!got_any_data) {     // empty CR cause response "RFF"
                    cnt++;
                    print_rff();
                    continue;
                }
                if (bit_count == 8)  {
                    chk ^= b;
                    character_bitmap[byte_count] = b;
                    b = 0;
                    byte_count++;
                }
                bit_count = 0;
                break;

            case 0x30: // ascii '0'
            case 0x31: // ascii '1' 
                b <<= 1;
                if(c == 0x31)
                    b += 1;
                bit_count++;
                
                got_any_data=1;
                break;

            case 'r':
                font_count--;
            break;

            default:
//               Serial.printf_P(PSTR("got bad character: %x\n"),c);
                break;
            }

            // we have one completed character
            // write the character to NVM 
            if(byte_count == 64) {
                osd.write_NVM(font_count, character_bitmap);
                byte_count = 0;
                font_count++;
                serial_print_S(PSTR("CD"));
            //    font_state(font_count); - мешает загрузке шрифтов
                chk=0;
            }
        }
    }
    serial_print_S(PSTR("FD"));

#if defined(SHOW_FONT) && 0
    byte n=0;
    OSD::setPanel(0, 0);

    for(byte j=16; j!=0; j--) { // show full font
        for(byte i=16; i!=0; i--)   {
              osd.write_S((byte)(n));
              n++;
        }
        osd.write_S('\xff');
    }

    osd.update();
#endif

}


