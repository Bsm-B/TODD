
_SENSOR_Init:

;Sensor.c,5 :: 		void SENSOR_Init()
;Sensor.c,7 :: 		INTCON = 0b10011000; // RB interruption
	MOVLW      152
	MOVWF      INTCON+0
;Sensor.c,8 :: 		OPTION_REG.INTEDG = 1;  // Falling Edge
	BSF        OPTION_REG+0, 6
;Sensor.c,9 :: 		ADCON1 = 0x02;   //ONLY A0;A1,A2 As Analog
	MOVLW      2
	MOVWF      ADCON1+0
;Sensor.c,10 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Sensor.c,11 :: 		}
L_end_SENSOR_Init:
	RETURN
; end of _SENSOR_Init

_SENSOR_R1:

;Sensor.c,13 :: 		float SENSOR_R1(){
;Sensor.c,14 :: 		return ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
;Sensor.c,15 :: 		}
L_end_SENSOR_R1:
	RETURN
; end of _SENSOR_R1

_SENSOR_R2:

;Sensor.c,16 :: 		float SENSOR_R2(){
;Sensor.c,17 :: 		return ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
;Sensor.c,18 :: 		}
L_end_SENSOR_R2:
	RETURN
; end of _SENSOR_R2

_SENSOR_R3:

;Sensor.c,19 :: 		float SENSOR_R3(){
;Sensor.c,20 :: 		return ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
;Sensor.c,21 :: 		}
L_end_SENSOR_R3:
	RETURN
; end of _SENSOR_R3

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Sensor.c,22 :: 		void interrupt (void) {
;Sensor.c,24 :: 		if(INTCON.INTF){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;Sensor.c,26 :: 		INT_NUM = 5;    //INFRA
	MOVLW      5
	MOVWF      _INT_NUM+0
;Sensor.c,27 :: 		INTCON.INTF = 0;   //REST
	BCF        INTCON+0, 1
;Sensor.c,28 :: 		}
L_interrupt0:
;Sensor.c,30 :: 		if (INTCON.RBIF){
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt1
;Sensor.c,32 :: 		if (PORTB.RB4){
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt2
;Sensor.c,33 :: 		INT_NUM = 1;     // BUM1
	MOVLW      1
	MOVWF      _INT_NUM+0
;Sensor.c,34 :: 		}
L_interrupt2:
;Sensor.c,35 :: 		if (PORTB.RB5){
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt3
;Sensor.c,36 :: 		INT_NUM = 2;      // BUM2
	MOVLW      2
	MOVWF      _INT_NUM+0
;Sensor.c,37 :: 		}
L_interrupt3:
;Sensor.c,38 :: 		if (PORTB.RB6){
	BTFSS      PORTB+0, 6
	GOTO       L_interrupt4
;Sensor.c,39 :: 		INT_NUM = 3;       // BUM3
	MOVLW      3
	MOVWF      _INT_NUM+0
;Sensor.c,40 :: 		}
L_interrupt4:
;Sensor.c,41 :: 		if (PORTB.RB7){
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt5
;Sensor.c,42 :: 		INT_NUM = 4;         // BUM4
	MOVLW      4
	MOVWF      _INT_NUM+0
;Sensor.c,43 :: 		}
L_interrupt5:
;Sensor.c,44 :: 		INTCON.RBIF  = 0; //REST INTERRUPT
	BCF        INTCON+0, 0
;Sensor.c,45 :: 		}
L_interrupt1:
;Sensor.c,49 :: 		}
L_end_interrupt:
L__interrupt11:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

Sensor____?ag:

L_end_Sensor___?ag:
	RETURN
; end of Sensor____?ag
