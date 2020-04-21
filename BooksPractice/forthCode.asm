include "emu8086.inc" 
 
org    100h 
 
mov    al, 5 
mov    bl, 5 
 
cmp    al, bl     ; compare al - bl.  
 
 
; je equal        ; there is only 1 byte  
 
 
 
jne    not_equal  ; jump if al <> bl (zf = 0).  
jmp    equal 
not_equal: 
 
 
add    bl, al 
sub    al, 10 
xor    al, bl 
 
jmp skip_data 
db 256 dup(0)     ; 256 bytes  
skip_data: 
 
 
putc   'n'        ; if it gets here, then al <> bl,  
jmp    stop       ; so print 'n', and jump to stop.  
 
equal:            ; if gets here,  
putc   'y'        ; then al = bl, so print 'y'.  
 
stop: 
 
ret 



