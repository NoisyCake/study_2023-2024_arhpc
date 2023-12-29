%include 'in_out.asm'

SECTION .data
    filename db 'name.txt', 0h
    prompt db 'Как вас зовут? ', 0h
    intro_msg db 'Меня зовут ', 0h
SECTION .bss
    name resb 255
SECTION .text
    global _start

_start:
    mov eax, prompt
    call sprint

    mov ecx, name
    mov edx, 255
    call sread

    mov ecx, 0777o
    mov ebx, filename
    mov eax, 8
    int 80h
    
    mov ecx, 2
    mov ebx, filename
    mov eax, 5
    int 80h
    
    mov esi, eax
    mov eax, intro_msg
    call slen
    
    mov edx, eax
    mov ecx, intro_msg
    mov ebx, esi
    mov eax, 4
    int 80h
    
    mov eax, name
    call slen
    
    mov edx, eax
    mov ecx, name
    mov ebx, esi
    mov eax, 4
    int 80h

    mov ebx, esi
    mov eax, 6
    int 80h

    call quit