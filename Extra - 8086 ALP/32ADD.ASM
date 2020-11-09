;ADD 2 32-BIT NUMBERS
;[opr12 opr11] - [opr22 opr21] = [ans2 ans1] 
 
assume cs:code, ds:data
 
data segment
		opr11	dw	0FFFFh
		opr12	dw	0FFFFh
		opr21	dw	0FFFFh
		opr22	dw	0FFFFh
		org 	0010h
		carry	db	?
		res1	dw	?
		res2	dw	?
data ends
 
code segment
		org 0100h
start:
		mov ax, data
		mov ds, ax
 
		mov cl, 00h
		mov ax, opr11
		mov bx, opr12
 
		add ax, opr21
		adc bx, opr22
		jnc here
		inc cl
here:	
		mov res1, ax
		mov res2, bx
		mov carry, cl
 
		mov ah, 4Ch
		int 21h
 
code ends
end start
