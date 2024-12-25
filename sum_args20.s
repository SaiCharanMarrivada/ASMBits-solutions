.global _start
_start:
    ldr sp, =0x04000000	// Initial sp
    sub sp, sp, #64	// 16 stack parameters
    mov r0, #5
    mov r1, #20
    mov r2, sp
initloop:
    str r0, [r2], #4       // Post-indexed addressing: Add 4 to r2 after
    add r0, r0, #1
    cmp r0, r1
    ble initloop

    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4

    bl sum
    add sp, sp, #64	// Clean up stack
1:  b 1b  // done

sum:
    sub sp, sp, #16
    mov r12, sp
    str r0, [r12], #4
    str r1, [r12], #4
    str r2, [r12], #4
    str r3, [r12], #4
    add r0, r1
    add r0, r2
    add r0, r3
    // 16 iterations unrolled
    ldr r1, [r12], #4
    add r0, r1//, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    ldr r1, [r12], #4
    add r0, r1, r0
    add sp, sp, #16
    bx lr


