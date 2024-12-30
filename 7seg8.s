// Some testing code
.global _start
_start:
    ldr r0, =99
    bl hexdisplay
1:  b 1b  // done

.macro hex_to_byte reg shift
    and r12, r2, #15
    ldrb r12, [r3, r12]
    orr \reg, \reg, r12, lsl #\shift
    lsr r2, r2, #4
.endm

hexdisplay:
    mov r2, r0
    mov r0, #0
    mov r1, #0
    ldr r3, =bit_pattern

    hex_to_byte r0, 0
    hex_to_byte r0, 8
    hex_to_byte r0, 16
    hex_to_byte r0, 24
    hex_to_byte r1, 0
    hex_to_byte r1, 8
    hex_to_byte r1, 16
    hex_to_byte r1, 24
    bx lr

bit_pattern:
    .byte 0x3f, 0x6, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x7
    .byte 0x7f, 0x6f, 0x77, 0x7c, 0x58, 0x5e, 0x79, 0x71
