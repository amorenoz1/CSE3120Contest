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

PUBLIC CheckWinCondition
CheckWinCondition PROC USES EDX ECX EAX EBX ESI EDI
    MOV ECX, 0
    XOR EDX, EDX
    MOV EBX, 7
    MOV EDI, EAX

CheckNextCell :
    MOVZX EDX, BYTE PTR[EDI + ECX]
    CMP DL, 'X'
    JE CheckDirections
    CMP DL, 'O'
    JNE SkipCell

CheckDirections :
    PUSH ECX
    PUSH EDX

    MOV ESI, 0
    CALL CheckDirection
    TEST AL, AL
    JNZ FoundWinner

    MOV ESI, 1
    CALL CheckDirection
    TEST AL, AL
    JNZ FoundWinner

    MOV ESI, 2
    CALL CheckDirection
    TEST AL, AL
    JNZ FoundWinner

    MOV ESI, 3
    CALL CheckDirection
    TEST AL, AL
    JNZ FoundWinner

    POP EDX
    POP ECX

SkipCell :
    INC ECX
    CMP ECX, 49
    JL CheckNextCell

    XOR AL, AL
    RET

FoundWinner :
    POP EDX
    POP ECX
    MOV AL, DL
    RET

CheckDirection :
    PUSH EBX
    PUSH EDI
    MOV EAX, 1

NextStep :
    MOV EBX, ECX
    CMP ESI, 0
    JE HorzDir
    CMP ESI, 1
    JE VertDir
    CMP ESI, 2
    JE DiagDown
    CMP ESI, 3
    JE DiagUp

HorzDir :
    ADD EBX, 1
    JMP DirContinue

VertDir :
    ADD EBX, 7
    JMP DirContinue

DiagDown :
    ADD EBX, 8
    JMP DirContinue

DiagUp :
    SUB EBX, 6

DirContinue :
    CMP EBX, 49
    JAE NoWin
    MOV AH, BYTE PTR[EDI + EBX]
    CMP AH, DL
    JNE NoWin
    INC EAX
    CMP EAX, 4
    JE Win
    MOV ECX, EBX
    JMP NextStep

NoWin :
    XOR AL, AL
    POP EDI
    POP EBX
    RET

Win :
    MOV AL, 1
    POP EDI
    POP EBX
    RET

CheckWinCondition ENDP
        

        END
