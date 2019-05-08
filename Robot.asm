
_main:

;Robot.c,31 :: 		void main() {
;Robot.c,33 :: 		MOTORS_Init();
	CALL       _MOTORS_Init+0
;Robot.c,34 :: 		LCD_Init_P();
	CALL       _LCD_Init_P+0
;Robot.c,35 :: 		SENSOR_Init();
	CALL       _SENSOR_Init+0
;Robot.c,37 :: 		UART1_Init(9600);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Robot.c,39 :: 		Speed = SPEED_Read();
	CALL       _SPEED_Read+0
	MOVF       R0+0, 0
	MOVWF      _Speed+0
;Robot.c,40 :: 		Direction = DIRECTION_Read();
	CALL       _DIRECTION_Read+0
	MOVF       R0+0, 0
	MOVWF      _Direction+0
;Robot.c,43 :: 		UART1_Write_Text("Start");
	MOVLW      ?lstr1_Robot+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Robot.c,44 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Robot.c,45 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Robot.c,49 :: 		if (Direction == 1)
	MOVF       _Direction+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main0
;Robot.c,51 :: 		strcpy(TXT1,"LEFT");   // LEFT
	MOVLW      _TXT1+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr2_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,53 :: 		}else{
	GOTO       L_main1
L_main0:
;Robot.c,54 :: 		strcpy(TXT1,"RIGHT");  // RIGHT
	MOVLW      _TXT1+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr3_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,55 :: 		}
L_main1:
;Robot.c,57 :: 		if (Speed == 1)
	MOVF       _Speed+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Robot.c,59 :: 		strcpy(TXT2,"MIN");
	MOVLW      _TXT2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr4_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,60 :: 		Sd = 80;
	MOVLW      80
	MOVWF      _Sd+0
;Robot.c,62 :: 		}else if (Speed == 2){
	GOTO       L_main3
L_main2:
	MOVF       _Speed+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Robot.c,64 :: 		strcpy(TXT2,"MOY");
	MOVLW      _TXT2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr5_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,65 :: 		Sd = 160;
	MOVLW      160
	MOVWF      _Sd+0
;Robot.c,67 :: 		}else{
	GOTO       L_main5
L_main4:
;Robot.c,68 :: 		strcpy(TXT2,"MAX");
	MOVLW      _TXT2+0
	MOVWF      FARG_strcpy_to+0
	MOVLW      ?lstr6_Robot+0
	MOVWF      FARG_strcpy_from+0
	CALL       _strcpy+0
;Robot.c,69 :: 		Sd = 255;
	MOVLW      255
	MOVWF      _Sd+0
;Robot.c,70 :: 		}
L_main5:
L_main3:
;Robot.c,72 :: 		while(1){
L_main6:
;Robot.c,73 :: 		IR1 =  SENSOR_R1();
	CALL       _SENSOR_R1+0
	MOVF       R0+0, 0
	MOVWF      _IR1+0
	MOVF       R0+1, 0
	MOVWF      _IR1+1
	MOVF       R0+2, 0
	MOVWF      _IR1+2
	MOVF       R0+3, 0
	MOVWF      _IR1+3
;Robot.c,74 :: 		IR2 =  SENSOR_R2();
	CALL       _SENSOR_R2+0
	MOVF       R0+0, 0
	MOVWF      _IR2+0
	MOVF       R0+1, 0
	MOVWF      _IR2+1
	MOVF       R0+2, 0
	MOVWF      _IR2+2
	MOVF       R0+3, 0
	MOVWF      _IR2+3
;Robot.c,75 :: 		IR3 =  SENSOR_R3();
	CALL       _SENSOR_R3+0
	MOVF       R0+0, 0
	MOVWF      _IR3+0
	MOVF       R0+1, 0
	MOVWF      _IR3+1
	MOVF       R0+2, 0
	MOVWF      _IR3+2
	MOVF       R0+3, 0
	MOVWF      _IR3+3
;Robot.c,77 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;Robot.c,78 :: 		switch(uart_rd)
	GOTO       L_main8
;Robot.c,80 :: 		case '1':
L_main10:
;Robot.c,81 :: 		EEPROM_WRITE(DIRECTION,1);
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Robot.c,82 :: 		break;
	GOTO       L_main9
;Robot.c,83 :: 		case '2':
L_main11:
;Robot.c,84 :: 		EEPROM_WRITE(DIRECTION,2);
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Robot.c,85 :: 		break;
	GOTO       L_main9
;Robot.c,86 :: 		case '3':
L_main12:
;Robot.c,87 :: 		EEPROM_WRITE(SPEED,1);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Robot.c,88 :: 		break;
	GOTO       L_main9
;Robot.c,89 :: 		case '4':
L_main13:
;Robot.c,90 :: 		EEPROM_WRITE(SPEED,2);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Robot.c,91 :: 		break;
	GOTO       L_main9
;Robot.c,92 :: 		case '5':
L_main14:
;Robot.c,93 :: 		EEPROM_WRITE(SPEED,3);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Robot.c,94 :: 		break;
	GOTO       L_main9
;Robot.c,96 :: 		}
L_main8:
	MOVF       _uart_rd+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _uart_rd+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _uart_rd+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _uart_rd+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _uart_rd+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main14
