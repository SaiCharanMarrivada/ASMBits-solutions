.data
// Leave some space for the expanded array
Array: .word 1, 2, 3, 4, 0xff, 0xff

.text
.global _start
_start:
    ldr r0, =Array
    ldr r1, =4
    ldr r2, =2
    ldr r3, =123
    bl array_insert
    1: b 1b    // Done

array_insert:
    ldr r12, [r0, r2, lsl #2]
    str r3, [r0, r2, lsl #2]
    cmp r1, r2 // insert at the end of the array
    bxeq lr
    sub r1, r1, #1
insert:
    add r2, r2, #1
    ldr r3, [r0, r2, lsl #2]
    str r12, [r0, r2, lsl #2]
    mov r12, r3
    cmp r1, r2
    bhs insert
    bx lr
