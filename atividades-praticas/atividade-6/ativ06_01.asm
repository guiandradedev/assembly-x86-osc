TITLE ATIV06_01
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB '[$'
    MSG2 DB 'o] caracter: $'
    LF EQU 10
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 4 ; contador do loop
    MOV BL, '1' ; contador da msg

    VOLTA:
        ; Printa a mensagem de caracter qual caracter
        MOV AH, 09
        LEA DX, MSG
        INT 21H

        MOV AH, 02
        MOV DL, BL
        INT 21H

        MOV AH, 09
        LEA DX, MSG2
        INT 21H

        ; Le o caracter
        MOV AH, 08H
        INT 21H
        MOV DL, AL ; Envia o valor para DL
        CMP DL, '0' ; Compara com 0
        ; Caso AL nao seja 0 ele move 'X' para DL
        JNE PRINTA 
        MOV DL, 'X'

    PRINTA:

        ; Printa o caracter (X ou caracter)
        MOV AH, 02
        INT 21H
        ; Printa um 'enter'
        MOV DL, LF
        INT 21H

        INC BL ; Incrementa o contador da mensagem
        LOOP VOLTA ; Volta o loop

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN