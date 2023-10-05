TITLE ATV2_1
.MODEL SMALL
.DATA
    MSG DB 'Insira um caracter minusculo $'
    MSG2 DB 10, 13, 'A correspondente maiuscula do caracter eh: $'
.CODE
main proc
    MOV AX, @DATA
    MOV DS, AX
    
    ; Printa a mensagem inicial
    MOV AH, 09
    MOV DX, OFFSET MSG
    INT 21h

    ;00011010
    ; Le o caracter
    MOV AH, 01
    INT 21h

    ; Transforma o caracter em maiusculo
    SUB AL, 32
    MOV BL, AL

    ; Printa a segunda mensagem
    MOV AH, 09
    MOV DX, OFFSET MSG2
    INT 21h

    ; Printa o caracter em maiusculo
    MOV AH, 02
    MOV DL, BL
    INT 21h

    ; Finaliza o programa
    MOV AH, 4ch
    INT 21H
main endp
END MAIN