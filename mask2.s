.global _start
_start:
    ldr r0, =4
    ldr r1, =2
    bl mask
1:  b 1b    // Done

mask:
    sub r2, r0, r1
    mvn r0, #0
    mvn r0, r0, lsl r2
    lsl r0, r1
    bx lr
