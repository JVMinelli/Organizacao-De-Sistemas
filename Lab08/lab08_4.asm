TITLE IMPRIME Hexadecimal
.MODEL SMALL
.STACK 100h
.CODE
    MAIN PROC
        MOV BX,0FFAH        ;Inicialização das variaveis
        MOV CX,4
    CONTA:
        MOV DL,BH       ;Copia BH para DL
        SHR DL,4        ;Descloca DL 4 vezes para a direita
        ADD DL,30h      ;Transforma o digito em caractere
        CMP DL,39h      ;Compara se ele é maior ou menor que 9, se for menor ou igula, pula para número
        JBE NUMERO
        ADD DL, 7       ;Adiciona 7 para transformar em letra
        MOV AH,2        
        MOV DL,DL       ;Mostra DL na tela
        INT 21h
        ROL BX,4        ;Roda BX 4 casas para a esquerda
        DEC CX
        CMP CX,0        ;Decrementa o contador e compara ele com 0, se for igual pula para FIM, se não volta para CONTA
        JNE CONTA
        JE FIM
    NUMERO:
        MOV AH,2
        MOV DL,DL       ;Mostra na tela o conteúdo de DL
        INT 21H
        ROL BX,4        ;Roda BX 4 casas para a esquerda
        DEC CX
        CMP CX,0        ;Decrementa o contador e compara ele com 0, se for igual finaliza o programa, se não ele volta para CONTA
        JNE CONTA
    FIM:
        MOV AH,4ch      ;Finaliza o programa
        INT 21H
    MAIN ENDP
END MAIN