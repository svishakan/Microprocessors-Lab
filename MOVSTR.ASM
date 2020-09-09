;MASM PROGRAM TO MOVE A STRING OF BYTES

assume cs:code, ds:data, es:extra

data segment
		str1	db	"MASM"
data ends

extra segment
		str2	db	?
		strlen	dw	0004h
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
		cld
		rep movsb
		mov ah, 4ch
		int 21h

code ends

end start


;MOVSB moves the bytes from DS to ES.
;offset is an assembler directive which gets the starting address of the variable, much like & operator in C
;CLD clears Direction Flag, if DF = 1, the bytes are read from Right->Left
;Since we want Left->Right movement, clear DF, so that it always reads Left->Right irrespective of previous value