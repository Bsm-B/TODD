#line 1 "C:/Users/Bsm/Desktop/TODD/Robot.c"
#line 1 "c:/users/bsm/desktop/todd/src/eeprom.h"






unsigned short SPEED_Read();
unsigned short DIRECTION_Read();
#line 1 "c:/users/bsm/desktop/todd/src/sensor.h"




void SENSOR_Init();
float SENSOR_R1();
float SENSOR_R2();
float SENSOR_R3();
#line 1 "c:/users/bsm/desktop/todd/src/motors.h"



void MOTORS_Init();
void MOTORS_Left(unsigned short);
void MOTORS_Right(unsigned short);
void MOTORS_Back();
void MOTORS_Mill_Around();
void MOTORS_Stop();
void MOTROS_Start(unsigned short);
void MOTOR_Aspirator(unsigned short);
void MOTOR_Blades(unsigned short);
#line 1 "c:/users/bsm/desktop/todd/src/lcd.h"



 sbit LED at PORTC.B0;

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
float IR1,IR2,IR3;
unsigned short Speed = 0;
unsigned short Direction = 0;
unsigned short Sd = 0;
unsigned short Dn = 0;
unsigned short Etat = 0;
unsigned char *TXT1[5];
unsigned char *TXT2[3];


void main() {

 MOTORS_Init();
 LCD_Init_P();
 SENSOR_Init();


 Speed = SPEED_Read();
 Direction = DIRECTION_Read();

 if (Direction == 0)
 {
 strcpy(TXT1,"LEFT");
 Dn = 1;
 }else{
 strcpy(TXT1,"RIGHT");
 Dn = 2;
 }

 if (Speed == 0)
 {
 strcpy(TXT2,"MIN");
 Sd = 80;

 }else if (Speed == 1){

 strcpy(TXT2,"MOY");
 Sd = 160;

 }else{
 strcpy(TXT2,"MAX");
 Sd = 255;
 }
 MOTOR_Aspirator(1);
 MOTOR_Blades(1);

 for(;;){
 IR1 = SENSOR_R1();
 IR2 = SENSOR_R2();
 IR3 = SENSOR_R3();
 switch (Etat) {

 case 0:

 MOTROS_Start(sd);
 LCD_Out(1,1,"SPEED :");
 LCD_Out(1,8,TXT1);
 LCD_Out(2,1,"DIRCT :");
 LCD_Out(2,8,TXT2);

 if ( IR1 > 600 ){

 if ((IR2 < 512) && (IR3 < 512)) Etat = 3;
 else if (IR3 < 512) Etat = 2;
 else if (IR2 < 512) Etat = 1;
 else Etat = 4;

 LCD_Cmd(_LCD_CLEAR);
 }


 else if ( IR2 > 900){

 Etat = 5;
 LCD_Cmd(_LCD_CLEAR);
 }

 else if (IR3 > 900){

 Etat = 6;
 LCD_Cmd(_LCD_CLEAR);

 }
 if (PORTE.RE0)
 Etat = 7;

 break;

 case 1:

 if ( IR1 > 600 ) {
 MOTORS_Left(sd);
 LCD_Out(1,1,"Obstacle R");
 Led = ~ Led;
 }else{
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }

 break;

 case 2:

 if ( IR1 > 600 ) {
 MOTORS_Right(sd);
 LCD_Out(1,1,"Obstacle L");
 Led = ~ Led;
 }else{
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }

 break;

 case 3:

 if (Dn == 1) Etat = 1;
 else Etat = 2;

 break;


 case 4:

 LCD_Out(1,1,"Around");
 MOTORS_Mill_Around();
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);

 break;


 case 5:

 MOTORS_Left(sd);
 LCD_Out(1,1,"Skip L");
 if (IR2 < 512){
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }

 break;



 case 6:
 MOTORS_Right(sd);
 LCD_Out(1,1,"Skip R");
 if (IR3 < 512){
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }

 break;


 }


 };



}
