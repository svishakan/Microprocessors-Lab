;MASM PROGRAM TO CONVERT A GIVEN BCD BYTE TO ITS HEXADECIMAL EQUIVALENT

assume cs:code,ds:data

data segment
		bcd	db	026h
		hex	db	?
data ends

code segment

		org     0100h

start:		mov     ax, data
		mov     ds, ax
		mov     al, bcd
		mov	ah, 00h
		mov     bl, 10h		
		div     bl		;Divide by 16
		mov     bl, 0Ah		
		mov     dl, ah		;Store remainder of division, (LSB)
		mov     ah, 00h
		mul     bl		;Multiply MSB by 10
		add     al, dl		;Add LSB
		mov     hex, al		;Store addition as hex value
		mov     ah, 4ch
		int     21h

code ends

end start