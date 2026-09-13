; Exercise 4 - Three-Step Workflow Block

section .data
    workflow db 'Step 1: Edit', 0xA, 'Step 2: Assemble', 0xA, 'Step 3: Run', 0xA
    workflow_len equ $ - workflow

section .text
    global _start

_start:
    mov eax, 4                  ; SYS_WRITE
    mov ebx, 1                  ; standard output
    mov ecx, workflow           ; start of the whole contiguous block
    mov edx, workflow_len       ; total bytes in the block
    int 0x80

    mov eax, 1                  ; SYS_EXIT
    xor ebx, ebx
    int 0x80
