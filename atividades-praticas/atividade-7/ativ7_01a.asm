TITLE ATIV7_01A
.MODEL SMALL
.STACK 100H
.DATA
    ARRAY DB 5, 4, 3, 2, 1
    LF EQU 10
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    XOR BX, BX ; Zera o indice do vetor

    MOV AH, 02
    FOR_LOOP:
        MOV DL, ARRAY[BX] ; Manda o elemento do vetor de indice BX para DL
        OR DL, 30H ; Transforma em caracter ASCII
        INT 21H

        INC BX
        MOV DL, LF ; Printa um enter
        INT 21H
        
        CMP BX, 5
        JNE FOR_LOOP

    ; Finaliza o programa
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN