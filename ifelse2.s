// Some testing code
// You may uncomment these during testing
// add_a: bx lr
// add_b: bx lr
// add_c: bx lr
// add_d: bx lr
// add_e: bx lr
// done: bx lr

.global _start
_start:
    ldr r0, =5    // First function parameter is always passed through r0.
    bl build
    1: b 1b    // Done

build:
    push {lr}
    tst r0, #1
    bne apples
    tst r0, #2
    bne bananas
    tst r0, #4
    bne cherries
    tst r0, #8
    bne dates
    tst r0, #16
    beq nothing
    bl  add_e
nothing:
    pop {lr}
    b done
apples:
    bl add_a
    pop {lr}
    b done
bananas:
    bl add_b
    pop {lr}
    b done
cherries:
    bl add_c
    pop {lr}
    b done
dates:
    bl add_d
    pop {lr}
    b done
