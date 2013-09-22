

/* MAX3421E USB Host controller LCD/PS3 demonstration */
#include <Spi.h>
#include <Max3421e.h>
#include <Usb.h>
#include <Max_LCD.h>
#include <MemoryFree.h>
#include <avr/pgmspace.h>

/*The application will work in reduced host mode, so we can save program and data
memory space. After verifying the PID and VID we will use known values for the 
configuration values for device, interface, endpoints and HID */

/* PS3 data taken from descriptors */
#define PS3_ADDR        1
#define PS3_VID_LO      0x4c  // Sony VID
#define PS3_VID_HI      0x05
#define PS3_PID_LO      0x68  // Batch Device
#define PS3_PID_HI      0x02
#define PS3_CONFIGURATION 1
#define PS3_IF          0
#define PS3_NUM_EP      3
#define EP_MAXPKTSIZE   64
#define EP_INTERRUPT    0x03 
#define EP_POLL         0x01
#define CONTROL_EP      0
#define OUTPUT_EP       1
#define REPORT_EP       2


#define PS3_F4_REPORT_LEN 4
#define PS3_F5_REPORT_LEN 8
#define PS3_01_REPORT_LEN 48
#define HID_REPORT_FEATURE 3 
#define HID_REPORT_OUTPUT  2
#define PS3_F4_REPORT_ID  0xF4
#define PS3_01_REPORT_ID  0x01
#define PS3_F5_REPORT_ID 0xF5

/* Defines for the PS3 Data in the HID Report
*/
#define LAnalogX    buf[6]
#define LAnalogY    buf[7]
#define RAnalogX    buf[8]
#define RAnalogY    buf[9]
#define buttons1    buf[2]
#define buttons2    buf[3]
#define buttons3    buf[4]
#define buttonchange ((buttons1 != oldbuttons1) | (buttons2 != oldbuttons2))
#define buSelect    (buttons1 & 0x01)
#define buLAnalog   (buttons1 & 0x02)
#define buRAnalog   (buttons1 & 0x04)
#define buStart     (buttons1 & 0x08)
#define buUp        (buttons1 & 0x10)
#define buRight     (buttons1 & 0x20)
#define buDown      (buttons1 & 0x40)
#define buLeft      (buttons1 & 0x80)
#define buL2        (buttons2 & 0x01)
#define buR2        (buttons2 & 0x02)
#define buL1        (buttons2 & 0x04)
#define buR1        (buttons2 & 0x08)
#define buTriangle  (buttons2 & 0x10)
#define buCircle    (buttons2 & 0x20)
#define buCross     (buttons2 & 0x40)
#define buSquare    (buttons2 & 0x80)
#define buPS        (buttons3 & 0x01)
#define AnalogUp    buf[14]
#define AnalogRight buf[15]
#define AnalogDown  buf[16]
#define AnalogLeft  buf[17]
#define AnalogL2    buf[18]
#define AnalogR2    buf[19]
#define AnalogL1    buf[20]
#define AnalogR1    buf[21]
#define AnalogTriangle buf[22]
#define AnalogCircle buf[23]
#define AnalogCross  buf[24]
#define AnalogSquare buf[25]
#define AccelX      (((unsigned char)buf[42] | (unsigned char)buf[41] << 8)-512)
#define AccelY      (((unsigned char)buf[44] | (unsigned char)buf[43] << 8)-512)
#define AccelZ      (((unsigned char)buf[46] | (unsigned char)buf[45] << 8)-512)
#define GyroX       (((unsigned char)buf[48] | (unsigned char)buf[47] << 8)-512)



/*Menu screens

*/
#define Root    0
#define Basic   1
#define Buttons 2
#define Joystick 3
#define Pressure 4
#define Accelerometer 5
#define LED 6
#define Bdaddr 7
#define Freememory 8


/* Menu Text
*/

