TITLE LEREIMPRIMIR
.MODEL SMALL
.STACK 100H
.DATA
    VETOR DB 7 DUP(?)
    MSG1 DB 'Insira o vetor: $'
    MSG2 DB 'Seu vetor invertido é: $'
.CODE
    MAIN PROC
        MOV AX,@DATA        ;Acesso ás variáveis
        MOV DS,AX
        MOV AH,9
        LEA DX,MSG1     ;Imprime a string 1
        INT 21H
        XOR SI,SI       ;Zera SI
        XOR BX,BX       ;Zera BX
        XOR DI,DI       ;Zera DI
        MOV CX, 7       ;Coloca 7 em CX
        LEA BX, VETOR       ;Tranforma BX em ponteiro do VETOR
        CALL LER        ;Chama o procedimento LER
        MOV CX,3        ;Coloca 3 em CX
        CALL INVERTER       ;Chama o procedimento INVERTER
        CALL IMPRIMIR       ;Chama o procedimento IMPRIMIR

        MOV AH,4CH      ;Finaliza o programa
        INT 21H
    
    MAIN ENDP

    LER PROC
        LEITURA:
        MOV AH,1        ;Recebe um caractere e armazena em AL
        INT 21H
        MOV [BX], AL        ;Coloca o caractere no vetor na posição BX
        INC BX      ;Incrementa BX
        LOOP LEITURA        ;Repete até CX ser 0
    RET     ;Retorna para MAIN
    LER ENDP

    INVERTER PROC
        XOR BX,BX       ;Zera BX
        MOV BX, 6       ;Coloca 6 em BX
        INVER:
        MOV AL,[BX]     ;Move o caractere da posição BX do vetor para AL
        MOV AH,[SI]     ;Move o caractere da posição SI do vetor para AH
        MOV [BX],AH     ;Coloca AH na posição BX do vetor
        MOV [SI],AL     ;Coloca AL na posição SI do vetor
        DEC BX      ;Decrementa BX
        INC SI      ;Incrementa SI
        LOOP INVER      ;Repete até que CX seja 0
    RET     ;Retorna para MAIN
    INVERTER ENDP

    IMPRIMIR PROC
        XOR BX,BX       ;Zera BX
        LEA BX,VETOR    ;Transforma BX em ponteiro do vetor
        MOV CX,7        ;Coloca 7 em CX
        IMPRESSAO:
        MOV AH, 2
        MOV DL,[BX]     ;Imprime o caractere da posição BX
        INC BX      ;Incrementa BX
        INT 21H
        LOOP IMPRESSAO      ;Repete até CX ser 0
    RET
    IMPRIMIR ENDP
END MAIN


        

