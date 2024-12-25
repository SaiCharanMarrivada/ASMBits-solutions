.global _start
_start:
    ldr r0, =0
    ldr r1, =2
    bl cacheblock
1:  b 1b    // Done

cacheblock:
    eor r1, r0, r1
    mov r0, #0
    cmp r1, #16
    movlo r0, #1
    bx lr

