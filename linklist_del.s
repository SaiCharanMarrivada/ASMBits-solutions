.data
A: .word B
D: .word 0
C: .word D
B: .word C
.text
.global _start
_start:
    ldr r0, =A
    bl listdel
    1: b 1b   // done

.global listdel
listdel:
    cmp r0, #0
    bxeq lr
    ldr r2, [r0]
    cmp r2, #0
    ldrne r1, [r2]
    strne r1, [r0]
    mov r0, r2
    bx lr
