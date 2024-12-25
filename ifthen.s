// You may uncomment these during testing
// add_a: ret
// add_b: ret
// add_c: ret
// add_d: ret
// add_e: ret
// done: ret

.global _start
_start:
    ldr r0, =5    // First function parameter is always passed through r0.
    bl build
    1: b 1b    // Done

build:
    // Because there are nested function calls, lr needs to be saved and restored.
    push {lr}
    ands r1, r0, #1
    blne add_a
    ands r1, r0, #2
    blne add_b
    ands r1, r0, #4
    blne add_c
    ands r1, r0, #8
    blne add_d
    ands r1, r0, #16
    blne add_e
    pop {lr}
    b done // tail call