prog_char menutext_0[] PROGMEM = "Select Test";
prog_char menutext_1[] PROGMEM = "Basic Tests";  
prog_char menutext_2[] PROGMEM = "Buttons Test";
prog_char menutext_3[] PROGMEM = "Joystick Test";
prog_char menutext_4[] PROGMEM = "Pressure Test";
prog_char menutext_5[] PROGMEM = "Motion Test";
prog_char menutext_6[] PROGMEM = "LED/Rumble Test";
prog_char menutext_7[] PROGMEM = "Bluetooth Addr";
prog_char menutext_8[] PROGMEM = "Free Memory";


PROGMEM const char *menu_table[] = 	  
{   
  menutext_0,
  menutext_1,
  menutext_2,
  menutext_3,
  menutext_4,
  menutext_5,
  menutext_6,
  menutext_7,
  menutext_8 };

prog_char output_01_report[] PROGMEM = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                     0x00, 0x02, 0xff, 0x27, 0x10, 0x00, 0x32, 0xff, 
                                     0x27, 0x10, 0x00, 0x32, 0xff, 0x27, 0x10, 0x00, 
                                     0x32, 0xff, 0x27, 0x10, 0x00, 0x32, 0x00, 0x00, 
                                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

prog_char feature_F4_report[] PROGMEM = {0x42, 0x0c, 0x00, 0x00};

EP_RECORD ep_record[ PS3_NUM_EP ];  //endpoint record structure for the PS3 controller

char buf[ 64 ] = { 0 };      //General purpose buffer for usb data
char oldbuttons1, oldbuttons2;
char screen, selscreen;
char lcdbuffer[17];
unsigned char bdaddr[6];
char bdcursor;
char ledrum;
char lrcursor;


void setup();
void loop();

MAX3421E Max;
USB Usb;
Max_LCD LCD;

void setup() {
  // set up the LCD's number of rows and columns: 
  LCD.begin(16, 2);
  LCD.home();
  LCD.print("PS3 Controller");
  LCD.setCursor(0,1);
  LCD.print("Wait for connect");
  Serial.begin( 9600 );
  Serial.println("PS3 Controller Start");
  Serial.print("freeMemory() reports ");
  Serial.println( freeMemory() );
  Max.powerOn();
  delay(200);
}

