TITLE Eco
.MODEL SMALL
.CODE
    MAIN PROC
        ;Exibe o caracter ? na tela
        MOV AH,2
        MOV DL,"?"
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
        ;Exibe o caracter lido (salvo em BL)
        MOV AH,2
        MOV DL,BL
        INT 21h
        ;Finaliza o programa
        MOV AH,4Ch
        INT 21H
    MAIN ENDP
END MAIN
        