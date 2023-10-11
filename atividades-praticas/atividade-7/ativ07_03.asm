TITLE ATIV07_03
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "Insira 7 elementos no vetor: $"
    MSG2 DB "Vetor invertido: $"
    LF EQU 10
    ARRAY DB ?, ?, ?, ?, ?, ?, ?
.CODE
MAIN PROC
    ; Inicializa o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09
    LEA DX, MSG
    INT 21H

    XOR SI, SI ; Endereço base do vetor (posição 0)
    MOV CX, 7
    MOV AH, 01
    ; Lê o vetor
    FOR_LEITURA:
        ; Le o caracter
        INT 21H
        
        AND AL, 0FH ; Transforma o caracter em número
        MOV ARRAY[SI], AL ; Envia o númerro para o vetor

        ; Pula para a próxima iteração
        INC SI
        
        LOOP FOR_LEITURA
    END_FOR_LEITURA:

    ; Reinicializa os registradores de indexação
    XOR SI, SI
    MOV DI, 6
    xor cx,3
    ; Realiza a inversão do vetor
    FOR_INVERSAO:
        ; Utiliza os registradores DL e DH para armazenar de forma temporária os valores a serem modificados
        MOV DL, ARRAY[DI]
        XCHG ARRAY[SI],Dl
        MOV ARRAY[DI], DL

        INC SI
        DEC DI
        LOOP FOR_INVERSAO
    END_FOR_INVERSAO:

    ; Reinicializa os registradores de indexação
    MOV SI, 0

    MOV AH, 02
    MOV DL, LF
    INT 21H

    MOV AH, 09
    LEA DX, MSG2
    INT 21H

    MOV AH, 02
    FOR_PRINTA:
        CMP SI, 7
        JE END_FOR_PRINTA

        MOV DL, ARRAY[SI]
        OR DL, 30H
        INT 21H

        INC SI
        JMP FOR_PRINTA
    END_FOR_PRINTA:

    ; Finaliza o programa
    MOV AH, 04CH
    INT 21H
MAIN ENDP
END MAIN
