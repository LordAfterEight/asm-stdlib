section .text
    global readln
    global buf

readln:         ; Expects buffer in rsi
    push rdi
    push rdx

    mov rax, 0
    mov rdi, 0
    mov rdx, 199
    syscall
    mov byte [buf+rax], 0

    pop rdx
    pop rdi

    ret

section .bss
    buf resb 200