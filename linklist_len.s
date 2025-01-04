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
    tst r0, r0
    beq _end
length:
    ldr r0, [r0]
    add r2, r2, #1
    tst r0, r0
    ldrne r0, [r0]
    addne r2, r2, #1
    tst r0, r0
    bne length
_end:
    mov r0, r2
    bx lr

