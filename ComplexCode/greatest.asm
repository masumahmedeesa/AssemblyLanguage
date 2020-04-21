
include 'emu8086.inc'


org 100h

CALL SCAN_NUM
MOV AX, CX
PRINTN  ""

CALL SCAN_NUM
MOV BX,CX
PRINTN ""

CALL SCAN_NUM
PRINTN ""

;MOV AX,20H
;MOV BX,22H
;MOV CX,23H

CMP AX,BX
JGE first

CMP BX,CX
JGE second

MOV AX,CX
CALL PRINT_NUM
PRINT " is big"
JMP stop

second:

JMP SECONDPRINT


first:
CMP AX,CX
JMP first1

MOV AX,CX
CALL PRINT_NUM
PRINT " is big"
JMP stop

first1:
JMP FIRSTPRINT

 
 
SECONDPRINT:
MOV AX,BX
CALL PRINT_NUM
PRINT " is big"
JMP stop
 
 
 
FIRSTPRINT:
MOV AX,AX
CALL PRINT_NUM
PRINT " is big"
JMP stop

stop:
ret  

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_NUM

END




