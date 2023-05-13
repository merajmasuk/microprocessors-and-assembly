
section	.data
	userMsg		db	"Please enter a number: "
	lenUserMsg	equ	$-userMsg

	dispMsg		db	"You have entered: "
	lenDispMsg	equ	$-dispMsg

section	.bss
	num	resb	5

section	.text
	global	_start

_start:
	mov	eax, 4	; sys_read
	mov	ebx, 1	; stdout
	mov	ecx, userMsg
	mov	edx, lenUserMsg
	int	80h

	mov	eax, 3	; sys_write
	mov	ebx, 2	; stdin
	mov	ecx, num
	mov	edx, 5
	int	80h

	mov	eax, 4
	mov	ebx, 1
	mov	ecx, dispMsg
	mov	edx, lenDispMsg
	int	80h

	mov	eax, 4
	mov	ebx, 1
	mov	ecx, num
	mov	edx, 5
	int	80h

	mov	eax, 1	; sys_exit
	mov	ebx, 0
	int	80h

