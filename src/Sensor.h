#ifndef SENSOR_H_INCLUDED
#define SENSOR_H_INCLUDED

// CLIFF SENSOR

#define CLF1 PORTB.RB4
#define CLF2 PORTB.RB5
#define CLF3 PORTB.RB6
#define CLF4 PORTB.RB7

// IR SENSOR

#define IRD PORTB.RB0

// CONFIG BUTTONS
#define OK PORTB.RB1
#define CG PORTC.RC3
#define SL PORTC.RC4
#define SR PORTC.RC5



void  SENSOR_Init();
float SENSOR_R1();
float SENSOR_R2();
float SENSOR_R3();

#endif