INCLUDE Irvine32.inc
INCLUDE GameUtility.inc
.data 
	table BYTE 49 DUP('X')
.code 
main PROC
	MOV EBX, OFFSET table
	CALL PrintBoard
	CALL Clrscr
	exit
main ENDP
END main