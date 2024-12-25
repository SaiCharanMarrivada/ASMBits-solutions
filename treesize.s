.data
A: .word B, C
B: .word 0, 0
C: .word 0, 0

.text
.global _start

_start:
    ldr r0, =A
    bl size
    1: b 1b

.global size
size:
    push {lr}
    cmp r0, #0
    popeq {pc}
    push {r0}
    ldr r0, [r0]
    bl size
    pop {r2}
    push {r0}
    ldr r0, [r2, #4]
    bl size
    pop {r3}
    add r0, r3, r0
    add r0, #1
    pop {pc}


