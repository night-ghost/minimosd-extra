/* AL5D robotic arm manual control using USB mouse. Servo controller by Renbotics with some pins swapped, USB Host Shield by Circuits At Home */
#include <ServoShield.h>
#include <Spi.h>
#include <Max3421e.h>
#include <Usb.h>
 
#define DEVADDR 1
#define CONFVALUE 1




/* Arm dimensions( mm ) */
#define BASE_HGT 67.31      //base hight 2.65"
#define HUMERUS 146.05      //shoulder-to-elbow "bone" 5.75"
#define ULNA 187.325        //elbow-to-wrist "bone" 7.375"   
#define GRIPPER 100.00      //gripper (incl.heavy duty wrist rotate mechanism) length 3.94"

#define ftl(x) ((x)>=0?(long)((x)+0.5):(long)((x)-0.5))  //float to long conversion

/* Servo names/numbers */
/* Base servo HS-485HB */
#define BAS_SERVO 0
/* Shoulder Servo HS-5745-MG */
#define SHL_SERVO 1
/* Elbow Servo HS-5745-MG */
#define ELB_SERVO 2
/* Wrist servo HS-645MG */
#define WRI_SERVO 3
/* Wrist rotate servo HS-485HB */
#define WRO_SERVO 4
/* Gripper servo HS-422 */
#define GRI_SERVO 5

//#define ARM_PARK set_arm( -50, 140, 100, 0 )  //arm parking position

/* pre-calculations */
float hum_sq = HUMERUS*HUMERUS;
float uln_sq = ULNA*ULNA;

void setup();
void loop();
 
ServoShield servos;                       //ServoShield object
MAX3421E Max;
USB Usb;
//ServoShield servos;                       //ServoShield object

/* Arm data structure */
struct {
  float x_coord;            // X coordinate of the gripper tip
  float y_coord;            // Y coordinate of the gripper tip
  float z_coord;            //Z coordinate of the gripper tip
  float gripper_angle;      //gripper angle
  int16_t gripper_servo;   //gripper servo pulse duration 
  int16_t wrist_rotate;    //wrist rotate servo pulse duration
} armdata;
   
void setup()
{
  /* set servo end points */
  servos.setbounds( BAS_SERVO, 900, 2100 );
  servos.setbounds( SHL_SERVO, 1000, 2100 );
  servos.setbounds( ELB_SERVO, 900, 2100 );
  servos.setbounds( WRI_SERVO, 600, 2400 );
  servos.setbounds( WRO_SERVO, 600, 2400 );
  servos.setbounds( GRI_SERVO, 890, 2100 );
  /**/
//  servo_park();
  arm_park();
  
  servos.start();                         //Start the servo shield
  Max.powerOn();
  Serial.begin( 115200 );
  Serial.println("Start");
  delay( 500 );
  //ARM_PARK;
}

void loop()
{
byte rcode;
    //delay( 10 );
    set_arm( armdata.x_coord, armdata.y_coord, armdata.z_coord, armdata.gripper_angle );
    servos.setposition( WRO_SERVO, armdata.wrist_rotate );
    servos.setposition( GRI_SERVO, armdata.gripper_servo );
   //ARM_PARK;
 // circle();
    Max.Task();
    Usb.Task();
    if( Usb.getUsbTaskState() == USB_STATE_CONFIGURING ) {  
        mouse_init();
    }//if( Usb.getUsbTaskState() == USB_STATE_CONFIGURING...
    if( Usb.getUsbTaskState() == USB_STATE_RUNNING ) {  //poll the keyboard  
        rcode = mouse_poll();
        if( rcode ) {
          Serial.print("Mouse Poll Error: ");
          Serial.println( rcode, HEX );
        }//if( rcode...
    }//if( Usb.getUsbTaskState() == USB_STATE_RUNNING...
    //Serial.println( armdata.gripper_servo, DEC );
}

/* Initialize mouse */
void mouse_init( void )
{
 byte rcode = 0;  //return code
  /**/
  Usb.setDevTableEntry( 1, Usb.getDevTableEntry( 0,0 ) );              //copy device 0 endpoint information to device 1
  /* Configure device */
  rcode = Usb.setConf( DEVADDR, 0, CONFVALUE );                    
  if( rcode ) {
    Serial.print("Error configuring mouse. Return code : ");
    Serial.println( rcode, HEX );
    while(1);  //stop
  }//if( rcode...
  Usb.setUsbTaskState( USB_STATE_RUNNING );
  return;
}

/* Poll mouse using Get Report and fill arm data structure */
byte mouse_poll( void )
{
  byte rcode;
  char buf[ 4 ];                //mouse buffer
  static uint16_t delay = 500;  //delay before park

    /* poll mouse */
    rcode = Usb.getReport( DEVADDR, 0, 4, 0, 1, 0, buf );
    if( rcode ) {  //error
      return( rcode );
    }
    // todo: add arm limit check
    armdata.x_coord += ( buf[ 1 ] * -0.1 );
    armdata.y_coord += ( buf[ 2 ] * -0.1 );
    switch( buf[ 0 ] ) {  //read buttons
      case 0x00:            //no buttons pressed
        armdata.z_coord += ( buf[ 3 ] * -2 ) ;
        break;
      case 0x01:            //button 1 pressed. Wheel sets gripper angle
        armdata.gripper_servo += ( buf[ 3 ] * -20 );
          /* check gripper boundaries */
        if( armdata.gripper_servo < 1000 ) {
          armdata.gripper_servo = 1000;
        }
        if( armdata.gripper_servo > 2100 ) {
          armdata.gripper_servo = 2100;
        }
        break;
      case 0x02:           //button 2 pressed. Wheel sets wrist rotate
        armdata.wrist_rotate += ( buf[ 3 ] * -10 );
        /* check wrist rotate boundaries */
        if( armdata.wrist_rotate < 600 ) {
          armdata.wrist_rotate = 600;
        }
        if( armdata.wrist_rotate > 2400 ) {
          armdata.wrist_rotate = 2400;
        }
        break;
      case 0x04:          //wheel button pressed. Wheel controls gripper
        armdata.gripper_angle += ( buf[ 3 ] * -1 );
        /* check gripper angle boundaries */
        if( armdata.gripper_angle < -90 ) {
          armdata.gripper_angle = -90;
        }
        if( armdata.gripper_angle > 90 ) {
          armdata.gripper_angle = 90;
        }
        break;
      case 0x07:          //all 3 buttons pressed. Park the arm
        arm_park();
        break;        
    }//switch( buf[ 0 ...
    Serial.println( armdata.wrist_rotate, DEC );
}


