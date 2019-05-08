#include "EEPROM.h"
#include "Sensor.h"
#include "Motors.h"
#include "LCD.h"


float          IR1,IR2,IR3;
unsigned short Speed     = 0;
unsigned short Direction = 0;
unsigned short Sd        = 0;
unsigned short Etat      = 0;
unsigned short CSD       = 1;
unsigned short Flag       = 0;
char TXT1[5];
char TXT2[5];

char CONFIG[]  = "*CONF*";
char CONFID[]  = "*DIRCT CONF*";
char CONFIS[]  = "*SPEED CONF*";
char OptionC[] = " SPEED    DIRCT";
char OptionS[] = "MIN   MOY   MAX";
char OptionD[] = "LEFT     RIGHT";
char Tag[]= ">";
char Vid[]= " ";
char Done[]= "OK";
 char uart_rd;




void main() {
 // INIT
 MOTORS_Init();
 LCD_Init_P();
 SENSOR_Init();
   
   UART1_Init(9600);
///Load Data
  Speed = SPEED_Read();
  Direction = DIRECTION_Read();
  
  
  UART1_Write_Text("Start");
  UART1_Write(10);
  UART1_Write(13);


       //  CONFIG
         if (Direction == 1)
       {
           strcpy(TXT1,"LEFT");   // LEFT

       }else{
           strcpy(TXT1,"RIGHT");  // RIGHT
       }

       if (Speed == 1)
       {
          strcpy(TXT2,"MIN");
          Sd = 80;
          
       }else if (Speed == 2){

          strcpy(TXT2,"MOY");
          Sd = 160;

       }else{
           strcpy(TXT2,"MAX");
           Sd = 255;
       }

      while(1){
        IR1 =  SENSOR_R1();
        IR2 =  SENSOR_R2();
        IR3 =  SENSOR_R3();

      uart_rd = UART1_Read();
      switch(uart_rd)
      {
      case '1':
        EEPROM_WRITE(DIRECTION,1);
      break;
       case '2':
        EEPROM_WRITE(DIRECTION,2);
      break;
       case '3':
        EEPROM_WRITE(SPEED,1);
      break;
      case '4':
        EEPROM_WRITE(SPEED,2);
      break;
      case '5':
        EEPROM_WRITE(SPEED,3);
      break;
      
      }
      
        switch(Flag)
        {
            case 1:
            
            Motors_Right(sd);
            Delay_ms(800);
            Etat = 0;
            Flag = 0;
            break;
            
            case 2:

            Motors_Left(sd);
            Delay_ms(800);
            Etat = 0;
            Flag = 0;
            break;
            

            case 3:

            Etat = 4;
            Flag = 0;
            break;
        
        }
        
        switch (Etat) {

            case 0:     // ETAT 0  // INIT
                               
             MOTROS_Start(sd);

             LCD_Out(1,1,TXT1);
             LCD_Out(2,1,TXT2);

            
             if ( IR1 > 600 ){
             
                if ((IR2 < 512) && (IR3 < 512)) Etat = 3;
                else if  (IR3 < 512) Etat = 2;
                else if  (IR2 < 512) Etat = 1;
                else  Etat = 4;
                
                LCD_Cmd(_LCD_CLEAR);
              }
              
              
              else if ( IR2 > 900){     //  SKIP LEFT
                  
                   Etat = 5;
                   LCD_Cmd(_LCD_CLEAR);
              }

              else if (IR3 > 900){     // SKIP RIGHT
              
                   Etat = 6;
                   LCD_Cmd(_LCD_CLEAR);
              
              }
              if (CG == 1){
              
                 // MENU CONFIG  
                 MOTORS_Stop();
                  Etat = 7;
                  LCD_Cmd(_LCD_CLEAR);
              
              }



             break;
             
             case 1:   // ETAT 1   //LEFT
             LCD_Out(1,1,"OBST L");
                if ( IR1 > 600 ) {
                    MOTORS_Left(sd);

                }else{
                    Etat = 0;
                    LCD_Cmd(_LCD_CLEAR);
                }

             break;
             
             case 2: // ETAT 2  //RIGHT
                 LCD_Out(1,1,"OBST R");
              if ( IR1 > 600 ) {
                 MOTORS_Right(sd);

              }else{
                 Etat = 0;
                 LCD_Cmd(_LCD_CLEAR);
              }
              
              break;
              
              case 3:  // ETAT 3  //SELECT BY USER
              
              if (Direction  == 1) Etat = 2;  //LEFT
              else Etat = 1;          //RIGHT

              break;
              
              
              case 4:  // ETAT 4 # RETURN ARROUND
              LCD_out(1,6,"AR");
              MOTORS_Mill_Around();
              Etat = 0;
              LCD_Cmd(_LCD_CLEAR);

              break;
              
              
              case 5:    // ETAT 5 #SKIP LEFT
                     LCD_Out(1,1,"SL");
                    MOTORS_Left(sd);
                    if (IR2 < 700){
                     Etat = 0;
                     LCD_Cmd(_LCD_CLEAR);
                    }

              break;
              
              
              
              case 6:   // ETAT 6 #SKIP RIGHT
                   LCD_Out(1,1,"SR");
                    MOTORS_Right(sd);
                    if (IR3 < 700){
                     Etat = 0;
                     LCD_Cmd(_LCD_CLEAR);
                    }
              
              break;
              
              // ******** CONFIG  ******** //
              
              case 7:
              
               Lcd_Out(1,1,CONFIG);
               Lcd_Out(2,2,OptionC);
               
               if (SL){
                 CSD = 1;
                 Delay_ms(200);
                }
                
               if (SR) {
                CSD = 2;
                Delay_ms(200);
               }

               if (CSD == 1) {
               
                  Lcd_Out(2,1,Tag);
                  Lcd_Out(2,10,Vid);
                  
                }else{
                
                   Lcd_Out(2,10,Tag);
                   Lcd_Out(2,1,Vid);
                   
                }

                if (OK){
                
                    if(CSD == 1) Etat = 8;
                    else Etat = 9;
                    LCD_Cmd(_LCD_CLEAR);
                    
                }

              
              break;
              
              case 8:


                  Lcd_Out(2,2,OptionS);
                  if (Speed == 1 ){
                  Lcd_Out(2,1,Tag);
                  Lcd_Out(2,6,Vid);
                  Lcd_Out(2,11,Vid);
                  if (SR){
                  Speed = 2;
                  Delay_ms(300);
                  }

                  }else if (Speed == 2){
                 Lcd_Out(2,1,Vid);
                 Lcd_Out(2,7,Tag);
                  Lcd_Out(2,13,Vid);
                  if (SL) {
                  Speed = 1;
                  Delay_ms(300); }

                  if (SR){
                  Speed = 3;
                  Delay_ms(300);
                  }
                  }else{

                  Lcd_Out(2,1,Vid);
                 Lcd_Out(2,6,Vid);
                 Lcd_Out(2,12,Tag);
                  if (SL == 1) {
                  Speed = 2;
                  Delay_ms(300); }
                  }

                  if (CG){
                  LCD_Cmd(_LCD_CLEAR);
                Lcd_Out(1,8,Done);
                EEPROM_WRITE(SPEED,Speed);
                  Delay_ms(1000);
                  Etat = 0;
                  LCD_Cmd(_LCD_CLEAR);
                  }



              break;
              
              case 9:

               Lcd_Out(2,2,OptionD);
               if (SL) {
               Direction = 1;
               Delay_ms(300); }
               if (SR) {
               Direction = 2;
               Delay_ms(300);
               }

               if (Direction == 1) {
               Lcd_Out(2,1,Tag);
               Lcd_Out(2,10,Vid);
               }else{
               Lcd_Out(2,10,Tag);
               Lcd_Out(2,1,Vid);
               }

               if (CG){
               LCD_Cmd(_LCD_CLEAR);
               Lcd_Out(1,8,Done);
               EEPROM_WRITE(DIRECTION,Direction);
               Delay_ms(1000);
               Etat = 0;
               LCD_Cmd(_LCD_CLEAR);
                }

              break;
              
              //*************

              
              
             
       
        }



    };



}

  void interrupt (void) {

   if(INTCON.INTF){
         Flag = 3;
            //INFRA
        INTCON.INTF = 0;   //REST
    }

   if (INTCON.RBIF){

     if (PORTB.RB4){
           Flag = 1;
          // BUM1
     }
     if (PORTB.RB5){
         Flag = 3;
            // BUM2
     }
     if (PORTB.RB6){
          Flag = 3;
            // BUM3
     }
     if (PORTB.RB7){
          Flag = 2;
             // BUM4
     }
     INTCON.RBIF  = 0; //REST INTERRUPT
   }

 }

