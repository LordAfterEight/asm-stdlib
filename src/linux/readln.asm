section .text
    global readln

readln:         ; Expects buffer in rdi and len in rsi
    mov rdx, rsi
    mov rsi, rdi
    xor rax, rax
    xor rdi, rdi
    syscall
    mov byte [rsi+rax], 0
    ret