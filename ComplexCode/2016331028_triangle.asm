INCLUDE "EMU8086.INC"
org 100h

CALL SCAN_NUM
PRINTN ""

;MOV CX,5
MOV BX,0

L1:
    PUSH CX
    INC BX
    MOV CX,BX
    L2:
        MOV DL,42
        MOV AH,2
        INT 21H
        LOOP L2
    PRINTN ""    
    POP CX
    LOOP L1
                  
         

ret

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END


