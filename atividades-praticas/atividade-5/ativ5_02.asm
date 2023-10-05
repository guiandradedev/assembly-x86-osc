TITLE ATIV5_02
.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Insira o dividendo de 0 a 9: $'
    MSG2 DB 10, 13, 'Insira o divisor de 1 a 9: $'
    MSG3 DB 10, 13, 'Insira somente valores de 1 a 9 para o divisor: $'
    QUOSCIENTE DB 10, 13, 'Quosciente: $'
    RESTO DB 10, 13, 'Resto: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Le o primeiro caracter (dividendo) e transforma em número 
    MOV AH, 09
    LEA DX, MSG1
    INT 21H

    MOV AH, 01
    INT 21H

    MOV BL, AL ; Envia o número lido para BL
    AND BL, 0FH ; Transforma o caracter ASCII para binário, por ex, 39H em 9H/9B

    ; Le o segundo caracter (divisor) e transforma em número 
    MOV AH, 09
    LEA DX, MSG2
    INT 21H

    WHILE_NAO_ZERO:
        MOV AH, 01
        INT 21H

        ; Verifica se o divisor é 0 e repete até que o usuário coloque um número inteiro entre 1 ee 9
        CMP AL, 30H
        JNE END_WHILE_NAO_ZERO

        ; Printa a mensagem para repetir
        MOV AH, 09
        LEA DX, MSG3
        INT 21H

        JMP WHILE_NAO_ZERO
    
    END_WHILE_NAO_ZERO:

    MOV BH, AL ; Envia o número lido para BH
    AND BH, 0FH ; Transforma o caracter ASCII para binário, por ex, 39H em 9H/9B

    XOR CH, CH ; Contador do quosciente

    WHILE_LOOP:
        CMP BL, BH
        JB END_WHILE
        INC CH

        SUB BL, BH ; Retira BH de BL
        JMP WHILE_LOOP

    END_WHILE:

    ; Printa o quosciente
    MOV AH, 09
    LEA DX, QUOSCIENTE
    INT 21H

    MOV AH, 02
    MOV DL, CH
    ADD DL, 30H ; Transforma o resultado em ASCII para printar
    INT 21H

    ; Printa o resto
    MOV AH, 09
    LEA DX, RESTO
    INT 21H

    MOV AH, 02
    MOV DL, BL
    ADD DL, 30H  ; Transforma o resultado em ASCII para printar
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN