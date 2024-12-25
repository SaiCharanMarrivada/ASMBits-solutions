.global _start
_start:
    ldr r0, =0xff3100
    bl memenable
1:  b 1b    // Done

memenable:
    ldr r3, =0xff3
    cmp r3, r0, lsr #12
    ite eq
    ubfxeq  r0, r0, #8, #4
    movne r0, #-1
    bx lr
