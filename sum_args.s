.global _start
_start:
    ldr sp, =0x40000000	// Initial sp
    mov r0, #4
    mov r1, #1
    mov r2, #2

    bl sum
1:  b 1b  // done

.global sum
sum:
    ldr r12, =nargs
    cmp r0, #4
    ldrle pc, [r12, r0, lsl #2]

    mov r12, r0
    add r0, r1, r2
    add r0, r3
    sub r12, #3
    mov r2, sp
_sum:
    ldr r3, [r2], #4
    add r0, r3
    subs r12, #1
    bne _sum
    bx lr

_0:
    mov r0, #0
    bx lr
_1:
    mov r0, r1
    bx lr
_2:
    add r0, r1, r2
    bx lr
_3:
    add r0, r1, r2
    add r0, r3
    bx lr

_4:
    add r0, r1, r2
    add r0, r3
    ldr r3, [sp, #4]
    add r0, r3
    bx lr


nargs:
    .word _0, _1, _2, _3//, _4

