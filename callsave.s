.global _start
    ldr sp, =0x40000000
    mov r0, #10
    mov r1, #10
    mov r2, #20
    mov r3, #30
    bl call1234
1:  b 1b

//secret:  // For debugging, uncomment this label
    // Don't submit with this label though, or you will get a duplicate label error.
    mov r0, #10
    bx lr

.global call1234
call1234:
    push {lr}
    sub sp, sp, #16
    stm sp, {r0, r1, r2, r3}
    ldr r12, =args
    ldm r12, {r0, r1, r2, r3}
    bl secret
    mov r12, r0
    ldm sp, {r0, r1, r2, r3}
    cmp r12, r0
    moveq r0, #1
    movne r0, #0
    cmp r12, r1
    addeq r0, #1
    cmp r12, r2
    addeq r0, #1
    cmp r12, r3
    addeq r0, #1
    add sp, sp, #16
    pop {pc} // restore the lr to pc

args:
    .word 1, 2, 3, 4 // for the function `secret`

