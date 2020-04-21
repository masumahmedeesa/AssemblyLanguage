# TOUR DE ASSEMBLY LANGUAGE

AX_ACCUMULATOR REGISTER,BX_BASE ADDRESS REGISTER,CX_COUNTER REGISTER,DX_DATA REGISTER,SI_SOURCE INDEX REG, DI_DESTINATION INDEX REG
SP_STACK POINTER,BP_BASE POINTER=ALL 8 ARE GENERAL PURPOSES

CS_containing the current program,SS,ES,DS=ALL 4 ARE SEGMENT REGISTER
the address formed with 2 registers is called an effective address.  

CS_IP
SS_SP,BP
DS_SI,DI
ES

to access memory we can use these four registers: BX, SI, DI, BP

d8 - stays for 8 bit signed immediate displacement

d16 - stays for 16 bit signed immediate displacement

When DS contains value 1234h and SI contains the value 7890h it can be also recorded as 1234:7890. The physical address will be 1234h * 10h + 7890h = 19BD0h. 

```javascript
MOV AX, 0B800h ; set AX to hexadecimal value of B800h.
MOV DS, AX ; copy value of AX to DS.
MOV CL, 'A' ; set CL to ASCII code of 'A', it is 41h.
MOV CH, 1101_1111b ; DIDN'T UNDERSTAND
MOV BX, 15Eh ; set BX to 15Eh.
MOV CX,1345H
MOV [BX], CX 
MOV DX,[BX]
MOV AL,'H'
RET
MOV AH,'E'
RET ; returns to operating system.
```
                                       
MOV instruction is used to copy values from source to destination.                                       

MOV AX,1234H
MOV BX,0ABCDH 
                                     
MOV [1234H],AX

MOV CX,[1234H]     

When compiler makes machine code, it automatically replaces all variable names with their offsets
SUCH AS
MOV AL, var1 SHOWS THAT MOV AL,[0108H]
          
In memory list first row is an offset
second row is a hexadecimal value
third row is decimal value
and last row is an ASCII character value.
         
         
MACHINE CODE

```javascript
ORG 100h ; just a directive to make a simple .com file (expands into no code).
DB 0A0h
DB 08h ; DECIMAL IS 008
DB 01h ;DECIMAL IS 001 
```
MOV AL(DB 0A0H),0108H(01H PLUS 08H)
ACTUALLY 07 WILL BE STORED IN AL..MOST PROBABLY MINUS VALUE IS STORED IN AL

DB 8Bh;DECIMAL 139,REFERS TO BX MAYBE
DB 1Eh;DECIMAL 030,REFERS TO MOV OPERATIONS
DB 09h;DECIMAL 009,ADDRESS OF VALUE
DB 01h;DECIMAL 001,ADDRESS OF VALUE
MOV BX,[0109H].ABOVE CODE REFERS MEMORY ADDRESS OF [0109H] WILL BE STORED IN BX

IP:0000,SP:FFFE....AT FIRST
DB 0C3h; RET
DB 7;POP ES
THEN AFTER THESE ABOVE COMMANDS
IP:FF00,SP:0000....AT LAST

DB 34h
DB 12h
XOR AL,012H

I DIDN'T UNDERSTAND THIS PORTION WELL. IT'S TRUE



TO DECLARE A ARRAY

a DB 48h, 65h, 6Ch, 6Ch, 6Fh, 00h 
b DB 'Hello', 0

EMO8086 SHOWS THIS:
unknown opcode skipped: 65
not 8086 instruction - not supported yet.



ORG 100h
MOV AL, VAR1 ; check value of VAR1 by moving it to AL.
LEA BX, VAR1 ; get address of VAR1 in BX.Actually address stored as variable in BH and BL. That's all

MOV BYTE PTR [BX], 44h ; modify the contents of VAR1.This byte ptr[BX] refers address of BX. When MOV is called,then
new variable 44h will be stored in BX address. LEA is Load Effective Address

MOV AL, VAR1 ; check value of VAR1 by moving it to AL.To ensure, this command will work.
RET
VAR1 DB 22h ;IT IS SAME AS BELOW(LIKEWISE OFFSET) GIVE 18 DIFFERENT IP.
END                                                               

```javascript
ORG 100h
MOV AL, VAR1 ; check value of VAR1 by moving it to AL.
MOV BX, OFFSET VAR1 ; get address of VAR1 in BX.LEA and OFFSET work as same.
MOV BYTE PTR [BX], 44h ; modify the contents of VAR1.
MOV AL, VAR1 ; check value of VAR1 by moving it to AL. 
MOV SI, OFFSET VAR1 ;00116H STORED AS MEMORY ADDRESS IN SI.
MOV DI,OFFSET VAR1 ;00116H STORED AS MEMORY ADDRESS IN DI.
MOV BP,OFFSET VAR1 ;00116H STORED AS MEMORY ADDRESS IN BP.
```

BECAUSE THEY ARE ALL OFFSET.BX,SI,DI,BP
RET
VAR1 DB 22h

