#include "Sensor.h"

unsigned short INT_NUM = 0;

void SENSOR_Init()
{
  INTCON = 0b10011000; // RB interruption
  OPTION_REG.INTEDG = 1;  // Falling Edge
  ADCON1 = 0x02;   //ONLY A0;A1,A2 As Analog
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
   
           INT_NUM = 5;    //INFRA
        INTCON.INTF = 0;   //REST
    }

   if (INTCON.RBIF){
   
     if (PORTB.RB4){
       INT_NUM = 1;     // BUM1
     }
     if (PORTB.RB5){
        INT_NUM = 2;      // BUM2
     }
     if (PORTB.RB6){
        INT_NUM = 3;       // BUM3
     }
     if (PORTB.RB7){
       INT_NUM = 4;         // BUM4
     }
     INTCON.RBIF  = 0; //REST INTERRUPT
   }



 }