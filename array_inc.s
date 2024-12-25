.data
Array: .word 1, 2, 3, 4

.text
.global _start
_start:
    ldr r0, =Array
    mov r1, #4
    bl array_inc
    1: b 1b    // Done

.global array_inc
array_inc:
    cmp r1, #0
    bxle lr
    sub r1, r1, #1
increment:
    ldr r2, [r0, r1, lsl #2]
    add r2, r2, #1
    str r2, [r0, r1, lsl #2]
    subs r1, r1, #1
    bge increment
    bx lr
