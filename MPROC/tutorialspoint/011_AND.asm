section	.text
	global	_start

_start:
	mov	ax, 8h
	and	ax, 1
	jz	even

	mov	eax, 4
	mov	ebx, 1
	mov	ecx, odd_msg
	mov	edx, len2
	int	80h

	jmp outprog

even:
	mov	ah, 9h
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, even_msg
	mov	edx, len1
	int	80h

outprog:
	mov	eax, 1
	int	80h

section	.data
	even_msg	db	"Even"
	len1		equ	$-even_msg

	odd_msg		db	"Odd"
	len2		equ	$-odd_msg
