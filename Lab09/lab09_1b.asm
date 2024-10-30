.MODEL SMALL
.DATA
VETOR DB 1, 1, 1, 2, 2, 2
.CODE
    MAIN PROC
        MOV AX, @DATA       ;Acesso ás variáveis
        MOV DS,AX       
        XOR DL, DL      ;Zera DL
        MOV CX,6        ;Inicialza CX como 6
        XOR BX, BX      ;Zera BX
        CALL IMPRESSAO      ;Chama o processo IMPRESSAO
        MOV AH,4CH
        INT 21H ;saida para o DOS
    MAIN ENDP
    IMPRESSAO PROC
    
        VOLTA:
        MOV DL, VETOR[BX]    ;Coloca o valor de VETOR[BX] em DL para a impressão
        INC BX      ;Incrementa BX
        ADD DL, 30H     ;Transforma em caractere
        MOV AH, 02      ;Imprime
        
        INT 21H
        LOOP VOLTA      ;Repete até CX ser zero
        RET     ;Retorna para MAIN
    
    IMPRESSAO ENDP
END MAIN