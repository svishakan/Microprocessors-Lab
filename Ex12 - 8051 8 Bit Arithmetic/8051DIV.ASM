;8051 ALP TO DIVIDE 2 8-BIT NUMBERS

MOV     R0, #00     ;R0 has addr. of 0x00
MOV     A, R1       ;0x01 has 1st 8-bit number
MOV     B, R2       ;0x02 has 2nd 8-bit number
DIV     AB          ;AB = A/B, A: Quotient, B: Remainder
MOV     R4, A       ;Move quotient to R4 from A
MOV     R5, B       ;Move remainder to R5 from B

HALT:
SJMP    HALT