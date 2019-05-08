
_LCD_Init_P:

;LCD.c,5 :: 		void LCD_Init_P()
;LCD.c,8 :: 		LCD_Init(); // LCD: Initialize LCD
	CALL       _Lcd_Init+0
;LCD.c,9 :: 		LCD_Cmd(_LCD_CLEAR); // LCD: Clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,10 :: 		LCD_Cmd(_LCD_CURSOR_OFF); // LCD: Disable Cursor LCD
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,12 :: 		}
L_end_LCD_Init_P:
	RETURN
; end of _LCD_Init_P
