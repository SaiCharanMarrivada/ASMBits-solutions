.global _start
_start:
    ldr r0, =16384
    ldr r1, =2
    ldr r2, =0
    ldr r3, =2
    bl cachetag
1:  b 1b    // Done


cachetag:
    eor r2, r2, r3
    lsr r0, r0, r1
    sub r3, r0, #1
    // mvn r3, r3
    mov r0, #0
    bics r2, r2, r3
    moveq r0, #1
    bx lr
