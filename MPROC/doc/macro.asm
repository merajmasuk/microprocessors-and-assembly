
SYS_EXIT        equ 1
SYS_WRITE       equ 4
STDIN           equ 0
STDOUT          equ 1


%macro print_string 2
    ; load the address of the string into esi
    lea esi, [%1]

    ; load the length of the string into edx
    mov edx, %2

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, esi
    int 0x80
%endmacro


section	.data
	m1	db	'Hello world!', 0
	m1len	equ	$ - m1

section	.text
	global	_start

_start:
	print_string	m1, m1len
	
	call	exit


exit:
	mov	eax, SYS_EXIT
	xor	ebx, ebx
	int	80h
	
