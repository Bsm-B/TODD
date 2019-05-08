#include "EEPROM.h"

unsigned short SPEED_Read(){

         return EEPROM_Read(SPEED);
}
unsigned short DIRECTION_Read(){

         return EEPROM_Read(DIRECTION);
}