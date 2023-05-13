section .data
	usrMsg	db	"Please enter a number: "
	lenUsrMsg equ $-usrMsg
	dispMsg	db	"You have entered: "
	lenDispMsg equ $-dispMsg


section .bss
	num	resb	5


section .text
	global	_start

_start:
	MOV	EAX, 4
	MOV	EBX, 1
	MOV	ECX, usrMsg
	MOV	EDX, lenUsrMsg
	INT	80h

	MOV	EAX, 3
	MOV	EBX, 2
	MOV	ECX, num
	MOV	EDX, 5
	INT	80h

	MOV	EAX, 4
	MOV	EBX, 1
	MOV	ECX, dispMsg
	MOV	EDX, lenDispMsg
	INT	80h

	MOV	EAX, 4
	MOV	EBX, 1
	MOV	ECX, num
	MOV	EDX, 5
	INT	80h

	MOV	EAX, 1
	MOV	EBX, 0
	INT	80h

