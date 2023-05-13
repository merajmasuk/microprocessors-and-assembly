
section	.data
	userMsg	DB	"Please enter a number: "
	lenUserMsg	EQU $-userMsg
	dispMsg	DB	"You have entered: "
	lenDispMsg	EQU $-dispMsg

section	.bss
	num	RESB	5

section	.text
	global	_start

_start:
	; printf("%s", userMsg)
	MOV	EAX, 4		; sys_write
	MOV	EBX, 1		; stdout
	MOV	ECX, userMsg
	MOV	EDX, lenUserMsg
	INT	80h

	; scanf("%d", &num)
	MOV	EAX, 3		; sys_read
	MOV	EBX, 2		; stdin
	MOV	ECX, num
	MOV	EDX, 5		; how many bytes
	INT	80h

	MOV	EAX, 4		; sys_write
	MOV	EBX, 1		; stdout
	MOV	ECX, dispMsg
	MOV	EDX, lenDispMsg
	INT	80h

	MOV	EAX, 4		; sys_write
	MOV	EBX, 1		; stdout
	MOV	ECX, num
	MOV	EDX, 5
	INT	80h

	MOV	EAX, 1		; sys_exit
	MOV	EBX, 0
	INT	80h
