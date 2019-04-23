#include "Sensor.h"




void SENSOR_Init()
{
  TRISB = 0xFF; // TRISB INPUT
  INTCON = 0b10001000; // RB interruption
  OPTION_REG.INTEDG = 1;  // Falling Edge

  ADCON1 = 0x02;   //ONLY A0;A1,A2 As Analog

}

 void interrupt (void) {

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
   }

   INTCON.RBIF  = 0; //REST INTERRUPT

 }

 void SENSOR_Read(unsigned short * IR_val)
 {
     IR_val[0] = ADC_READ(0);
     IR_val[1] = ADC_READ(1);
     IR_val[2] = ADC_READ(2);
 }
