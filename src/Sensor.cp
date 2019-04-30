#line 1 "C:/Users/Bsm/Desktop/TODD/src/Sensor.c"
#line 1 "c:/users/bsm/desktop/todd/src/sensor.h"




void SENSOR_Init();
void SENSOR_Read(unsigned short * IR_val);
#line 3 "C:/Users/Bsm/Desktop/TODD/src/Sensor.c"
unsigned short INT_NUM = 0;

void SENSOR_Init()
{
 TRISB = 0xFF;
 INTCON = 0b10001000;
 OPTION_REG.INTEDG = 1;

 ADCON1 = 0x02;
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

 INTCON.RBIF = 0;

 }

 void SENSOR_Read(unsigned short * IR_val)
 {
 IR_val[0] = ADC_READ(0);
 IR_val[1] = ADC_READ(1);
 IR_val[2] = ADC_READ(2);
 }
