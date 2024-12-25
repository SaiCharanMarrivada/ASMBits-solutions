// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =Array
    ldr r1, =3
    bl arraysum
    b _start        // End of testing code

// Sum elements of array
arraysum:
    mov r3, #0
sum:
    ldr r2, [r0], #4
    add r3, r2
    subs r1, #1
    bne sum
    mov r0, r3
    bx lr
