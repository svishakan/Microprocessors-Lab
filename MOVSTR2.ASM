;MASM PROGRAM TO MOVE A STRING OF BYTES WITHOUT USING STRING OPERATIONS

assume cs:code, ds:data

data segment
		str1	db	"MASM"
		strlen	dw	0004h
		str2	db	?
data ends

code segment
		
		org 0100h

start:	mov ax, data
		mov ds, ax
		mov si, offset str1 
		mov di, offset str2 + 000Ah
		mov cx, strlen

looper:	mov bl, [si]
		mov [di], bl
		inc si
		inc di
		dec cx
		jz break
		jmp looper

break:	mov ah, 4ch
		int 21h

code ends

end start


;Adding 000A with str2's offset so that the output can be seen in next address block (not required)
;The looper block runs till the value at cx becomes 0 (i.e. all bytes from the source string are copied)
;SI points to the address of str1's offset, and its value is taken with [SI] and copied to BL
;From BL it is copied to [DI] where DI points to str2's offset address
;CX is decremented to move to the next bytes