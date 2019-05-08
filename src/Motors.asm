
_MOTROS_Start:

;Motors.c,4 :: 		void MOTROS_Start(unsigned short v)
;Motors.c,6 :: 		PWM1_Set_Duty(v);
	MOVF       FARG_MOTROS_Start_v+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,7 :: 		PWM2_Set_Duty(v);
	MOVF       FARG_MOTROS_Start_v+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,8 :: 		}
L_end_MOTROS_Start:
	RETURN
; end of _MOTROS_Start

_MOTORS_Left:

;Motors.c,11 :: 		void MOTORS_Left(unsigned short v){
;Motors.c,12 :: 		PWM1_Set_Duty(v);;
	MOVF       FARG_MOTORS_Left_v+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,13 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,14 :: 		}
L_end_MOTORS_Left:
	RETURN
; end of _MOTORS_Left

_MOTORS_Right:

;Motors.c,16 :: 		void MOTORS_Right(unsigned short v){
;Motors.c,17 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,18 :: 		PWM2_Set_Duty(v);
	MOVF       FARG_MOTORS_Right_v+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,19 :: 		}
L_end_MOTORS_Right:
	RETURN
; end of _MOTORS_Right

_MOTORS_Stop:

;Motors.c,21 :: 		void MOTORS_Stop(){
;Motors.c,22 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,23 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,24 :: 		RMT1 = 0;
	BCF        PORTC+0, 0
;Motors.c,26 :: 		}
L_end_MOTORS_Stop:
	RETURN
; end of _MOTORS_Stop

_MOTORS_Mill_Around:

;Motors.c,29 :: 		void MOTORS_Mill_Around(){
;Motors.c,31 :: 		MOTORS_Stop();
	CALL       _MOTORS_Stop+0
;Motors.c,32 :: 		PWM1_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motors.c,33 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Motors.c,34 :: 		RMT1 = 1;
	BSF        PORTC+0, 0
;Motors.c,35 :: 		Delay_ms(800);
	MOVLW      17
	MOVWF      R11+0
	MOVLW      60
	MOVWF      R12+0
	MOVLW      203
	MOVWF      R13+0
L_MOTORS_Mill_Around0:
	DECFSZ     R13+0, 1
	GOTO       L_MOTORS_Mill_Around0
	DECFSZ     R12+0, 1
	GOTO       L_MOTORS_Mill_Around0
	DECFSZ     R11+0, 1
	GOTO       L_MOTORS_Mill_Around0
;Motors.c,36 :: 		MOTORS_Stop();
	CALL       _MOTORS_Stop+0
;Motors.c,37 :: 		}
L_end_MOTORS_Mill_Around:
	RETURN
; end of _MOTORS_Mill_Around

_MOTORS_Init:

;Motors.c,40 :: 		void MOTORS_Init(){
;Motors.c,42 :: 		PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Motors.c,43 :: 		PWM2_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Motors.c,44 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;Motors.c,45 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;Motors.c,46 :: 		MOTORS_Stop();
	CALL       _MOTORS_Stop+0
;Motors.c,47 :: 		}
L_end_MOTORS_Init:
	RETURN
; end of _MOTORS_Init
