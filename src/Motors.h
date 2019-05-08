#ifndef MOTORS_H_INCLUDED
#define MOTORS_H_INCLUDED



// MOTORS

#define RMT1 PORTC.RC0


void MOTORS_Init();
void MOTORS_Left(unsigned short);
void MOTORS_Right(unsigned short);
void MOTORS_Mill_Around();
void MOTORS_Stop();
void MOTROS_Start(unsigned short);




#endif