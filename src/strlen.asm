section .text
    global strlen

strlen:         ; Expects str in rsi
    push r8
    mov r8, 0
.loop:
    cmp byte [rsi + r8], 0
    je .done
    inc r8
    jmp .loop
.done:
    pop r8
    ret