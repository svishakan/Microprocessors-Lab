;ADD ODD NUMBERS IN A LIST

assume cs:code, ds:data

data segment
    arr		db 04h, 0Fh, 02h, 0Fh, 06h, 0Fh
    count	db 06h
    sum		db 00h
data ends

code segment
    org 0100h

start:
    mov ax, data
    mov ds, ax
    
    mov cl, count
    mov si, offset arr

looper:
    mov al, [si]
    and al, 01h
    cmp al, 00h		;If value = 0 => even
    jz skip			;Skip if even

adder:
    mov al, sum
    adc al, [si]
    mov sum, al

skip:
    inc si			;Point to the next element
    dec cl
    cmp cl, 00h		;Check if loop count is over
    jnz looper

exit:
    mov ah, 4ch
    int 21h

code ends
end start
