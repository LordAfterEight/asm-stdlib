section .text
    global strcmp

strcmp:         ; Expects str1 in rdi and str2 in rsi
    push rcx
    push rbx
    mov rcx, 0
    mov rax, 0
.loop:
    movzx rax, byte [rdi+rcx]
    movzx rbx, byte [rsi+rcx]
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