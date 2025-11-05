INCLUDE Irvine32.inc
INCLUDE GameUtility.inc
INCLUDE GameLogic.inc
.data 
	table BYTE 49 DUP('_')
	current_player BYTE 'X: ',0
	move_prompt BYTE "Input the column to make your move ", 0
	
.code 
main PROC
	MOV EBX, OFFSET table
	CALL PrintBoard

	MOV EDX, OFFSET move_prompt
	MOV EBX, OFFSET current_player
	CALL PromptMoveDialogue

	MOV EBX, OFFSET current_player
	CALL SwitchPlayer

	exit
main ENDP
END main