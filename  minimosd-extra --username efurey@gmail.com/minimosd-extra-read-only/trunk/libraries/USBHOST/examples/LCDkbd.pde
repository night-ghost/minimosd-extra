/* MAX3421E USB Host controller LCD/keyboard demonstration */
#include <Spi.h>
#include <Max3421e.h>
#include <Usb.h>
#include <Max_LCD.h>

/* keyboard data taken from configuration descriptor */
#define KBD_ADDR        1
#define KBD_EP          1
#define KBD_IF          0
#define EP_MAXPKTSIZE   8
#define EP_POLL         0x0a
/**/
//******************************************************************************
//  macros to identify special charaters(other than Digits and Alphabets)
//******************************************************************************
#define BANG        (0x1E)
#define AT          (0x1F)
#define POUND       (0x20)
#define DOLLAR      (0x21)
#define PERCENT     (0x22)
#define CAP         (0x23)
#define AND         (0x24)
#define STAR        (0x25)
#define OPENBKT     (0x26)
#define CLOSEBKT    (0x27)

#define RETURN      (0x28)
#define ESCAPE      (0x29)
#define BACKSPACE   (0x2A)
#define TAB         (0x2B)
#define SPACE       (0x2C)
#define HYPHEN      (0x2D)
#define EQUAL       (0x2E)
#define SQBKTOPEN   (0x2F)
#define SQBKTCLOSE  (0x30)
#define BACKSLASH   (0x31)
#define SEMICOLON   (0x33)
#define INVCOMMA    (0x34)
#define TILDE       (0x35)
#define COMMA       (0x36)
#define PERIOD      (0x37)
#define FRONTSLASH  (0x38)
#define DELETE      (0x4c)
/**/
/* Modifier masks. One for both modifiers */
#define SHIFT       0x22
#define CTRL        0x11
#define ALT         0x44
#define GUI         0x88
/**/
/* "Sticky keys */
#define CAPSLOCK    (0x39)
#define NUMLOCK     (0x53)
#define SCROLLLOCK  (0x47)
/* Sticky keys output report bitmasks */
#define bmNUMLOCK       0x01
#define bmCAPSLOCK      0x02
#define bmSCROLLLOCK    0x04
/**/
EP_RECORD ep_record[ 2 ];  //endpoint record structure for the keyboard

char buf[ 8 ] = { 0 };      //keyboard buffer
char old_buf[ 8 ] = { 0 };  //last poll
/* Sticky key state */
bool numLock = false;
bool capsLock = false;
bool scrollLock = false;
bool line = false;

void setup();
void loop();

MAX3421E Max;
USB Usb;
Max_LCD LCD;

void setup() {
  // set up the LCD's number of rows and columns: 
  LCD.begin(16, 2);
  LCD.home();
  Serial.begin( 9600 );
  Serial.println("Start");
  Max.powerOn();
  delay( 200 );
}

void loop() {
    Max.Task();
    Usb.Task();
    if( Usb.getUsbTaskState() == USB_STATE_CONFIGURING ) {  //wait for addressing state
        kbd_init();
        Usb.setUsbTaskState( USB_STATE_RUNNING );
    }
    if( Usb.getUsbTaskState() == USB_STATE_RUNNING ) {  //poll the keyboard  
        kbd_poll();
    }
}
/* Initialize keyboard */
void kbd_init( void )
{
 byte rcode = 0;  //return code
/**/
    /* Initialize data structures */
    ep_record[ 0 ] = *( Usb.getDevTableEntry( 0,0 ));  //copy endpoint 0 parameters
    ep_record[ 1 ].MaxPktSize = EP_MAXPKTSIZE;
    ep_record[ 1 ].Interval  = EP_POLL;
    ep_record[ 1 ].sndToggle = bmSNDTOG0;
    ep_record[ 1 ].rcvToggle = bmRCVTOG0;
    Usb.setDevTableEntry( 1, ep_record );              //plug kbd.endpoint parameters to devtable
    /* Configure device */
    rcode = Usb.setConf( KBD_ADDR, 0, 1 );                    
    if( rcode ) {
        Serial.print("Error attempting to configure keyboard. Return code :");
        Serial.println( rcode, HEX );
        while(1);  //stop
    }
    /* Set boot protocol */
    rcode = Usb.setProto( KBD_ADDR, 0, 0, 0 );
    if( rcode ) {
        Serial.print("Error attempting to configure boot protocol. Return code :");
        Serial.println( rcode, HEX );
        while( 1 );  //stop
    }
    LCD.print("Keyboard initialized");
    delay(2000);
    LCD.clear();
    LCD.home();
    Serial.println("Keyboard initialized");
}

