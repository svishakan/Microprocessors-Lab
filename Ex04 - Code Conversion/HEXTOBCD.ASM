;MASM PROGRAM TO CONVERT A GIVEN HEXADECIMAL BYTE TO ITS BCD EQUIVALENT

assume cs:code,ds:data

data segment
		hex	db	0FFh
		bcd	dw	?
data ends

code segment

		org     0100h

start:		mov     ax, data
		mov     ds, ax
		mov     al, hex
		mov	ah, 00h
		mov     bl, 64h	
		div     bl			;divide by 100
		mov	cl, al			;MSB - (3rd bit) of BCD
		mov	al, ah			;use the remainder of the division as the next dividend
		mov	ah, 00h
		mov	bl, 0Ah
		div 	bl			;divide by 10 
		mov	ch, al			;2nd bit of BCD
		mov	dl, ah			;LSB - (1st bit of BCD)
		mov	bl, 10h			;MSB * 10
		mov	al, cl
		mul	bl
		add	al, ch			;MSB + 2nd bit
		mul	bl			;MSB * 100 (and consequentially 2nd bit * 10)
		add	al, dl			;MSB * 100 + 2nd bit * 10 + LSB
		mov	bcd, ax			;Resulting BCD value
		mov     ah, 4ch
		int     21h

code ends

end start