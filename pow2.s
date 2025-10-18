.global _start
_start:
    ldr r0, =4
    bl pow2
1:  b 1b    // Done

pow2:
    sub r1, r0, #1
    bics r2, r1, r0
    moveq r0, #1
    bx lr
