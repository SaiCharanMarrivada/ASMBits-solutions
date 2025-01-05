.data
Out: .skip 256	// Reserve some space for output

.text
// read_uart:	// This may be useful for debugging
    ldr r0, =0xff201000
    ldr r0, [r0]
    bx lr

.global _start
_start:
    ldr sp, =0x04000000	// Initialize SP for debugging.
    ldr r0, =Out		// Use Out as the output string
    bl uartgets
1:  b 1b			// Done


uartgets:
    push {lr}
    mov r1, r0
    mov r12, r0
    ldr r3, =0x0d000000
poll:
    bl read_uart
    tst r0, #0x8000
    beq poll
    strb r0, [r1], #1
    cmp r3, r0, lsl #24
    bne poll
    mov r2, #0
    strb r2, [r1, #-1]!
    sub r0, r1, r12
    pop {pc}

