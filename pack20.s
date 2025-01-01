.global _start
_start:
    ldr sp, =0x40000000	// Initial SP
    ldr r0, =0x20000
    mov r1, #22
    mov r2, #17
1:  push {r1}
    sub r1, #1
    subs r2, #1
    bne 1b

    mov r1, #3
    mov r2, #4
    mov r3, #5

    bl pack20
    add sp, #68   // Caller cleans up the stack: Remove 17 parameters.
    1: b 1b  // done

.global pack20
pack20:
    strb r1, [r0], #1
    strb r2, [r0], #1
    strb r3, [r0], #1
    mov r2, sp
    .rept 17
    ldrb r3, [r2], #4
    strb r3, [r0], #1
    .endr
    bx lr



