#line 1 "C:/Users/Bsm/Desktop/TODD/Robot.c"
#line 1 "c:/users/bsm/desktop/todd/src/eeprom.h"






unsigned short SPEED_Read();
unsigned short DIRECTION_Read();
#line 1 "c:/users/bsm/desktop/todd/src/sensor.h"
#line 23 "c:/users/bsm/desktop/todd/src/sensor.h"
void SENSOR_Init();
float SENSOR_R1();
float SENSOR_R2();
float SENSOR_R3();
#line 1 "c:/users/bsm/desktop/todd/src/motors.h"










void MOTORS_Init();
void MOTORS_Left(unsigned short);
void MOTORS_Right(unsigned short);
void MOTORS_Mill_Around();
void MOTORS_Stop();
void MOTROS_Start(unsigned short);
#line 1 "c:/users/bsm/desktop/todd/src/lcd.h"




 sbit LCD_RS at RD0_bit;
 sbit LCD_EN at RD1_bit;
 sbit LCD_D4 at RD2_bit;
 sbit LCD_D5 at RD3_bit;
 sbit LCD_D6 at RD4_bit;
 sbit LCD_D7 at RD5_bit;


 sbit LCD_RS_Direction at TRISD0_bit;
 sbit LCD_EN_Direction at TRISD1_bit;
 sbit LCD_D4_Direction at TRISD2_bit;
 sbit LCD_D5_Direction at TRISD3_bit;
 sbit LCD_D6_Direction at TRISD4_bit;
 sbit LCD_D7_Direction at TRISD5_bit;



 void LCD_Init_P();
#line 7 "C:/Users/Bsm/Desktop/TODD/Robot.c"
float IR1,IR2,IR3;
unsigned short Speed = 0;
unsigned short Direction = 0;
unsigned short Sd = 0;
unsigned short Etat = 0;
unsigned short CSD = 1;
unsigned short Flag = 0;
char TXT1[5];
char TXT2[5];

char CONFIG[] = "*CONF*";
char CONFID[] = "*DIRCT CONF*";
char CONFIS[] = "*SPEED CONF*";
char OptionC[] = " SPEED    DIRCT";
char OptionS[] = "MIN   MOY   MAX";
char OptionD[] = "LEFT     RIGHT";
char Tag[]= ">";
char Vid[]= " ";
char Done[]= "OK";




