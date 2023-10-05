TITLE ATIV06_02
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 4 ; contador do loop

    VOLTA:
        ; Le um caracter
        MOV AH, 08
        INT 21H

        MOV DL, AL ; Envia o caracter pra DL

        CMP DL, 'a' ; Verifica se é igual a 'a'
        JE AZINHO  
        CMP DL, 'A' ; Verifica se é igual a 'A', caso contrario printa direto
        JNE PRINTA
    AZINHO:
        MOV DL, '*' ; Troca o caracter por '*'

        PRINTA:
            MOV AH, 02
            INT 21H
    LOOP VOLTA

    MOV AH, 04CH
    INT 21H
MAIN ENDP
END MAIN