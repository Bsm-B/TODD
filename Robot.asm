
_main:

;Robot.c,9 :: 		void main() {
;Robot.c,11 :: 		LCD_Init_P();
	CALL       _LCD_Init_P+0
;Robot.c,12 :: 		SENSOR_Init();
	CALL       _SENSOR_Init+0
;Robot.c,13 :: 		MOTORS_Init();
	CALL       _MOTORS_Init+0
;Robot.c,14 :: 		do{
L_main0:
;Robot.c,18 :: 		}while(1);
	GOTO       L_main0
;Robot.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
