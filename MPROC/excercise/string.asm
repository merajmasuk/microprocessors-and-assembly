section .data
buf db 128 ; allocate 128 bytes for the string buffer

section .text

; input: eax = maximum string length
; output: eax = number of characters read
get_string:
    xor eax, eax ; clear eax (string length)
    mov edx, eax ; store maximum length in edx
    mov ecx, offset buf ; store address of buffer in ecx
    mov ebx, 0 ; stdin (file descriptor)
    mov eax, 3 ; sys_read system call
    int 0x80 ; invoke system call

    ret

; input: eax = string length
; output: none
print_string:
    mov edx, eax ; store string length in edx
    mov ecx, offset buf ; store address of buffer in ecx
    mov ebx, 1 ; stdout (file descriptor)
    mov eax, 4 ; sys_write system call
    int 0x80 ; invoke system call

    ret

section .text

global _start
_start:
    mov eax, 128 ; maximum string length
    call get_string ; read input from user
    mov edi, eax ; store string length in edi
    call print_string ; print string to screen
    mov eax, 1 ; sys_exit system call
    xor ebx, ebx ; exit status (0)
    int 0x80 ; invoke system call
