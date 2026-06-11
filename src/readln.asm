section .text
    global readln
    global buf

readln:
    push rdi
    push rsi
    push rdx

    mov rax, 0
    mov rdi, 0
    mov rsi, buf
    mov rdx, 199
    syscall
    mov byte [buf+rax], 0

    pop rdx
    pop rsi
    pop rdi

    ret

section .bss
    buf resb 200