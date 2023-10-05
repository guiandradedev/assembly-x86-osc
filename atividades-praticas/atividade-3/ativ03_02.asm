TITLE ATIV3_2
.MODEL SMALL
.DATA
    MSG DB 'Insira um caracter $'
    MSGNUMERO DB, 10, 13, 'eh um numero $'
    MSGMAIUSCULA DB, 10, 13, 'eh um caracter maiusculo$'
    MSGMINUSCULA DB, 10, 13, 'eh um caracter minusculo$'
    MSGDESCONHECIDO DB, 10, 13, 'eh um caracter desconhecido$'
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
    JB DESCONHECIDO

    ; Verifica se é menor que 9
    CMP BL, 57
    JBE NUMERO

    ; Verifica se é menor que 65 (A)
    CMP BL, 65
    JB DESCONHECIDO

    ; Verifica se é menor que 90 (Z)
    CMP BL, 90
    JBE MAIUSCULA

    ; Verifica se é menor que 97 (a)
    CMP BL, 97
    JB DESCONHECIDO

    ; Verifica se é menor que 122 (z)
    CMP BL, 122
    JBE MINUSCULA

    NUMERO:
        MOV AH, 09
        MOV DX, OFFSET MSGNUMERO
        INT 21H
        JMP EXIT
    
    MAIUSCULA:
        MOV AH, 09
        MOV DX, OFFSET MSGMAIUSCULA
        INT 21H
        JMP EXIT

    MINUSCULA:
        MOV AH, 09
        MOV DX, OFFSET MSGMINUSCULA
        INT 21H
        JMP EXIT

    DESCONHECIDO:
        MOV AH, 09
        MOV DX, OFFSET MSGDESCONHECIDO
        INT 21H
        JMP EXIT

EXIT:
    ; Finaliza o programa
    MOV AH, 4ch
    INT 21H

main endp
END MAIN