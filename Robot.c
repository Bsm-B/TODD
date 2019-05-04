#include "EEPROM.h"
#include "Sensor.h"
#include "Motors.h"
#include "LCD.h"

float          IR1,IR2,IR3;
unsigned short Speed     = 0;
unsigned short Direction = 0;
unsigned short Sd        = 0;
unsigned short Dn        = 0;
unsigned short Etat      = 0;
unsigned char *TXT1[5];
unsigned char *TXT2[3];


void main() {
 // INIT
 MOTORS_Init();
 LCD_Init_P();
 SENSOR_Init();

///Load Data
  Speed = SPEED_Read();
  Direction = DIRECTION_Read();
       //  CONFIG
         if (Direction == 0)
       {
           strcpy(TXT1,"LEFT");
           Dn = 1;  // LEFT
       }else{
           strcpy(TXT1,"RIGHT");
           Dn = 2; // RIGHT
       }

       if (Speed == 0)
       {
          strcpy(TXT2,"MIN");
          Sd = 80;
          
       }else if (Speed == 1){

          strcpy(TXT2,"MOY");
          Sd = 160;

       }else{
           strcpy(TXT2,"MAX");
           Sd = 255;
       }
       MOTOR_Aspirator(1);
       MOTOR_Blades(1);
       // BOUCLE
       for(;;){
        IR1 =  SENSOR_R1();
        IR2 =  SENSOR_R2();
        IR3 =  SENSOR_R3();
        switch (Etat) {

            case 0:     // ETAT 0  // INIT
                               
             MOTROS_Start(sd);
             LCD_Out(1,1,"SPEED :");
             LCD_Out(1,8,TXT1);
             LCD_Out(2,1,"DIRCT :");
             LCD_Out(2,8,TXT2);
            
             if ( IR1 > 600 ){
             
                if ((IR2 < 512) && (IR3 < 512)) Etat = 3;
                else if  (IR3 < 512) Etat = 2;
                else if  (IR2 < 512) Etat = 1;
                else  Etat = 4;
                
                LCD_Cmd(_LCD_CLEAR);
              }
              
              
              else if ( IR2 > 900){     // LEFT
                  
                   Etat = 5;
                   LCD_Cmd(_LCD_CLEAR);
              }

              else if (IR3 > 900){     // RIGHT
              
                   Etat = 6;
                   LCD_Cmd(_LCD_CLEAR);
              
              }
              if (PORTE.RE0)      // CONFIG MODE
                    Etat = 7;

             break;
             
             case 1:   // ETAT 1   //LEFT
                
                if ( IR1 > 600 ) {
                    MOTORS_Left(sd);
                    LCD_Out(1,1,"Obstacle R");
                    Led = ~ Led;
                }else{
                    Etat = 0;
                    LCD_Cmd(_LCD_CLEAR);
                }

             break;
             
             case 2: // ETAT 2  //RIGHT
             
              if ( IR1 > 600 ) {
                 MOTORS_Right(sd);
                 LCD_Out(1,1,"Obstacle L");
                 Led = ~ Led;
              }else{
                 Etat = 0;
                 LCD_Cmd(_LCD_CLEAR);
              }
              
              break;
              
              case 3:  // ETAT 3  //SELECT BY USER
              
              if (Dn  == 1) Etat = 1;  //LEFT
              else Etat = 2;          //RIGHT

              break;
              
              
              case 4:  // ETAT 4 # RETURN ARROUND
              
              LCD_Out(1,1,"Around");
              MOTORS_Mill_Around();
              Etat = 0;
              LCD_Cmd(_LCD_CLEAR);
              
              break;
              
              
              case 5:    // ETAT 5 #SKIP LEFT
              
                    MOTORS_Left(sd);
                    LCD_Out(1,1,"Skip L");
                    if (IR2 < 512){
                     Etat = 0;
                     LCD_Cmd(_LCD_CLEAR);
                    }

              break;
              
              
              
              case 6:   // ETAT 6 #SKIP RIGHT
                    MOTORS_Right(sd);
                    LCD_Out(1,1,"Skip R");
                    if (IR3 < 512){
                     Etat = 0;
                     LCD_Cmd(_LCD_CLEAR);
                    }
              
              break;
             
       
        }


    };



}