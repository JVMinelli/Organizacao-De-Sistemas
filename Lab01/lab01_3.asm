TITLE caracter
.MODEL SMALL
.DATA
    MSG1 DB "Digite um caractere:$"
    MSG2 DB "O caractere digitado foi:$"
.CODE
    MAIN PROC
        ;Permite o acesso às variáveis definidas em .DATA
        MOV AX,@DATA
        MOV DS,AX
        ;Exibe na tela a string MSG1
        MOV AH,9
        LEA DX,MSG1
        INT 21H
        ;Lê um caracter do teclado e salva o caracter lido em AL
        MOV AH,1
        INT 21H
        ;Copia o caracter lido para BL
        MOV BL,AL
        ;Exibe o caracter Line Feed (move o cursor para a linha seguinte)
        MOV AH,2
        MOV DL,10 ;O código ASC do caracter Line Feed é 10 (0Ah)
        INT 21H
        ;Exibe o caracter Carriage Return (move o cursor para o canto esquerdo da tela)
        MOV AH,2
        MOV DL,13 ;O código ASC do caracter Carriage Return é 13 (0Dh)
        INT 21H
        ;Exibe na tela a string MSG2
        MOV AH,9
        LEA DX,MSG2
        INT 21H
        ;Exibe o caracter lido (salvo em BL)
        MOV AH,2
        MOV DL,BL
        INT 21h
        ;Finaliza o programa
        MOV AH,4Ch
        INT 21H
    MAIN ENDP
END MAIN