#include "Motors.h"


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
     RMT1 = 0;

}


void MOTORS_Mill_Around(){

     MOTORS_Stop();
     PWM1_Set_Duty(255);
     PWM2_Set_Duty(0);
     RMT1 = 1;
     Delay_ms(800);
     MOTORS_Stop();
}


void MOTORS_Init(){

     PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
     PWM2_Init(5000);
     PWM1_Start();
     PWM2_Start();
     MOTORS_Stop();
}