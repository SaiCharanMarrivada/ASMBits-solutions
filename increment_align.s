.data
.byte 0    // Test with an unaligned word.
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer
    bl inc
    1: b 1b    // Done

.global inc
inc:
    mov r3, #0
    ldrb r12, [r0, #0]
    orr r3, r3, r12
    ldrb r12, [r0, #1]
    lsl r12, #8
    orr r3, r3, r12
    ldrb r12, [r0, #2]
    lsl r12, #16
    orr r3, r3, r12
    ldrb r12, [r0, #3]
    lsl r12, #24
    orr r3, r3, r12
    add r3, r3, #1
    strb r3, [r0, #0]
    lsr r3, #8
    strb r3, [r0, #1]
    lsr r3, #8
    strb r3, [r0, #2]
    lsr r3, #8
    strb r3, [r0, #3]
    bx lr

