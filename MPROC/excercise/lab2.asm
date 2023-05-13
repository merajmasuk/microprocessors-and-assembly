.model small
.stack 100h
.data 
    a db 'Enter a char: $'
    b db 'Output: $'
    c db 9
.code

main proc
    
    ;mov dl,ah
;    mov ah,2
;    mov dl,0ah
;    int 21h
;    mov ah,21
    
    LEA DX,a
    mov ah,9
    int 21h
    mov c,al  
    
    mov ah,1
    int 21h
    mov dl,al
    mov ah,2
    int 21h
    
    main endp
end main
 
