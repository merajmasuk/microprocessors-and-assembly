section	.data
	prompt:	db	"Enter a string: "
	plen:	equ	$-prompt

	yes:	db	"Palindrome"
	ylen:	equ	$-yes

	no:	db	"Not palindrome"
	nlen:	equ	$-no

section	.bss
	string:	resb	16

section	.text
	global	_start

_start:
	; print prompt
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, prompt
	mov	edx, plen
	int	80h

	; input string
	mov	eax, 3
	mov	ebx, 2
	mov	ecx, string
	mov	edx, 16
	int	80h

	; iterate string
	cmp	ecx, 0
	je	check			; jumping to 'check' from here
	inc	esi
	dec	ecx
	inc	ebx

	; print input string
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, string
	mov	edx, 16
	int	80h


check:
	mov	eax, [edx]
;	mov	eah, 0
	mov	ebx, [esi-1]
	cmp	eax, ebx
	jne	not_palindrome		; jumping to 'not palindrome' from here

	mov	eax, 4
	mov	ebx, 1
	mov	ecx, yes
	mov	edx, ylen
	int	80h

	; exit
	mov	eax, 1
	int	80h



not_palindrome:
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, no
	mov	edx, nlen
	int	80h

	mov	eax, 1
	int	80h
