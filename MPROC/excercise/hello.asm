global	_start	; must be declared for linker ld

section	.bss	; declare variables here

section	.data	; declare constant here

hello:	db "Hello, World!", 0xa	; variable string
len:	equ $ - hello		; string length

section	.text

_start:	; entry point for linker
	mov	ecx, hello	; message text
	mov	edx, len	; message length
	mov	ebx, 1		; stdout
	mov	eax, 4		; sys_write
	int	0x80		; call kernel (interrupt)

	mov	eax, 1		; sys_exit
	int	0x80		; call kernel

; nasm -f elf64 hello.asm
; ld hello.o -o hello.out
; ./hello.out

