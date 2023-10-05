TITLE ATIV5_01
.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Insira caracteres $'
    MSG2 DB 10, 13, 'Foram inseridos $'
    MSG3 DB ' caracteres$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09
    LEA DX, MSG1
    INT 21H

    XOR CH, CH ; Contador

    MOV AH, 01 ; Começa o loop pedindo um caracter
    WHILE_LOOP:
        INT 21H

        CMP AL, 13 ; Verifica se o caracter inserido é um enter
        JE END_WHILE ; Se for igual, finaliza o loop

        CMP CH, 8
        JE END_WHILE

        INC CH ; Incrementa o contador
        JMP WHILE_LOOP ; Volta o loop

    END_WHILE:

    ; Printa as mensagens
    MOV AH, 09
    LEA DX, MSG2
    INT 21H

    MOV AH, 02
    MOV DL, CH
    ADD DL, 30H ; Transforma o contador em Ascii novamente
    INT 21H

    MOV AH, 09
    LEA DX, MSG3
    INT 21H

    ; Finaliza o programa
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN