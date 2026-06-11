section .text
    global print
    extern strlen

print:          ; Expects text address in rsi
    call strlen
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall
    ret