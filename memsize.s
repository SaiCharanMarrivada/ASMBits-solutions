.global _start
_start:
    ldr r0, =12	// 12 address lines
    ldr r1, =8	// 8 data lines
    bl memsize
1:  b 1b    // Done

memsize:
// shift the number of data lines by no.of address lines
    lsl r0, r1, r0
    bx lr
