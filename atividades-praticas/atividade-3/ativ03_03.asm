TITLE ATIV33
.MODEL SMALL
.DATA
    ESPACO DB " $"
    MAIUSCULAS DB, 10, 13, "Maiusculas: $"
    MINUSCULAS DB, 10, 13, "Minusculas: $"
.CODE
main proc
    ; Inicializo o @DATA
        MOV AX, @DATA
        MOV DS, AX

    ; Printa a msg maiusculas
        MOV AH, 09
        MOV DX, OFFSET MAIUSCULAS
        INT 21H

    ; Inicializa BL como 41h (A)
        MOV BL, 41h

    LOOP_MAIUSCULAS:
        ; Printa o caracter
        MOV AH, 02
        MOV DL, BL
        INT 21h

        ; Printa um espaço
        MOV AH, 09
        MOV DX, OFFSET ESPACO
        INT 21H

        ; Adiciona um caracter
        INC BL

        ; Compara se o caracter é maior que 90 (Z)
        CMP BL, 90
        JBE LOOP_MAIUSCULAS

        ; Printa a msg minusculas
        MOV AH, 09
        MOV DX, OFFSET MINUSCULAS
        INT 21H
    
    ; Reinicializa DL como 61h (a)
        MOV BL, 61H

    LOOP_MINUSCULAS:
        ; Printa o caracter
        MOV AH, 02
        MOV DL, BL
        INT 21h

        ; Printa um espaço
        MOV AH, 09
        MOV DX, OFFSET ESPACO
        INT 21H

        ; Incrementa um caracter
        INC BL

        ; Compara se o caracter é maior que 7ah (z)
        CMP BL,7ah
        JBE LOOP_MINUSCULAS    
    

    EXIT:
        ; Finaliza o programa
        MOV AH, 4ch
        INT 21H

main endp
END MAIN