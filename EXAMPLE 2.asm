; Exercise 2 - Toolchain Status Screen

section .data
    assembler_msg db 'Assembler ready', 0xA
    assembler_len equ $ - assembler_msg
    linker_msg db 'Linker ready', 0xA
    linker_len equ $ - linker_msg
    program_msg db 'Program ready', 0xA
    program_len equ $ - program_msg

section .text
    global _start

_start:
    mov eax, 4                  ; SYS_WRITE
    mov ebx, 1
    mov ecx, assembler_msg
    mov edx, assembler_len
    int 0x80

    mov eax, 4                  ; SYS_WRITE
    mov ebx, 1
    mov ecx, linker_msg
    mov edx, linker_len
    int 0x80

    mov eax, 4                  ; SYS_WRITE
    mov ebx, 1
    mov ecx, program_msg
    mov edx, program_len
    int 0x80

    mov eax, 1                  ; SYS_EXIT
    xor ebx, ebx
    int 0x80
