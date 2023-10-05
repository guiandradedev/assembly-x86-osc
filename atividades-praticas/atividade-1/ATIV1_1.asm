TITLE ATV1_1
.MODEL SMALL
.DATA
    MSG DB 'testsse $'
    MSG2 DB 10, 13,'teste 2$'
.CODE
main proc
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 09
    MOV DX, OFFSET MSG
    INT 21h
    MOV AH, 09
    MOV DX, OFFSET MSG2
    INT 21h
    MOV AH, 4ch
    INT 21h
main endp
END MAIN