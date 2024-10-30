TITLE recebe binario
.MODEL SMALL
.STACK 100h
.CODE
    MAIN PROC
        MOV BX,0        ;Inicialização das variáveis
        MOV CX,0
    CONTA:
        MOV AH,1        ;Recebe um caractere e o armazena em AL
        INT 21H
        CMP AL,13       ;Compara se Al é igual a ENTER, se for pula para FIM, se não o codigo continua
        JE FIM
        SUB AL,30h      ;Transforma em 1 ou 0
        INC CX
        SHL BX,1        ;Incrementa o contador e desloca BX para a esquerda
        ADD BL,AL       
        CMP CX,16       ;Coloca um número no LSB de BX e compara o contador com 16, se for igual o código continua, se não ele pula para COMPARA novamente
        JNE CONTA
    FIM:    
        MOV AH,4ch      ;Finaliza o programa
        INT 21h
    MAIN ENDP
END MAIN