section	.data
	prompt:	db	"Enter a string: "
	plen:	equ	$-prompt

	con:	db	"Consonants: "
	conlen:	equ	$-con

	vow:	db	" and Vowels: "
	vowlen:	equ	$-vow


section	.text
	global	_start

_start:
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, prompt
	mov	edx, plen
	int	80h

	

	mov	eax, 1
	int	80h
