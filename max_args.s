.global _start
_start:
    ldr sp, =0x40000000	// Initial sp
    mov r0, #2
    mov r1, #1
    mov r2, #2

    bl max
1:  b 1b  // done

.global max
max:
    ldr r12, =nargs
    cmp r0, #3
    ldrle pc, [r12, r0, lsl #2]
    mov r12, r0
    mov r0, r1
    cmp r2, r0
    movgt r0, r2
    cmp r3, r0
    movgt r0, r3
    mov r3, sp
_max:
    ldr r2, [r3], #4
    cmp r2, r0
    movgt r0, r2
    subs r12, #1
    bne _max
    bx lr

_0:
    bx lr
_1:
    mov r0, r1
    bx lr

_2:
    mov r0, r1
    cmp r2, r0
    movgt r0, r2
    bx lr

_3:
    mov r0, r1
    cmp r2, r0
    movgt r0, r2
    cmp r3, r0
    movgt r0, r3
    bx lr

nargs:
    .word _0, _1, _2, _3


