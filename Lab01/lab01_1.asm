TITLE mensagens
.MODEL SMALL
.DATA
    MSG1 DB "Mensagem1.$"
    MSG2 DB 10,13,"MEnsagem2.$"
.CODE
    MAIN PROC
        ;Permite o acesso às variáveis definidas em .DATA
        MOV AX,@DATA
        MOV DS,AX
        ;Exibe na tela a string MSG1
        MOV AH,9
        LEA DX,MSG1
        INT 21H
        ;Exibe na tela a string MSG2
        MOV AH,9
        LEA DX,MSG2
        INT 21H
        ;Finaliza o programa
        MOV AH,4Ch
        INT 21H
    MAIN ENDP
END MAIN