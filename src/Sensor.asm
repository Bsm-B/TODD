
_SENSOR_Init:

;Sensor.c,4 :: 		void SENSOR_Init()
;Sensor.c,6 :: 		INTCON = 0b10011000; //  RB0 & RB4-7 interruption
	MOVLW      152
	MOVWF      INTCON+0
;Sensor.c,7 :: 		OPTION_REG.INTEDG = 1;  // Falling Edge
	BSF        OPTION_REG+0, 6
;Sensor.c,9 :: 		TRISA = 0xFF;    // TRISA AS INPUT
	MOVLW      255
	MOVWF      TRISA+0
;Sensor.c,10 :: 		TRISB = 0xFF;    // TRISB AS INPUT
	MOVLW      255
	MOVWF      TRISB+0
;Sensor.c,11 :: 		TRISC.RC0 = 0;
	BCF        TRISC+0, 0
;Sensor.c,12 :: 		TRISC.RC3 = 1;
	BSF        TRISC+0, 3
;Sensor.c,13 :: 		TRISC.RC4 = 1;
	BSF        TRISC+0, 4
;Sensor.c,14 :: 		TRISC.RC5 = 1;
	BSF        TRISC+0, 5
;Sensor.c,15 :: 		ADCON1 = 0x00;   //TRISA AS ANALOG
	CLRF       ADCON1+0
;Sensor.c,16 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Sensor.c,18 :: 		}
L_end_SENSOR_Init:
	RETURN
; end of _SENSOR_Init

_SENSOR_R1:

;Sensor.c,20 :: 		float SENSOR_R1(){
;Sensor.c,21 :: 		return ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
;Sensor.c,22 :: 		}
L_end_SENSOR_R1:
	RETURN
; end of _SENSOR_R1

_SENSOR_R2:

;Sensor.c,23 :: 		float SENSOR_R2(){
;Sensor.c,24 :: 		return ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
;Sensor.c,25 :: 		}
L_end_SENSOR_R2:
	RETURN
; end of _SENSOR_R2

_SENSOR_R3:

;Sensor.c,26 :: 		float SENSOR_R3(){
;Sensor.c,27 :: 		return ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
;Sensor.c,28 :: 		}
L_end_SENSOR_R3:
	RETURN
; end of _SENSOR_R3
