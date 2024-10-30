TITLE prova2
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB "Digite o multiplicando:$"
    MSG2 DB "Digite o multiplicador:$"
    MSG3 DB "Resultado:$"

.CODE
    MAIN PROC

        MOV AX,@DATA
        MOV DS,AX       ;Acesso às strings

        MOV AH,9
        MOV DX,OFFSET MSG1      ;Mostra a string 1 na tela
        int 21h

        MOV AH,1
        INT 21h     ;Recebe o input do usuário e armazena em AL
        sub AL,30h

        MOV BL,AL       ;Armazena o conteudeo de AL em BL
        MOV BH,BL       ;Armazena o conteudo de BL em BH

        MOV AH,2
        MOV DL,10   ;Move para uma nova linha
        INT 21h

        MOV AH,2
        MOV DL,13       ;Retorna o curso para a esquerda
        INT 21h

        MOV AH,9
        LEA DX, MSG2        ;Mostra a string 2 na tela
        INT 21h

        MOV AH,1
        INT 21h         ;Recebe o input do usuário e armazena em AL
        MOV CH,AL       ;Armazena o conteudo de AL em CH
        SUB CH,30h

        MOV AH,2
        MOV DL,10       ;Move para uma nova linha
        INT 21h

        MOV AH,2
        MOV DL,13       ;Retorna o curso para a esquerda
        INT 21h

        MOV BH,0        ;Inicializa BH como 0

MULTIPLICACAO:
        ADD BH,BL
        DEC CH          ;Soma BL em BH, decrementa o contador CH e compara ele com 0, se não for 0, ele repete a operação, se for ele continua
        CMP CH,0
        JNE MULTIPLICACAO

        
        
MULTIPLICACAOFEITA:
        MOV AH,9
        LEA DX, MSG3        ;Mostra a string 3 na tela
        INT 21h

        
        add BH,30h
        MOV AH,2
        MOV DL,BH       ;Mostra o resultado
        INT 21h

        MOV AH,4ch      ;Finaliza o programa
        INT 21h

    MAIN ENDP
END MAIN