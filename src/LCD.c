#include "LCD.h"



void LCD_Init_P()
{
  char i;
  LCD_Init(); // LCD: Initialize LCD
  LCD_Cmd(_LCD_CLEAR); // LCD: Clear LCD
  LCD_Cmd(_LCD_CURSOR_OFF); // LCD: Disable Cursor LCD
  LED = 1; //
 }