;MASM PROGRAM TO DO STRING MANIPULATION

assume cs:code, ds:data, es:extra

data segment					;Initialize data segement
		strlen	dw 0005h		;strlen = 5
		org 0010h
		str1	db	"MODEL"     		
		org 0020h
		char 	db  "D"
		org 0030h
		misloc 	dw 	0000h
		org 0040h
		strloc 	dw 	0000h
data ends

extra segment 					;Initialize extra segment
		str1ans	db	?
		org 0010h
		str2 	db 	"MODIL"
extra ends


code segment
		
		org 0100h

start:  mov ax, data 		;Load data segement
		mov ds, ax
		mov ax, extra		;Load extra segment
		mov es, ax

q1:							;To tranfer data from DS to ES
		mov si, offset str1 
		mov di, offset str1ans
		mov cx, strlen		;cx contains str length
		cld					;clear direction flag
		rep movsb			;repeates till CX -> 0
							; transfers from SI to DI

q2:							;Compares two string, finds first mismatch
		mov si, offset str1 
		mov di, offset str2
		mov cx, strlen 		;cx contains strlen
		mov bx, cx			;bx <- cx
		cld					;clear direction flag
		repe cmpsb			;repeates till two character are equal
							; or cx -> 0
		jz equstr			;If equal jump to equstr
		sub bx, cx			;find relative positon 
		mov misloc, bx
		jmp q3
		
equstr:	
		mov misloc, 0000h 	;misloc is 0 is two strs are equal
		jmp q3

q3:							;find position of a char in a string
		mov di, offset str2 
		mov al, char
		mov cx, strlen		;cx has string length
		mov bx, cx			;bx <- cx
		cld
		repne scasb			;repeats till ZF = 0, terminates 
							;when ZF=1 or CX->0
		jnz notfnd			;if ZF =0,then char not found
		sub bx, cx			;find relative position
		mov strloc, bx
		jmp exit
		
notfnd:
		mov strloc, 0000h	;if not found place zero as position

exit:	
		mov ah, 4ch			;dos interrupt to terminate the program
		int 21h

code ends

end start

