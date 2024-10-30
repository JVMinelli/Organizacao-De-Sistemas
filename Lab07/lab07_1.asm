TITLE prova
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB "Digite o dividendo:$"
    MSG2 DB "Digite o divisor:$"
    MSG3 DB "Quociente:$"
    MSG4 DB "Resto:$"

.CODE
    MAIN PROC

        MOV AX,@DATA    ;Acesso às strings
        MOV DS,AX

        MOV AH,9
        MOV DX,OFFSET MSG1  ;Mostra a string 1 na tela
        int 21h

        MOV AH,1        ;Recebe o input do usuário e armazena em AL
        INT 21h
        sub AL,30h

        MOV BL,AL       ;Armazena o conteudeo de AL em BL

        MOV AH,2
        MOV DL,10       ;Move para uma nova linha
        INT 21h

        MOV AH,2
        MOV DL,13       ;Retorna o curso para a esquerda
        INT 21h

        MOV AH,9
        LEA DX, MSG2        ;Mostra a string 2 na tela
        INT 21h

        MOV AH,1        ;Recebe o input do usuário e armazena em AL
        INT 21h
        MOV CL,AL       ;Armazena o conteudo de AL em CL
        SUB CL,30h

        MOV AH,2
        MOV DL,10       ;Move para uma nova linha
        INT 21h

        MOV AH,2
        MOV DL,13       ;Retorna o curso para a esquerda
        INT 21h

DIVISAO:
        CMP BL,CL
        JL Divisaofeita
        SUB BL,CL           ;Subtrai o divisor do dividendo, incrementa um contador que mostra quantas vezes essa operação foi feita e compara os números, se o divisor for menor que o dividendo a operação é repetida, se for maior o codigo pula para DIVISAOFEITA
        INC BH
        JMP DIVISAO
Divisaofeita:
        MOV AH,9
        LEA DX, MSG3        ;Mostra a string 3 na tela
        INT 21h

        
        add BH,30h
        MOV AH,2
        MOV DL,BH           ; Mostra o Quociente
        INT 21h

        MOV AH,2
        MOV DL,10               ;Move para uma nova linha
        INT 21h

        MOV AH,2
        MOV DL,13       ;Retorna o curso para a esquerda
        INT 21h

        MOV AH,9
        LEA DX, MSG4        ;Mostra a string 4 na tela
        INT 21h

        add BL,30h
        MOV AH,2
        MOV DL,BL           ;Mostra o resto
        INT 21h

        MOV AH,4ch      ;Finaliza o programa
        INT 21h

    MAIN ENDP
END MAIN