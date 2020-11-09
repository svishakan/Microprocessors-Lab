;ALP TO PRINT N FIBONACCI NUMBERS & THEIR SUM

assume cs:code,ds:data
 
data segment
	num db 07h  		;No. of Fibonacci numbers reqd.
	org 0010h
	sum db ?			;Store the sum
	ans db ?			;Store the series
data ends
 
code segment
	org 0100h
 
start: 
	mov ax, data
	mov ds, ax
	mov sum, 00h
	mov si, offset ans
	mov al, 00h 		;Initialise Fibonacci Series
	mov bl, 01h
	add num, 01h
	mov cl, num
 
	cmp cl, 00h 		;If num = 0
	jz exit
 
	mov [si], 00h
	mov dl, sum 		;Add current value to sum
	add dl, [si]
	mov sum, dl
	inc si
	dec cl

	cmp cl, 00h 		;Exit if count is over
	jz exit
 
	mov [si], 01h   	;Next number of the series
	mov dl, sum
	mov dl, [si]
	add sum, dl			;Add current value to sum
	inc si
	dec cl
 
loop1:
	cmp cl, 00h 		;Exit if the count is over
	jz exit
 
	add al, bl
	xchg al, bl 		;Put the next number in BL
 
	mov [si], bl
	mov dl, sum 		;Add the number to the sum
	add dl, [si]
	mov sum, dl 		;Put it back to the sum variable
 
	inc si
	dec cl
	jmp loop1   		;Continue with the next iteration

exit:
	mov ah, 4ch
	int 21h
 
code ends
end start
