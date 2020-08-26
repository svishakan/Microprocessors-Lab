;MASM PROGRAM TO MULTIPLY 2 16-BIT NUMBERS

assume cs:code,ds:data

data segment
  opr1      dw  1000H
  opr2      dw  1000H
  product1  dw  0000H     
  product2  dw  0000H
data ends

code segment
  
        org 0100H

start:  mov ax, data
        mov ds, ax
        mov ax, opr1
        mov bx, opr2
        mul bx
        mov product1, ax
        mov product2, dx
        mov ah, 4ch
        int 21h
	
code ends

end start
