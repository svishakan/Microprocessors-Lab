;8051 ALP TO FIND CUBE OF AN 8-BIT NUMBER.

MOV     R0, #00     ;R0 has addr of 0x00
MOV     A, R1       ;Transferring 8-bit number to reg A
MOV     B, R1       ;Transferring 8-bit number to reg B
MUL     AB          ;BA = A x B 
                    ;Since it is 8-bit B = 0x00
MOV     B, R1       ;Transfer 8-bit value to B 
MUL     AB          ;BA = A x B
MOV     R5, A       ;Moving LSBs to R5
MOV     R4, B       ;Moving MSBs to R4

HALT:
SJMP    HALT