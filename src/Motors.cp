#line 1 "C:/Users/Bsm/Desktop/TODD/src/Motors.c"
#line 1 "c:/users/bsm/desktop/todd/src/motors.h"










void MOTORS_Init();
void MOTORS_Left(unsigned short);
void MOTORS_Right(unsigned short);
void MOTORS_Mill_Around();
void MOTORS_Stop();
void MOTROS_Start(unsigned short);
#line 4 "C:/Users/Bsm/Desktop/TODD/src/Motors.c"
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
  PORTC.RC0  = 0;

}


void MOTORS_Mill_Around(){

 MOTORS_Stop();
 PWM1_Set_Duty(255);
 PWM2_Set_Duty(0);
  PORTC.RC0  = 1;
 Delay_ms(800);
 MOTORS_Stop();
}


void MOTORS_Init(){

 PWM1_Init(5000);
 PWM2_Init(5000);
 PWM1_Start();
 PWM2_Start();
 MOTORS_Stop();
}
