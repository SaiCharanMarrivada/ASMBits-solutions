// Some testing code
.data
Cmd: .string "+0+@-P"
.text

.global _start
_start:
    ldr r0, =Cmd
    bl calc	
1:  b 1b  // done

// Your function starts here:
calc:
    mov r1, r0
    ldrsb r2, [r1]
    mov r0, #0
    cmp r2, #0
    bxeq lr
    ldr r12, =op
    
accumulate:
    ldrsb r2, [r1], #1
    subs r2, r2, #42
    bxlt lr
    ldr pc, [r12, r2, lsl #2]

multiply:
    ldrsb r2, [r1], #1
    mul r0, r0, r2
    b accumulate
    
add:
    ldrsb r2, [r1], #1
    add r0, r0, r2
    b accumulate

subtract:
    ldrsb r2, [r1], #1
    subs r0, r0, r2
    b accumulate
    
op:
    .word multiply, add, 0x0000 /* dummy label */, subtract
	
	
