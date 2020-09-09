;MASM PROGRAM TO DIVIDE A 16-BIT NUMBER BY A 16-BIT NUMBER

assume cs:code,ds:data

data segment
    	opr1	dw	1000H
    	opr2	dw	0900H
    	quot	dw	0000H
    	rem	dw	0000H
data ends

code segment

        org 0100H

start:  mov ax, data
        mov ds, ax
        mov ax, opr1
        mov bx, opr2
        mov dx, quot
        div bx
        mov quot, ax
        mov rem, dx
        mov ah, 4ch
        int 21h

code ends

end start