/* Poll keyboard and print result */
/* buffer starts at position 2, 0 is modifier key state and 1 is irrelevant */
void kbd_poll( void )
{
 char i;
 static char leds = 0;
 byte rcode = 0;     //return code
    /* poll keyboard */
    rcode = Usb.inTransfer( KBD_ADDR, KBD_EP, 8, buf );
    if( rcode != 0 ) {
        return;
    }//if ( rcode..
    for( i = 2; i < 8; i++ ) {
     if( buf[ i ] == 0 ) {  //end of non-empty space
        break;
     }
      if( buf_compare( buf[ i ] ) == false ) {   //if new key
        switch( buf[ i ] ) {
          case CAPSLOCK:
            capsLock =! capsLock;
            leds = ( capsLock ) ? leds |= bmCAPSLOCK : leds &= ~bmCAPSLOCK;       // set or clear bit 1 of LED report byte
            break;
          case NUMLOCK:
            numLock =! numLock;
            leds = ( numLock ) ? leds |= bmNUMLOCK : leds &= ~bmNUMLOCK;           // set or clear bit 0 of LED report byte
            break;
          case SCROLLLOCK:
            scrollLock =! scrollLock;
            leds = ( scrollLock ) ? leds |= bmSCROLLLOCK : leds &= ~bmSCROLLLOCK;   // set or clear bit 2 of LED report byte
            break;
          case DELETE:
            LCD.clear();
            LCD.home();
            line = false;
            break;
          case RETURN:
            line =! line;
            LCD.setCursor( 0, line );
            break;  
          default:
            //LCD.print("A");                          //output
            LCD.print( HIDtoA( buf[ i ], buf[ 0 ] ));
            Serial.print(HIDtoA( buf[ i ], buf[ 0 ] ));
            break;
        }//switch( buf[ i ...
        rcode = Usb.setReport( KBD_ADDR, 0, 1, KBD_IF, 0x02, 0, &leds );
        if( rcode ) {
          Serial.print("Set report error: ");
          Serial.println( rcode, HEX );
        }//if( rcode ...
     }//if( buf_compare( buf[ i ] ) == false ...
    }//for( i = 2...
    for( i = 2; i < 8; i++ ) {                    //copy new buffer to old
      old_buf[ i ] = buf[ i ];
    }
}
/* compare byte against bytes in old buffer */
bool buf_compare( byte data )
{
 char i;
 for( i = 2; i < 8; i++ ) {
   if( old_buf[ i ] == data ) {
     return( true );
   }
 }
 return( false );
}

/* HID to ASCII converter. Takes HID keyboard scancode, returns ASCII code */
byte HIDtoA( byte HIDbyte, byte mod )
{
  /* upper row of the keyboard, numbers and special symbols */
  if( HIDbyte >= 0x1e && HIDbyte <= 0x27 ) {
    if(( mod & SHIFT ) || numLock ) {    //shift key pressed
      switch( HIDbyte ) {
        case BANG:  return( 0x21 );
        case AT:    return( 0x40 );
        case POUND: return( 0x23 );
        case DOLLAR: return( 0x24 );
        case PERCENT: return( 0x25 );
        case CAP: return( 0x5e );
        case AND: return( 0x26 );
        case STAR: return( 0x2a );
        case OPENBKT: return( 0x28 );
        case CLOSEBKT: return( 0x29 );
      }//switch( HIDbyte...
    }
    else {                  //numbers
      if( HIDbyte == 0x27 ) {  //zero
        return( 0x30 );
      }
      else {
        return( HIDbyte + 0x13 );
      }
    }//numbers
  }//if( HIDbyte >= 0x1e && HIDbyte <= 0x27
  /**/
  /* number pad. Arrows are not supported */
  if(( HIDbyte >= 0x59 && HIDbyte <= 0x61 ) && ( numLock == true )) {  // numbers 1-9
    return( HIDbyte - 0x28 );
  }
  if(( HIDbyte == 0x62 ) && ( numLock == true )) {                      //zero
    return( 0x30 );
  }
  /* Letters a-z */
  if( HIDbyte >= 0x04 && HIDbyte <= 0x1d ) {
    if((( capsLock == true ) && ( mod & SHIFT ) == 0 ) || (( capsLock == false ) && ( mod & SHIFT ))) {  //upper case
      return( HIDbyte + 0x3d );
    }
    else {  //lower case
      return( HIDbyte + 0x5d );
    }
  }//if( HIDbyte >= 0x04 && HIDbyte <= 0x1d...
  /* Other special symbols */
  if( HIDbyte >= 0x2c && HIDbyte <= 0x38 ) {
    switch( HIDbyte ) {
      case SPACE: return( 0x20 ); 
      case HYPHEN:
        if(( mod & SHIFT ) == false ) {
         return( 0x2d );
        }
        else {
          return( 0x5f );
        }
      case EQUAL:
       if(( mod & SHIFT ) == false ) {
        return( 0x3d );
       }
       else {
        return( 0x2b );
       }
       case SQBKTOPEN:
         if(( mod & SHIFT ) == false ) {
          return( 0x5b );
         }
         else {
          return( 0x7b );
         }
       case SQBKTCLOSE:
         if(( mod & SHIFT ) == false ) {
          return( 0x5d );
         }
         else {
          return( 0x7d );
         } 
       case BACKSLASH:
         if(( mod & SHIFT ) == false ) {
           return( 0x5c );
         }
         else {
           return( 0x7c );
         }
       case SEMICOLON:
         if(( mod & SHIFT ) == false ) {
           return( 0x3b );
         }
         else {
           return( 0x3a );
         }
      case INVCOMMA:
        if(( mod & SHIFT ) == false ) {
          return( 0x27 );
        }
        else {
          return( 0x22 );
        }
      case TILDE:  
        if(( mod & SHIFT ) == false ) {
          return( 0x60 );
        }
        else {
          return( 0x7e );
        }
      case COMMA:   
        if(( mod & SHIFT ) == false ) {
          return( 0x2c );
        }
        else {
          return( 0x3c );
        }
      case PERIOD:
        if(( mod & SHIFT ) == false ) {
          return( 0x2e );
        }
        else {
          return( 0x3e );
        }
      case FRONTSLASH:
        if(( mod & SHIFT ) == false ) {
          return( 0x2f );
        }
        else {
          return( 0x3f );
        }
      default:
        break;
    }//switch( HIDbyte..
  }//if( HIDbye >= 0x2d && HIDbyte <= 0x38..
  return( 0 );
}




