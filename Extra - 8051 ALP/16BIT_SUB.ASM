;PROG TO SUB TWO 16 BIT NUMBERS
;(11 12) - (21 22) = (30 31 32)

;CLEAR R0
MOV R0, #00

;INITIALIZE REGS WITH VALUES
MOV 11H, #0E5H
MOV 12H, #0FFH

MOV 21H, #0DBH
MOV 22H, #0CCH

;INITIALIZE DIFF AND SIGN AS ZERO
MOV 30H, #00
MOV 31H, #00
MOV 32H, #00

;SUBTRACTING LOWER NIBBLES
MOV A, 12H
SUBB A, 22H
MOV 32H, A

;SUBTRACTING HIGHER NIBBLES
MOV A, 11H
SUBB A, 21H
MOV 31H, A

;CHECKING IF NEGATIVE
JNC HALT
INC 30H

MOV A, 32H
CPL A
ADD A, #01H
MOV 32H, A

MOV A, 31H
CPL A
MOV 31H, A
CLR A
ADDC A, 31H
MOV 31H, A

;EXIT CODE
HALT:
SJMP HALT
