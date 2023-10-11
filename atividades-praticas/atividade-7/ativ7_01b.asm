TITLE ATIV7_01B
.MODEL SMALL
.STACK 100H
.DATA
    ARRAY DB 1,2,3,4,5
    LF EQU 10
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA BX, ARRAY ; Manda para BX o offset do vetor

    MOV AH, 02
    FOR_LOOP:
        MOV DL, [BX] ; Manda para DL o conteúdo do primeiro elemento do vetor
        OR DL, 30H
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