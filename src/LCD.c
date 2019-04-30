#include "LCD.h"

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
  LCD_Init(); // LCD: Initialize LCD
  LCD_Cmd(_LCD_CLEAR); // LCD: Clear LCD
  LCD_Cmd(_LCD_CURSOR_OFF); // LCD: Disable Cursor LCD
  LCD_Out(1,7,"TODD");
    Delay_ms(1500);
  LCD_Cmd(_LCD_CLEAR);
  for (i=2;i<17;i++)
  {
    CustomChar(2,i);
    Delay_ms(100);
    }
  LCD_Cmd(_LCD_CLEAR); // LCD: Clear LCD
  LCD_Out(1,5,"Welcome");
  Delay_ms(2000);
  LCD_Cmd(_LCD_CLEAR); // LCD: Clear LCD
 }