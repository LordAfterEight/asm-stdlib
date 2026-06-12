section .text
    global readln

readln:         ; Expects buffer in rsi and len in rdx
    push rdi
    push rdx

    mov rax, 0
    mov rdi, 0
    syscall
    mov byte [rsi+rax], 0

    pop rdx
    pop rdi

    ret