void main() {

 MOTORS_Init();
 LCD_Init_P();
 SENSOR_Init();


 Speed = SPEED_Read();
 Direction = DIRECTION_Read();


 if (Direction == 1)
 {
 strcpy(TXT1,"LEFT");

 }else{
 strcpy(TXT1,"RIGHT");
 }

 if (Speed == 1)
 {
 strcpy(TXT2,"MIN");
 Sd = 80;

 }else if (Speed == 2){

 strcpy(TXT2,"MOY");
 Sd = 160;

 }else{
 strcpy(TXT2,"MAX");
 Sd = 255;
 }

 while(1){
 IR1 = SENSOR_R1();
 IR2 = SENSOR_R2();
 IR3 = SENSOR_R3();

 switch(Flag)
 {
 case 1:

 Motors_Right(sd);
 Delay_ms(800);
 Etat = 0;
 Flag = 0;
 break;

 case 2:

 Motors_Left(sd);
 Delay_ms(800);
 Etat = 0;
 Flag = 0;
 break;


 case 3:

 Etat = 4;
 Flag = 0;
 break;

 }
 switch (Etat) {

 case 0:

 MOTROS_Start(sd);

 LCD_Out(1,1,TXT1);
 LCD_Out(2,1,TXT2);


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
 if ( PORTC.RC3  == 1){


 MOTORS_Stop();
 Etat = 7;
 LCD_Cmd(_LCD_CLEAR);

 }



 break;

 case 1:
 LCD_Out(1,1,"OBST L");
 if ( IR1 > 600 ) {
 MOTORS_Left(sd);

 }else{
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }

 break;

 case 2:
 LCD_Out(1,1,"OBST R");
 if ( IR1 > 600 ) {
 MOTORS_Right(sd);

 }else{
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }

 break;

 case 3:

 if (Direction == 1) Etat = 2;
 else Etat = 1;

 break;


 case 4:
 LCD_out(1,6,"AR");
 MOTORS_Mill_Around();
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);

 break;


 case 5:
 LCD_Out(1,1,"SL");
 MOTORS_Left(sd);
 if (IR2 < 700){
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }

 break;



 case 6:
 LCD_Out(1,1,"SR");
 MOTORS_Right(sd);
 if (IR3 < 700){
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }

 break;



 case 7:

 Lcd_Out(1,1,CONFIG);
 Lcd_Out(2,2,OptionC);

 if ( PORTC.RC4 ){
 CSD = 1;
 Delay_ms(200);
 }

 if ( PORTC.RC5 ) {
 CSD = 2;
 Delay_ms(200);
 }

 if (CSD == 1) {

 Lcd_Out(2,1,Tag);
 Lcd_Out(2,10,Vid);

 }else{

 Lcd_Out(2,10,Tag);
 Lcd_Out(2,1,Vid);

 }

 if ( PORTB.RB1 ){

 if(CSD == 1) Etat = 8;
 else Etat = 9;
 LCD_Cmd(_LCD_CLEAR);

 }


 break;

 case 8:


 Lcd_Out(2,2,OptionS);
 if (Speed == 1 ){
 Lcd_Out(2,1,Tag);
 Lcd_Out(2,6,Vid);
 Lcd_Out(2,11,Vid);
 if ( PORTC.RC5 ){
 Speed = 2;
 Delay_ms(300);
 }

 }else if (Speed == 2){
 Lcd_Out(2,1,Vid);
 Lcd_Out(2,7,Tag);
 Lcd_Out(2,13,Vid);
 if ( PORTC.RC4 ) {
 Speed = 1;
 Delay_ms(300); }

 if ( PORTC.RC5 ){
 Speed = 3;
 Delay_ms(300);
 }
 }else{

 Lcd_Out(2,1,Vid);
 Lcd_Out(2,6,Vid);
 Lcd_Out(2,12,Tag);
 if ( PORTC.RC4  == 1) {
 Speed = 2;
 Delay_ms(300); }
 }

 if ( PORTC.RC3 ){
 LCD_Cmd(_LCD_CLEAR);
 Lcd_Out(1,8,Done);
 EEPROM_WRITE( 0x0010 ,Speed);
 Delay_ms(1000);
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }



 break;

 case 9:

 Lcd_Out(2,2,OptionD);
 if ( PORTC.RC4 ) {
 Direction = 1;
 Delay_ms(300); }
 if ( PORTC.RC5 ) {
 Direction = 2;
 Delay_ms(300);
 }

 if (Direction == 1) {
 Lcd_Out(2,1,Tag);
 Lcd_Out(2,10,Vid);
 }else{
 Lcd_Out(2,10,Tag);
 Lcd_Out(2,1,Vid);
 }

 if ( PORTC.RC3 ){
 LCD_Cmd(_LCD_CLEAR);
 Lcd_Out(1,8,Done);
 EEPROM_WRITE( 0x0020 ,Direction);
 Delay_ms(1000);
 Etat = 0;
 LCD_Cmd(_LCD_CLEAR);
 }

 break;







 }


 };



}

 void interrupt (void) {

 if(INTCON.INTF){
 Flag = 3;

 INTCON.INTF = 0;
 }

 if (INTCON.RBIF){

 if (PORTB.RB4){
 Flag = 1;

 }
 if (PORTB.RB5){
 Flag = 3;

 }
 if (PORTB.RB6){
 Flag = 3;

 }
 if (PORTB.RB7){
 Flag = 2;

 }
 INTCON.RBIF = 0;
 }

 }
