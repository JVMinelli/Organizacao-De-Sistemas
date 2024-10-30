TITLE IMPRIME MATRIZ
.MODEL SMALL
.STACK 100H
pula_linha MACRO        ;Macro para pular linha
    PUSH AX
    PUSH DX
    MOV AH,02
    MOV DL,10
    INT 21H
    POP DX
    POP AX
ENDM
.DATA
    MATRIZ4X4 DB 1,2,3,4
    DB 4,3,2,1
    DB 5,6,7,8
    DB 8,7,6,5
.CODE
    MAIN PROC
        MOV AX,@DATA        ;Acesso ás variáveis
        MOV DS,AX
        XOR BX,BX
        XOR SI,SI
        CALL IMPRIMIR       ;Chama o procedimento imprimir
        MOV AH,4CH
        INT 21H     ;finaliza o programa
MAIN ENDP

    IMPRIMIR PROC
        MOV CX,4
        IMP:
        MOV AH,02
        MOV DL,MATRIZ4X4[BX][SI]        ;Move o conteudo da matriz[bx][si] para al
        ADD DL,30H      ;transforma em caractere
        INT 21H
        INC SI      ;incrementa si
        LOOP IMP        ;faz o loop 4 vezes
        PULALINHA:
        pula_linha      ;chama o macro para pular linha
        ADD BX,4        ;coloca bx para apontar para a segunda linha
        CMP BX,16       ;compara com 16, se for igual finaliza, se não reinicia o contador e refaz o loop na prox linha
        JE FIM
        MOV CX,4
        XOR SI,SI
        JMP IMP
        FIM:
        RET     ;retorna para main
    IMPRIMIR ENDP
END MAIN

    