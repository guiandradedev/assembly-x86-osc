TITLE ATIV3_1
.MODEL SMALL
.DATA
    MSG DB 'Insira um caracter $'
    MSGNUMERO DB, 10, 13, 'eh um numero $'
    MSGNAONUMERO DB, 10, 13, 'nao eh um numero$'
.CODE
main proc
    MOV AX, @DATA
    MOV DS, AX
    
    ; Printa a mensagem inicial
    MOV AH, 09
    MOV DX, OFFSET MSG
    INT 21h

    ; Lê o caracter
    MOV AH, 01H
    INT 21H

    MOV BL, AL

    ; Verifica se é menor que 0
    CMP BL, 48
    JB NAONUMERO

    ; Verifica se é menor que 9
    CMP BL, 57
    JA NAONUMERO

    ; Printa que é um número
    MOV AH, 09
    MOV DX, OFFSET MSGNUMERO
    INT 21H
    JMP EXIT
    
    NAONUMERO:
        MOV AH, 09
        MOV DX, OFFSET MSGNAONUMERO
        INT 21H
        JMP EXIT

    EXIT:
        ; Finaliza o programa
        MOV AH, 4ch
        INT 21H

main endp
END MAIN