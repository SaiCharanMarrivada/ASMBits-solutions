.global _start
_start:
    mov r0, #1
    mov r1, #1
    bl ackermann
    1: b 1b

.global ackermann
ackermann:
    cmp r0, #0
    beq base_case
    
    cmp r1, #0
    bne recursive_case
    subs r0, r0, #1
    mov r1, #1
    beq base_case
    b ackermann // tail-call
    
recursive_case:
    push {r0, lr}
    subs r1, r1, #1
    bl ackermann
    mov r1, r0
    pop {r0, lr}
    subs r0, r0, #1
    beq base_case
    b ackermann

base_case:
    add r0, r1, #1
    bx lr
