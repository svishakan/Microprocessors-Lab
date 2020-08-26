;MASM PROGRAM TO SUBTRACT 2 16-BIT NUMBERS

assume cs:code,ds:data

data segment 
        opr1	dw	7777h
        opr2	dw	9999h
        diff	dw	0000h
        sign	db	00h
data ends

code segment
	
        org 0100h

start:  mov ax, data
        mov ds, ax
        mov ax, opr1
        mov bx, opr2
        mov ch, 00h
        sub ax, bx
        jnc here
        neg ax
        inc ch
        
here:   mov diff, ax
        mov sign, ch
        mov ah, 4ch
        int 21h
        
code ends

end start
