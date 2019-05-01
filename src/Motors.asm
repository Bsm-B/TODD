
_MOTOR_Aspirator:

;Motors.c,5 :: 		void MOTOR_Aspirator(unsigned short F){
;Motors.c,6 :: 		if (F == 1){
	MOVF       FARG_MOTOR_Aspirator_F+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_MOTOR_Aspirator0
;Motors.c,7 :: 		PORTD.RD6 = 1;
	BSF        PORTD+0, 6
;Motors.c,8 :: 		}else{
	GOTO       L_MOTOR_Aspirator1
L_MOTOR_Aspirator0:
;Motors.c,9 :: 		PORTD.RD6 = 0;
	BCF        PORTD+0, 6
;Motors.c,10 :: 		}
L_MOTOR_Aspirator1:
;Motors.c,11 :: 		}
L_end_MOTOR_Aspirator:
	RETURN
; end of _MOTOR_Aspirator

_MOTOR_Blades:

;Motors.c,13 :: 		void MOTOR_Blades(unsigned short F){
;Motors.c,14 :: 		if (F == 1){
	MOVF       FARG_MOTOR_Blades_F+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_MOTOR_Blades2
;Motors.c,15 :: 		PORTD.RD7 = 1;
	BSF        PORTD+0, 7
;Motors.c,16 :: 		}else{
	GOTO       L_MOTOR_Blades3
L_MOTOR_Blades2:
;Motors.c,17 :: 		PORTD.RD7 = 0;
	BCF        PORTD+0, 7
;Motors.c,18 :: 		}
L_MOTOR_Blades3:
;Motors.c,19 :: 		}
L_end_MOTOR_Blades:
	RETURN
; end of _MOTOR_Blades

_MOTROS_Start:

;Motors.c,21 :: 		void MOTROS_Start(unsigned short v)
;Motors.c,23 :: 		PWM1_Set_Duty(v);
	MOVF       FARG_MOTROS_Start_v+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,24 :: 		PWM2_Set_Duty(v);
	MOVF       FARG_MOTROS_Start_v+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,25 :: 		}
L_end_MOTROS_Start:
	RETURN
; end of _MOTROS_Start

_MOTORS_Left:

;Motors.c,28 :: 		void MOTORS_Left(unsigned short v){
;Motors.c,29 :: 		PWM1_Set_Duty(v);;
	MOVF       FARG_MOTORS_Left_v+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,30 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,31 :: 		}
L_end_MOTORS_Left:
	RETURN
; end of _MOTORS_Left

_MOTORS_Right:

;Motors.c,33 :: 		void MOTORS_Right(unsigned short v){
;Motors.c,34 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,35 :: 		PWM2_Set_Duty(v);
	MOVF       FARG_MOTORS_Right_v+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,36 :: 		}
L_end_MOTORS_Right:
	RETURN
; end of _MOTORS_Right

_MOTORS_Stop:

;Motors.c,38 :: 		void MOTORS_Stop(){
;Motors.c,39 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,40 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,41 :: 		PORTC.RC3 = 0;
	BCF        PORTC+0, 3
;Motors.c,42 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;Motors.c,43 :: 		}
L_end_MOTORS_Stop:
	RETURN
; end of _MOTORS_Stop

_MOTORS_Mill_Around:

;Motors.c,46 :: 		void MOTORS_Mill_Around(){
;Motors.c,48 :: 		MOTORS_Stop();
	CALL       _MOTORS_Stop+0
;Motors.c,50 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,51 :: 		PWM2_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,52 :: 		PORTC.RC3 = 0;
	BCF        PORTC+0, 3
;Motors.c,53 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;Motors.c,54 :: 		Delay_ms(800);
	MOVLW      17
	MOVWF      R11+0
	MOVLW      60
	MOVWF      R12+0
	MOVLW      203
	MOVWF      R13+0
L_MOTORS_Mill_Around4:
	DECFSZ     R13+0, 1
	GOTO       L_MOTORS_Mill_Around4
	DECFSZ     R12+0, 1
	GOTO       L_MOTORS_Mill_Around4
	DECFSZ     R11+0, 1
	GOTO       L_MOTORS_Mill_Around4
;Motors.c,55 :: 		MOTORS_Stop();
	CALL       _MOTORS_Stop+0
;Motors.c,56 :: 		}
L_end_MOTORS_Mill_Around:
	RETURN
; end of _MOTORS_Mill_Around

_MOTORS_Init:

;Motors.c,59 :: 		void MOTORS_Init(){
;Motors.c,60 :: 		TRISC = 0x00; // TRIC C AS OUTPUT
	CLRF       TRISC+0
;Motors.c,61 :: 		TRISD.RD6 = 0; // PIN D6 AS OUTPUT
	BCF        TRISD+0, 6
;Motors.c,62 :: 		TRISD.RD7 = 0; // PIN D7 As OUTPUT
	BCF        TRISD+0, 7
;Motors.c,63 :: 		PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Motors.c,64 :: 		PWM2_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Motors.c,65 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;Motors.c,66 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;Motors.c,67 :: 		MOTOR_Blades(0);
	CLRF       FARG_MOTOR_Blades_F+0
	CALL       _MOTOR_Blades+0
;Motors.c,68 :: 		MOTOR_Aspirator(0);
	CLRF       FARG_MOTOR_Aspirator_F+0
	CALL       _MOTOR_Aspirator+0
;Motors.c,69 :: 		MOTORS_Stop();
	CALL       _MOTORS_Stop+0
;Motors.c,71 :: 		}
L_end_MOTORS_Init:
	RETURN
; end of _MOTORS_Init
