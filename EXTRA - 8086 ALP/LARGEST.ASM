; Program to find the largest number in 10 numbers

assume cs:code, ds:data

data segment
		array	db	0Bh, 0Dh, 03h, 0Ah, 0Bh, 23h, 47h, 7Fh, 18h, 43h
		len		db	09h
		org		0010h
		largest	db	?
data ends

code segment
		org 0100h
start:
		mov ax, data
		mov ds, ax

		mov si, offset array	; Pointer to parse
		mov cl, len				; length of the array

		mov bx, 0000h			; index of largest element

looper:
		mov al, [si]
		cmp al, [bx]
		jc here
		mov bx, si
here:
		inc si
		dec cl
		jnz looper

		mov largest, bl
		mov ah, 4ch
		int 21h

code ends
end start