void loop() {
  

    Max.Task();
    Usb.Task();
    if( Usb.getUsbTaskState() == USB_STATE_CONFIGURING ) {  //wait for addressing state
        PS3_init();
        process_report();
        Usb.setUsbTaskState( USB_STATE_RUNNING );
    }
    if( Usb.getUsbTaskState() == USB_STATE_RUNNING ) {  //poll the PS3 Controller 
        PS3_poll();
    }
}
/* Initialize PS3 Controller */
void PS3_init( void )
{
 byte rcode = 0;  //return code
 byte i;
/**/

    /* Initialize data structures for endpoints of device 1*/
    ep_record[ CONTROL_EP ] = *( Usb.getDevTableEntry( 0,0 ));  //copy endpoint 0 parameters
    ep_record[ OUTPUT_EP ].epAddr = 0x02;    // PS3 output endpoint
    ep_record[ OUTPUT_EP ].Attr  = EP_INTERRUPT;
    ep_record[ OUTPUT_EP ].MaxPktSize = EP_MAXPKTSIZE;
    ep_record[ OUTPUT_EP ].Interval  = EP_POLL;
    ep_record[ OUTPUT_EP ].sndToggle = bmSNDTOG0;
    ep_record[ OUTPUT_EP ].rcvToggle = bmRCVTOG0;
    ep_record[ REPORT_EP ].epAddr = 0x01;    // PS3 report endpoint
    ep_record[ REPORT_EP ].Attr  = EP_INTERRUPT;
    ep_record[ REPORT_EP ].MaxPktSize = EP_MAXPKTSIZE;
    ep_record[ REPORT_EP ].Interval  = EP_POLL;
    ep_record[ REPORT_EP ].sndToggle = bmSNDTOG0;
    ep_record[ REPORT_EP ].rcvToggle = bmRCVTOG0;
    
    Usb.setDevTableEntry( PS3_ADDR, ep_record );              //plug kbd.endpoint parameters to devtable
    
    /* read the device descriptor and check VID and PID*/
    rcode = Usb.getDevDescr( PS3_ADDR, ep_record[ CONTROL_EP ].epAddr, DEV_DESCR_LEN , buf );
    if( rcode ) {
        Serial.print("Error attempting read device descriptor. Return code :");
        Serial.println( rcode, HEX );
        while(1);  //stop
    }
    if((buf[ 8 ] != PS3_VID_LO) || (buf[ 9 ] != PS3_VID_HI) || (buf[ 10 ] != PS3_PID_LO) || (buf[ 11 ] != PS3_PID_HI) ) {
        Serial.print("Unsupported USB Device");
          while(1);  //stop   
    }
    
    /* Configure device */
    rcode = Usb.setConf( PS3_ADDR, ep_record[ CONTROL_EP ].epAddr, PS3_CONFIGURATION );                    
    if( rcode ) {
        Serial.print("Error attempting to configure PS3 controller. Return code :");
        Serial.println( rcode, HEX );
        while(1);  //stop
    }
    
 
    /* Set the PS3 controller to send reports */
    for (i=0; i < PS3_F4_REPORT_LEN; i++) buf[i] = pgm_read_byte_near( feature_F4_report + i); 
    rcode = Usb.setReport( PS3_ADDR, ep_record[ CONTROL_EP ].epAddr, PS3_F4_REPORT_LEN,  PS3_IF, HID_REPORT_FEATURE, PS3_F4_REPORT_ID , buf );
    if( rcode ) {
        Serial.print("Set report error: ");
        Serial.println( rcode, HEX );
        while(1);  //stop
       
    }
    
    /* Set the PS3 controller LED 1 On */
    for (i=0; i < PS3_01_REPORT_LEN; i++) buf[i] = pgm_read_byte_near( output_01_report + i); 
    rcode = Usb.setReport( PS3_ADDR, ep_record[ CONTROL_EP ].epAddr, PS3_01_REPORT_LEN,  PS3_IF, HID_REPORT_OUTPUT, PS3_01_REPORT_ID , buf );
    if( rcode ) {
        Serial.print("Set report error: ");
        Serial.println( rcode, HEX );
        while(1);  //stop
       
    }
    
    LCD.print("PS3 initialized");
    Serial.println("PS3 initialized");
    delay(200);
    screen = Root;
    selscreen = Basic;
    LCD.clear();
    LCD.home();
    LCD.print("Main Menu");
    LCD.setCursor(0,1);
    strcpy_P(lcdbuffer, (char*)pgm_read_word(&(menu_table[selscreen]))); 
    LCD.print(lcdbuffer);

    
}

/* Poll PS3 and print result */

void PS3_poll( void )
{
 
 byte rcode = 0;     //return code
    /* poll PS3 */
    rcode = Usb.inTransfer(PS3_ADDR, ep_record[ REPORT_EP ].epAddr, PS3_01_REPORT_LEN, buf );
    if( rcode != 0 ) {
       return;
    }
    process_report();
    return;
}

