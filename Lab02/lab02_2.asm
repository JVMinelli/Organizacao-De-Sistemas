TITLE SOMA
.MODEL SMALL
.DATA
    MSG1 DB "Insira um numero:$"
    MSG2 DB "Seus numeros somados tem resultado:$"
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
        SUB bl,30h
        ;Exibe o caracter Line Feed (move o cursor para a linha seguinte)
        MOV AH,2
        MOV DL,10 ;O código ASC do caracter Line Feed é 10 (0Ah)
        INT 21H
        ;Exibe o caracter Carriage Return (move o cursor para o canto esquerdo da tela)
        MOV AH,2
        MOV DL,13 ;O código ASC do caracter Carriage Return é 13 (0Dh)
        INT 21H
        ;Exibe na tela a string MSG1
        MOV AH,9
        LEA DX,MSG1
        INT 21H
        ;Lê um caracter do teclado e salva o caracter lido em AL
        MOV AH,1
        INT 21H
        ;Copia o caractere lido para BH
        MOV BH,AL
        sub BH,30h
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
        ;Soma os dois valores
        ADD BL,bh
        add BL,30h
        ;Exibe o valor adiquirido(Salvo em BL)
        MOV AH,2
        MOV DL,BL
        INT 21h
        ;Finaliza o programa
        MOV AH,4Ch
        INT 21H
    MAIN ENDP
END MAIN
        


     