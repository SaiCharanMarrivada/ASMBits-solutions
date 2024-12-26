.global _start
_start:
    mov r0, #5
    bl hailstone
    1: b 1b    // Done

.global hailstone
hailstone:
    mov r1, r0
    mov r0, #0
    cmp r1, #1
    bxeq lr
sequence:
    add r2, r1, r1, lsl #1
    add r2, r2, #1
    tst r1, #1
    lsreq r2, r1, #1
    add r0, r0, #1
    mov r1, r2
    rbit r3, r1
    clz r3, r3
    lsr r1, r3
    add r0, r0, r3
    cmp r1, #1
    bne sequence
    bx lr

