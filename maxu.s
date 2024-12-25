// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3
    ldr r1, =Array
    bl max
    b _start        // End of testing code

// Return maximum element of unsigned array
max:
    sub r0, r0, #1
    ldr r2, [r1, r0, lsl #2]
    cmp r0, #0
    moveq r0, r2
    bxeq lr
    sub r0, r0, #1
_max:
    ldr r3, [r1, r0, lsl #2]
    cmp r3, r2
    movhi r2, r3 // hi is for unsigned higher
    subs r0, r0, #1
    bge _max
    mov r0, r2
    bx lr
