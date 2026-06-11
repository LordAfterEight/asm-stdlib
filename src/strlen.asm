section .text
    global strlen

strlen:
    push r8
    push rcx
    mov rax, 0
    mov rcx, r8
.loop:
    cmp byte [rcx], 0
    je .done
    inc rax
    inc rcx
    jmp .loop
.done:
    pop rcx
    pop r8
    ret