section .text
    global print
    extern strlen

print:          ; Expects text address in rsi
    push rdx
    push rax
    push rdi

    call strlen
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall

    pop rdi
    pop rax
    pop rdx

    ret