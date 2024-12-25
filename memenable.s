.global _start
_start:
    ldr r0, =0xff3100
    bl memenable
1:  b 1b    // Done

memenable:
    ldr r1, =0xff3
    // lsr r0, #12
    cmp r1, r0, lsr #12
    mov r0, #0
    moveq r0, #1
    bx lr
