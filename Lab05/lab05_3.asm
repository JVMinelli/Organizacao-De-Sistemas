TITLE MinusMaius
.MODEL SMALL
.STACK 100h
.CODE
    MAIN PROC

        MOV CX,26
        MOV DL,41H
        
    MAIUSCULA:
        
        MOV AH,2
        INT 21H
        INC DL
        loop MAIUSCULA

        
    
        MOV AH,2
        MOV DL,10 
        INT 21H


        MOV AH,2
        MOV DL,13 
        INT 21H


        MOV CX,26
        MOV DL,61H
    
    MINUSCULA:

        MOV AH,2
        INT 21h
        INC DL
        loop MINUSCULA


        MOV AH,4Ch
        INT 21H

        

    MAIN ENDP
END MAIN