void process_report(void)
{
  byte i, j, mask;
  if(buPS){
    screen = Root;
    selscreen = Basic;
    LCD.clear();
    LCD.home();
    LCD.print("Main Menu");
    LCD.setCursor(0,1);
    strcpy_P(lcdbuffer, (char*)pgm_read_word(&(menu_table[selscreen]))); 
    LCD.print(lcdbuffer);
    oldbuttons1 = buttons1;
    oldbuttons2 = buttons2;

  }
  
  switch (screen){
    
    case Root:     
      if(buttonchange){
        if(buDown) selscreen--;
        else if(buUp | buSelect) selscreen++;
        else if(buStart) {
          screen = selscreen;
          LCD.clear();
          oldbuttons1 = buttons1;
          oldbuttons2 = buttons2;
          break;
        }
        else {
          oldbuttons1 = buttons1;
          oldbuttons2 = buttons2;
          break;
          
        }
        if (selscreen == 0) selscreen = 1;
        if (selscreen > 8) selscreen = 1;
        LCD.clear();
        LCD.home();
        LCD.print("Main Menu:");
        LCD.setCursor(0,1);
        strcpy_P(lcdbuffer, (char*)pgm_read_word(&(menu_table[selscreen]))); 
        LCD.print(lcdbuffer);
        oldbuttons1 = buttons1;
        oldbuttons2 = buttons2;
      }
      break;
    
    case Basic:
      if(buttonchange){
        LCD.home();
        if (buL1) LCD.print('X');
        else LCD.print(' ');
        LCD.print("  Test L/R");
        LCD.setCursor(0,1);
        if (buL2) LCD.print('X');
        else LCD.print(' ');
        LCD.print("  Buttons");
        LCD.setCursor(15,0);
        if (buR1) LCD.print('X');
        else LCD.print(' ');
        
        LCD.setCursor(15,1);
        if (buR2) LCD.print('X');
        else LCD.print(' ');
      }
      
      break;
    
    case Buttons:  
      if(buttonchange){
        LCD.home();
        LCD.print("0123456789ABCDEF");
        LCD.setCursor(0,1);
        mask = 1;
        for( i = 0; i < 8; i++){
          if (buttons1 & mask) lcdbuffer[i] = '^';
          else lcdbuffer[i] = ' ';
          mask <<= 1;
        }
        mask = 1;
        for( i = 0; i < 8; i++){
          if (buttons2 & mask) lcdbuffer[i+8] = '^';
          else lcdbuffer[i+8] = ' ';
          mask <<= 1;
        }
        LCD.print(lcdbuffer);
        oldbuttons1 = buttons1;
        oldbuttons2 = buttons2;
 
      }
      
      break;
    
    case Joystick:
      LCD.home();
      LCD.print('^');
      LCD.print((unsigned char)LAnalogY, DEC);
      LCD.print("  ");
      LCD.setCursor(8,0);
      LCD.print('^');
      LCD.print((unsigned char)RAnalogY, DEC);
      LCD.print("  ");
      LCD.setCursor(0,1);
      LCD.print('>');
      LCD.print((unsigned char)LAnalogX, DEC);
      LCD.print("  ");
      LCD.setCursor(8,1);
      LCD.print('>');
      LCD.print((unsigned char)RAnalogX, DEC);
      LCD.print("  ");
      break;
      
    case Pressure:
      LCD.home();
      LCD.print((unsigned char)AnalogUp, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogDown, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogLeft, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogRight, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogL1, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogR1, DEC);
      LCD.print("      ");
 
      LCD.setCursor(0,1);
      LCD.print((unsigned char)AnalogCircle, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogTriangle, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogSquare, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogCross, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogL2, DEC);
      LCD.print(" ");
      LCD.print((unsigned char)AnalogR2, DEC);
      LCD.print("      ");
     
      break;
      
    case Accelerometer:
      LCD.home();
      LCD.print('X');
      LCD.print(AccelX, DEC);
      LCD.print("  ");
      LCD.setCursor(8,0);
      LCD.print('Y');
      LCD.print(AccelY, DEC);
      LCD.print("  ");
      LCD.setCursor(0,1);
      LCD.print('Z');
      LCD.print(AccelZ, DEC);
      LCD.print("  ");
      LCD.setCursor(8,1);
      LCD.print('G');
      LCD.print(GyroX, DEC);
      LCD.print("  ");
      break;
      
    case LED:
      if(buttonchange){
        oldbuttons1 = buttons1;
        oldbuttons2 = buttons2;
        if (buRight) lrcursor++;
        else if (buLeft) lrcursor--;
        else if (buUp) ledrum |= 1 << lrcursor;
        else if (buDown) ledrum &= ~(1 << lrcursor);
        if (lrcursor > 7) lrcursor = 0;
        if (lrcursor < 0) lrcursor = 7;
      }
      LCD.home();
      LCD.print("1 2 3 4 S W ");
      LCD.setCursor(0,1);
      j = 0;
      for (i=0; i < 6; i++){
        if(ledrum & 1 << i) lcdbuffer[j] = 'X';
        else lcdbuffer[j] = ' ';
        j++; ;
        lcdbuffer[j] = ' ';
        j++;
      }
      lcdbuffer[j] = 0;
      LCD.print(lcdbuffer);
      LCD.setCursor((lrcursor * 2),1);
      LCD.cursor();
      /* default buffer values */
      for (i=0; i < PS3_01_REPORT_LEN; i++) buf[i] = pgm_read_byte_near( output_01_report + i); 
      /* LED setings */
      buf[9] = (ledrum & 0x0f) << 1;
      /* rumble settings */
      if (ledrum & 0x30){
        buf[1] = buf[3] = 0xfe;
        if (ledrum & 0x10) buf[4] = 0xff;
        else buf[2] = 0xff;
      }
      
      Usb.setReport( PS3_ADDR, ep_record[ CONTROL_EP ].epAddr, PS3_01_REPORT_LEN,  PS3_IF, HID_REPORT_OUTPUT, PS3_01_REPORT_ID , buf );

      delay(100);
      LCD.noCursor();
      break;
      
    case Bdaddr:
      if(buttonchange){
        oldbuttons1 = buttons1;
        oldbuttons2 = buttons2;
 
        if (buRight) bdcursor++;
        else if (buLeft) bdcursor--;
        if (bdcursor > 11) bdcursor = 0;
        if (bdcursor < 0) bdcursor = 11;
        if(buUp){
          if(bdcursor % 2){
            if ((bdaddr[bdcursor /2] & 0x0f) == 0x0f) bdaddr[bdcursor /2] &= 0xf0;
            bdaddr[bdcursor / 2] += 0x1;           
          }
          else{
            if ((bdaddr[bdcursor /2] & 0xf0) == 0xf0) bdaddr[bdcursor /2] &= 0x0f;
            bdaddr[bdcursor / 2] += 0x10;       
          }
          
        }
        else if (buDown){
          if(bdcursor % 2){
            if ((bdaddr[bdcursor /2] & 0x0f) == 0x0) bdaddr[bdcursor /2] |= 0x0f;
            bdaddr[bdcursor / 2] -= 0x1;           
          }
          else{
            if ((bdaddr[bdcursor /2] & 0xf0) == 0x0) bdaddr[bdcursor /2] |= 0xf0;
            bdaddr[bdcursor / 2] -= 0x10;       
          }
         
         }
         if( buCross){
           buf[0] = 0x01;
           buf[1] = 0x00;
           for (i=0; i < 6; i++){
             buf[i+2] = bdaddr[i];
           }
          Serial.println( "bdaddr"); 
          Usb.setReport( PS3_ADDR, ep_record[ CONTROL_EP ].epAddr, PS3_F5_REPORT_LEN,  PS3_IF, HID_REPORT_FEATURE, PS3_F5_REPORT_ID , buf ); 
        }
      }
      LCD.home();
      LCD.print("R: ");
      Usb.getReport( PS3_ADDR, ep_record[ CONTROL_EP ].epAddr, PS3_F5_REPORT_LEN,  PS3_IF, HID_REPORT_FEATURE, PS3_F5_REPORT_ID , buf );
      for( i=0; i < 6; i++){
        if ((unsigned char)buf[i+2] < 16) LCD.print ('0');
        LCD.print((unsigned char)buf[i + 2], HEX);
      }
      
      LCD.setCursor(0,1);
      LCD.print("W: ");
      for( i=0; i < 6; i++){
        if (bdaddr[i] < 16) LCD.print ('0');
        LCD.print(bdaddr[i], HEX);
      }
      LCD.setCursor(3 + bdcursor ,1);
      LCD.cursor();
      
      delay(100);
      LCD.noCursor();
      break;
      
    case Freememory:
      LCD.home();
      LCD.print("Free Memory ");
      LCD.print( freeMemory(), DEC );
      LCD.setCursor(0,1);
      break;
    
    default:
      break;
      
  }
  
  return;
}




