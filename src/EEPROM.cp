#line 1 "C:/Users/Bsm/Desktop/TODD/src/EEPROM.c"
#line 1 "c:/users/bsm/desktop/todd/src/eeprom.h"






unsigned short SPEED_Read();
unsigned short DIRECTION_Read();
#line 3 "C:/Users/Bsm/Desktop/TODD/src/EEPROM.c"
unsigned short SPEED_Read(){

 return EEPROM_Read( 0x0010 );
}
unsigned short DIRECTION_Read(){

 return EEPROM_Read( 0x0020 );
}
