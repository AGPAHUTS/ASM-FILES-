; Exercise 5 - Repair the System Notice
; Repairs: exports _start, uses SYS_WRITE, puts the buffer in ECX,
; and loads SYS_EXIT before exiting.

section .data
    notice db 'System notice: READY', 0xA
    notice_len equ $ - notice

section .text
    global _start

_start:
    mov eax, 4                  ; SYS_WRITE (not SYS_READ)
    mov ebx, 1                  ; standard output
    mov ecx, notice             ; buffer address belongs in ECX
    mov edx, notice_len
    int 0x80

    mov eax, 1                  ; SYS_EXIT must be loaded
    xor ebx, ebx                ; exit status 0
    int 0x80
