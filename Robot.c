#include "EEPROM.h"
#include "Sensor.h"
#include "Motors.h"
#include "LCD.h"

unsigned short x = 0;


void main() {
 // INIT
 LCD_Init_P();
 SENSOR_Init();
 MOTORS_Init();
do{



}while(1);

}