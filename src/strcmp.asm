section .text
    global strcmp

strcmp:         ; Expects str1 in rdi and str2 in rsi
    xor r8, r8
    xor rax, rax
.loop:
    movzx rax, byte [rdi+r8]
    movzx rcx, byte [rsi+r8]
    cmp rax, rcx
    jne .done
    cmp rax, 0
    je  .equal
    inc r8
    jmp .loop
.equal:
    xor rax, rax
    ret
.done:
    sub rax, rcx
    ret