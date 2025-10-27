
INCLUDE Irvine32.inc

.code 
main PROC
	push EAX
	mov EAX, 23
	mov EDX, 22
	add EAX, EDX
	exit
main ENDP
END main