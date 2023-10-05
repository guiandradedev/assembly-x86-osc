TITLE ATIV4_04
.MODEL SMALL
.STACK 100h
.DATA
    SPACE EQU 32
    LF EQU 10
    MINUSCULAS DB, 10, 13, "Minusculas: $"
.CODE
MAIN PROC
    ; Inicializa @DATA
    MOV AX, @DATA
    MOV DS, AX

    ; Printa "Minusculas: "
    MOV AH, 09
    LEA DX, MINUSCULAS
    INT 21H
    
    MOV CX, 26 ; Inicializa o contador das letras

    ; Printa um espaço
    MOV AH, 02
    MOV DL, LF
    INT 21H
    
    MOV DL, 'a' ; Inicializa a letra como 'A'
    MOV BH, 4 ; Inicializa o contador das linhas

    MINUSCULAS_LOOP:
        INT 21H ; Printa a letra armazenada
        INC DL ; Adiciona uma letra
        DEC BH ; "Remove" um caracter da linha

        JNZ VOLTA ; Caso não seja 0, volta o loop

        ; Caso seja 0, executa:
        
        PUSH DX ; Envia a próxima letra para a pilha

        ; Printa o enter
        MOV DL, LF
        INT 21H

        MOV BH,4 ; Reinicia o contador das linhas
        POP DX ; Retorna o valor da letra para DX
        
        VOLTA:
            LOOP MINUSCULAS_LOOP
        
    MOV AH, 04CH
    INT 21H
MAIN ENDP
END MAIN