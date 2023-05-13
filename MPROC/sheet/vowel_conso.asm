
SYS_EXIT        equ 1
SYS_WRITE       equ 4
SYS_READ	equ 3
STDIN           equ 0
STDOUT          equ 1


%macro print_string 2
	; load the address of the string into esi
	lea	esi, [%1]

	; load the length of the string into edx
	mov	edx, %2

	mov	eax, SYS_WRITE
	mov	ebx, STDOUT
	mov	ecx, esi
	int	80h

	; printing by looping as string length cannot be passed directly
;	loop_start:
;		mov	al, [esi]
;		cmp	al, 0		; checking null terminator
;		je	loop_end
		
;		mov	ah, 0x0E
;		mov	bl, 0x07
;		int	10h
		
;		inc	esi
;		dec	ecx
;		jnz	loop_start
		
;	loop_end:
%endmacro

%macro read_string 2
	lea	esi, [%1]
	mov	edx, %2
	
	mov	eax, SYS_READ
	mov	ebx, STDIN
	mov	ecx, esi
	int	80h
%endmacro


section	.data
	strlen	dd	0
	string	db	80
	vowels	db	'AEIOUaeiou'
	
	m1	db	'Enter a string: ', 0
	m1len	equ	$ - m1
	m2	db	'The number of vowels: $'
	m2len	equ	$ - m2
	m3	db	'The number of consonents: $'
	m3len	equ	$ - m3
	
	; counter for vowels and consonents
	vow	dw 0
	con	dw 0
	
section	.bss

section	.text
	global	_start

_start:
;	print_string	m1, m1len
	
;	read_string	string, 80
	
	
	mov	esi, vowels
	mov	ecx, 0
;	jmp	len

	len:
		cmp	byte [esi+ecx], 0	; checking null terminator
		je	done

		inc	ecx
		jmp	len

	done:
		mov	dword [strlen], ecx
	
	mov	eax, SYS_WRITE
	mov	ebx, STDOUT
	mov	ecx, strlen
	mov	edx, 4
	int	80h

	;print_string	vowels, strlen
	
	call	exit

	


exit:
	mov	eax, SYS_EXIT
	xor	ebx, ebx
	int	80h
	
