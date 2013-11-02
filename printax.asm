; fasm
; tested on emu8086
; 11/2/2013
org 100h
; please have mercy ;)
main:
   mov ax, 65535
   call printax
   ret
; declares an array
; string len < 6 (16bits)
ptr db 6 dup('$')
; printax routine
printax:                 
; di points to end of the array
; string generated in reverse
lea di, ptr
add di, 4 
; divison by 10 extracts digits
mov bx, 10   
contprint:
; dx:ax should hold dividend, reset dx
mov dx, 0
div bx
mov [di],dl
; make ascii for printing later
add [di],48
dec di
cmp ax, 0
je exit
jmp contprint
exit:  
; print the string
mov ah, 9
mov dx, di
inc dx
int 21h
ret