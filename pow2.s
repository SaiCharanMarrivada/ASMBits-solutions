.global _start
_start:
    ldr r0, =4
    bl pow2
1:  b 1b    // Done

pow2:
    sub r1, r0, #1
    ands r2, r1, r0
    movne r0, #0
    // bxne lr
    moveq r0, #1
    bx lr
