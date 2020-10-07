;MASM PROGRAM TO ADD TWO BCD NUMBERS

assume cs:code,ds:data

data segment
	num1	db	26h
	num2	db	99h
        res	db	?
        carry	db	?
data ends

code segment

	org     0100h

start:	mov	ax, data	
	mov	ds, ax
	mov	al, num1
        mov	bl, num2
	mov	cl, 00h
	add	al, bl
	daa			;Converts AL's value from HEX to BCD
	jnc	resume
	inc	cl
resume:	mov	res, al
        mov	carry, cl       
	mov     ah, 4ch
	int     21h

code ends

end start

;Carry can also be obtained without JNC instruction using:
;mov	al, 00h		;Clear AL
;adc	al, al		;If carry produced it'll be added to AL (AL = 0)