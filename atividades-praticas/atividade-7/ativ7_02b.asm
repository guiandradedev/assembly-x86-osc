TITLE ATIV7_02B
.MODEL SMALL
.STACK 100H
.DATA
    ARRAY DB 2, 4, 6, 8, 0
    LF EQU 10
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA SI, ARRAY  ; Manda para SI o offset do vetor

    MOV AH, 02
    FOR_LOOP:
        MOV DL, [SI]  ; Manda para DL o conteúdo do primeiro elemento do vetor
        OR DL, 30H
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