;SUBTRACT 2 32-BIT NUMBERS
;[opd12 opd11] - [opd22 opd21] = [ans2 ans1] 

assume cs:code, ds:data

data segment
	opd11	dw 0FFFFh
	opd12	dw 02323h
	opd21	dw 02323h
	opd22	dw 0FFFFh
	ans1	dw 0000h
	ans2	dw 0000h
	borrow	db 00h
data ends

code segment
	org 0100h
start:
	mov ax, data
	mov ds, ax
	
	mov ax, opd11
	mov bx, opd12
	mov dl, 00h

	sub ax, opd21	;SUB OPD11 - OPD21
	sbb bx, opd22	;SUB OPD21 - OPD22 - CF
	jnc part3

	neg ax			;Take complement of the whole answer
	neg bx
	dec bx			;To fix complement being one value extra
	inc dl		

part3:
	mov ans1, ax
	mov ans2, bx
	mov borrow, dl

exit:
	mov ah, 4ch
	int 21h

code ends
end start 
	
	
