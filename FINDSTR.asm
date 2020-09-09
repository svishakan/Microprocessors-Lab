;MASM PROGRAM TO SEARCH A BYTE IN A STRING

assume cs:code, ds:data, es:extra

data segment
		str2	db	"Y"
		strloc	dw	0000h
		strlen	dw	0005h
data ends

extra segment
		str1	db	"VENKY"
extra ends


code segment
		
		org 0100h

start:	mov ax, data
		mov ds, ax
		mov ax, extra
		mov es, ax
		mov di, offset str1
		mov al, str2
		mov cx, strlen
		mov bx, cx
		cld
		repne scasb
		jnz notfnd
		sub bx, cx
		mov strloc, bx
		mov ah, 4ch
		int 21h
		
notfnd:	mov strloc, 0000h
		mov ah, 4ch
		int 21h

code ends

end start


;JNZ jumps if ZF is not set to 1
;REPNE repeats the SCASB instruction while ZF flag = 0
;SCASB scans for a byte (present in al) in the source string (present in ES, accessed using DI)
;if byte is found, we calculate index as (string length - CX reg value) (starting base is 1, not 0)
;if byte is not found, we output index as 0