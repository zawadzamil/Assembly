.MODEL SMALL
.STACK 100H
.DATA
N DW ?
M DW ?
Z DW ?
i DW ?
j DW ?
X DW ?
Y DW ?
GCD DW ?  

C DW ?
S1 DW "ENTER YOUR FIRST NUMBER : $"
S2 DW "ENTER YOUR SECOND NUMBER : $"
S3 DW "GCD RESULT : $"        

.CODE 
MAIN     PROC
MOV AX,@DATA
MOV DS,AX   
INPUT_N:
MOV N,0
MOV i,1
MOV GCD,0
MOV Z,10 
MOV C,0
LEA DX,S1
MOV AH,9
INT 21H
MOV AH,1

WHILE_INPUT_N:
    INT 21H
    CMP AL,0DH
    JE INPUT_M
    SUB AL,48
    MOV BL,AL 
    MOV AX,N
    IMUL Z
    MOV DX,AX
    MOV AL,BL
    AND AX,00FFH  
    ADD DX,AX
    MOV N,DX 
    MOV AH,1
    JMP WHILE_INPUT_N 

INPUT_M:
MOV M,0

MOV  AH,2           
MOV  DL,0DH         
INT  21H           
MOV  DL,0AH        
INT  21H            
LEA DX,S2
MOV AH,9
INT 21H
MOV AH,1

WHILE_INPUT_M:

    CMP N,0
    JE  ENDJ
    INT 21H
    
    CMP AL,0DH
    JE CALCULATE_GCD
    SUB AL,48
    MOV BL,AL 
    MOV AX,M
    IMUL Z
    MOV DX,AX
    MOV AL,BL
    AND AX,00FFH  
    ADD DX,AX
    MOV M,DX 
    MOV AH,1
    JMP WHILE_INPUT_M 
    
    

     

CALCULATE_GCD: 


         MOV AX,N  
         MOV BX,M 
         WHILE:
         XOR DX,DX
         DIV BX
         CMP DX,0
         JE L1:
         XCHG AX,BX
         XCHG BX,DX
         JMP WHILE:
         
         L1:
         MOV GCD,BX
         
   
    
PRINT_GCD: 
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    LEA DX,S3
    MOV AH,9
    INT 21H
    MOV C,0
    
    PRINT1:
        MOV GCD,BX
        MOV AX,GCD
        CMP AX,10000
        JL PRINTDIGIT1
        SUB AX,10000
        MOV GCD,AX
        INC C
        JMP PRINT1
    
    PRINTDIGIT1:
        MOV AH,2
        MOV BX,C
        ADD BX,48
        MOV DL,BL
        INT 21H
    
    MOV C,0
    
    PRINT2:
        MOV AX,GCD
        CMP AX,1000
        JL PRINTDIGIT2
        SUB AX,1000
        MOV GCD,AX
        INC C
        JMP PRINT2
    
    PRINTDIGIT2:
        MOV AH,2
        MOV BX,C
        ADD BX,48
        MOV DL,BL
        INT 21H
    
    MOV C,0
    
    PRINT3:
        MOV AX,GCD
        CMP AX,100
        JL PRINTDIGIT3
        SUB AX,100
        MOV GCD,AX
        INC C
        JMP PRINT3
    
    PRINTDIGIT3:
        MOV AH,2
        MOV BX,C
        ADD BX,48
        MOV DL,BL
        INT 21H
    
    MOV C,0
    
    PRINT4:
        MOV AX,GCD
        CMP AX,10
        JL PRINTDIGIT4
        SUB AX,10
        MOV GCD,AX
        INC C
        JMP PRINT4
    
    PRINTDIGIT4:
        MOV AH,2
        MOV BX,C
        ADD BX,48
        MOV DL,BL
        INT 21H
    
    MOV C,0
    
    PRINT5:
        MOV AX,GCD
        CMP AX,0
        JE PRINTDIGIT5
        SUB AX,1
        MOV GCD,AX
        INC C
        JMP PRINT5
    
    PRINTDIGIT5:
        MOV AH,2
        MOV BX,C
        ADD BX,48
        MOV DL,BL
        INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    JMP INPUT_N
        

  JMP INPUT_N
ENDJ:
    MAIN ENDP 
END MAIN

