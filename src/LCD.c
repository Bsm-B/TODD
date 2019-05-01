#include "LCD.h"



void LCD_Init_P()
{
  char i;
  LCD_Init(); // LCD: Initialize LCD
  LCD_Cmd(_LCD_CLEAR); // LCD: Clear LCD
  LCD_Cmd(_LCD_CURSOR_OFF); // LCD: Disable Cursor LCD
  LCD_Out(1,7,"TODD");
  Delay_ms(1000);
  LCD_Cmd(_LCD_CLEAR);
  LED = 1; //
 }
