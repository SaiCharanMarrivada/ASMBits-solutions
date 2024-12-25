.global _start
_start:
    mov r0, #2
    bl popcount
    1: b 1b    // Done

.global popcount
popcount:
    cmp r0, #0
    beq _end
    mov r1, #0
count_ones:
    sub r2, r0, #1
    ands r0, r0, r2
    add r1, #1
    bne count_ones
    mov r0, r1
_end:
    bx lr
