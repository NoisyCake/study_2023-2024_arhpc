%include 'in_out.asm'

SECTION .data
msg: DB 'Введите значение переменной x: ',0
rem: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; ---- Ввод значения переменной x
    mov eax, msg
    call sprint
    mov ecx, x
    mov edx, 80
    call sread

    ; ---- Вычисление выражения (12𝑥 + 3)5
    mov eax, x
    call atoi
    mov ebx, 12
    imul eax, ebx
    add eax, 3
    imul eax, 5
    mov edi, eax

    ; ---- Вывод результата на экран
    mov eax, rem
    call sprint
    mov eax, edi
    call iprint
    call quit