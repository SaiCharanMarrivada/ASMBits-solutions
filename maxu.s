// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl max
    b _start        // End of testing code

// Return maximum element of unsigned array
max:
    ldr r2, [r1], #4
    subs r0, r0, #1
    beq _end
_max:
    ldr r3, [r1], #4
    cmp r2, r3
    movlo r2, r3
    subs r0, r0, #1
    bne _max
_end:
    mov r0, r2
    bx lr
	
	
