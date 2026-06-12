section .text
    global strcmp

strcmp:         ; Expects str1 in rsi, str2 in rdi
    push r8
    push rbx
    mov r8, 0
    mov rax, 0
.loop:
    movzx rax, byte [rsi+r8]
    movzx rbx, byte [rdi+r8]
    cmp rax, rbx
    jne .done
    cmp rax, 0
    je  .equal
    inc r8
    jmp .loop
.equal:
    mov rax, 1
.done:
    pop rbx
    pop r8
    ret