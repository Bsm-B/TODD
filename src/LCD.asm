
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
;LCD.c,11 :: 		LCD_Out(1,7,"TODD");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,12 :: 		Delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_LCD_Init_P0:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Init_P0
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Init_P0
	DECFSZ     R11+0, 1
	GOTO       L_LCD_Init_P0
	NOP
;LCD.c,13 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,14 :: 		LED = 1; //
	BSF        PORTC+0, 0
;LCD.c,15 :: 		}
L_end_LCD_Init_P:
	RETURN
; end of _LCD_Init_P
