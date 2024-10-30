.MODEL SMALL
.DATA
VETOR DB 1, 1, 1, 2, 2, 2
.CODE
    MAIN PROC
        
        MOV AX, @DATA       ;Acesso ás variáveis
        MOV DS,AX
        XOR DL, DL      ;Zera DL
        MOV CX,6        ;Inicializa o contador como CX
        LEA BX, VETOR       ;Transforma BX em ponteiro do vetor 
        
        CALL IMPRESSAO      ;Chama o procedimento IMPRESSAO
        
        MOV AH,4CH      ;Finaliza o programa
        INT 21H ;saida para o DOS
    
    MAIN ENDP
    
    IMPRESSAO PROC
    
        VOLTA:
        MOV DL, [BX]    ;Coloca o valor que BX aponta em DL para a impressão
        INC BX      ;Incrementa BX
        ADD DL, 30H     ;Transforma em caractere
        MOV AH, 02      ;Imprime
        
        INT 21H
        LOOP VOLTA      ;Repete até CX ser zero
        RET     ;Retorna para MAIN
    
    IMPRESSAO ENDP

    END MAIN