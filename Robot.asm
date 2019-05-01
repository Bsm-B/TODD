
_main:

;Robot.c,16 :: 		void main() {
;Robot.c,18 :: 		MOTORS_Init();
	CALL       _MOTORS_Init+0
;Robot.c,19 :: 		LCD_Init_P();
	CALL       _LCD_Init_P+0
;Robot.c,20 :: 		SENSOR_Init();
	CALL       _SENSOR_Init+0
;Robot.c,23 :: 		Speed = SPEED_Read();
	CALL       _SPEED_Read+0
	MOVF       R0+0, 0
	MOVWF      _Speed+0
;Robot.c,24 :: 		Direction = DIRECTION_Read();
	CALL       _DIRECTION_Read+0
	MOVF       R0+0, 0
	MOVWF      _Direction+0
;Robot.c,26 :: 		if (Direction == 0)
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main0
;Robot.c,28 :: 		strcpy(TXT1,"LEFT");
	MOVLW      _TXT1+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr1_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,29 :: 		Dn = 1;  // LEFT
	MOVLW      1
	MOVWF      _Dn+0
;Robot.c,30 :: 		}else{
	GOTO       L_main1
L_main0:
;Robot.c,31 :: 		strcpy(TXT1,"RIGHT");
	MOVLW      _TXT1+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr2_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,32 :: 		Dn = 2; // RIGHT
	MOVLW      2
	MOVWF      _Dn+0
;Robot.c,33 :: 		}
L_main1:
;Robot.c,35 :: 		if (Speed == 0)
	MOVF       _Speed+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Robot.c,37 :: 		strcpy(TXT2,"MIN");
	MOVLW      _TXT2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr3_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,38 :: 		Sd = 80;
	MOVLW      80
	MOVWF      _Sd+0
;Robot.c,40 :: 		}else if (Speed == 1){
	GOTO       L_main3
L_main2:
	MOVF       _Speed+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Robot.c,42 :: 		strcpy(TXT2,"MOY");
	MOVLW      _TXT2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr4_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,43 :: 		Sd = 160;
	MOVLW      160
	MOVWF      _Sd+0
;Robot.c,45 :: 		}else{
	GOTO       L_main5
L_main4:
;Robot.c,46 :: 		strcpy(TXT2,"MAX");
	MOVLW      _TXT2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr5_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,47 :: 		Sd = 255;
	MOVLW      255
	MOVWF      _Sd+0
;Robot.c,48 :: 		}
L_main5:
L_main3:
;Robot.c,49 :: 		MOTOR_Aspirator(1);
	MOVLW      1
	MOVWF      FARG_MOTOR_Aspirator+0
	CALL       _MOTOR_Aspirator+0
;Robot.c,50 :: 		MOTOR_Blades(1);
	MOVLW      1
	MOVWF      FARG_MOTOR_Blades+0
	CALL       _MOTOR_Blades+0
