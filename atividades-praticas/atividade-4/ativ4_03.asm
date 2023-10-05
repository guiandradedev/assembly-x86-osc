TITLE ATIV4_04
.MODEL SMALL
.STACK 100h
.DATA
    LF EQU 10
    SPACE EQU 32
    MINUSCULAS DB, 10, 13, "Minusculas: $"
    MAIUSCULAS DB, 10, 13, "Maiusculas: $"
.CODE
MAIN PROC
    ; Inicializa @DATA
    MOV AX, @DATA
    MOV DS, AX

    ; Printa "maiusculas"
    MOV AH, 09
    LEA DX, MAIUSCULAS
    INT 21H
    
    MOV CX, 26 ; Inicia o contador do loop
    MOV DL, 'A' ; Inicializa a letra como 'A'

    MOV AH, 02H ; Prepara para printar

    MAIUSCULAS_LOOP:
        INT 21H ; Printa a letra

        PUSH DX ; Envia a próxima letra para a pilha

        ; Printa o espaço
        MOV DL, SPACE
        INT 21H

        POP DX ; Retorna o valor da letra para DX

        INC DL ; Adiciona uma letra
        LOOP MAIUSCULAS_LOOP ; Volta o loop

    ; Printa "maiusculas"
    MOV AH, 09
    LEA DX, MINUSCULAS
    INT 21H

    MOV CX, 26 ; Reinicializa o contador do loop
    MOV DL, 'a' ; Reinicializa a letra

    MOV AH, 02H ; Prepara para printar

    MINUSCULAS_LOOP:
        INT 21H ; Printa a letra

        PUSH DX ; Envia a próxima letra para a pilha

        ; Printa o espaço
        MOV DL, SPACE
        INT 21H

        POP DX ; Retorna o valor da letra para DX

        INC DL ; Adiciona uma letra
        LOOP MINUSCULAS_LOOP ; Volta o loop

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN