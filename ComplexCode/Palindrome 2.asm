
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

INCLUDE 'EMU8086.INC'

MOV DX,1234H        ;Set buffer size
LEA DI,BUFFER       ;Set buffer offset
CALL GET_STRING
MOV SI, DI          ;Store input from DI to SI


MOV CX,0
LP1: 
    PUSH DI
    INC DI
    INC CX  
    CMP [DS+DI], 000
    JNE LP1
    
PRINTN ""     
    
MOV DI, SI
LP2:            
    POP SI
    PUTC [DS+SI]
    PUTC "-"
    PUTC [DS+DI] 
    PRINTN "" 
    MOV BL, [DS+SI]
    MOV BH, [DS+DI]
    CMP BL, BH 
    JNE NO
    INC DI
LOOP LP2
         
YES:
   LEA SI, MSGYES
   CALL PRINT_STRING
   JMP RT
NO:
   LEA SI, MSGNO
   CALL PRINT_STRING
  
RT:
   RET
        
MSGYES DB "PALINDROME",0
MSGNO DB "NOT PALINDROME",0
BUFFER DB 20 DUP(0) 

DEFINE_GET_STRING
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM   
DEFINE_PRINT_NUM_UNS

END


