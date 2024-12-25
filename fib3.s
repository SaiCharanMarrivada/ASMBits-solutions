.global _start
_start:
    mov r0, #4
    bl numfib
    1: b 1b

.global numfib
numfib:
    ldr r1, =nfib
    ldr r0, [r1, r0, lsl #2]
    bx lr

nfib:
    .word 1
    .word 1
    .word 3
    .word 5
    .word 9
    .word 15
    .word 25
    .word 41
    .word 67
    .word 109
    .word 177
    .word 287
    .word 465
    .word 753
    .word 1219
    .word 1973
    .word 3193
    .word 5167
    .word 8361
    .word 13529
    .word 21891
    .word 35421
    .word 57313
    .word 92735
    .word 150049
    .word 242785
    .word 392835
    .word 635621
    .word 1028457
    .word 1664079
    .word 2692537

