#line 1 "C:/Users/Bsm/Desktop/TODD/src/Sensor.c"
#line 1 "c:/users/bsm/desktop/todd/src/sensor.h"
#line 22 "c:/users/bsm/desktop/todd/src/sensor.h"
void SENSOR_Init();
float SENSOR_R1();
float SENSOR_R2();
float SENSOR_R3();
#line 4 "C:/Users/Bsm/Desktop/TODD/src/Sensor.c"
void SENSOR_Init()
{
 INTCON = 0b10011000;
 OPTION_REG.INTEDG = 1;

 TRISA = 0xFF;
 TRISB = 0xFF;
 TRISC.RC0 = 0;
 TRISC.RC3 = 1;
 TRISC.RC4 = 1;
 TRISC.RC5 = 1;
 ADCON1 = 0x00;
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
