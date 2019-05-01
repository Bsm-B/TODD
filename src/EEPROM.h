#ifndef EEPROM_H_INCLUDED
#define EEPROM_H_INCLUDED

#define SPEED 0x0010   // CONST Memory Adress
#define DIRECTION 0x0040  // CONST Memory Adress

unsigned short SPEED_Read(); // EPPROM :  Read Speed
unsigned short DIRECTION_Read();  // EPPROM :  Read Direction

#endif