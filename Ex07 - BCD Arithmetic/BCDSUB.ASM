;MASM PROGRAM TO SUBTRACT TWO BCD NUMBERS

assume cs:code,ds:data

data segment
	num1	db	15h
	num2	db	35h
	diff	db	?
	sign	db	?
data ends

code segment

	org     0100h

start:	mov	ax, data
	mov	ds, ax
	mov	al, num1
	mov	bl, num2
	sub	al, bl
	das			;Difference in AL is decimal adjusted (HEX to BCD)
	mov	diff, al
	jnc	break		;If no borrow produced, end the program
	mov	sign, 01h	;Sign of the difference
	mov	al, 99h         
	mov	bl, diff        
	sub	al, bl		;Taking 9's complement of BCD value
	mov	bl, 01h		;Adding 1 to get 10's complement of BCD value
	add	al, bl
	daa			;Addition result in AL is decimal adjusted again (HEX to BCD)
	mov	diff, al
break:	mov	ah, 4ch
	int	21h

code ends

end start