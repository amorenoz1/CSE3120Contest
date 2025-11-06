INCLUDE Irvine32.inc
INCLUDE GameUtility.inc
INCLUDE GameLogic.inc
.data 
	table BYTE 49 DUP('_')
	current_player BYTE "X: ",0
	move_prompt BYTE "Input the column to make your move ", 0
	winning_dialogue BYTE "Winner: ",0
	running DWORD 1
.code 
main PROC
	CALL MainLoop
	exit
main ENDP
END main

MainLoop PROC
WHILE_L1:
	CMP running, 1
	JNE DONE
	
	MOV EBX, OFFSET table
	CALL PrintBoard

	MOV EDX, OFFSET move_prompt
	MOV EBX, OFFSET current_player
	CALL PromptMoveDialogue

	MOV EBX, OFFSET current_player
	CALL SwitchPlayer

	MOV EAX, OFFSET table
	CALL CheckWinCondition
	
	CMP AL, 'X'
	JE X_WIN
	CMP AL, 'O'
	JE O_WIN
	JMP NOT_WIN

X_WIN:
	CALL Crlf
	MOV EDX, OFFSET winning_dialogue
	CALL WriteString
	MOV AL, 'X'
	CALL WriteChar
	MOV running, 0
O_WIN:
	CALL Crlf
	MOV EDX, OFFSET winning_dialogue
	CALL WriteString
	MOV AL, 'O'
	CALL WriteChar
	MOV running, 0
NOT_WIN:

    JMP WHILE_L1
DONE:

MainLoop ENDP