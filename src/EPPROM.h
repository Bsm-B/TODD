#ifndef EEPROM_H_INCLUDED
#define EEPROM_H_INCLUDED

#define CONFIG 0x00   // CONST Memory Adress

unsigned short CONFIG_Read(); // EPPROM :  Read Configuration
void CONFIG_Write(unsigned short); //  EPPROM :  Write Configuration




#endif
