.global _start
_start:
    ldr r0, =2       // 2 = sign extend 8->32
    ldr r1, =0xf0    // The number to extend
    bl extend
    b _start        // End of testing code

// A function to extend. Only this part will be tested.
extend:
    /* implementation using branch table */
    ldr r2, =cases
    ldr pc, [r2, r0, lsl #2] // load pc with the address
zero_extend8to32:
    ubfx r0, r1, #0, #8
    bx lr
zero_extend16to32:
    ubfx r0, r1, #0, #16
    bx lr
sign_extend8to32:
    sbfx r0, r1, #0, #8
    bx lr
sign_extend16to32:
    sbfx r0, r1, #0, #16
    bx lr

cases:
    .word zero_extend8to32
    .word zero_extend16to32
    .word sign_extend8to32
    .word sign_extend16to32
