;MASM PROGRAM TO ADD 2 8-BIT NUMBERS

assume cs:code,ds:data

data segment 
	opr1	db	11h
	opr2	db	99h
	result	db	00H
	carry	db	00H      
data ends

code segment
		
		org 0100h

start:  mov ax,data
        mov ds,ax
        mov ah,opr1
        mov bh,opr2
        mov ch,00h
        add ah,bh
        jnc here
        inc ch
here:   mov result,ah
        mov carry,ch
        mov ah,4ch
        int 21h
		
code ends

end start
