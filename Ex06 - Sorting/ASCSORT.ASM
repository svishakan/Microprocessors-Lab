;MASM PROGRAM TO SORT AN ARRAY IN ASCENDING ORDER USING BUBBLE SORT

assume cs: code, ds: data

data segment
    list    db  05h, 04h, 03h, 02h, 01h
    len     db  04h
data ends

code segment

    org 0100h

    start:  mov     ax, data
            mov     ds, ax
            mov     ch, len             ;Outer loop count
    
    outer:  mov     si, offset list     ;Pointer at first element
            mov     cl, len             ;Inner loop count

    inner:  mov     al, [si]
            mov     ah, [si+1]  
            cmp     ah, al              ;Compare by AL - AH 
            jnc     skip                ;Skip if no carry on AL - AH    
            xchg    al, ah              ;Exchange register contents
            mov     [si], ax            ;Copy back moved contents to data segment (AL -> [SI], AH -> [SI + 1])

    skip:   inc     si                  ;Go to next element
            dec     cl                  ;Decrement inner loop count
            jnz     inner               ;Restart inner loop
            dec     ch                  ;Decrement outer loop count
            jnz     outer               ;Restart outer loop

            mov     ah, 4ch
            int     21h

code ends

end start
