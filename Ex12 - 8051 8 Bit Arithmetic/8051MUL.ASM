;8051 ALP TO MULTIPLY 2 8-BIT NUMBERS

MOV     R0, #00     ;R0 has addr. of 0x00
MOV     A, R1       ;0x01 has 1st 8-bit number
MOV     B, R2       ;0x02 has 2nd 8-bit number
MUL     AB          ;BA = A * B

MOV     R5, A       ;Move lower byte to R5 from A
MOV     R4, B       ;Move higher byte to R4 from B

HALT:
JMP     HALT