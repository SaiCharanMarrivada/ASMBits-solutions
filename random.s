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
    .rept 8
    mla r2, r1, r2, r3
    .endr
    subs r12, #1
    bne lcg
    ands r0, r0, #7
    ldr r12, =remaining_iterations
    ldr pc, [r12, r0, lsl #2]
    mov r0, r2
    bx lr

7:
    mla r2, r1, r2, r3
6:
    mla r2, r1, r2, r3
5:
    mla r2, r1, r2, r3
4:
    mla r2, r1, r2, r3
3:
    mla r2, r1, r2, r3
2:
    mla r2, r1, r2, r3
1:
    mla r2, r1, r2, r3
0:
    mov r0, r2
    bx lr
remaining_iterations:
    .word 0b, 1b, 2b, 3b, 4b, 5b, 6b, 7b
