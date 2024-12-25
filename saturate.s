// A test case to test your function with
.global _start
_start:
    ldr r0, =0x2367   // First parameter is always in r0
    bl saturate
    b _start        // End of testing code

// Convert unsigned 32 bit to 16 bit, with saturation
saturate:
    mov r1, #0xFFFF
    cmp r0, r1
    movhs r0, r1
    bx lr

