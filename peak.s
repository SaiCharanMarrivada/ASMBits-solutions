// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3
    ldr r1, =Array
    bl peak
    b _start        // End of testing code

// Return the difference between max and min array elements

peak:
    sub r0, r0, #1
    ldr r2, [r1, r0, lsl #2]
    cmp r0, #0
    moveq r0, #0
    bxeq lr
    mov r12, r2
_peak:
    ldr r3, [r1, r0, lsl #2]
    cmp r2, r3
    movlt r2, r3
    cmp r12, r3
    movgt r12, r3
    subs r0, r0, #1
    bge _peak
    sub r0, r2, r12
    bx lr

