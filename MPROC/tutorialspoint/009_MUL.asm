section	.text
	global	_start

_start:
	mov	al, '3'
	sub	al, '0'
	mov	bl, '2'
	sub	bl, '0'
	mul	bl
	add	al, '0'
	mov	[res], al

	mov	ecx, msg
	mov	edx, len
	mov	ebx, 1
	mov	eax, 4
	int	80h

	mov	ecx, res
	mov	edx, 1
	mov	ebx, 1
	mov	eax, 4
	int	80h

	mov	eax, 1
	int	80h

section	.data
	msg	db	"The result is: ", 0xA, 0xD
	len	equ	$-msg

section	.bss
	res	resb	1
