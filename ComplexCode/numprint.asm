
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

include 'emu8086.inc'
org 100h


CALL scan_num

MOV AX,CX 
PRINTN ""

MOV AX,1


SUM:
CALL PRINT_NUM
INC AX
ADD AX,AX
PRINTN ""
LOOP SUM




ret

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS

END




