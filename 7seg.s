// Some testing code
.global _start
_start:
    ldr r0, =8
    bl sevenseg
1:  b 1b  // done

// Your function starts here:
sevenseg:
    ldr r12, =bit_pattern
    ldrb r0, [r12, r0]
    bx lr

bit_pattern:
    .byte 0x3f, 0x6, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x7
    .byte 0x7f, 0x6f, 0x77, 0x7c, 0x58, 0x5e, 0x79, 0x71

