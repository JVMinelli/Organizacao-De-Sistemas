TITLE Leitura Hexadecimal
.MODEL SMALL
.STACK 100h
.DATA
    msg1 DB "Digite um numero hexadecimal (max 4 digitos): $"

.CODE
    MAIN PROC
        MOV AX, @DATA       ;Acesso as strings
        MOV DS, AX

        MOV DX, OFFSET msg
        MOV AH, 9       ;Exibe na tela a string msg
        INT 21H

        MOV BX, 0       ;Inicialização das variaveis
        MOV CX, 0
    LEITURA:
        MOV AH, 1     ;Função para ler caractere
        INT 21H
        CMP AL, 13      ;Verifica se é ENTER
        JE FIM      ;Se sim, termina a leitura
        SUB AL, 30h
        CMP AL, 9          ;Verifica se é 0-9, se sim, vai para HEX_DIGIT, se não continua o código
        JBE HEX_DIGIT
        SUB AL, 7          ;Converte A-F para 10-15
    HEX_DIGIT:
        SHL BX, 4          ;Desloca BX para a esquerda
        ADD BX, AX         
        INC CX             ;Incrementa o contador
        CMP CX, 4          ;Coloca um número no LSB de BX e compara o contador com 4, se for igual o código continua, se não ele pula para LEITURA novamente
        JL LEITURA         
    FIM:
        MOV AH, 4CH     ;Finaliza o programa
        INT 21H
    MAIN ENDP
END MAIN
