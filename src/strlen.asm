section .text
    global strlen

strlen:         ; Expects str in rsi
    push r8
    mov rax, 0
    mov r8, 0
.loop:
    cmp byte [rsi + r8], 0
    je .done
    inc rax
    inc r8
    jmp .loop
.done:
    pop r8
    ret