/* arm positioning routine utilizing inverse kinematics */
/* z is height, y is distance from base center out, x is side to side. y,z can only be positive */
//void set_arm( uint16_t x, uint16_t y, uint16_t z, uint16_t grip_angle )
void set_arm( float x, float y, float z, float grip_angle_d )
{
  float grip_angle_r = radians( grip_angle_d );    //grip angle in radians for use in calculations
  /* Base angle and radial distance from x,y coordinates */
  float bas_angle_r = atan2( x, y );
  float rdist = sqrt(( x * x ) + ( y * y ));
  /* rdist is y coordinate for the arm */
  y = rdist;
  /* Grip offsets calculated based on grip angle */
  float grip_off_z = ( sin( grip_angle_r )) * GRIPPER;
  float grip_off_y = ( cos( grip_angle_r )) * GRIPPER; 
  /* Wrist position */
  float wrist_z = ( z - grip_off_z ) - BASE_HGT;
  float wrist_y = y - grip_off_y;
  /* Shoulder to wrist distance ( AKA sw ) */
  float s_w = ( wrist_z * wrist_z ) + ( wrist_y * wrist_y );
  float s_w_sqrt = sqrt( s_w );
  /* s_w angle to ground */
  //float a1 = atan2( wrist_y, wrist_z ); 
  float a1 = atan2( wrist_z, wrist_y );
  /* s_w angle to humerus */
  float a2 = acos((( hum_sq - uln_sq ) + s_w ) / ( 2 * HUMERUS * s_w_sqrt ));
  /* shoulder angle */
  float shl_angle_r = a1 + a2;
  float shl_angle_d = degrees( shl_angle_r ); 
  /* elbow angle */
  float elb_angle_r = acos(( hum_sq + uln_sq - s_w ) / ( 2 * HUMERUS * ULNA ));
  float elb_angle_d = degrees( elb_angle_r );
  float elb_angle_dn = -( 180.0 - elb_angle_d );
  /* wrist angle */
  float wri_angle_d = ( grip_angle_d - elb_angle_dn ) - shl_angle_d;
 
  /* Servo pulses */
  float bas_servopulse = 1500.0 - (( degrees( bas_angle_r )) * 11.11 );
  float shl_servopulse = 1500.0 + (( shl_angle_d - 90.0 ) * 6.6 );
  float elb_servopulse = 1500.0 -  (( elb_angle_d - 90.0 ) * 6.6 );
  float wri_servopulse = 1500 + ( wri_angle_d  * 11.1 );

  /* Set servos */
  servos.setposition( BAS_SERVO, ftl( bas_servopulse ));
  servos.setposition( WRI_SERVO, ftl( wri_servopulse ));
  servos.setposition( SHL_SERVO, ftl( shl_servopulse ));
  servos.setposition( ELB_SERVO, ftl( elb_servopulse ));
  
}

/* moves the arm to parking position */
void arm_park()
{
  set_arm( armdata.x_coord = -50, armdata.y_coord = 140, armdata.z_coord = 100, armdata.gripper_angle = 0 );
  servos.setposition( WRO_SERVO, armdata.wrist_rotate = 600 );
  servos.setposition( GRI_SERVO, armdata.gripper_servo = 900 );
}

/* move servos to parking position */
void servo_park()
{
  servos.setposition( BAS_SERVO, 1715 );
  servos.setposition( SHL_SERVO, 2100 );
  servos.setposition( ELB_SERVO, 2100 );
  servos.setposition( WRI_SERVO, 1800 );
  servos.setposition( WRO_SERVO, 600 );
  servos.setposition( GRI_SERVO, 900 );
  return;
}

void zero_x()
{
  for( double yaxis = 150.0; yaxis < 356.0; yaxis += 1 ) {
    set_arm( 0, yaxis, 127.0, 0 );
    delay( 10 );
  }
  for( double yaxis = 356.0; yaxis > 150.0; yaxis -= 1 ) {
    set_arm( 0, yaxis, 127.0, 0 );
    delay( 10 );
  }
}

/* moves arm in a straight line */
void line()
{
    for( double xaxis = -100.0; xaxis < 100.0; xaxis += 0.5 ) {
      set_arm( xaxis, 250, 100, 0 );
      delay( 10 );
    }
    for( float xaxis = 100.0; xaxis > -100.0; xaxis -= 0.5 ) {
      set_arm( xaxis, 250, 100, 0 );
      delay( 10 );
    }
}

void circle()
{
  #define RADIUS 80.0
  //float angle = 0;
  float zaxis,yaxis;  
  for( float angle = 0.0; angle < 360.0; angle += 1.0 ) {
      yaxis = RADIUS * sin( radians( angle )) + 200;
      zaxis = RADIUS * cos( radians( angle )) + 200;
      set_arm( 0, yaxis, zaxis, 0 );
      delay( 1 );
  }
}
  
