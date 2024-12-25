// A test case to test your function with
.global _start
_start:
    ldr r0, =0x123    // First parameter is always in r0
    bl saturate
    b _start        // End of testing code

// Convert signed 32 bit to 8 bit, with saturation
saturate:
    cmp r0, #127
    movge r0, #127
    bxge lr
    cmn r0, #128
    mvnle r0, #127
    and r0, r0, #255
    bx lr
