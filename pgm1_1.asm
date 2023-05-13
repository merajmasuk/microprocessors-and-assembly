
section .bss		; variable data segment
SUM:	RESB	5	; reserve a word

section	.data		; static data segment
A:	DW	2	; declare a byte
B:	DW	5	; declare a byte

section	.text		; code segment
	global	_start	; _start function (mandatory)

_start:
; read the numbers
	MOV	AX, A
	ADD	AX, B
	MOV	SUM, AX
	MOV	BX, 1		; stdout
	MOV	AX, 4		; sys_write
; exit to DOS
	MOV	AX, 1		; sys_exit
	INT	0x80
