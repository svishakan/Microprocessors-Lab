;ALP TO PERFORM INVERTED BLOCK TRANSFER OF 10 BYTES OF DATA

assume ds:data,cs:code,es:extra

data segment
	src db 01h,10h,20h,30h,40h,50h,60h,70h,80h,90h
	count dw 000Ah
data ends

extra segment
	dest db ?
extra ends

code segment
	org 0100h

start:
	mov ax, data
	mov ds, ax
	mov ax, extra
	mov es, ax
	mov cx, count		;Counter for LOOP call
	mov si, offset src
	mov di, offset dest
	add si, 09h		;To start from reverse

loop1:
	std			;Sets the direction flag, data goes backward
	lodsb			;Load to AX from data segment (AL <- DS[SI]) & decrements SI offset because DF = 1
	cld			;Clear the direction flag, data goes forward
	stosb			;Store from AX to extra segment (AL -> ES[DI]) & increments DI offset becaue DF = 0
	loop loop1		;Loop till CX = 0

	mov ah,4ch
	int 21h

code ends
end start