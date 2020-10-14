;MASM PROGRAM TO GET SYSTEM DATE

assume cs:code,ds:data

data segment 
    day     db  01  dup(?)
    month   db  01  dup(?)
    year    db  02  dup(?)
data ends

code segment

        org 0100h

start:  mov ax, data
        mov ds, ax
        
        ;INT21h /AH = 2Ah - To get system date;
        ;return: CX = year (1980-2099), DH = month, DL = day, AL = day of week (00h = Sunday)     
        
        mov ah, 2Ah
        int 21h
        
        mov si, offset day
        mov [si], dl
        
        mov si, offset month
        mov [si], dh
        
        mov si, offset year
        mov [si], cx
        
        mov ah, 4ch
        int 21h
        
code ends 
end start