WE USE THIS DB, IT WILL GIVE SO MANY INSTRUCTION POINTERS.
SUCH AS:FIRST IP IS 0004, THEN SECOND ONE IS 0005,THEN..0006,0007,0008,0009,000A,000B,000C,000D,000E,000F,0010,0011,0012,0013,0014,0015.WHERE IT IS HALTED.

END                 


To define constants EQU directive is used
K EQU 010
MOV AX,K  
IT WORKS


hexadecimal numbers should have "h" suffix, binary "b" suffix, octal "o" suffix, decimal numbers require no suffix.
STRING REQUIRES THIS: 'HELLOWORLD',0
  
To view arrays you should click on a variable and set Elements property to array size.

To make a software interrupt there is an INT instruction, it has very simple syntax:
INT value

WHERE VALUE CAN BE A NUMBER BETWEEN 0 TO 255. BUT GENERALLY HEXADECIMAL IS MOSTLY USED.
To specify a sub-function AH register should be set before calling interrupt.
Each interrupt may have up to 256 sub-functions (so we get 256 * 256 = 65536 functions).
In general AH register is used, but sometimes other registers maybe in use.
Generally other registers are used to pass parameters and data to sub-function.


MOV AH,0EH
IT WILL STORE 0E IN AH

```javascript
MOV AL, 'H' ; ASCII code: 72
INT 10h ; print it!
MOV AL, 'e' ; ASCII code: 101
INT 10h ; print it!
MOV AL, 'l' ; ASCII code: 108
INT 10h ; print it!
MOV AL, 'l' ; ASCII code: 108
INT 10h ; print it!
MOV AL, 'o' ; ASCII code: 111
INT 10h ; print it!
MOV AL, '!' ; ASCII code: 33
INT 10h ; print it!
RET ; returns to operating system.
```

SHOWS
set_VIDEO_MODE: unsupported video mode:  48h
set_VIDEO_MODE: unsupported video mode:  65h
set_VIDEO_MODE: unsupported video mode:  6Ch
set_VIDEO_MODE: unsupported video mode:  6Ch
set_VIDEO_MODE: unsupported video mode:  6Fh  




use of include 'emu8086.inc'

emu8086.inc defines the following macros:
1.PUTC CHAR_macro with 1 parameter, prints out an ASCII char at current cursor position.
2.GOTOXY COL,ROW_macro with 2 parameters, sets cursor position.
3.PRINT string - macro with 1 parameter, prints out a string.
4.PRINTN string - macro with 1 parameter, prints out a string.
5.CURSOROFF - turns off the text cursor.
6.CURSORON - turns on the text cursor.


#THIS IS GOOD INCLUDE AND HELPS MANY THINGS TO DO EASILY

include emu8086.inc
ORG 100h
PRINT 'Hello World!'; PRINT HELLO WORLD
GOTOXY 10, 5 ;SET THE CURSOR POSITION
PUTC 65 ; 65 - is an ASCII code for 'A' AND PRINT A
PUTC 'B'; PRINT CHARACTER 'B'
RET ; return to operating system.
END ; directive to stop the compiler.


THIS INCLUDE 'EMU8086.INC' ALSO DEFINES SOME OTHERS PREOCEDURES.

SUCH AS

include emu8086.inc
ORG 100h
CALL PTHIS 
db 'Hello World!', 0 
RET
DEFINE_PTHIS
END

PROGRAM HAS RETURNED CONTROL
TO THE OPERATING SYSTEM

OTHERS;
1.GET_STRING
2.CLEAR_SCREEN
3.SCAN_NUM
4.PRINT_NUM
5.PRINT_NUM_UNS

HERE IS EXAMPLE

include 'emu8086.inc'
ORG 100h
LEA SI, msg1 ; ask for the number, 'ENTER YOUR NUMBER:'
CALL print_string ;IT WILL PRINT 'ENTER YOUR NUMBER:'
CALL scan_num ; get number in CX.YOU HAVE TO GIVE NUMBER
MOV AX, CX ; copy the number to AX.
 print the following string:
CALL pthis
DB 13, 10, 'YOU HAVE ENTERED: ', 0 ;PRINT STRING
CALL print_num ; print number in AX.
RET ; return to operating system.
msg1 DB 'ENTER YOUR NUMBER: ', 0
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS ; required for print_num.
DEFINE_PTHIS
END ; directive to stop the compiler.

PROGRAM HAS RETURNED CONTROL
TO THE OPERATING SYSTEM

ANOTHER THINGS ARE: YOU MUST HAVE TO PROVIDE INCLUDE,RET,DEFINE,END



Arithmetic and logic instructions

There are 16 bits in this register, each bit is called a flag and can take a value of 1 or 0.
1.CARRY FLAG(CF)
2.ZERO FLAG(ZF)
3.Sign Flag (SF)
4.Overflow Flag (OF)
5.Parity Flag (PF)
6.Auxiliary Flag (AF)
7.Interrupt enable Flag (IF)
8.Direction Flag (DF)
REST OF THEM IS NONE,UNUSEABLE FLAGS

