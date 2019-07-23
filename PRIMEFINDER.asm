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

STR_YES DW "YES $"
STR_NO DW "NO $"

.CODE 
MAIN     PROC
MOV AX,@DATA
MOV DS,AX   
INPUT_N:
MOV N,0
MOV i,2
MOV j,0
MOV Z,10
LEA DX,S1
MOV AH,9
INT 21H
MOV AH,1

WHILE_INPUT_N:
    INT 21H
    CMP AL,0DH
    JE CHECK_PRIME
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





     

CHECK_PRIME: 
     
     
    
     MOV BX,i
     
     MOV CX,2  
     MOV BH,0
     WHILE:
     
     MOV DX,0 
     MOV AX,N 
     CMP AX,2
     JE YES:
     DIV BX
     CMP DX,0
     JE L1:
     ADD BX,1 
     L2: 
     CMP BX,AX
     JLE WHILE:
     CMP BH,0
     JE YES:
     JMP NO: 
     
     
     L1:
     MOV BH,1
     ADD BX,1 
     JMP L2:
    
       
    

     
      
    
    
    
YES: 
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    LEA DX,STR_YES
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    JMP INPUT_N 
   
    
NO: 
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    LEA DX,STR_NO
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    JMP INPUT_N
        

  
ENDJ:
    MAIN ENDP 
END MAIN