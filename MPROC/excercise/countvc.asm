
SYS_EXIT	equ 1
SYS_WRITE	equ 4
STDIN		equ 0
STDOUT		equ 1

section	.text
	global	_start

; esi - source index
; eax - counts vowels
; ebx - counts consonents

_start:
	xor	eax, eax	; clear eax
	xor	ebx, ebx	; clear ebx

	mov	edx, esi
	mov	ecx, [edx]	; store edx length

	mov	eax, 1
	int	80h

loop:
	cmp	ecx, 0		; check if end of string
	je	exit

	mov	al, [esi]	; load char from current index
	inc	esi		; go to next char
	dec	ecx		; reduce length

	; checking if current char vowel
	mov	ah, 0
	mov	bh, 0
	mov	bl, al


	cmp	bl, 'a'
	je	is_vowel
	cmp	bl, 'e'
	je	is_vowel
	cmp	bl, 'i'
	je	is_vowel
	cmp	bl, 'o'
	je	is_vowel
	cmp	bl, 'u'
	je	is_vowel
	cmp	bl, 'A'
	je	is_vowel
	cmp	bl, 'E'
	je	is_vowel
	cmp	bl, 'I'
	je	is_vowel
	cmp	bl, 'O'
	je	is_vowel
	cmp	bl, 'U'
	je	is_vowel

	je	is_conso	; if not a/e/i/o/u then must be a conso

is_vowel:
	inc	eax		; increments vowel count
	jmp	loop

is_conso:
	inc	ebx		; increments conso count
	jmp	loop

