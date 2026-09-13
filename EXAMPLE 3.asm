; Exercise 3 - Exit Status Reporter
; Run `echo $?` immediately after executing the program; it reports 25.

section .data
    message db 'Task complete.', 0xA
    message_len equ $ - message

section .text
    global _start

_start:
    mov eax, 4                  ; SYS_WRITE
    mov ebx, 1
    mov ecx, message
    mov edx, message_len
    int 0x80

    mov eax, 1                  ; SYS_EXIT
    mov ebx, 25                 ; required exit status
    int 0x80
