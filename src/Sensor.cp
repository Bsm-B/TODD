#line 1 "C:/Users/Bsm/Desktop/TODD/src/Sensor.c"
#line 1 "c:/users/bsm/desktop/todd/src/sensor.h"




void SENSOR_Init();
float SENSOR_R1();
float SENSOR_R2();
float SENSOR_R3();
#line 3 "C:/Users/Bsm/Desktop/TODD/src/Sensor.c"
unsigned short INT_NUM = 0;

void SENSOR_Init()
{
 INTCON = 0b10011000;
 OPTION_REG.INTEDG = 1;
 ADCON1 = 0x02;
 ADC_Init();
}

float SENSOR_R1(){
 return ADC_Read(0);
}
float SENSOR_R2(){
 return ADC_Read(1);
}
float SENSOR_R3(){
 return ADC_Read(2);
}
 void interrupt (void) {

 if(INTCON.INTF){

 INT_NUM = 5;
 INTCON.INTF = 0;
 }

 if (INTCON.RBIF){

 if (PORTB.RB4){
 INT_NUM = 1;
 }
 if (PORTB.RB5){
 INT_NUM = 2;
 }
 if (PORTB.RB6){
 INT_NUM = 3;
 }
 if (PORTB.RB7){
 INT_NUM = 4;
 }
 INTCON.RBIF = 0;
 }



 }
