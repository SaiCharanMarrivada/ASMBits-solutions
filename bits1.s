// A test case to test your function with
.global _start
_start:
    ldr r0, =0x1000
    bl bits
    b _start        // End of testing code

// Return minimum number of bits to represent first parameter
bits:
    clz r1, r0 // `clz` - count leading zeros
    rsb r0, r1, #32
    bx lr

