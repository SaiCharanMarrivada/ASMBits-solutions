.global _start
_start:
    ldr r0, =16	// Depth 16
    ldr r1, =8	// 8 bit wide (128 bits of capacity)
    bl addrlines
1:  b 1b    // Done

addrlines:
    // fast ceil log2
    sub r0, r0, #1
    clz r0, r0
    rsb r0, r0, #32
    bx lr

