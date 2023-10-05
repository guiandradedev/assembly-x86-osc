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
    MOV DI, 7 ; Endereço final do vetor (posição 7)

    ; ; Lê o vetor
    FOR_LEITURA:
        CMP DI, 0 ; Verifica se passou por todos os indices do vetor
        JZ END_FOR_LEITURA

        ; Le o caracter
        MOV AH, 01
        INT 21H
        
        AND AL, 0FH ; Transforma o caracter em número
        MOV ARRAY[SI], AL ; Envia o númerro para o vetor

        ; Pula para a próxima iteração
        INC SI
        DEC DI
        JMP FOR_LEITURA
    END_FOR_LEITURA:

    ; Reinicializa os registradores de indexação
    XOR SI, SI
    MOV DI, 6
    
    ; Realiza a inversão do vetor
    FOR_INVERSAO:
        CMP SI, 4 ; Para não inverter duas vezes, determina o loop até a 'metade' do tamanho do vetor, no caso 4
        JE END_FOR_INVERSAO

        ; Utiliza os registradores DL e DH para armazenar de forma temporária os valores a serem modificados
        MOV DL, ARRAY[DI]
        MOV DH, ARRAY[SI]
        MOV ARRAY[SI], DL
        MOV ARRAY[DI], DH

        INC SI
        DEC DI
        JMP FOR_INVERSAO
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