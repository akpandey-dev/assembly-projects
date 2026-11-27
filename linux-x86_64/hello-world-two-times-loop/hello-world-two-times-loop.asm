; hello-world-two-times-loop.asm
; Linux x86_64 NASM
; Prints "Hello, world!" using a loop two times

section .data
    msg db "Hello, world!", 10
    len equ $ - msg

section .text
    global _start

_start:
    mov r12, 2          ; set loop counter to 2

print_loop:
    cmp r12, 0
    je exit

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    dec r12             ; decrease r12
    jmp print_loop

exit:
    mov rax, 60         ; 60 is exit
    xor rdi, rdi
    syscall
