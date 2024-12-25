// A test case to test your function with

.global _start
_start:
    ldr r0, =0x40000
    bl shift
    b _start        // End of testing code

// Return 1/4 amplitude for a S32 sample
shift:
    asr r0, #2
    bx lr
