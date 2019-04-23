#include "EEPROM.h"


unsigned short CONFIG_Read()
{
  return EEPROM_Read(CONFIG);
}


void CONFIG_Write(unsigned short C)
{
  EEPROM_Write(CONFIG,C);
}
