TITLE ATIV4_01
.MODEL small
.STACK 100h
.DATA
    LF EQU 10
.CODE
MAIN PROC
    ; Inicializa o segmento data
    MOV AX, @DATA
    MOV DS, AX

    ; Inicializa o contador em 50
    MOV CL, 50

    PRINTA:
        ; Printa o *
        MOV AH, 02
        MOV DL, '*'
        INT 21H

        ; Printa o enter
        MOV DL, LF 
        INT 21H

        ; Remove uma unidade do contador
        DEC CL
        ; Pula para PRINTA se for diferente de zero
        JNZ PRINTA

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN