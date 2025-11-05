INCLUDE Irvine32.inc
INCLUDE GameLogic.inc

.code

PUBLIC SwitchPlayer

SwitchPlayer PROC USES EBX EAX
MOV EAX, [EBX]
CMP EAX, 'X'
JZ IF_1
MOV EAX, 'X'
IF_1:
MOV EAX, 'O'
MOV[EBX], EAX
RET
SwitchPlayer ENDP

END