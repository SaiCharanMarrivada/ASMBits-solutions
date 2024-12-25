.global _start

_start:
    ldr r0, =2    // First function parameter is always passed through r0.
    bl random
    1: b 1b    // Done

random:
    cmp r0, #0
    bxeq lr
    ldr r1, =0x8088405
    mov r2, #0
    mov r3, #1
    lsrs r12, r0, #3
    bne lcg
    ands r0, r0, #7
    ldr r12, =remaining_iterations
    ldr pc, [r12, r0, lsl #2]

lcg:
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    subs r12, #1
    bne lcg
    ands r0, r0, #7
    ldr r12, =remaining_iterations
    ldr pc, [r12, r0, lsl #2]
    mov r0, r2
    bx lr

_0:
    mov r0, r2
    bx lr
_1:
    mla r2, r1, r2, r3
    mov r0, r2
    bx lr
_2:
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mov r0, r2
    bx lr
_3:
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mov r0, r2
    bx lr
_4:
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mov r0, r2
    bx lr
_5:
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mov r0, r2
    bx lr

_6:
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mov r0, r2
    bx lr

_7:
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mla r2, r1, r2, r3
    mov r0, r2
    bx lr

remaining_iterations:
    .word _0, _1, _2, _3, _4, _5, _6, _7//, _8, _9


