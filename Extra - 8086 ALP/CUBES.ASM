;ALP TO FIND CUBES OF NUMBERS FROM 0 - 9

assume cs:code,ds:data
 
data segment
   num db  09h
   org 0100h		;XX00 => XX  = 01
   ans dw  ?
data ends
 
code segment
   org 0100h

start:
  mov ax, data
  mov ds, ax
 
  mov cl, 00h
  mov ch, num
 
  mov si, offset ans

looper:
  mov al, cl
  mov bl, cl
  mul bl ;square
  mul bl ;cube
 
  mov [si], ah		;store the cube value
  inc si
  mov [si], al
  inc si
  
  cmp cl, ch		;check if count is 9
  jz  exit
 
  inc cl
  jmp looper		;continue looping

exit:
  mov ah, 4ch
  int 21h
 
code ends
end start
