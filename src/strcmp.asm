section .text
    global strcmp

strcmp:
    push rcx
    push rbx
    mov rcx, 0
    mov rax, 0
.loop:
    movzx rax, byte [r8+rcx]
    movzx rbx, byte [r9+rcx]
    cmp rax, rbx
    jne .done
    cmp rax, 0
    je  .equal
    inc rcx
    jmp .loop
.equal:
    mov rax, 1
.done:
    pop rbx
    pop rcx
    ret