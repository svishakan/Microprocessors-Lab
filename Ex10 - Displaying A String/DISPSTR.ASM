;MASM PROGRAM TO DISPLAY A STRING OF CHARACTERS

assume cs:code,ds:data

data segment
    message db  "Hello World!$"
data ends

code segment

start:  mov ax, data
        mov ds, ax
        mov ah, 9                ; DOS function #9 to write string to STDOUT
        mov dx, offset message   ; Offset of the string
        int 21h                  ; Display it
        mov ah, 4ch
        int 21h

code ends

end start