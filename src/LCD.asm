
_CustomChar:

;LCD.c,5 :: 		void CustomChar(char pos_row, char pos_char) {
;LCD.c,7 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,8 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       CustomChar_i_L0+0
L_CustomChar0:
	MOVF       CustomChar_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChar1
	MOVF       CustomChar_i_L0+0, 0
	ADDLW      _character+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       CustomChar_i_L0+0, 1
	GOTO       L_CustomChar0
L_CustomChar1:
;LCD.c,9 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,10 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomChar_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChar_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,11 :: 		}
L_end_CustomChar:
	RETURN
; end of _CustomChar

_LCD_Init_P:

;LCD.c,13 :: 		void LCD_Init_P()
;LCD.c,16 :: 		LCD_Init(); // LCD: Initialize LCD
	CALL       _Lcd_Init+0
;LCD.c,17 :: 		LCD_Cmd(_LCD_CLEAR); // LCD: Clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,18 :: 		LCD_Cmd(_LCD_CURSOR_OFF); // LCD: Disable Cursor LCD
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,19 :: 		LCD_Out(1,7,"TODD");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,20 :: 		Delay_ms(1500);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_LCD_Init_P3:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Init_P3
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Init_P3
	DECFSZ     R11+0, 1
	GOTO       L_LCD_Init_P3
	NOP
;LCD.c,21 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,22 :: 		for (i=2;i<17;i++)
	MOVLW      2
	MOVWF      LCD_Init_P_i_L0+0
L_LCD_Init_P4:
	MOVLW      17
	SUBWF      LCD_Init_P_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_LCD_Init_P5
;LCD.c,24 :: 		CustomChar(2,i);
	MOVLW      2
	MOVWF      FARG_CustomChar_pos_row+0
	MOVF       LCD_Init_P_i_L0+0, 0
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;LCD.c,25 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_LCD_Init_P7:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Init_P7
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Init_P7
	DECFSZ     R11+0, 1
	GOTO       L_LCD_Init_P7
;LCD.c,22 :: 		for (i=2;i<17;i++)
	INCF       LCD_Init_P_i_L0+0, 1
;LCD.c,26 :: 		}
	GOTO       L_LCD_Init_P4
L_LCD_Init_P5:
;LCD.c,27 :: 		LCD_Cmd(_LCD_CLEAR); // LCD: Clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,28 :: 		LCD_Out(1,5,"Welcome");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,29 :: 		Delay_ms(2000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_LCD_Init_P8:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Init_P8
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Init_P8
	DECFSZ     R11+0, 1
	GOTO       L_LCD_Init_P8
;LCD.c,30 :: 		LCD_Cmd(_LCD_CLEAR); // LCD: Clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,31 :: 		}
L_end_LCD_Init_P:
	RETURN
; end of _LCD_Init_P
