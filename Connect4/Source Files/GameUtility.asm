INCLUDE Irvine32.inc
INCLUDE GameUtility.inc

.code
PUBLIC PrintBoard

PrintBoard PROC USES EBX ECX EDX EAX
MOV ECX, 0

PRINTLOOP:
	MOV AL, [EBX + ECX]
	CALL WriteChar
	INC ECX
	CMP ECX, 49
	JAE DONE

	MOV EAX, ECX
	XOR EDX, EDX
	MOV ESI, 7
	DIV ESI
	CMP EDX, 0
	JNE PRINTLOOP
	CALL Crlf
	JMP PRINTLOOP

DONE :
	RET
PrintBoard ENDP

PUBLIC PromptMoveDialogue

PromptMoveDialogue PROC USES EAX EDX EBX
	CALL Crlf

	CALL WriteString

	MOV EDX, EBX
	CALL WriteString

	CALL ReadInt	

	RET

PromptMoveDialogue ENDP

END

