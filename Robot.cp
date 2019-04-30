#line 1 "C:/Users/Bsm/Desktop/TODD/Robot.c"
#line 1 "c:/users/bsm/desktop/todd/src/eeprom.h"





unsigned short CONFIG_Read();
void CONFIG_Write(unsigned short);
#line 1 "c:/users/bsm/desktop/todd/src/sensor.h"




void SENSOR_Init();
void SENSOR_Read(unsigned short * IR_val);
#line 1 "c:/users/bsm/desktop/todd/src/motors.h"



void MOTORS_Init();
void MOTORS_Left();
void MOTORS_Right();
void MOTORS_Back();
void MOTOR_Aspirator(unsigned short);
void MOTOR_Blades(unsigned short);
#line 1 "c:/users/bsm/desktop/todd/src/lcd.h"




 sbit LCD_EN at RD0_bit;
 sbit LCD_RS at RD1_bit;
 sbit LCD_D4 at RD2_bit;
 sbit LCD_D5 at RD3_bit;
 sbit LCD_D6 at RD4_bit;
 sbit LCD_D7 at RD5_bit;

 sbit LCD_EN_Direction at TRISD0_bit;
 sbit LCD_RS_Direction at TRISD1_bit;
 sbit LCD_D4_Direction at TRISD2_bit;
 sbit LCD_D5_Direction at TRISD3_bit;
 sbit LCD_D6_Direction at TRISD4_bit;
 sbit LCD_D7_Direction at TRISD5_bit;



 void LCD_Init_P();
#line 6 "C:/Users/Bsm/Desktop/TODD/Robot.c"
unsigned short x = 0;


void main() {

 LCD_Init_P();
 SENSOR_Init();
 MOTORS_Init();
do{



}while(1);

}
