TITLE ATV2_2
.MODEL SMALL
.DATA
    MSG DB 'Digite um numero de 0 a 9: $'
    MSG2 DB 10, 13, 'Digite um segundo numero de 0 a 9: $'
    MSG3 DB 10, 13, 'A soma dos dois numeros eh: $'
.CODE
main proc
    ; Permite o acesso do @data no code
    MOV AX, @DATA
    MOV DS, AX
    
    ; Printa a mensagem inicial
    MOV AH, 09
    MOV DX, OFFSET MSG
    INT 21h

    ; Le o número
    MOV AH, 01
    INT 21h
    MOV BL, AL

    ; Printa a segunda mensagem
    MOV AH, 09
    MOV DX, OFFSET MSG2
    INT 21h

    ; Le o segundo número
    MOV AH, 01
    INT 21h
    MOV BH, AL

    ; Printa a terceira mensagem
    MOV AH, 09
    MOV DX, OFFSET MSG3
    INT 21h

    ; Soma os valores ASCII de cada numero
    ADD BH, BL
    ; Remove 30 posições em hexadecimal
    SUB BH, 30H

    ; Printa o resultado
    MOV AH, 02h
    MOV DL, BH
    INT 21h
    
    ; Finaliza o programa
    MOV AH, 4ch
    INT 21H
main endp
END MAIN