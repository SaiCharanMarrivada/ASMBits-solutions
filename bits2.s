// A test case to test your function with
.global _start
_start:
    ldr r0, =0x1000
    bl bits
    b _start        // End of testing code

// Return minimum number of bits to represent first parameter
bits:
    cmp r0, #0
    mvnlt r0, r0
    clz r0, r0
    rsb r0, r0, #33
    bx lr

