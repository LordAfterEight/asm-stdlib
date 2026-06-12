section .text
    global strlen

strlen:         ; Expects str in rsi
    mov rax, 0
.loop:
    cmp byte [rsi + rax], 0
    je .done
    inc rax
    jmp .loop
.done:
    ret