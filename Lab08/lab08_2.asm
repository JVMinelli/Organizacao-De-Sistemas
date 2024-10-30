TITLE IMPRIME binario
.MODEL SMALL
.STACK 100h
.DATA
    um DB "1$"
    dois DB "0$"
.CODE
    MAIN PROC
        MOV AX,@DATA        ;Acesso às strings
        MOV DS,AX
        
        MOV BX,11111111b        ;Inicialização das variáveis
        MOV CX,0

    COMPARA:
        RCL BX,1        ;Rotaciona BX para a esquerda e compara o CF, se for 1 pula para PRINTAUM e se for zero exibe na tela o numero zero
        JC PRINTAUM
        MOV AH,9
        LEA DX, dois
        INT 21H
        INC CX
        CMP CX,16       ;Incrementa e compara o contador, se for igual a 16, pula para o final, se não repete o loop
        JNE COMPARA
        JE FIM
    PRINTAUM:
        MOV AH,9
        LEA DX, um      ;Mostra um na tela e compara CX, se for igual a 16 o codigo continua para o final, se não pula para COMPARA e repete o loop
        INT 21H
        INC CX
        CMP CX,16
        JNE COMPARA
    FIM:
        MOV AH,4ch      ;Finaliza o programa
        INT 21H
    MAIN ENDP
END MAIN
