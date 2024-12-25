// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3
    ldr r1, =Array
    bl min
    b _start        // End of testing code

// Return minimum element of signed array
min:
    mov r2, r0
    ldr r0, [r1], #4
    cmp r2, #1
    bxeq lr
    subs r3, r2, #1
    ands r2, r3, #1
    bne residual
_min:
    ldr r2, [r1], #4
    cmp r0, r2
    movgt r0, r2
    ldr r2, [r1], #4
    cmp r0, r2
    movgt r0, r2
    subs r3, r3, #2
    bne _min
    bx lr
 residual:
    ldr r2, [r1], #4
    cmp r0, r2
    movgt r0, r2
    subs r3, #1
    bne _min
    bx lr
