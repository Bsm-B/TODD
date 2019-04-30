#line 1 "C:/Users/Bsm/Desktop/TODD/src/LCD.c"
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
#line 3 "C:/Users/Bsm/Desktop/TODD/src/LCD.c"
const char character[] = {31,31,31,31,31,31,31,31};

void CustomChar(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}

void LCD_Init_P()
{
 char i;
 LCD_Init();
 LCD_Cmd(_LCD_CLEAR);
 LCD_Cmd(_LCD_CURSOR_OFF);
 LCD_Out(1,7,"TODD");
 Delay_ms(1500);
 LCD_Cmd(_LCD_CLEAR);
 for (i=2;i<17;i++)
 {
 CustomChar(2,i);
 Delay_ms(100);
 }
 LCD_Cmd(_LCD_CLEAR);
 LCD_Out(1,5,"Welcome");
 Delay_ms(2000);
 LCD_Cmd(_LCD_CLEAR);
 }
