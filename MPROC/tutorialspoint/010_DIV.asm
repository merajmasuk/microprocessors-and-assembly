
section	.text
	global	_start

_start:
	mov	ax, '8'
	sub	ax, '0'
	mov	bl, '2'
	sub	bl, '0'
	div	bl
	add	ax, '0'
	mov	[res], ax

	mov	edx, len
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4
	int	80h

	mov	edx, 1
	mov	ecx, res
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
