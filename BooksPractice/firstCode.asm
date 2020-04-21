org    100h 
 
mov    ax, 5          ; set ax to 5.  
mov    bx, 2          ; set bx to 2.  
 
jmp    calc           ; go to 'calc'.  
 
back:  jmp stop       ; go to 'stop'.  
 
calc: 
add    ax, bx         ; add bx to ax.  
jmp    back           ; go 'back'.  
 
stop: 
 
ret                   ; return to operating system.



