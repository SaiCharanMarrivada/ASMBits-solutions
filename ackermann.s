.global _start
_start:
    mov r0, #1
    mov r1, #1
    bl ackermann
    1: b 1b

.global ackermann
ackermann:
    cmp r0, #0
    addeq r0, r1, #1
    bxeq lr
    
    cmp r1, #0
    bne recursive_case
    sub r0, r0, #1
    mov r1, #1
    b ackermann // tail-call
    bx lr
    
recursive_case:
    push {r0, lr}
    sub r1, r1, #1
    bl ackermann
    mov r1, r0
    pop {r0, lr}
    sub r0, r0, #1
    b ackermann
    bx lr	
