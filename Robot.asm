
_main:

;Robot.c,30 :: 		void main() {
;Robot.c,32 :: 		MOTORS_Init();
	CALL       _MOTORS_Init+0
;Robot.c,33 :: 		LCD_Init_P();
	CALL       _LCD_Init_P+0
;Robot.c,34 :: 		SENSOR_Init();
	CALL       _SENSOR_Init+0
;Robot.c,37 :: 		Speed = SPEED_Read();
	CALL       _SPEED_Read+0
	MOVF       R0+0, 0
	MOVWF      _Speed+0
;Robot.c,38 :: 		Direction = DIRECTION_Read();
	CALL       _DIRECTION_Read+0
	MOVF       R0+0, 0
	MOVWF      _Direction+0
;Robot.c,41 :: 		if (Direction == 1)
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main0
;Robot.c,43 :: 		strcpy(TXT1,"LEFT");   // LEFT
	MOVLW      _TXT1+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr1_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,45 :: 		}else{
	GOTO       L_main1
L_main0:
;Robot.c,46 :: 		strcpy(TXT1,"RIGHT");  // RIGHT
	MOVLW      _TXT1+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr2_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,47 :: 		}
L_main1:
;Robot.c,49 :: 		if (Speed == 1)
	MOVF       _Speed+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Robot.c,51 :: 		strcpy(TXT2,"MIN");
	MOVLW      _TXT2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr3_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,52 :: 		Sd = 80;
	MOVLW      80
	MOVWF      _Sd+0
