
static void uploadFont() {
    
    SPCR |= (1<<SPR0) | (1<<SPR1);

    uint8_t byte_count = 0;
    byte bit_count=0;

    // move these local to prevent ram usage
    uint8_t character_bitmap[0x40];

    int font_count = 0;

    osd.clear();

    Serial.print_P(PSTR("RFF\n"));

    byte chk=0;
    while(font_count < 256) { 
	if(Serial.available_S()){ // absense of this is not a good
            uint8_t incomingByte = Serial.read_S();

            switch(incomingByte){ // parse and decode mcm file
            case 0x0A: // carridge return, end of line
                continue;
            
            case 0x0d: // carridge return, end of line
                //Serial.println("cr");
                if (bit_count == 8)  {
                    byte_count++;
                    character_bitmap[byte_count] = 0;
                }
                bit_count = 0;
                break;
            
            case 0x30: // ascii '0'
            case 0x31: // ascii '1' 
                chk ^= incomingByte;
                character_bitmap[byte_count] <<= 1;
                if(incomingByte == 0x31)
                    character_bitmap[byte_count] += 1;
                bit_count++;
                break;

            case 'r':
                font_count--;
            break;
	
            default:
                break;
            }

            // we have one completed character
            // write the character to NVM 
            if(byte_count == 64) {
                osd.write_NVM(font_count, character_bitmap);
                byte_count = 0;
                font_count++;
                Serial.printf_P(PSTR("CD%d\n"),chk);
                chk=0;
            }
        }
    }
    Serial.printf_P(PSTR("FD\n"));

}


