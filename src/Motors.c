#include "Motors.h"



void MOTOR_Aspirator(unsigned short F){
  if (F == 1){
    PORTD.RD6 = 1;
  }else{
    PORTD.RD6 = 0;
  }
}

void MOTOR_Blades(unsigned short F){
  if (F == 1){
    PORTD.RD7 = 1;
  }else{
    PORTD.RD7 = 0;
  }
}

void MOTROS_Start(unsigned short v)
{
  PWM1_Set_Duty(v);
  PWM2_Set_Duty(v);
}


void MOTORS_Left(unsigned short v){
     PWM1_Set_Duty(v);;
     PWM2_Set_Duty(0);
}

void MOTORS_Right(unsigned short v){
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(v);
}

void MOTORS_Stop(){
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);
     PORTC.RC3 = 0;
     PORTC.RC4 = 0;
}


void MOTORS_Mill_Around(){

     MOTORS_Stop();

     PWM1_Set_Duty(0);
     PWM2_Set_Duty(255);
     PORTC.RC3 = 0;
     PORTC.RC4 = 1;
     Delay_ms(800);
     MOTORS_Stop();
}


void MOTORS_Init(){
     TRISC = 0x00; // TRIC C AS OUTPUT
     TRISD.RD6 = 0; // PIN D6 AS OUTPUT
     TRISD.RD7 = 0; // PIN D7 As OUTPUT
     PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
     PWM2_Init(5000);
     PWM1_Start();
     PWM2_Start();
     MOTOR_Blades(0);
     MOTOR_Aspirator(0);
     MOTORS_Stop();
  
}