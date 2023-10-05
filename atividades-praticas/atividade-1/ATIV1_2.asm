TITLE ATV1_2
.MODEL SMALL
.CODE
main proc
    MOV AH, 01
    INT 21h

    MOV BL, AL
    MOV AH, 02
    MOV DL,10
    INT 21h
    MOV AH, 02
    MOV DL,13
    INT 21h
    
    MOV AH, 02
    MOV DL, BL
    INT 21h
    MOV AH, 4ch
    INT 21H
main endp
END MAIN