// A test case to test your function with

.global _start
_start:
    ldr r0, =0x1234
    bl shift
    b _start        // End of testing code

// Convert one S16 to S32 format
shift:
    lsl r0, #16
    bx lr

