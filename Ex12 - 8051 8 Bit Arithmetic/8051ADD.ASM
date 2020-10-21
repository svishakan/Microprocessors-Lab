;8051 ALP TO ADD 2 8-BIT NUMBERS

MOV     R0, #00     ;R0 has addr. of 0x00
MOV     A, R1       ;0x01 has 1st 8-bit number
ADD     A, R2       ;0x02 has 2nd 8-bit number. Add it with A
JNC     LABEL
INC     R0          ;If carry, increment R0

LABEL:
MOV     R4, A       ;Move output to R4 from A
MOV     03, R0      ;Move carry to R3. (MOV R3, R0) is invalid

HALT:
SJMP    HALT