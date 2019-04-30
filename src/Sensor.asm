
_SENSOR_Init:

;Sensor.c,5 :: 		void SENSOR_Init()
;Sensor.c,7 :: 		TRISB = 0xFF; // TRISB INPUT
	MOVLW      255
	MOVWF      TRISB+0
;Sensor.c,8 :: 		INTCON = 0b10001000; // RB interruption
	MOVLW      136
	MOVWF      INTCON+0
;Sensor.c,9 :: 		OPTION_REG.INTEDG = 1;  // Falling Edge
	BSF        OPTION_REG+0, 6
;Sensor.c,11 :: 		ADCON1 = 0x02;   //ONLY A0;A1,A2 As Analog
	MOVLW      2
	MOVWF      ADCON1+0
;Sensor.c,12 :: 		}
L_end_SENSOR_Init:
	RETURN
; end of _SENSOR_Init

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Sensor.c,14 :: 		void interrupt (void) {
;Sensor.c,16 :: 		if (INTCON.RBIF){
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt0
;Sensor.c,17 :: 		if (PORTB.RB4){
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt1
;Sensor.c,18 :: 		INT_NUM = 1;
	MOVLW      1
	MOVWF      _INT_NUM+0
;Sensor.c,19 :: 		}
L_interrupt1:
;Sensor.c,20 :: 		if (PORTB.RB5){
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt2
;Sensor.c,21 :: 		INT_NUM = 2;
	MOVLW      2
	MOVWF      _INT_NUM+0
;Sensor.c,22 :: 		}
L_interrupt2:
;Sensor.c,23 :: 		if (PORTB.RB6){
	BTFSS      PORTB+0, 6
	GOTO       L_interrupt3
;Sensor.c,24 :: 		INT_NUM = 3;
	MOVLW      3
	MOVWF      _INT_NUM+0
;Sensor.c,25 :: 		}
L_interrupt3:
;Sensor.c,26 :: 		if (PORTB.RB7){
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt4
;Sensor.c,27 :: 		INT_NUM = 4;
	MOVLW      4
	MOVWF      _INT_NUM+0
;Sensor.c,28 :: 		}
L_interrupt4:
;Sensor.c,29 :: 		}
L_interrupt0:
;Sensor.c,31 :: 		INTCON.RBIF  = 0; //REST INTERRUPT
	BCF        INTCON+0, 0
;Sensor.c,33 :: 		}
L_end_interrupt:
L__interrupt7:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_SENSOR_Read:

;Sensor.c,35 :: 		void SENSOR_Read(unsigned short * IR_val)
;Sensor.c,37 :: 		IR_val[0] = ADC_READ(0);
	MOVF       FARG_SENSOR_Read_IR_val+0, 0
	MOVWF      FLOC__SENSOR_Read+0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       FLOC__SENSOR_Read+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Sensor.c,38 :: 		IR_val[1] = ADC_READ(1);
	INCF       FARG_SENSOR_Read_IR_val+0, 0
	MOVWF      FLOC__SENSOR_Read+0
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       FLOC__SENSOR_Read+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Sensor.c,39 :: 		IR_val[2] = ADC_READ(2);
	MOVLW      2
	ADDWF      FARG_SENSOR_Read_IR_val+0, 0
	MOVWF      FLOC__SENSOR_Read+0
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       FLOC__SENSOR_Read+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Sensor.c,40 :: 		}
L_end_SENSOR_Read:
	RETURN
; end of _SENSOR_Read

Sensor____?ag:

L_end_Sensor___?ag:
	RETURN
; end of Sensor____?ag
