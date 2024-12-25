.data
A: .word B, C
B: .word 0, 0
C: .word 0, 0

.text
.global _start

_start:
    ldr r0, =A
    mov r1, #2
    bl depth
    1: b 1b

.global depth
depth:
    push {lr}
    bl max_depth
    cmp r0, r1
    mov r0, #0
    movls r0, #1 // move if lower or same
    pop {pc}

max_depth:
    push {lr}
    cmp r0, #0
    beq _return
    push {r0}
    ldr r0, [r0]
    bl max_depth
    pop {r2}
    push {r0}
    ldr r0, [r2, #4]
    bl max_depth
    pop {r2}
    cmp r0, r2
    movlo r0, r2 // move if lower
    add r0, #1
_return:
    pop {pc}

