; Exercise 1 - Assembly Lab Welcome Board
; Build: nasm -f elf32 exercise_1_welcome_board.asm -o exercise_1_welcome_board.o
;        ld -m elf_i386 -o exercise_1_welcome_board exercise_1_welcome_board.o

section .data
    line1 db 'Assembly Laboratory', 0xA
    line1_len equ $ - line1
    line2 db 'Mode: NASM 32-bit', 0xA
    line2_len equ $ - line2
    line3 db 'Status: Ready', 0xA
    line3_len equ $ - line3

section .text
    global _start

_start:
    mov eax, 4                  ; SYS_WRITE
    mov ebx, 1                  ; standard output
    mov ecx, line1
    mov edx, line1_len
    int 0x80

    mov eax, 4                  ; SYS_WRITE
    mov ebx, 1
    mov ecx, line2
    mov edx, line2_len
    int 0x80

    mov eax, 4                  ; SYS_WRITE
    mov ebx, 1
    mov ecx, line3
    mov edx, line3_len
    int 0x80

    mov eax, 1                  ; SYS_EXIT
    xor ebx, ebx                ; exit status 0
    int 0x80
