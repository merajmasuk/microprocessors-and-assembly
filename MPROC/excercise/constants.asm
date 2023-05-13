
SYS_EXIT	EQU 1
SYS_WRITE	EQU 4
STDIN		EQU 0
STDOUT		EQU 1

SECTION	.text
	GLOBAL	_start

_start:
	MOV	EAX, SYS_WRITE
	MOV	EBX, STDOUT
	MOV	ECX, msg1
	MOV	EDX, len1
	INT	80h

	MOV	EAX, SYS_WRITE
	MOV	EBX, STDOUT
	MOV	ECX, msg2
	MOV	EDX, len2
	INT	80h

	MOV	EAX, SYS_WRITE
	MOV	EBX, STDOUT
	MOV	ECX, msg3
	MOV	EDX, len3
	INT	80h

	MOV	EAX, SYS_EXIT
	INT	80h

SECTION	.data
	msg1	DB	"Hello world!", 0xA, 0xD
	len1	EQU	$-msg1

	msg2	DB	"Welcome to", 0xA, 0XD
	len2	EQU	$-msg2

	msg3	DB	"NASM\n"
	len3	EQU	$-msg3
