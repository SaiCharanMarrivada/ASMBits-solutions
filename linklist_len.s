.data
A: .word B
B: .word C
C: .word 0
.text
.global _start
    ldr r0, =A
    bl listlen
1:  b 1b  // done

.global listlen
listlen:
    cmp r0, #0
    bxeq lr
    ldr r0, [r0]
    mov r2, #1
    cmp r0, #0
    bne length
    mov r0, r2
    bx lr
length:
    ldr r0, [r0]
    add r2, r2, #1
    cmp r0, #0
    bne length
    mov r0, r2
    bx lr
