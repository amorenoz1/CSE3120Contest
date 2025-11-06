INCLUDE Irvine32.inc
INCLUDE GameLogic.inc

.code

PUBLIC SwitchPlayer

SwitchPlayer PROC USES EAX EBX
MOV     AL, BYTE PTR[EBX]
XOR     AL, 17h
MOV     BYTE PTR[EBX], AL
RET
SwitchPlayer ENDP

PUBLIC CheckWinCondition

; not implemented yet
CheckWinCondition PROC USES EBX ECX EDX ESI
NOP
CheckWinCondition ENDP

PUBLIC MakeMove

MakeMove PROC USES ECX ESI
MOV     ECX, 6; start from bottom row

CheckRow :
    MOV     ESI, ECX
        IMUL    ESI, 7
        ADD     ESI, EAX; add column
        CMP     BYTE PTR[EBX + ESI], '_'
        JE      PlacePiece

        DEC     ECX
        CMP     ECX, -1
        JG      CheckRow

        XOR     AL, AL
        RET

        PlacePiece :
    MOV     BYTE PTR[EBX + ESI], DL
        MOV     AL, 1
        RET
        MakeMove ENDP

END
