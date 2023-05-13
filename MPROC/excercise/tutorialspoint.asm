
section .text
	global	_start

_start:
	mov	edx, len
	mov	ecx, msg
	mov	ebx, 1		; stdout
	mov	eax, 4		; sys_write
	int	0x80

	mov	edx, 9
	mov	ecx, s2
	mov	ebx, 1		; stdout
	mov	eax, 4		; sys_write
	int	0x80

	mov	ecx, nl
	mov	ebx, 1
	mov	eax, 4
	int	0x80

	mov	eax, 1		; sys_exit
	int	0x80

section .data

msg	db	'Displaying 9 stars', 0xa
len	equ	$ - msg		; length of msg
s2	times	9 db '*'
nl	db	0xa
