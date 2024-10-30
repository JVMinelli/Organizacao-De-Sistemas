TITLE Soma
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB "Digite um caractere:$"
    MSG2 DB "Seus caracteres somados e igual a:$"
.CODE
    MAIN PROC
    
        MOV AX,@DATA
        MOV DS,AX

        MOV CX,5
    NUMEROS:
        
        MOV AH,9
        MOV DX,OFFSET MSG1
        INT 21h
        
        MOV AH,1
        INT 21h

        MOV BL,AL
        SUB BL,30h
        ADD BH,BL
        loop NUMEROS

        MOV AH,2
        MOV DL,10 
        INT 21H

        MOV AH,2
        MOV DL,13 
        INT 21H

        MOV AH,9
        MOV DX,OFFSET MSG2
        INT 21h

        ADD BH,30h
        MOV AH,2
        MOV DL,BH
        INT 21H

        MOV AH,4Ch
        INT 21H


    MAIN ENDP
END MAIN