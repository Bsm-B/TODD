#line 1 "C:/Users/Bsm/Desktop/TODD/src/Motors.c"
#line 1 "c:/users/bsm/desktop/todd/src/motors.h"



void MOTORS_Init();
void MOTORS_Left();
void MOTORS_Right();
void MOTORS_Back();
void MOTOR_Aspirator(unsigned short);
void MOTOR_Blades(unsigned short);
#line 5 "C:/Users/Bsm/Desktop/TODD/src/Motors.c"
void MOTOR_Aspirator(unsigned short F){
 if (F){
 PORTD.RD6 = 1;
 }else{
 PORTD.RD6 = 0;
 }
}


void MOTOR_Blades(unsigned short F){
 if (F){
 PORTD.RD7 = 1;
 }else{
 PORTD.RD7 = 0;
 }
}


void MOTORS_Back()
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
 TRISC = 0x00;
 TRISD.RD6 = 0;
 TRISD.RD7 = 0;
 PORTD.RD6 = 0;
 PORTD.RD7 = 0;
 PORTC = 0;


}
