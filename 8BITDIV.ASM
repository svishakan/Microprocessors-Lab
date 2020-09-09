;MASM PROGRAM TO DIVIDE A 16-BIT NUMBER BY AN 8-BIT NUMBER

assume cs:code,ds:data

data segment
	opr1	dw	0010H
	opr2	db	08H
	quot	db	00H
	rem     db	00H
data ends

code segment
	org 0100H
       
start:	mov ax, data
	mov ds, ax
	mov ax, opr1
	mov bl, opr2
	div bl
	mov quot, al
	mov rem, ah
	mov ah, 4ch
	int 21h
	
code ends

end start
