; related: tinyurl.com/tocxol
;
; numbers limited to size
; of one word
; 
; will be replaced with BCD (later tm)
;
;
org 100h   
;              
; SAY Fibonacci(20)$ 
mov dx, offset msg1
call say
; SAY $
mov dx, offset msg2
call say  
; SET x 0
mov x, 0
; SET y 1
mov y, 1
; SET n 0
mov n, 0 
; SAV 1
sav1:  
; OUT y
mov ax,y
call printax 
; SAY $
mov dx, offset msg2
call say
; SET z y
mov di, offset z
mov bp, offset y
mov dl, [bp]
mov [di],dl
inc di
inc bp    
mov dl,[bp]
mov [di],dl
; INC y x
mov ax,y
mov bx,x
add ax,bx
mov y,ax
; SET x z
mov ax,z
mov x,ax
; JLE n 100 1
inc n
cmp n,20
jle sav1 
ret
;
;
; dummy array used by printax
ptr db 6 dup('$')
;
;
; generated from a first pass over
; the code, catches all SET <a> <...>
; statements and initialises a      
msg1 db "Fibonacci(20)",13,10,'$'
msg2 db 13,10,'$'                                  
x dw 0
y dw 0
n dw 0
z dw 0
;
;
; helper routines which will be
; replaced inline later on
say:
  mov ah, 9h
  int 21h       
  ret
printax:                 
  lea di, ptr
  add di, 4 
  mov bx, 10   
  contprint:
  mov dx, 0
  div bx
  mov [di],dl
  add [di],48
  dec di
  cmp ax, 0
  je exit
  jmp contprint
  exit:  
  mov ah, 9
  mov dx, di
  inc dx
  int 21h
  ret

