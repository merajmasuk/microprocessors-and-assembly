section .data
vowels db 'aeiou' ; a string of all the vowels

section .text

; input: esi = pointer to string
; output: eax = number of vowels, ebx = number of consonants
init:
    xor eax, eax ; clear eax (vowel count)
    xor ebx, ebx ; clear ebx (consonant count)

    mov edx, esi ; store string pointer in edx
    mov ecx, [edx] ; store length of string in ecx
	call iterate

; iterate through each character in the string
iterate:
    cmp ecx, 0 ; check if we have reached the end of the string
    je done ; if so, jump to done

    mov al, [esi] ; load current character into al
    inc esi ; increment string pointer
    dec ecx ; decrement string length

; check if current character is a vowel
    mov ah, 0
    mov bh, 0
    mov bl, al
    cmp bl, 'a'
    je is_vowel
    cmp bl, 'e'
    je is_vowel
    cmp bl, 'i'
    je is_vowel
    cmp bl, 'o'
    je is_vowel
    cmp bl, 'u'
    je is_vowel

; if not a vowel, increment consonant count
    inc ebx
    jmp iterate

is_vowel:
    inc eax ; increment vowel count
    jmp iterate

done:
    ret

	global	_start

_start:
	call init
