INCLUDE Irvine32.inc
INCLUDE GameUtility.inc
INCLUDE GameLogic.inc

.data
table BYTE 49 DUP('_')
current_player BYTE "X: ", 0
move_prompt BYTE "Input the column to make your move ", 0
winning_dialogue BYTE "Winner: ", 0
col_full_msg BYTE "Column full, try again", 0
current_col DWORD ?
running DWORD 1

.code
main PROC
CALL MainLoop
exit
main ENDP

MainLoop PROC
WHILE_L1 :
CMP DWORD PTR running, 1
JNE DONE

MOV EBX, OFFSET table
CALL PrintBoard

MOV EDX, OFFSET move_prompt
MOV EBX, OFFSET current_player
MOV EDI, OFFSET current_col
CALL PromptMoveDialogue

MOV EBX, OFFSET table
MOV DL, [current_player]; DL = 'X' or 'O'
MOV EAX, current_col
CALL MakeMove; EAX = column in, EBX = board ptr, DL = player

CMP AL, 1
JNE MOVE_FAILED


; MOV EAX, OFFSET table
; CALL CheckWinCondition; AL = 'X' or 'O' or 0

; CMP AL, 'X'
; JE X_WIN
; CMP AL, 'O'
; JE O_WIN

MOV EBX, OFFSET current_player
CALL SwitchPlayer
JMP WHILE_CONTINUE

MOVE_FAILED :
MOV EDX, OFFSET col_full_msg
CALL WriteString
CALL Crlf
JMP WHILE_CONTINUE

; X_WIN:
; CALL Crlf
; MOV EDX, OFFSET winning_dialogue
; CALL WriteString
; MOV AL, 'X'
; CALL WriteChar
; CALL Crlf
; MOV DWORD PTR running, 0
; JMP WHILE_CONTINUE

; O_WIN:
; CALL Crlf
; MOV EDX, OFFSET winning_dialogue
; CALL WriteString
; MOV AL, 'O'
; CALL WriteChar
; CALL Crlf
; MOV DWORD PTR running, 0

WHILE_CONTINUE:
JMP WHILE_L1

DONE :
RET
MainLoop ENDP

END main
