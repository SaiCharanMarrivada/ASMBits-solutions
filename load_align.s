.data
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer
    bl load
    1: b 1b    // Done

.global load
load:
    tst r0, #3
    beq word_aligned
    ldrb r3, [r0, #0]
    ldrb r12, [r0, #1]
    orr r3, r12, lsl #8
    ldrb r12, [r0, #2]
    orr r3, r12, lsl #16
    ldrb r12, [r0, #3]
    orr r0, r3, r12, lsl #24
    bx lr

word_aligned:
    ldr r0, [r0]
    bx lr
	
	