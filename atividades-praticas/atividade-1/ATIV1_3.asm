TITLE ATV1_3
.MODEL SMALL
.DATA
    MSG DB 'Insira um caracter $'
    MSG2 DB 10, 13, 'O caracter inserido foi: $'
.CODE
main proc
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09
    MOV DX, OFFSET MSG
    INT 21h

    MOV AH, 01
    INT 21h

    MOV BL, AL
    MOV AH, 09
    MOV DX, OFFSET MSG2
    INT 21h

    MOV AH, 02
    MOV DL, BL
    INT 21h

    MOV AH, 4ch
    INT 21H
main endp
END MAIN