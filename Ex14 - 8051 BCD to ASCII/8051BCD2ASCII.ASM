;8051 ALP TO CONVERT A GIVEN BCD NUMBER TO ITS ASCII EQUIVALENT

MOV     R0, #00     ;R0 has addr of 0x00
MOV     A, R1       ;Moving BCD value to A
ANL     A, #0FH     ;Taking lower byte value of A by doing (byte & 0F)
ADD     A, #30H     ;Add 30H to lower byte to convert it to ASCII
MOV     R4, A       ;Move lower ASCII byte to R4 from A

MOV     A, R1       ;Moving BCD value again to A
ANL     A, #0F0H    ;Taking higher byte value of A by doing (byte & F0)
SWAP    A           ;Swap the lower and higher nibble in A
ADD     A, #30H     ;Add 30H to higher byte to convert it to ASCII
MOV     R3, A       ;Move higher ASCII byte to R3 from A

HALT:
SJMP    HALT

;Do not give "ANL A, #F0H" because it gets interpreted as a label in the EDSIM51DI Simulator
;30H should be added to A (i.e 48 in decimal, not 30 in decimal)