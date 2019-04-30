
_MOTOR_Aspirator:

;Motors.c,5 :: 		void MOTOR_Aspirator(unsigned short F){
;Motors.c,6 :: 		if (F){
	MOVF       FARG_MOTOR_Aspirator_F+0, 0
	BTFSC      STATUS+0, 2
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

;Motors.c,14 :: 		void MOTOR_Blades(unsigned short F){
;Motors.c,15 :: 		if (F){
	MOVF       FARG_MOTOR_Blades_F+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_MOTOR_Blades2
;Motors.c,16 :: 		PORTD.RD7 = 1;
	BSF        PORTD+0, 7
;Motors.c,17 :: 		}else{
	GOTO       L_MOTOR_Blades3
L_MOTOR_Blades2:
;Motors.c,18 :: 		PORTD.RD7 = 0;
	BCF        PORTD+0, 7
;Motors.c,19 :: 		}
L_MOTOR_Blades3:
;Motors.c,20 :: 		}
L_end_MOTOR_Blades:
	RETURN
; end of _MOTOR_Blades

_MOTORS_Back:

;Motors.c,23 :: 		void MOTORS_Back()
;Motors.c,25 :: 		PORTD.RC1 = 0;
	BCF        PORTD+0, 1
;Motors.c,26 :: 		PORTD.RC2 = 0;
	BCF        PORTD+0, 2
;Motors.c,27 :: 		PORTD.RC3 = 1;
	BSF        PORTD+0, 3
;Motors.c,28 :: 		PORTD.RC4 = 1;
	BSF        PORTD+0, 4
;Motors.c,29 :: 		}
L_end_MOTORS_Back:
	RETURN
; end of _MOTORS_Back

_MOTORS_Left:

;Motors.c,32 :: 		void MOTORS_Left(){
;Motors.c,33 :: 		PORTD.RC1 = 0;
	BCF        PORTD+0, 1
;Motors.c,34 :: 		PORTD.RC2 = 1;
	BSF        PORTD+0, 2
;Motors.c,35 :: 		}
L_end_MOTORS_Left:
	RETURN
; end of _MOTORS_Left

_MOTORS_Right:

;Motors.c,36 :: 		void MOTORS_Right(){
;Motors.c,37 :: 		PORTD.RC1 = 1;
	BSF        PORTD+0, 1
;Motors.c,38 :: 		PORTD.RC2 = 0;
	BCF        PORTD+0, 2
;Motors.c,39 :: 		}
L_end_MOTORS_Right:
	RETURN
; end of _MOTORS_Right

_MOTORS_Init:

;Motors.c,43 :: 		void MOTORS_Init(){
;Motors.c,44 :: 		TRISC = 0x00; // TRIC C AS OUTPUT
	CLRF       TRISC+0
;Motors.c,45 :: 		TRISD.RD6 = 0; // PIN D6 AS OUTPUT
	BCF        TRISD+0, 6
;Motors.c,46 :: 		TRISD.RD7 = 0; // PIN D7 As OUTPUT
	BCF        TRISD+0, 7
;Motors.c,47 :: 		PORTD.RD6 = 0;  // INIT PIN D6 =  0
	BCF        PORTD+0, 6
;Motors.c,48 :: 		PORTD.RD7 = 0; // INIT PIN D7 = 0
	BCF        PORTD+0, 7
;Motors.c,49 :: 		PORTC = 0; // INIT MOTORS  =  0
	CLRF       PORTC+0
;Motors.c,52 :: 		}
L_end_MOTORS_Init:
	RETURN
; end of _MOTORS_Init
