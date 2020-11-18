;8086 ALP TO FIND THE NUMBER OF 0S AND 1S IN A 32-BIT NUMBER
;EXAMPLE: 32109999 - 11001000010000 1001100110011001- 20 ZEROES 12 ONES

ASSUME CS:CODE,DS:DATA

DATA SEGMENT
    NUM1 DW 3210H
    NUM2 DW 9999H
    COUNT_ONE DB ?
    COUNT_ZERO DB ?
DATA ENDS

CODE SEGMENT
    ORG 0100H

START: 
    MOV AX, DATA
    MOV DS, AX
    MOV BL, 00H
    MOV DL, 00H
    MOV AX, NUM1
    CLC

HERE:
    CMP AX, 0000H
    JZ SKIP             ;If AX becomes 0, go to the higher 16-bits
    SHR AX, 1           ;Else shift right. If carry occurs, increment BL. (odd count)
    JNC HERE
    INC BL
    JMP HERE

SKIP:
    MOV AX, NUM2        ;Higher 16-bits of the 32-bit number
    CLC                 ;Clear carry flag

HERE2:
    CMP AX, 0000H       ;Same logic as above
    JZ DONE
    SHR AX, 1
    JNC HERE2
    INC BL
    JMP HERE2

DONE:
    MOV COUNT_ONE, BL
    MOV AL, 20H         ;20H = 32 in decimal
    SUB AL, BL          ;For no. of zeroes = no. of digits - no. of ones
    MOV COUNT_ZERO, AL
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START