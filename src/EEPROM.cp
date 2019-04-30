#line 1 "C:/Users/Bsm/Desktop/TODD/src/EEPROM.c"
#line 1 "c:/users/bsm/desktop/todd/src/eeprom.h"





unsigned short CONFIG_Read();
void CONFIG_Write(unsigned short);
#line 4 "C:/Users/Bsm/Desktop/TODD/src/EEPROM.c"
unsigned short CONFIG_Read()
{
 return EEPROM_Read( 0x00 );
}


void CONFIG_Write(unsigned short C)
{
 EEPROM_Write( 0x00 ,C);
}
