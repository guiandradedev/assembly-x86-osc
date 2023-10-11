TITLE ATIV7_02A
.MODEL SMALL
.STACK 100H
.DATA
    ARRAY DB 6, 7, 8, 9, 0
    LF EQU 10
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    XOR SI, SI  ; Zera o indice do vetor


    MOV AH, 02
    FOR_LOOP:
        MOV DL, ARRAY[SI] ; Manda o elemento do vetor de indice BX para DL
        OR DL, 30H ; Transforma em caracter ASCII
        INT 21H

        INC SI
        MOV DL, LF ; Printa um enter
        INT 21H
        
        CMP SI, 5
        JNE FOR_LOOP

    ; Finaliza o programa
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN