section	.data
	prompt:	db	"Enter a positive integer: "
	plen:	equ	$-prompt

	fac:	db	"Factorial of "
	faclen:	equ	$-fac

	is:	db	" is: "
	islen:	equ	$-is

	N:	db	"4"

section	.bss
;	N:	resb	4
	sum:	db	?

section	.text
	global	_start

_start:
; print prompt
;	mov	eax, 4
;	mov	ebx, 1
;	mov	ecx, prompt
;	mov	edx, plen
;	int	80h

; input	N
;	mov	eax, 3
;	mov	ebx, 2
;	mov	ecx, N
;	mov	edx, 4
;	int	80h

	mov	eax, [N]
	sub	eax, '0'
	add	eax, eax
	add	eax, '0'
	mov	[sum], eax
	int	80h

; print sum
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, sum
	mov	edx, 2
	int	80h

; exit
	mov	eax, 1
	int	80h
