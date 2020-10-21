;8051 ALP TO SUBTRACT 2 8-BIT NUMBERS

MOV     R0, #00     ;R0 has addr. of 0x00
MOV     A, R1       ;0x01 has 1st 8-bit number
SUBB    A, R2       ;0x02 has 2nd 8-bit number. Subtract it from A.
JNC     LABEL
INC     R0          ;If borrow, increment R0 for sign change
CPL     A           ;1's complement the difference
INC     A           ;2's complement the difference

LABEL:
MOV     R4, A       ;Move output to R4 from A
MOV     03, R0      ;Move borrow to R3. (MOV R3, R0) is invalid

HALT:
SJMP    HALT