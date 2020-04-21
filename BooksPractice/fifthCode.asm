
org    100h 
 
; unconditional jump forward:  ; skip over next 3 bytes + itself   
; the machine code of short jmp instruction takes 2 bytes.   
jmp $3+2 
a db 3    ; 1 byte.  
b db 4    ; 1 byte.  
c db 4    ; 1 byte.  
 
; conditional jump back 5 bytes:  
mov bl,9 
dec bl      ; 2 bytes.  
cmp bl, 0   ; 3 bytes.  
jne $-5     ; jump 5 bytes back  
 
ret 



