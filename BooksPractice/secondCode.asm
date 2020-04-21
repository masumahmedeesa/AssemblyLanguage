include "emu8086.inc"

org 100h

mov al, 25  ;set al to 25.
mov bl, 10  ;set bl to 10.

cmp al, bl  ;compare al-bl.

je equal    ;jump if al=bl(zf=1).

putc 'n'    ;if it gets here, then al<>bl,
jmp stop    ;so print 'n', and jump to stop.

equal:      ;if gets here,
putc 'y'    ;then al=bl, so print 'y'.

stop:

ret         ;gets here no matter what.



