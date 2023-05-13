
section	.bss
; varaibles here

section	.data
; constants here
	hello: db "Hi Mom!", 10
	helloLen: equ $-hello

section	.text
	global	_start

	_start:
		mov	rax, 1	; sys_write
		mov	rdi, 1	; stdout
		mov	rsi, hello	; message to write
		mov	rdx, helloLen	; message length
		syscall

	; end program, otherwise it would cause segm_fault
		mov	rax, 60
		mov	rdi, 0
		syscall
