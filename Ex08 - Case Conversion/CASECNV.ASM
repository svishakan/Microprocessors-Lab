;MASM PROGRAM FOR CASE CONVERSION

assume cs:code,ds:data

data segment
        count   equ     10h
data ends 

code segment

start:  mov ax, data
        mov ds, ax
        mov cx, count           ; Loop counter
l1:     mov ah, 1               ; To input a character
        int 21h                 ; AL = character,  ASCII (hex) : a-z= 41-5A, a-z= 61-7A
        cmp al, 60h
        jnc upper
        add al, 20h             ; Convert to lower case
        jmp skip                ; Not an alphabet

upper:  sub al, 20h             ; Convert to upper case

skip:   mov ah, 2               ; To output a character
        mov dl, al              ; Character must be in dl
        int 21h                 ; Display the character
        loop l1                 ; Repeat loop
        mov ah, 4ch
        int 21h

code ends

end start
