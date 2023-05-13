.globl	_start	/* must be declared for linker ld */

.bss	/* declare variables here */

.data	/* declare constant here */

hello:	db "Hello, World!", 0xa	/* variable string */
len:	equ $-hello		/* string length */

.text

_start:	/* entry point for linker */
	mov	ecx, hello	/* message text */
	mov	edx, len	/* message length */
	mov	ebx, 1		/* stdout */
	mov	eax, 4		/* sys_write */
	int	0x80		/* call kernel (interrupt) */

	mov	rax, 1		/* sys_exit */
	int	0x80		/* call kernel */

/* gcc -c hello.s */
