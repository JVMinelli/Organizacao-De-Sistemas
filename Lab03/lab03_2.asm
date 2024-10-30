TITLE Numero
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB "Digite um caractere:$"
    SIM DB 10,13,"O caractere digitado e um numero.$"
    LETRA DB 10,13,"O caractere digitado e uma letra.$"
    NAO DB 10,13,"O caractere digitado e um caractere desconhecido.$"
.CODE
    MAIN PROC
    ;Permite o acesso às variáveis definidas em .DATA
    MOV AX,@DATA
    MOV DS,AX

    ;Exibe na tela a string MSG1("Digite um caractere:")
    MOV AH,9
    MOV DX,OFFSET MSG1
    INT 21h

    ;Lê um caractere do teclado e salva o caractere lido em AL
    MOV AH,1
    INT 21h

    ;Copia o caractere lido para BL
    MOV BL,AL

    ;Compara o caractere em BL com o valor 48 (código ASCII do caractere 0)
    CMP BL, 48

    ;Se o caractere em BL for menor que 48("0"), salta para o rótulo NAOENUMERO
    JB LETRAMAIUSCULA

    ;Compara o caractere em BL com valor 57 ("9")
    CMP BL,57

    ;Se o caractere em BL for maior que 57 ("9"), salta para o rótulo NAOENUMERO
    JA LETRAMAIUSCULA

    ;Se chegou até aqui, exibe na tela dizendo que o caractere é um numero
    MOV AH,9
    MOV DX,OFFSET SIM
    INT 21h

    ;Salta para o rótulo FIM
    JMP FIM

    ;Define o rótulo LETRA MAIUSCULA
LETRAMAIUSCULA:

    ;Compara BL com 65 ("A")
    CMP BL,65

    ;Se o caractere BL possuir codigo decimal menor que 65(A), salta para o rótulo DESCONEHCIDO
    JB DESCONHECIDO

    ;Compara BL com 90 ("Z")
    CMP BL,90 

    ;Se o caractere BL possuir codigo decimal maior que 90(Z), salta para o rótulo MINUSCULA
    JA MINUSCULA

    ;Se chegou até aqui, exibe na tela dizendo que o caractere é uma letra maiuscula
    MOV AH,9
    MOV DX,OFFSET LETRA
    INT 21h

    ;Salta para o rótulo FIM
    JMP FIM

    ;Define o rótulo MINUSCULA
MINUSCULA:

    ;Compara BL com 97 ("a")
    CMP BL,97

    ;Se o caractere BL possuir codigo decimal menor que 97("a"), salta para o rótulo DESCONHECIDO
    JB DESCONHECIDO

    ;Compara BL com 122 ("z")
    CMP BL,122

    ;Se o caractere BL possuir codigo decimal menor que 122("z"), salta para o rótulo DESCONHECIDO
    JA DESCONHECIDO

    ;Se chegou até aqui, exibe na tela dizendo que o caractere é uma letra minuscula
    MOV AH,9
    MOV DX,OFFSET LETRA
    INT 21h

    ;Salta para o rótulo FIM
    JMP FIM


;Define o rótulo DESCONHECIDO
DESCONHECIDO:

    MOV AH,9
    MOV DX,OFFSET NAO
    INT 21h
;Define o rótulo FIM
FIM:
    ;Finaliza o programa
    MOV AH,4ch
    INT 21h
END MAIN