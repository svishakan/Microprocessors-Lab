;MASM PROGRAM TO MULTIPLY 2 8-BIT NUMBERS

assume cs:code,ds:data

data segment
	opr1	db	10H
	opr2	db	10H
	product	dw	0000H     
data ends

code segment
	org 0100H
	
start:	mov ax, data
	mov ds, ax
	mov al, opr1
	mov bl, opr2
	mul bl
	mov product, ax
	mov ah, 4ch
	int 21h
	
code ends

end start
