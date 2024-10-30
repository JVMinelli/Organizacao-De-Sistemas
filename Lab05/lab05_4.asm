TITLE 4letras
.MODEL SMALL
.STACK 100h
.CODE
    MAIN PROC

        MOV CX,26
        MOV DL,61h
        MOV BL,4
        CMP BL,0
    
    LOOPGERAL:
        MOV CX,4
        CMP BL,0
        
    LOOP1:
        CMP DL,7Bh
        JE FIM
        MOV AH,2
        INT 21H
        INC DL
        DEC BL
        loop LOOP1

    QUATRO:    
        
        MOV AH,2
        MOV BL,DL
        MOV DL,10 
        INT 21H
        MOV DL,BL

        MOV AH,2
        MOV BL,DL
        MOV DL,13 
        INT 21H
        MOV DL,BL
        JGE LOOPGERAL
    FIM:    
        MOV AH,4Ch
        INT 21H


    MAIN ENDP
END MAIN