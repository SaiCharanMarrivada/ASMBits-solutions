// A test case to test your function with
.data
Array: .byte 1, 2, -3

.text
.global _start
_start:
    ldr r0, =3
    ldr r1, =Array
    bl max
    b _start        // End of testing code

// Return maximum element of unsigned array
max:
    ldrb r2, [r1], #1
    sbfx r2, r2, #0, #8
    cmp r0, #1
    moveq r0, r2
    beq _end
    sub r0, r0, #1
    // sub r0, r0, #2
_max:
    ldrb r3, [r1], #1
    sbfx r3, r3, #0, #8
    cmp r2, r3
    movlt r2, r3
    subs r0, r0, #1
    bne _max
    mov r0, r2
_end:
    bx lr