These types of operands are supported:
REG,MEMORY
REG,REG
MEMORY,REG
MEMORY,IMMEDIATE
REG,IMMEDIATE

SOME VALIDS:

AX/BX/CX/DX/DI/SI/BP/SP, [BX]/[BX+SI+7]/ETC

[BX]/[BX+SI+7]/ETC,AX/BX/CX/DX/DI/SI/BP/SP      

AX/BX/CX/DX/DI/SI/BP/SP,AX/BX/CX/DX/DI/SI/BP/SP 

[BX]/[BX+SI+7]/ETC,5/-24/3FH/100011001B/ETC     

AX/BX/CX/DX/DI/SI/BP/SP,5/-24/3FH/100011001B/ETC 



SOME THINGS
ADD - add second operand to first.
SUB - Subtract second operand to first.
CMP - Subtract second operand from first for flags only.
AND - Logical AND between all bits of two operands.
                                                    
                                                    
                                                    
                                                    
Second group: MUL, IMUL, DIV, IDIV

REG
MEMORY

VALIDS

AX/BX/CX/DX/DI/SI/BP/SP
[BX]/[BX+SI+7]/ETC

IMPORTANT THINGS:
MUL and IMUL instructions affect these flags only: CF, OF


 
 
 
 
Third group: INC, DEC, NOT, NEG
SAME AS ABOVE
IMPORTANT THINGS:
INC, DEC instructions affect these flags only: ZF, SF, OF, PF, AF.
NOT instruction does not affect any flags!
NEG instruction affects these flags only: CF, ZF, SF, OF, PF, AF.


### JUMP
Program flow control: 
	A program control instruction changes address value in the PC and hence the normal flow of execution. 
	Change in PC causes a break in the execution of instructions. 
	It is an important feature of the computers since it provides.

Program using the different instructions:-
	 Conditional and Unconditional Jump Instructions
	• Compare Instruction
	• Loop Instruction

Unconditional Jump Instruction: JMP
	
	In conditional jump, status conditions at the time of jump instruction execution Decide whether or not the jump will occur.

	The JMP instruction is the only unconditional flow control instruction.
	It unconditionally transfers control to another point in the program.
	The location to be transferred to is known as the target address.
	
	such as:
	 In its simplest form, the JMP statement is similar to the GOTO statement in high level languages.

	GOTO statement 	=	JMP statement

	It has the following syntax:	
	JMP [operator] destination



	The basic syntax of JMP instruction:
	JMP label/destination name

	JMP 1234H; IP will take the value 1234H 
	JMP BX ; IP will take the value in BX 
	JMP [BX]; IP will take the value in memory location pointed to by BX


 Short Conditional Jump Instructoin:

 	To konw from how many bytes, the linker has to use a long jump (instead a short one), we must know what is the maximal move of a short jump.

	Instruction's size is always 2 bytes (in 16 or 32 bits program) and $bytes_count is stored on one byte (8 bits).
	$bytes_count is a signed number, then we have the sign bit and the 7 other bits are used for the value.

	Logic and arithmetic instructions set flags.
	Flags provide state information from previous instruction(s).
	Using flags we can perform conditional jumping, i.e., transfer program execution to some different place within the program

		if condition was true
			- jump back or forward in your code to the location specified
			- instruction pointer(IP) gets updated(to point to the instruction to which execution will jump)
		if condition was flase
			- continue execution at the following instruction
			- IP gets incremented as usual
	Limit range to within +127 and -128 bytes from the location following the conditional jump.
	Example:
		- JB, JC jump to a label if the Carry flag is set
		- JE, JZ jump to a label if the Zero flag is set
		- JS jumps to a label if the Sign flag is set
		- JNE, JNZ jump to a label if the Zero flag is clear

Loops:

	loop instructions are used to simplify the decrementing, testing and branching portion of the loop. In the above case this portion required two instructions, but in more complicated situation may require more than two instructions.
	The loop instruction for 8086 all have the form:
	OPCODE  D8
	where D8 is byte displacement from current IP. 
	The loop instruction is simplified to: With loop instruction the format for branch become:
	MOV CX, N Begin: -- -- LOOP Begin 

	 The LOOP instruction is mainly used to simulate the different loops in HLL. The Loop instructions use the CX register to indicate the loop count.

	The syntax of the Loop instruction is:

	LOOP label

	The Loop instruction decrements CX without changing any flags
	If CX is not zero after the decrement, control is transferred to the destination label
	The jump is a SHORT jump only

	All conditional jumps have one big limitation, unlike JMP instruction they can only jump 127 bytes forward and 128 bytes backward (note that 
	most instructions are assembled into 3 or more bytes).  
 
	We can easily avoid this limitation using a cute trick: 
		1.Get an opposite conditional jump instruction from the table above, make it jump to label_x (can be any valid label name, but there must not be two or more labels with the same name) .  
		2.Use JMP instruction to jump to desired location.  
		3.Define label_x: just after the JMP instruction.                                                    


