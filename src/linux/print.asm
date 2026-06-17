section .text
    global print
    extern strlen

print:          ; Expects str in rdi
    push rbx

    mov rbx, rdi
    call strlen

    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    syscall

    pop rbx
    ret