;Robot.c,54 :: 		}else if (Speed == 2){
	GOTO       L_main3
L_main2:
	MOVF       _Speed+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Robot.c,56 :: 		strcpy(TXT2,"MOY");
	MOVLW      _TXT2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr4_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,57 :: 		Sd = 160;
	MOVLW      160
	MOVWF      _Sd+0
;Robot.c,59 :: 		}else{
	GOTO       L_main5
L_main4:
;Robot.c,60 :: 		strcpy(TXT2,"MAX");
	MOVLW      _TXT2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr5_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,61 :: 		Sd = 255;
	MOVLW      255
	MOVWF      _Sd+0
;Robot.c,62 :: 		}
L_main5:
L_main3:
;Robot.c,64 :: 		while(1){
L_main6:
;Robot.c,65 :: 		IR1 =  SENSOR_R1();
	CALL       _SENSOR_R1+0
	MOVF       R0+0, 0
	MOVWF      _IR1+0
	MOVF       R0+1, 0
	MOVWF      _IR1+1
	MOVF       R0+2, 0
	MOVWF      _IR1+2
	MOVF       R0+3, 0
	MOVWF      _IR1+3
;Robot.c,66 :: 		IR2 =  SENSOR_R2();
	CALL       _SENSOR_R2+0
	MOVF       R0+0, 0
	MOVWF      _IR2+0
	MOVF       R0+1, 0
	MOVWF      _IR2+1
	MOVF       R0+2, 0
	MOVWF      _IR2+2
	MOVF       R0+3, 0
	MOVWF      _IR2+3
;Robot.c,67 :: 		IR3 =  SENSOR_R3();
	CALL       _SENSOR_R3+0
	MOVF       R0+0, 0
	MOVWF      _IR3+0
	MOVF       R0+1, 0
	MOVWF      _IR3+1
	MOVF       R0+2, 0
	MOVWF      _IR3+2
	MOVF       R0+3, 0
	MOVWF      _IR3+3
;Robot.c,69 :: 		switch(Flag)
	GOTO       L_main8
;Robot.c,71 :: 		case 1:
L_main10:
;Robot.c,73 :: 		Motors_Right(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Right+0
	CALL       _MOTORS_Right+0
;Robot.c,74 :: 		Delay_ms(800);
	MOVLW      17
	MOVWF      R11+0
	MOVLW      60
	MOVWF      R12+0
	MOVLW      203
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
;Robot.c,75 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,76 :: 		Flag = 0;
	CLRF       _Flag+0
;Robot.c,77 :: 		break;
	GOTO       L_main9
;Robot.c,79 :: 		case 2:
L_main12:
;Robot.c,81 :: 		Motors_Left(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Left+0
	CALL       _MOTORS_Left+0
;Robot.c,82 :: 		Delay_ms(800);
	MOVLW      17
	MOVWF      R11+0
	MOVLW      60
	MOVWF      R12+0
	MOVLW      203
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
;Robot.c,83 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,84 :: 		Flag = 0;
	CLRF       _Flag+0
;Robot.c,85 :: 		break;
	GOTO       L_main9
;Robot.c,88 :: 		case 3:
L_main14:
;Robot.c,90 :: 		Etat = 4;
	MOVLW      4
	MOVWF      _Etat+0
;Robot.c,91 :: 		Flag = 0;
	CLRF       _Flag+0
;Robot.c,92 :: 		break;
	GOTO       L_main9
;Robot.c,94 :: 		}
L_main8:
	MOVF       _Flag+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _Flag+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _Flag+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main14
L_main9:
;Robot.c,95 :: 		switch (Etat) {
	GOTO       L_main15
;Robot.c,97 :: 		case 0:     // ETAT 0  // INIT
L_main17:
;Robot.c,99 :: 		MOTROS_Start(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTROS_Start+0
	CALL       _MOTROS_Start+0
;Robot.c,101 :: 		LCD_Out(1,1,TXT1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TXT1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,102 :: 		LCD_Out(2,1,TXT2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TXT2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,105 :: 		if ( IR1 > 600 ){
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
	GOTO       L_main18
;Robot.c,107 :: 		if ((IR2 < 512) && (IR3 < 512)) Etat = 3;
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
	GOTO       L_main21
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
	GOTO       L_main21
L__main86:
	MOVLW      3
	MOVWF      _Etat+0
	GOTO       L_main22
L_main21:
;Robot.c,108 :: 		else if  (IR3 < 512) Etat = 2;
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
	GOTO       L_main23
	MOVLW      2
	MOVWF      _Etat+0
	GOTO       L_main24
L_main23:
;Robot.c,109 :: 		else if  (IR2 < 512) Etat = 1;
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
	GOTO       L_main25
	MOVLW      1
	MOVWF      _Etat+0
	GOTO       L_main26
L_main25:
;Robot.c,110 :: 		else  Etat = 4;
	MOVLW      4
	MOVWF      _Etat+0
L_main26:
L_main24:
L_main22:
;Robot.c,112 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,113 :: 		}
	GOTO       L_main27
L_main18:
;Robot.c,116 :: 		else if ( IR2 > 900){     //  SKIP LEFT
	MOVF       _IR2+0, 0
	MOVWF      R4+0
	MOVF       _IR2+1, 0
	MOVWF      R4+1
	MOVF       _IR2+2, 0
	MOVWF      R4+2
	MOVF       _IR2+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      97
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
	GOTO       L_main28
;Robot.c,118 :: 		Etat = 5;
	MOVLW      5
	MOVWF      _Etat+0
;Robot.c,119 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,120 :: 		}
	GOTO       L_main29
L_main28:
;Robot.c,122 :: 		else if (IR3 > 900){     // SKIP RIGHT
	MOVF       _IR3+0, 0
	MOVWF      R4+0
	MOVF       _IR3+1, 0
	MOVWF      R4+1
	MOVF       _IR3+2, 0
	MOVWF      R4+2
	MOVF       _IR3+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      97
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
	GOTO       L_main30
;Robot.c,124 :: 		Etat = 6;
	MOVLW      6
	MOVWF      _Etat+0
;Robot.c,125 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,127 :: 		}
L_main30:
L_main29:
L_main27:
;Robot.c,128 :: 		if (CG == 1){
	BTFSS      PORTC+0, 3
	GOTO       L_main31
;Robot.c,131 :: 		MOTORS_Stop();
	CALL       _MOTORS_Stop+0
;Robot.c,132 :: 		Etat = 7;
	MOVLW      7
	MOVWF      _Etat+0
;Robot.c,133 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,135 :: 		}
L_main31:
;Robot.c,139 :: 		break;
	GOTO       L_main16
;Robot.c,141 :: 		case 1:   // ETAT 1   //LEFT
L_main32:
;Robot.c,142 :: 		LCD_Out(1,1,"OBST L");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,143 :: 		if ( IR1 > 600 ) {
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
	GOTO       L_main33
;Robot.c,144 :: 		MOTORS_Left(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Left+0
	CALL       _MOTORS_Left+0
;Robot.c,146 :: 		}else{
	GOTO       L_main34
L_main33:
;Robot.c,147 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,148 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,149 :: 		}
L_main34:
;Robot.c,151 :: 		break;
	GOTO       L_main16
;Robot.c,153 :: 		case 2: // ETAT 2  //RIGHT
L_main35:
;Robot.c,154 :: 		LCD_Out(1,1,"OBST R");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,155 :: 		if ( IR1 > 600 ) {
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
	GOTO       L_main36
;Robot.c,156 :: 		MOTORS_Right(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Right+0
	CALL       _MOTORS_Right+0
;Robot.c,158 :: 		}else{
	GOTO       L_main37
L_main36:
;Robot.c,159 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,160 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,161 :: 		}
L_main37:
;Robot.c,163 :: 		break;
	GOTO       L_main16
;Robot.c,165 :: 		case 3:  // ETAT 3  //SELECT BY USER
L_main38:
;Robot.c,167 :: 		if (Direction  == 1) Etat = 2;  //LEFT
	MOVF       _Direction+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main39
	MOVLW      2
	MOVWF      _Etat+0
	GOTO       L_main40
L_main39:
;Robot.c,168 :: 		else Etat = 1;          //RIGHT
	MOVLW      1
	MOVWF      _Etat+0
L_main40:
;Robot.c,170 :: 		break;
	GOTO       L_main16
;Robot.c,173 :: 		case 4:  // ETAT 4 # RETURN ARROUND
L_main41:
;Robot.c,174 :: 		LCD_out(1,6,"AR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,175 :: 		MOTORS_Mill_Around();
	CALL       _MOTORS_Mill_Around+0
;Robot.c,176 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,177 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,179 :: 		break;
	GOTO       L_main16
;Robot.c,182 :: 		case 5:    // ETAT 5 #SKIP LEFT
L_main42:
;Robot.c,183 :: 		LCD_Out(1,1,"SL");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,184 :: 		MOTORS_Left(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Left+0
	CALL       _MOTORS_Left+0
;Robot.c,185 :: 		if (IR2 < 700){
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      47
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
	GOTO       L_main43
;Robot.c,186 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,187 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,188 :: 		}
L_main43:
;Robot.c,190 :: 		break;
	GOTO       L_main16
;Robot.c,194 :: 		case 6:   // ETAT 6 #SKIP RIGHT
L_main44:
;Robot.c,195 :: 		LCD_Out(1,1,"SR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,196 :: 		MOTORS_Right(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Right+0
	CALL       _MOTORS_Right+0
;Robot.c,197 :: 		if (IR3 < 700){
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      47
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
	GOTO       L_main45
;Robot.c,198 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,199 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,200 :: 		}
L_main45:
;Robot.c,202 :: 		break;
	GOTO       L_main16
;Robot.c,206 :: 		case 7:
L_main46:
;Robot.c,208 :: 		Lcd_Out(1,1,CONFIG);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _CONFIG+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,209 :: 		Lcd_Out(2,2,OptionC);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _OptionC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,211 :: 		if (SL){
	BTFSS      PORTB+0, 2
	GOTO       L_main47
;Robot.c,212 :: 		CSD = 1;
	MOVLW      1
	MOVWF      _CSD+0
;Robot.c,213 :: 		Delay_ms(200);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	DECFSZ     R11+0, 1
	GOTO       L_main48
;Robot.c,214 :: 		}
L_main47:
;Robot.c,216 :: 		if (SR) {
	BTFSS      PORTB+0, 3
	GOTO       L_main49
;Robot.c,217 :: 		CSD = 2;
	MOVLW      2
	MOVWF      _CSD+0
;Robot.c,218 :: 		Delay_ms(200);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	DECFSZ     R11+0, 1
	GOTO       L_main50
;Robot.c,219 :: 		}
L_main49:
;Robot.c,221 :: 		if (CSD == 1) {
	MOVF       _CSD+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main51
;Robot.c,223 :: 		Lcd_Out(2,1,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,224 :: 		Lcd_Out(2,10,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,226 :: 		}else{
	GOTO       L_main52
L_main51:
;Robot.c,228 :: 		Lcd_Out(2,10,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,229 :: 		Lcd_Out(2,1,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,231 :: 		}
L_main52:
;Robot.c,233 :: 		if (OK){
	BTFSS      PORTB+0, 1
	GOTO       L_main53
;Robot.c,235 :: 		if(CSD == 1) Etat = 8;
	MOVF       _CSD+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main54
	MOVLW      8
	MOVWF      _Etat+0
	GOTO       L_main55
L_main54:
;Robot.c,236 :: 		else Etat = 9;
	MOVLW      9
	MOVWF      _Etat+0
L_main55:
;Robot.c,237 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,239 :: 		}
L_main53:
;Robot.c,242 :: 		break;
	GOTO       L_main16
;Robot.c,244 :: 		case 8:
L_main56:
;Robot.c,247 :: 		Lcd_Out(2,2,OptionS);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _OptionS+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,248 :: 		if (Speed == 1 ){
	MOVF       _Speed+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main57
;Robot.c,249 :: 		Lcd_Out(2,1,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,250 :: 		Lcd_Out(2,6,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,251 :: 		Lcd_Out(2,11,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,252 :: 		if (SR){
	BTFSS      PORTB+0, 3
	GOTO       L_main58
;Robot.c,253 :: 		Speed = 2;
	MOVLW      2
	MOVWF      _Speed+0
;Robot.c,254 :: 		Delay_ms(300);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main59:
	DECFSZ     R13+0, 1
	GOTO       L_main59
	DECFSZ     R12+0, 1
	GOTO       L_main59
	DECFSZ     R11+0, 1
	GOTO       L_main59
	NOP
;Robot.c,255 :: 		}
L_main58:
;Robot.c,257 :: 		}else if (Speed == 2){
	GOTO       L_main60
L_main57:
	MOVF       _Speed+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main61
;Robot.c,258 :: 		Lcd_Out(2,1,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,259 :: 		Lcd_Out(2,7,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,260 :: 		Lcd_Out(2,13,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,261 :: 		if (SL) {
	BTFSS      PORTB+0, 2
	GOTO       L_main62
;Robot.c,262 :: 		Speed = 1;
	MOVLW      1
	MOVWF      _Speed+0
;Robot.c,263 :: 		Delay_ms(300); }
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main63:
	DECFSZ     R13+0, 1
	GOTO       L_main63
	DECFSZ     R12+0, 1
	GOTO       L_main63
	DECFSZ     R11+0, 1
	GOTO       L_main63
	NOP
L_main62:
;Robot.c,265 :: 		if (SR){
	BTFSS      PORTB+0, 3
	GOTO       L_main64
;Robot.c,266 :: 		Speed = 3;
	MOVLW      3
	MOVWF      _Speed+0
;Robot.c,267 :: 		Delay_ms(300);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main65:
	DECFSZ     R13+0, 1
	GOTO       L_main65
	DECFSZ     R12+0, 1
	GOTO       L_main65
	DECFSZ     R11+0, 1
	GOTO       L_main65
	NOP
;Robot.c,268 :: 		}
L_main64:
;Robot.c,269 :: 		}else{
	GOTO       L_main66
L_main61:
;Robot.c,271 :: 		Lcd_Out(2,1,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,272 :: 		Lcd_Out(2,6,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,273 :: 		Lcd_Out(2,12,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,274 :: 		if (SL == 1) {
	BTFSS      PORTB+0, 2
	GOTO       L_main67
;Robot.c,275 :: 		Speed = 2;
	MOVLW      2
	MOVWF      _Speed+0
;Robot.c,276 :: 		Delay_ms(300); }
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main68:
	DECFSZ     R13+0, 1
	GOTO       L_main68
	DECFSZ     R12+0, 1
	GOTO       L_main68
	DECFSZ     R11+0, 1
	GOTO       L_main68
	NOP
L_main67:
;Robot.c,277 :: 		}
L_main66:
L_main60:
;Robot.c,279 :: 		if (CG){
	BTFSS      PORTC+0, 3
	GOTO       L_main69
;Robot.c,280 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,281 :: 		Lcd_Out(1,8,Done);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Done+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,282 :: 		EEPROM_WRITE(SPEED,Speed);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _Speed+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Robot.c,283 :: 		Delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main70:
	DECFSZ     R13+0, 1
	GOTO       L_main70
	DECFSZ     R12+0, 1
	GOTO       L_main70
	DECFSZ     R11+0, 1
	GOTO       L_main70
	NOP
;Robot.c,284 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,285 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,286 :: 		}
L_main69:
;Robot.c,290 :: 		break;
	GOTO       L_main16
;Robot.c,292 :: 		case 9:
L_main71:
;Robot.c,294 :: 		Lcd_Out(2,2,OptionD);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _OptionD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,295 :: 		if (SL) {
	BTFSS      PORTB+0, 2
	GOTO       L_main72
;Robot.c,296 :: 		Direction = 1;
	MOVLW      1
	MOVWF      _Direction+0
;Robot.c,297 :: 		Delay_ms(300); }
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main73:
	DECFSZ     R13+0, 1
	GOTO       L_main73
	DECFSZ     R12+0, 1
	GOTO       L_main73
	DECFSZ     R11+0, 1
	GOTO       L_main73
	NOP
L_main72:
;Robot.c,298 :: 		if (SR) {
	BTFSS      PORTB+0, 3
	GOTO       L_main74
;Robot.c,299 :: 		Direction = 2;
	MOVLW      2
	MOVWF      _Direction+0
;Robot.c,300 :: 		Delay_ms(300);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main75:
	DECFSZ     R13+0, 1
	GOTO       L_main75
	DECFSZ     R12+0, 1
	GOTO       L_main75
	DECFSZ     R11+0, 1
	GOTO       L_main75
	NOP
;Robot.c,301 :: 		}
L_main74:
;Robot.c,303 :: 		if (Direction == 1) {
	MOVF       _Direction+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main76
;Robot.c,304 :: 		Lcd_Out(2,1,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,305 :: 		Lcd_Out(2,10,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,306 :: 		}else{
	GOTO       L_main77
L_main76:
;Robot.c,307 :: 		Lcd_Out(2,10,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,308 :: 		Lcd_Out(2,1,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,309 :: 		}
L_main77:
;Robot.c,311 :: 		if (CG){
	BTFSS      PORTC+0, 3
	GOTO       L_main78
;Robot.c,312 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,313 :: 		Lcd_Out(1,8,Done);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Done+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,314 :: 		EEPROM_WRITE(DIRECTION,Direction);
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _Direction+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Robot.c,315 :: 		Delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main79:
	DECFSZ     R13+0, 1
	GOTO       L_main79
	DECFSZ     R12+0, 1
	GOTO       L_main79
	DECFSZ     R11+0, 1
	GOTO       L_main79
	NOP
;Robot.c,316 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,317 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,318 :: 		}
L_main78:
;Robot.c,320 :: 		break;
	GOTO       L_main16
;Robot.c,328 :: 		}
L_main15:
	MOVF       _Etat+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _Etat+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main32
	MOVF       _Etat+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main35
	MOVF       _Etat+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main38
	MOVF       _Etat+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main41
	MOVF       _Etat+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main42
	MOVF       _Etat+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main44
	MOVF       _Etat+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main46
	MOVF       _Etat+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main56
	MOVF       _Etat+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main71
L_main16:
;Robot.c,331 :: 		};
	GOTO       L_main6
;Robot.c,335 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Robot.c,337 :: 		void interrupt (void) {
;Robot.c,339 :: 		if(INTCON.INTF){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt80
;Robot.c,340 :: 		Flag = 3;
	MOVLW      3
	MOVWF      _Flag+0
;Robot.c,342 :: 		INTCON.INTF = 0;   //REST
	BCF        INTCON+0, 1
;Robot.c,343 :: 		}
L_interrupt80:
;Robot.c,345 :: 		if (INTCON.RBIF){
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt81
;Robot.c,347 :: 		if (PORTB.RB4){
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt82
;Robot.c,348 :: 		Flag = 1;
	MOVLW      1
	MOVWF      _Flag+0
;Robot.c,350 :: 		}
L_interrupt82:
;Robot.c,351 :: 		if (PORTB.RB5){
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt83
;Robot.c,352 :: 		Flag = 3;
	MOVLW      3
	MOVWF      _Flag+0
;Robot.c,354 :: 		}
L_interrupt83:
;Robot.c,355 :: 		if (PORTB.RB6){
	BTFSS      PORTB+0, 6
	GOTO       L_interrupt84
;Robot.c,356 :: 		Flag = 3;
	MOVLW      3
	MOVWF      _Flag+0
;Robot.c,358 :: 		}
L_interrupt84:
;Robot.c,359 :: 		if (PORTB.RB7){
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt85
;Robot.c,360 :: 		Flag = 2;
	MOVLW      2
	MOVWF      _Flag+0
;Robot.c,362 :: 		}
L_interrupt85:
;Robot.c,363 :: 		INTCON.RBIF  = 0; //REST INTERRUPT
	BCF        INTCON+0, 0
;Robot.c,364 :: 		}
L_interrupt81:
;Robot.c,366 :: 		}
L_end_interrupt:
L__interrupt89:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