L_main9:
;Robot.c,98 :: 		switch(Flag)
	GOTO       L_main15
;Robot.c,100 :: 		case 1:
L_main17:
;Robot.c,102 :: 		Motors_Right(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Right+0
	CALL       _MOTORS_Right+0
;Robot.c,103 :: 		Delay_ms(800);
	MOVLW      17
	MOVWF      R11+0
	MOVLW      60
	MOVWF      R12+0
	MOVLW      203
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
;Robot.c,104 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,105 :: 		Flag = 0;
	CLRF       _Flag+0
;Robot.c,106 :: 		break;
	GOTO       L_main16
;Robot.c,108 :: 		case 2:
L_main19:
;Robot.c,110 :: 		Motors_Left(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Left+0
	CALL       _MOTORS_Left+0
;Robot.c,111 :: 		Delay_ms(800);
	MOVLW      17
	MOVWF      R11+0
	MOVLW      60
	MOVWF      R12+0
	MOVLW      203
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
;Robot.c,112 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,113 :: 		Flag = 0;
	CLRF       _Flag+0
;Robot.c,114 :: 		break;
	GOTO       L_main16
;Robot.c,117 :: 		case 3:
L_main21:
;Robot.c,119 :: 		Etat = 4;
	MOVLW      4
	MOVWF      _Etat+0
;Robot.c,120 :: 		Flag = 0;
	CLRF       _Flag+0
;Robot.c,121 :: 		break;
	GOTO       L_main16
;Robot.c,123 :: 		}
L_main15:
	MOVF       _Flag+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _Flag+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _Flag+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main21
L_main16:
;Robot.c,125 :: 		switch (Etat) {
	GOTO       L_main22
;Robot.c,127 :: 		case 0:     // ETAT 0  // INIT
L_main24:
;Robot.c,129 :: 		MOTROS_Start(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTROS_Start+0
	CALL       _MOTROS_Start+0
;Robot.c,131 :: 		LCD_Out(1,1,TXT1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TXT1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,132 :: 		LCD_Out(2,1,TXT2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TXT2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,135 :: 		if ( IR1 > 600 ){
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
;Robot.c,137 :: 		if ((IR2 < 512) && (IR3 < 512)) Etat = 3;
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
	GOTO       L_main28
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
	GOTO       L_main28
L__main93:
	MOVLW      3
	MOVWF      _Etat+0
	GOTO       L_main29
L_main28:
;Robot.c,138 :: 		else if  (IR3 < 512) Etat = 2;
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
	GOTO       L_main30
	MOVLW      2
	MOVWF      _Etat+0
	GOTO       L_main31
L_main30:
;Robot.c,139 :: 		else if  (IR2 < 512) Etat = 1;
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
	GOTO       L_main32
	MOVLW      1
	MOVWF      _Etat+0
	GOTO       L_main33
L_main32:
;Robot.c,140 :: 		else  Etat = 4;
	MOVLW      4
	MOVWF      _Etat+0
L_main33:
L_main31:
L_main29:
;Robot.c,142 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,143 :: 		}
	GOTO       L_main34
L_main25:
;Robot.c,146 :: 		else if ( IR2 > 900){     //  SKIP LEFT
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
	GOTO       L_main35
;Robot.c,148 :: 		Etat = 5;
	MOVLW      5
	MOVWF      _Etat+0
;Robot.c,149 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,150 :: 		}
	GOTO       L_main36
L_main35:
;Robot.c,152 :: 		else if (IR3 > 900){     // SKIP RIGHT
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
	GOTO       L_main37
;Robot.c,154 :: 		Etat = 6;
	MOVLW      6
	MOVWF      _Etat+0
;Robot.c,155 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,157 :: 		}
L_main37:
L_main36:
L_main34:
;Robot.c,158 :: 		if (CG == 1){
	BTFSS      PORTC+0, 3
	GOTO       L_main38
;Robot.c,161 :: 		MOTORS_Stop();
	CALL       _MOTORS_Stop+0
;Robot.c,162 :: 		Etat = 7;
	MOVLW      7
	MOVWF      _Etat+0
;Robot.c,163 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,165 :: 		}
L_main38:
;Robot.c,169 :: 		break;
	GOTO       L_main23
;Robot.c,171 :: 		case 1:   // ETAT 1   //LEFT
L_main39:
;Robot.c,172 :: 		LCD_Out(1,1,"OBST L");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,173 :: 		if ( IR1 > 600 ) {
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
	GOTO       L_main40
;Robot.c,174 :: 		MOTORS_Left(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Left+0
	CALL       _MOTORS_Left+0
;Robot.c,176 :: 		}else{
	GOTO       L_main41
L_main40:
;Robot.c,177 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,178 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,179 :: 		}
L_main41:
;Robot.c,181 :: 		break;
	GOTO       L_main23
;Robot.c,183 :: 		case 2: // ETAT 2  //RIGHT
L_main42:
;Robot.c,184 :: 		LCD_Out(1,1,"OBST R");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,185 :: 		if ( IR1 > 600 ) {
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
	GOTO       L_main43
;Robot.c,186 :: 		MOTORS_Right(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Right+0
	CALL       _MOTORS_Right+0
;Robot.c,188 :: 		}else{
	GOTO       L_main44
L_main43:
;Robot.c,189 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,190 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,191 :: 		}
L_main44:
;Robot.c,193 :: 		break;
	GOTO       L_main23
;Robot.c,195 :: 		case 3:  // ETAT 3  //SELECT BY USER
L_main45:
;Robot.c,197 :: 		if (Direction  == 1) Etat = 2;  //LEFT
	MOVF       _Direction+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main46
	MOVLW      2
	MOVWF      _Etat+0
	GOTO       L_main47
L_main46:
;Robot.c,198 :: 		else Etat = 1;          //RIGHT
	MOVLW      1
	MOVWF      _Etat+0
L_main47:
;Robot.c,200 :: 		break;
	GOTO       L_main23
;Robot.c,203 :: 		case 4:  // ETAT 4 # RETURN ARROUND
L_main48:
;Robot.c,204 :: 		LCD_out(1,6,"AR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,205 :: 		MOTORS_Mill_Around();
	CALL       _MOTORS_Mill_Around+0
;Robot.c,206 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,207 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,209 :: 		break;
	GOTO       L_main23
;Robot.c,212 :: 		case 5:    // ETAT 5 #SKIP LEFT
L_main49:
;Robot.c,213 :: 		LCD_Out(1,1,"SL");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,214 :: 		MOTORS_Left(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Left+0
	CALL       _MOTORS_Left+0
;Robot.c,215 :: 		if (IR2 < 700){
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
	GOTO       L_main50
;Robot.c,216 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,217 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,218 :: 		}
L_main50:
;Robot.c,220 :: 		break;
	GOTO       L_main23
;Robot.c,224 :: 		case 6:   // ETAT 6 #SKIP RIGHT
L_main51:
;Robot.c,225 :: 		LCD_Out(1,1,"SR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_Robot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,226 :: 		MOTORS_Right(sd);
	MOVF       _Sd+0, 0
	MOVWF      FARG_MOTORS_Right+0
	CALL       _MOTORS_Right+0
;Robot.c,227 :: 		if (IR3 < 700){
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
	GOTO       L_main52
;Robot.c,228 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,229 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,230 :: 		}
L_main52:
;Robot.c,232 :: 		break;
	GOTO       L_main23
;Robot.c,236 :: 		case 7:
L_main53:
;Robot.c,238 :: 		Lcd_Out(1,1,CONFIG);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _CONFIG+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,239 :: 		Lcd_Out(2,2,OptionC);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _OptionC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,241 :: 		if (SL){
	BTFSS      PORTB+0, 2
	GOTO       L_main54
;Robot.c,242 :: 		CSD = 1;
	MOVLW      1
	MOVWF      _CSD+0
;Robot.c,243 :: 		Delay_ms(200);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main55:
	DECFSZ     R13+0, 1
	GOTO       L_main55
	DECFSZ     R12+0, 1
	GOTO       L_main55
	DECFSZ     R11+0, 1
	GOTO       L_main55
;Robot.c,244 :: 		}
L_main54:
;Robot.c,246 :: 		if (SR) {
	BTFSS      PORTB+0, 3
	GOTO       L_main56
;Robot.c,247 :: 		CSD = 2;
	MOVLW      2
	MOVWF      _CSD+0
;Robot.c,248 :: 		Delay_ms(200);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main57:
	DECFSZ     R13+0, 1
	GOTO       L_main57
	DECFSZ     R12+0, 1
	GOTO       L_main57
	DECFSZ     R11+0, 1
	GOTO       L_main57
;Robot.c,249 :: 		}
L_main56:
;Robot.c,251 :: 		if (CSD == 1) {
	MOVF       _CSD+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main58
;Robot.c,253 :: 		Lcd_Out(2,1,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,254 :: 		Lcd_Out(2,10,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,256 :: 		}else{
	GOTO       L_main59
L_main58:
;Robot.c,258 :: 		Lcd_Out(2,10,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,259 :: 		Lcd_Out(2,1,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,261 :: 		}
L_main59:
;Robot.c,263 :: 		if (OK){
	BTFSS      PORTB+0, 1
	GOTO       L_main60
;Robot.c,265 :: 		if(CSD == 1) Etat = 8;
	MOVF       _CSD+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main61
	MOVLW      8
	MOVWF      _Etat+0
	GOTO       L_main62
L_main61:
;Robot.c,266 :: 		else Etat = 9;
	MOVLW      9
	MOVWF      _Etat+0
L_main62:
;Robot.c,267 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,269 :: 		}
L_main60:
;Robot.c,272 :: 		break;
	GOTO       L_main23
;Robot.c,274 :: 		case 8:
L_main63:
;Robot.c,277 :: 		Lcd_Out(2,2,OptionS);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _OptionS+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,278 :: 		if (Speed == 1 ){
	MOVF       _Speed+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main64
;Robot.c,279 :: 		Lcd_Out(2,1,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,280 :: 		Lcd_Out(2,6,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,281 :: 		Lcd_Out(2,11,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,282 :: 		if (SR){
	BTFSS      PORTB+0, 3
	GOTO       L_main65
;Robot.c,283 :: 		Speed = 2;
	MOVLW      2
	MOVWF      _Speed+0
;Robot.c,284 :: 		Delay_ms(300);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main66:
	DECFSZ     R13+0, 1
	GOTO       L_main66
	DECFSZ     R12+0, 1
	GOTO       L_main66
	DECFSZ     R11+0, 1
	GOTO       L_main66
	NOP
;Robot.c,285 :: 		}
L_main65:
;Robot.c,287 :: 		}else if (Speed == 2){
	GOTO       L_main67
L_main64:
	MOVF       _Speed+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main68
;Robot.c,288 :: 		Lcd_Out(2,1,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,289 :: 		Lcd_Out(2,7,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,290 :: 		Lcd_Out(2,13,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,291 :: 		if (SL) {
	BTFSS      PORTB+0, 2
	GOTO       L_main69
;Robot.c,292 :: 		Speed = 1;
	MOVLW      1
	MOVWF      _Speed+0
;Robot.c,293 :: 		Delay_ms(300); }
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main70:
	DECFSZ     R13+0, 1
	GOTO       L_main70
	DECFSZ     R12+0, 1
	GOTO       L_main70
	DECFSZ     R11+0, 1
	GOTO       L_main70
	NOP
L_main69:
;Robot.c,295 :: 		if (SR){
	BTFSS      PORTB+0, 3
	GOTO       L_main71
;Robot.c,296 :: 		Speed = 3;
	MOVLW      3
	MOVWF      _Speed+0
;Robot.c,297 :: 		Delay_ms(300);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main72:
	DECFSZ     R13+0, 1
	GOTO       L_main72
	DECFSZ     R12+0, 1
	GOTO       L_main72
	DECFSZ     R11+0, 1
	GOTO       L_main72
	NOP
;Robot.c,298 :: 		}
L_main71:
;Robot.c,299 :: 		}else{
	GOTO       L_main73
L_main68:
;Robot.c,301 :: 		Lcd_Out(2,1,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,302 :: 		Lcd_Out(2,6,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,303 :: 		Lcd_Out(2,12,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,304 :: 		if (SL == 1) {
	BTFSS      PORTB+0, 2
	GOTO       L_main74
;Robot.c,305 :: 		Speed = 2;
	MOVLW      2
	MOVWF      _Speed+0
;Robot.c,306 :: 		Delay_ms(300); }
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
L_main74:
;Robot.c,307 :: 		}
L_main73:
L_main67:
;Robot.c,309 :: 		if (CG){
	BTFSS      PORTC+0, 3
	GOTO       L_main76
;Robot.c,310 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,311 :: 		Lcd_Out(1,8,Done);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Done+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,312 :: 		EEPROM_WRITE(SPEED,Speed);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _Speed+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Robot.c,313 :: 		Delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main77:
	DECFSZ     R13+0, 1
	GOTO       L_main77
	DECFSZ     R12+0, 1
	GOTO       L_main77
	DECFSZ     R11+0, 1
	GOTO       L_main77
	NOP
;Robot.c,314 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,315 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,316 :: 		}
L_main76:
;Robot.c,320 :: 		break;
	GOTO       L_main23
;Robot.c,322 :: 		case 9:
L_main78:
;Robot.c,324 :: 		Lcd_Out(2,2,OptionD);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _OptionD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,325 :: 		if (SL) {
	BTFSS      PORTB+0, 2
	GOTO       L_main79
;Robot.c,326 :: 		Direction = 1;
	MOVLW      1
	MOVWF      _Direction+0
;Robot.c,327 :: 		Delay_ms(300); }
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main80:
	DECFSZ     R13+0, 1
	GOTO       L_main80
	DECFSZ     R12+0, 1
	GOTO       L_main80
	DECFSZ     R11+0, 1
	GOTO       L_main80
	NOP
L_main79:
;Robot.c,328 :: 		if (SR) {
	BTFSS      PORTB+0, 3
	GOTO       L_main81
;Robot.c,329 :: 		Direction = 2;
	MOVLW      2
	MOVWF      _Direction+0
;Robot.c,330 :: 		Delay_ms(300);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main82:
	DECFSZ     R13+0, 1
	GOTO       L_main82
	DECFSZ     R12+0, 1
	GOTO       L_main82
	DECFSZ     R11+0, 1
	GOTO       L_main82
	NOP
;Robot.c,331 :: 		}
L_main81:
;Robot.c,333 :: 		if (Direction == 1) {
	MOVF       _Direction+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main83
;Robot.c,334 :: 		Lcd_Out(2,1,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,335 :: 		Lcd_Out(2,10,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,336 :: 		}else{
	GOTO       L_main84
L_main83:
;Robot.c,337 :: 		Lcd_Out(2,10,Tag);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Tag+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,338 :: 		Lcd_Out(2,1,Vid);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Vid+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,339 :: 		}
L_main84:
;Robot.c,341 :: 		if (CG){
	BTFSS      PORTC+0, 3
	GOTO       L_main85
;Robot.c,342 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,343 :: 		Lcd_Out(1,8,Done);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Done+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Robot.c,344 :: 		EEPROM_WRITE(DIRECTION,Direction);
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _Direction+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Robot.c,345 :: 		Delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main86:
	DECFSZ     R13+0, 1
	GOTO       L_main86
	DECFSZ     R12+0, 1
	GOTO       L_main86
	DECFSZ     R11+0, 1
	GOTO       L_main86
	NOP
;Robot.c,346 :: 		Etat = 0;
	CLRF       _Etat+0
;Robot.c,347 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Robot.c,348 :: 		}
L_main85:
;Robot.c,350 :: 		break;
	GOTO       L_main23
;Robot.c,358 :: 		}
L_main22:
	MOVF       _Etat+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _Etat+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main39
	MOVF       _Etat+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main42
	MOVF       _Etat+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main45
	MOVF       _Etat+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main48
	MOVF       _Etat+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main49
	MOVF       _Etat+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main51
	MOVF       _Etat+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main53
	MOVF       _Etat+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main63
	MOVF       _Etat+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main78
L_main23:
;Robot.c,362 :: 		};
	GOTO       L_main6
;Robot.c,366 :: 		}
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

;Robot.c,368 :: 		void interrupt (void) {
;Robot.c,370 :: 		if(INTCON.INTF){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt87
;Robot.c,371 :: 		Flag = 3;
	MOVLW      3
	MOVWF      _Flag+0
;Robot.c,373 :: 		INTCON.INTF = 0;   //REST
	BCF        INTCON+0, 1
;Robot.c,374 :: 		}
L_interrupt87:
;Robot.c,376 :: 		if (INTCON.RBIF){
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt88
;Robot.c,378 :: 		if (PORTB.RB4){
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt89
;Robot.c,379 :: 		Flag = 1;
	MOVLW      1
	MOVWF      _Flag+0
;Robot.c,381 :: 		}
L_interrupt89:
;Robot.c,382 :: 		if (PORTB.RB5){
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt90
;Robot.c,383 :: 		Flag = 3;
	MOVLW      3
	MOVWF      _Flag+0
;Robot.c,385 :: 		}
L_interrupt90:
;Robot.c,386 :: 		if (PORTB.RB6){
	BTFSS      PORTB+0, 6
	GOTO       L_interrupt91
;Robot.c,387 :: 		Flag = 3;
	MOVLW      3
	MOVWF      _Flag+0
;Robot.c,389 :: 		}
L_interrupt91:
;Robot.c,390 :: 		if (PORTB.RB7){
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt92
;Robot.c,391 :: 		Flag = 2;
	MOVLW      2
	MOVWF      _Flag+0
;Robot.c,393 :: 		}
L_interrupt92:
;Robot.c,394 :: 		INTCON.RBIF  = 0; //REST INTERRUPT
	BCF        INTCON+0, 0
;Robot.c,395 :: 		}
L_interrupt88:
;Robot.c,397 :: 		}
L_end_interrupt:
L__interrupt96:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
