;MASM PROGRAM TO ADD 2 FLOATING POINT NUMBERS

assume cs:code, ds:data

data segment
    org     00h 
    x       dd  20.4375
    
    org     10h
    y       dd  20.4375
    
    org     20h
    sum     dd  ?
data ends


code segment

start:  mov ax, data        ; load the data segment address
        mov ds, ax          ; Assign value to ds
        finit               ; Initialize 8087 stack
        fld x               ; Load x into st(0)
        fld y               ; Load y into st(0)
        fadd st(0), st(1)   ; st(0) = x+y 
        fst sum             ; Store st(0) in sum
        mov ah, 4ch         ; Setup function-4c of the int21
        int 21h             ; Call bios int21 to return to DOS

code ends

end start