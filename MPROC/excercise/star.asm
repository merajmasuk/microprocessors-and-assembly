
SECTION	.text
	global	_start

_start:
	MOV	EDX, 9
	MOV	ECX, stars
	MOV	EBX, 1
	MOV	EAX, 4
	INT	0x80

	MOV	EAX, 1
	INT	0x80

SECTION	.data
	stars	TIMES 9 DB "*"
