;MASM PROGRAM TO ADD TWO MATRICES

assume cs:code, ds:data

data segment
		mat1    db    23h,24h,55h,11h
		mat2    db    21h,44h,57h,22h
		row1    db    02h
		col1    db    02h
		row2    db    02h
		col2    db    02h
		len     db    00h
		resi    dw    ?						;Stores result of mat addition
data ends


code segment
		
		org 0100h

start:		mov ax, data
		mov ds, ax

		mov al, row1						;Comparing two row count
		mov bl, row2
		cmp al, bl
		jne break

		mov al, col1						;Comparing two column count
		mov bl, col2
		cmp al, bl
		jne break

		mov si, offset mat1 
		mov di, offset mat2 
		mov al, row1
		mov bl, col1
		mul bl							;Finding no. of elements in matrix row X col
		mov len, al
		mov cl, len
		mov ch, 00h
		mov ax, 0000h

looper:		mov al, [si]						;Pushing each element-wise difference into stack
		mov ah, 00h
		mov bl, [di]
		mov bh, 00h
		sub ax, bx
		push ax
		inc si
		inc di
		dec cx
		jz  prewrk
		jmp looper

prewrk:		mov si, offset resi + 0001h
		mov cl, len
		mov ch, 00h
		add si, cx
		add si, cx

retloop:	pop ax							;Popping each element from stack into resultant array
		mov [si], al
		dec si
		mov [si], ah
		dec si
		dec cx
		jz break
		jmp retloop

break:		mov ah, 4ch
		int 21h

code ends

end start


;This code can also be done by using [dx] register as offset for resi.
;mov dx, offset resi + 0001h
;And just move stuff in looper itself.
;This code uses stack.