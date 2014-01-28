
void uploadFont()
{
    uint16_t byte_count = 0;
    byte half_byte_count = 0;
    byte ascii_binary[0x08];

    // move these local to prevent ram usage
    uint8_t character_bitmap[0x40];
    int font_count = 0;

    osd.clear();
//    osd.setPanel(6,9);
//    osd.openPanel();
//    osd.printf_P(PSTR("Character Update"));
//    delay(2000);
//    osd.closePanel();


    Serial.printf_P("Ready for Font\n");

    byte ascii_byte;
    while(font_count < 256) { 
        int8_t incomingByte = Serial.read();
        if(incomingByte = 0x0d){
            //Serial.println("cr");
            if (half_byte_count == 2)
            {
                character_bitmap[byte_count] = ascii_byte;
                byte_count++;
                half_byte_count = 0;
                ascii_byte = 0;
            }
            else
                half_byte_count = 0;
        }
        else if(incomingByte = 0x0a){ // line feed, ignore
            //Serial.println("ln");   
        }
        else if((incomingByte >= 0x30) && (incomingByte <= 0x3F)){
            ascii_byte = ascii_byte + ((incomingByte - '0') * pow(16, half_byte_count));
            half_byte_count++;
        }

        // we have one completed character
        // write the character to NVM 
        if(byte_count == 64)
        {
            osd.write_NVM(font_count, character_bitmap);    
            byte_count = 0;
            font_count++;
            Serial.printf_P("Char Done\n");
        }
    }
}



