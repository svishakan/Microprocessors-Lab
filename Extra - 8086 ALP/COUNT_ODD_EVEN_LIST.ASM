;8086 ALP TO FIND THE NUMBER OF ODD NUMBERS AND EVEN NUMBERS IN A LIST

assume cs:code, ds:data
 
data segment
	arr		db	02h, 08h, 0Bh, 05h, 0Bh, 0Dh
	org 0010h
	arr_size	db	06h
	oddcnt		db	00h
	evencnt		db	00h
data ends
 
code segment
	org 0100h
 
start:
	mov ax, data
	mov ds, ax
 
	mov cl, arr_size		;Move array size to CL
	mov si, offset arr		;Put the base address of array to SI
	mov dx, 0000h			;Clear DX
 
loop1:
	mov al, [si]			;Move the value pointed by SI to AL
	and al, 01h			;And AL's last bit with 1
	cmp al, 00h			;If value of AL 0 => even
	jnz odd				;Otherwise, jump to odd
	inc dh				;DH = DH + 1 for even count
	jmp skip			;To next iteration

odd:
	inc dl				;DL = DL + 1 for odd count

skip:
	inc si				;Increment SI
	dec cl				;Decrement CL (count)
	cmp cl, 00h			;Compare CL with 00h for end of loop
	jnz loop1			;If CL != 0, continue with loop1

here:
	mov oddcnt, dl			;Move the oddcount from DL to oddc
	mov evencnt, dh			;Move the evencount from DH to evenc
   
	mov ah,4ch
	int 21h

code ends
end start
