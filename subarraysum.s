// A test case to test your function with
Array: .word -1, -1, 3, -1, 3, -2

.global _start
_start:
    ldr r0, =Array
    ldr r1, =6 
    bl subarraysum
    b _start        // End of testing code


// `max_subarray_sum` using Kadane's algorithm
subarraysum:
	ldr r2, =0x80000000
    add r1, r0, r1, lsl #2
	ldr r3, [r0], #4
    cmp r1, r0
    beq _end
max_subarray_sum:
	ldr r12, [r0], #4
    add r3, r3, r12
    cmp r3, r12
    movlt r3, r12
    cmp r2, r3
    movlt r2, r3
    cmp r1, r0
    bne max_subarray_sum
_end:
	mov r0, r2
    bx lr
	
