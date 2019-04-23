#include "Motors.h"



void MOTOR_ASPIRATOR(bit F){
  if (F){
    PORTD.RD6 = 1;
  }else{
    PORTD.RD6 = 0;
  }
}


void MOTOR_BLADES(bit F){
  if (F){
    PORTD.RD7 = 1;
  }else{
    PORTD.RD7 = 0;
  }
}


void MOTORS_Back();
{
  PORTD.RC1 = 0;
  PORTD.RC2 = 0;
  PORTD.RC3 = 1;
  PORTD.RC4 = 1;
}


void MOTORS_Left(){
    PORTD.RC1 = 0;
    PORTD.RC2 = 1;
}
void MOTORS_Right(){
    PORTD.RC1 = 1;
    PORTD.RC2 = 0;
}



void MOTORS_Init(){
  TRISC = 0x00; // TRIC C AS OUTPUT
  TRISD.RD6 = 0; // PIN D6 AS OUTPUT
  TRISD.RD7 = 0; // PIN D7 As OUTPUT
  PORTD.RD6 = 0;  // INIT PIN D6 =  0
  PORTD.RD7 = 0; // INIT PIN D7 = 0
  PORTC = 0; // INIT MOTORS  =  0


}
