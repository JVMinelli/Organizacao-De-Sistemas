TITLE ASTERISCO
.MODEL SMALL
.STACK 100h
.CODE
    MAIN PROC 

        MOV BL, 0D
        MOV CL,49D
        CMP BL,CL
    
    HORIZONTAL:

        MOV AH,2
        MOV DL,"*"
        INT 21h
        DEC CL
        JGE HORIZONTAL
    

        MOV BL,0D
        MOV CL,49D
        CMP BL,CL

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

        DEC CL

        JGE VERTICAL


        MOV AH,4Ch
        INT 21H

    MAIN ENDP
END MAIN






