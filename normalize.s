Input: .word 0x10000, 0x20000, 0x80000, 0x4000
Output: .skip 8

.global _start
_start:
    ldr r0, =4
    ldr r1, =Input
    ldr r2, =Output
    bl normalize
    b _start        // End of testing code

// Normalize to U16
normalize:
    subs r0, r0, #1
    bxlt lr
    push {r0}
    ldr r3, [r1, r0, lsl #2]
    beq largest_end
largest:
    ldr r12, [r1, r0, lsl #2]
    cmp r3, r12
    movlo r3, r12
    subs r0, r0, #1
    bge largest
    
largest_end:
    pop {r0}
    lsl r0, #1
    clz r3, r3
    subs r3, r3, #16
    bpl shift_left_all // largest element has less than 16 bits
    rsb r3, r3, #0
    
shift_right_all:
    ldr r12, [r1, r0, lsl #1]
    lsr r12, r3
    strh r12, [r2, r0]
    subs r0, r0, #2
    bge shift_right_all
    bx lr
    
shift_left_all:
    ldr r12, [r1, r0, lsl #1]
    lsl r12, r3
    strh r12, [r2, r0]
    subs r0, r0, #2
    bge shift_left_all
    bx lr
     
