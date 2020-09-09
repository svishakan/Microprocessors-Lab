;MASM PROGRAM TO COMPARE 2 STRINGS OF BYTES

assume cs:code, ds:data, es:extra

data segment
		str1	db	"VENKY"
		streq	dw	0000h
		strlen	dw	0005h
data ends

extra segment
		str2	db	"VENGY"
extra ends


code segment
		
		org 0100h

start:	mov ax, data
		mov ds, ax
		mov ax, extra
		mov es, ax
		mov si, offset str1 
		mov di, offset str2
		mov cx, strlen
		mov bx, cx
		cld
		repe cmpsb
		jz equstr
		sub bx, cx
		mov streq, bx
		mov ah, 4ch
		int 21h
		
equstr:	mov streq, 0000h
		mov ah, 4ch
		int 21h

code ends

end start


;JZ jumps if ZF is set to 1
;REPE repeats the CMPSB instruction while ZF flag = 1
;CMPSB compares bytes of ES(pointed by DI) to the bytes of DS(pointed by SI)
;if they are not equal, we output the first mismatch index value
;mismatch index value = (string length - CX reg value) (starting base is 1, not 0)
;if both strings are equal, have output as 0