section .text
    global strlen

strlen:         ; Expects str in rsi
    mov rax, 0
.loop:
    cmp byte [rsi], 0
    je .done
    inc rax
    inc rsi
    jmp .loop
.done:
    ret