
_CONFIG_Read:

;EEPROM.c,4 :: 		unsigned short CONFIG_Read()
;EEPROM.c,6 :: 		return EEPROM_Read(CONFIG);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;EEPROM.c,7 :: 		}
L_end_CONFIG_Read:
	RETURN
; end of _CONFIG_Read

_CONFIG_Write:

;EEPROM.c,10 :: 		void CONFIG_Write(unsigned short C)
;EEPROM.c,12 :: 		EEPROM_Write(CONFIG,C);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       FARG_CONFIG_Write_C+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;EEPROM.c,13 :: 		}
L_end_CONFIG_Write:
	RETURN
; end of _CONFIG_Write
