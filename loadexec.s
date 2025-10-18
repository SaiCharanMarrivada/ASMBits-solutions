// Some testing code
// When debugging in CPUlator, turn off the following debugging checks:
// - Instruction fetch: Modified opcode
// - Instruction fetch: Outside a code section (If Dest is outside the .text section)

Src: 
    add r0, r0, r0    // This function returns double its parameter.
    bx lr
Dest:
    .skip 8        // Make space for the code

.global _start
_start:
    ldr r0, =Dest
    ldr r1, =Src
    ldr r2, =8    // There are 2 instructions to copy: 8 bytes
    ldr r3, =4    // Let's call the function with parameter 4
    bl loadexec
    1: b 1b  // done

// Your function starts here:
loadexec:
    cmp r2, #32 // check if there are atleast 32 bytes to copy
    blo residual
    push {r4-r11}
    subs r2, r2, #32 // guaranteed to copy atleast 32 bytes
copy32:
    ldmia r1!, {r4-r11}
    stmia r0!, {r4-r11}
    subs r2, r2, #32
    bgt copy32
    ands r2, r2, #31
    pop {r4-r11}
    bxeq lr
residual:
    ldr r12, [r1], #4
    str r12, [r0], #4
    subs r2, r2, #4
    bne residual
    mov r0, r3
    ldr r12, =Dest
    ldr pc, [r12]
    bx lr
