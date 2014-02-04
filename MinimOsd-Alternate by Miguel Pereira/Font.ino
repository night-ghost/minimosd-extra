
void uploadFont()
{
    uint8_t byte_count = 0;
    //byte ascii_binary[0x08];

    // move these local to prevent ram usage
    uint8_t character_bitmap[0x40];
    int font_count = 0;

    osd.clear();
//    osd.setPanel(6,9);
//    osd.openPanel();
//    osd.printf_P(PSTR("Character Update"));
//    delay(2000);
//    osd.closePanel();

    Serial.printf_P(PSTR("Ready for Font\n"));

    //byte ascii_byte;
    while(font_count < 256) { 
        int8_t incomingByte = Serial.read();
        boolean half_byte_count = 0;
        //New line means 'one char sent'
        if(incomingByte == 0x0d){
            osd.write_NVM(font_count, character_bitmap);    
            //byte_count = 0;
            font_count++;
            Serial.printf_P(PSTR("Char Done\n"));
        }
        else if((incomingByte >= 0x30) && (incomingByte <= 0x3F)){
          if(half_byte_count = 0){
            character_bitmap[byte_count] = character_bitmap[byte_count] + (incomingByte - '0');
            half_byte_count = 1;
          }
          else
          {
             character_bitmap[byte_count] = character_bitmap[byte_count] + ((incomingByte - '0') * 16);
             //character_bitmap[byte_count] = ascii_byte;
             byte_count++;
             half_byte_count = 0;
             //ascii_byte = 0;
           }
        }
    }
}



