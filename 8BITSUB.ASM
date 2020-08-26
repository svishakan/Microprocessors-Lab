;MASM PROGRAM TO SUBTRACT 2 8-BIT NUMBERS

assume cs:code,ds:data

data segment 
	opr1	db	99h
	opr2	db	77h
	diff	db	00h
	sign	db	00h
data ends

code segment

        org 0100h

start:  mov ax, data
        mov ds, ax
        mov ah, opr1
        mov bh, opr2
	mov ch, 00h
        sub ah, bh
        jnc here
        neg ah
        inc ch
here:   mov diff, ah
        mov sign, ch
        mov ah, 4ch
        int 21h

code ends

end start
