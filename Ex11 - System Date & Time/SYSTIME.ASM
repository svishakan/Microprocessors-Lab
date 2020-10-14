;MASM PROGRAM TO GET SYSTEM TIME

assume cs:code,ds:data

data segment 
	hour	db	01	dup(?)
	minute	db	01	dup(?)
	second	db	02	dup(?)
data ends

code segment

	org 0100h

start:	mov ax, data
	mov ds, ax
    
	;INT 21h/AH = 2Ch - To get system time;
	;return: CH = hour, CL = minute, DH = second    
        
	mov ah, 2Ch
	int 21h
        
	mov si, offset hour
	mov [si], ch
        
	mov si, offset minute
	mov [si], cl
        
	mov si, offset second
	mov [si], dh
        
	mov ah, 4ch
	int 21h
        
code ends

end start
