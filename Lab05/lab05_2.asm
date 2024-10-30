TITLE ASTERISCO
.MODEL SMALL
.STACK 100h
.CODE
    MAIN PROC 
    
    MOV CX,50D
    HORIZONTAL:
        MOV AH,2
        MOV DL,"*"
        INT 21h
        loop HORIZONTAL
    

        MOV BL,0D
        MOV CL,49D
        CMP BL,CL
        
        MOV CX,50D

    VERTICAL:

        MOV AH,2
        MOV DL,10 
        INT 21H


        MOV AH,2
        MOV DL,13 
        INT 21H
    
    
    
    
        MOV AH,2
        MOV DL,"*"
        INT 21H


        loop VERTICAL


        MOV AH,4Ch
        INT 21H

    MAIN ENDP
END MAIN