;Robot.c,52 :: 		for(;;){
L_main6:
;Robot.c,53 :: 		IR1 =  SENSOR_R1();
	CALL       _SENSOR_R1+0
	MOVF       R0+0, 0
	MOVWF      _IR1+0
	MOVF       R0+1, 0
	MOVWF      _IR1+1
	MOVF       R0+2, 0
	MOVWF      _IR1+2
	MOVF       R0+3, 0
	MOVWF      _IR1+3
;Robot.c,54 :: 		IR2 =  SENSOR_R2();
	CALL       _SENSOR_R2+0
	MOVF       R0+0, 0
	MOVWF      _IR2+0
	MOVF       R0+1, 0
	MOVWF      _IR2+1
	MOVF       R0+2, 0
	MOVWF      _IR2+2
	MOVF       R0+3, 0
	MOVWF      _IR2+3
;Robot.c,55 :: 		IR3 =  SENSOR_R3();
	CALL       _SENSOR_R3+0
	MOVF       R0+0, 0
	MOVWF      _IR3+0
	MOVF       R0+1, 0
	MOVWF      _IR3+1
	MOVF       R0+2, 0
	MOVWF      _IR3+2
	MOVF       R0+3, 0
	MOVWF      _IR3+3
;Robot.c,56 :: 		switch (Etat) {
	GOTO       L_main9
;Robot.c,58 :: 		case 0:     // ETAT 1   // NORMAL
L_main11:
;Robot.c,60 :: 		MOTROS_Start(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTROS_Start+0
	CALL       _MOTROS_Start+0
;Robot.c,61 :: 		LCD_Out(1,1,"SPEED :");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,62 :: 		LCD_Out(1,8,TXT1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TXT1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,63 :: 		LCD_Out(2,1,"DIRCT :");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,64 :: 		LCD_Out(2,8,TXT2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TXT2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,66 :: 		if ( IR1 > 600 ){
	MOVF       _IR1+0, 0
	MOVWF      R4+0
	MOVF       _IR1+1, 0
	MOVWF      R4+1
	MOVF       _IR1+2, 0
	MOVWF      R4+2
	MOVF       _IR1+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      22
	MOVWF      R0+2
	MOVLW      136
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;Robot.c,68 :: 		if ((IR2 < 512) && (IR3 < 512)) Etat = 3;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	MOVF       _IR2+0, 0
	MOVWF      R0+0
	MOVF       _IR2+1, 0
	MOVWF      R0+1
	MOVF       _IR2+2, 0
	MOVWF      R0+2
	MOVF       _IR2+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	MOVF       _IR3+0, 0
	MOVWF      R0+0
	MOVF       _IR3+1, 0
	MOVWF      R0+1
	MOVF       _IR3+2, 0
	MOVWF      R0+2
	MOVF       _IR3+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
L__main31:
	MOVLW      3
	MOVWF      _Etat+0
	GOTO       L_main16
L_main15:
;Robot.c,69 :: 		else if  (IR3 < 512) Etat = 2;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	MOVF       _IR3+0, 0
	MOVWF      R0+0
	MOVF       _IR3+1, 0
	MOVWF      R0+1
	MOVF       _IR3+2, 0
	MOVWF      R0+2
	MOVF       _IR3+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVLW      2
	MOVWF      _Etat+0
	GOTO       L_main18
L_main17:
;Robot.c,70 :: 		else if  (IR2 < 512) Etat = 1;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	MOVF       _IR2+0, 0
	MOVWF      R0+0
	MOVF       _IR2+1, 0
	MOVWF      R0+1
	MOVF       _IR2+2, 0
	MOVWF      R0+2
	MOVF       _IR2+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVLW      1
	MOVWF      _Etat+0
	GOTO       L_main20
L_main19:
;Robot.c,71 :: 		else  Etat = 4;
	MOVLW      4
	MOVWF      _Etat+0
L_main20:
L_main18:
L_main16:
;Robot.c,73 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,74 :: 		}
L_main12:
;Robot.c,76 :: 		break;
	GOTO       L_main10
;Robot.c,78 :: 		case 1:   // ETAT 2   //LEFT
L_main21:
;Robot.c,80 :: 		if ( IR1 > 600 ) {
	MOVF       _IR1+0, 0
	MOVWF      R4+0
	MOVF       _IR1+1, 0
	MOVWF      R4+1
	MOVF       _IR1+2, 0
	MOVWF      R4+2
	MOVF       _IR1+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      22
	MOVWF      R0+2
	MOVLW      136
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main22
;Robot.c,81 :: 		MOTORS_Left(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Left+0
	CALL       _MOTORS_Left+0
;Robot.c,82 :: 		LCD_Out(1,1,"Obstacle R");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,83 :: 		Led = ~ Led;
	MOVLW      1
	XORWF      PORTC+0, 1
;Robot.c,84 :: 		}else{
	GOTO       L_main23
L_main22:
;Robot.c,85 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,86 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,87 :: 		}
L_main23:
;Robot.c,89 :: 		break;
	GOTO       L_main10
;Robot.c,91 :: 		case 2: // ETAT 3   //RIGHT
L_main24:
;Robot.c,93 :: 		if ( IR1 > 600 ) {
	MOVF       _IR1+0, 0
	MOVWF      R4+0
	MOVF       _IR1+1, 0
	MOVWF      R4+1
	MOVF       _IR1+2, 0
	MOVWF      R4+2
	MOVF       _IR1+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      22
	MOVWF      R0+2
	MOVLW      136
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main25
;Robot.c,94 :: 		MOTORS_Right(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Right+0
	CALL       _MOTORS_Right+0
;Robot.c,95 :: 		LCD_Out(1,1,"Obstacle L");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,96 :: 		Led = ~ Led;
	MOVLW      1
	XORWF      PORTC+0, 1
;Robot.c,97 :: 		}else{
	GOTO       L_main26
L_main25:
;Robot.c,98 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,99 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,100 :: 		}
L_main26:
;Robot.c,102 :: 		break;
	GOTO       L_main10
;Robot.c,104 :: 		case 3:
L_main27:
;Robot.c,106 :: 		if (Dn  == 1) Etat = 1;  //LEFT
	MOVF       _Dn+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main28
	MOVLW      1
	MOVWF      _Etat+0
	GOTO       L_main29
L_main28:
;Robot.c,107 :: 		else Etat = 2;          //RIGHT
	MOVLW      2
	MOVWF      _Etat+0
L_main29:
;Robot.c,109 :: 		break;
	GOTO       L_main10
;Robot.c,112 :: 		case 4:
L_main30:
;Robot.c,113 :: 		LCD_Out(1,1,"Around");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,114 :: 		MOTORS_Mill_Around();
	CALL       _MOTORS_Mill_Around+0
;Robot.c,115 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,116 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,118 :: 		break;
	GOTO       L_main10
;Robot.c,121 :: 		}
L_main9:
	MOVF       _Etat+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _Etat+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _Etat+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _Etat+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main27
	MOVF       _Etat+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main30
L_main10:
;Robot.c,124 :: 		};
	GOTO       L_main6
;Robot.c,128 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
