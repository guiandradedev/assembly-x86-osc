TITLE ATIV4_02
.MODEL SMALL
.STACK 100h
.DATA
    LF EQU 10
    SPACE EQU 32
.CODE
MAIN PROC
    ; Inicializa @DATA
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 50 ; Inicializa o contador como 50
    
    MOV AH, 02 ; Prepara para printar
    INICIO:
        MOV DL, '*'
        INT 21H ; Printa

        ; Printa um espaço
        MOV DL, SPACE
        INT 21H

        ; ; Printa um enter
        ; MOV DL, LF
        ; INT 21H

        LOOP INICIO ; Volta o loop

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN