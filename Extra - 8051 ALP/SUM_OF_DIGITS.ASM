; 8051 Program to find the sum of the digits of a 16-bit number
; 377F => [r1 r2]
; sum  => r3 = 3 + 7 + 7 + F = 20 (hexadecimal)

mov r1, #37h		; First 8-bits of the number
mov r2, #7Fh		; Second 8-bits of the number
mov r3, #00		; Sum (to be stored)

mov a, r1		; Load first 8 bits
anl a, #0Fh		; Mask the higher nibble (digit 1)
mov r3, a		; Move them to r3

mov a, r1		; Load the first 8 bits again
anl a, #0F0h		; Mask the lower nibble
swap a			; Swap higher and lower nibbles (digit 2)
add a, r3		; Add this digit to digit 1, in r3
mov r3, a		; Move the sum back to r3

mov a, r2		; Load the second 8 bits
anl a, #0Fh		; Mask the higher nibble (digit 3)
add a, r3		; Add this digit to the sum in r3
mov r3, a		; Move the sum back to r3

mov a, r2		; Load the second 8 bits again
anl a, #0F0h		; Mask the lower nibble
swap a			; Swap higher and lower nibbles (digit 4)
add a, r3		; Add this digit to the sum in r3
mov r3, a		; Move the sum back to r3

; r3 now contains the sum of the digits