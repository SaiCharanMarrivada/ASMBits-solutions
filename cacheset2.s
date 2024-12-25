.global _start
_start:
    ldr r0, =8
    ldr r1, =4
    ldr r2, =0
    ldr r3, =2
    bl cacheset
1:  b 1b    // Done

cacheset:
    eor r2, r2, r3
    mov r3, #1
    rsb r3, r3, r3, lsl r0
    mov r0, #0
    ands r3, r2, r3, lsl r1
    moveq r0, #1
    bx lr
