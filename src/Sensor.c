#include "Sensor.h"


void SENSOR_Init()
{
  INTCON = 0b10011000; //  RB0 & RB4-7 interruption
  OPTION_REG.INTEDG = 1;  // Falling Edge
  
  TRISA = 0xFF;    // TRISA AS INPUT
  TRISB = 0xFF;    // TRISB AS INPUT
  TRISC.RC0 = 0;
  TRISC.RC3 = 1;
  TRISC.RC4 = 1;
  TRISC.RC5 = 1;
  ADCON1 = 0x00;   //TRISA AS ANALOG
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


