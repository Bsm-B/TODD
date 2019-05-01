
_SPEED_Read:

;EEPROM.c,7 :: 		unsigned short SPEED_Read(){
;EEPROM.c,9 :: 		return EEPROM_Read(SPEED);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;EEPROM.c,10 :: 		}
L_end_SPEED_Read:
	RETURN
; end of _SPEED_Read

_DIRECTION_Read:

;EEPROM.c,11 :: 		unsigned short DIRECTION_Read(){
;EEPROM.c,13 :: 		return EEPROM_Read(DIRECTION);
	MOVLW      64
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;EEPROM.c,14 :: 		}
L_end_DIRECTION_Read:
	RETURN
; end of _DIRECTION_Read
