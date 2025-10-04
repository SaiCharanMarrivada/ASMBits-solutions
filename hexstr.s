MyString: .skip 12

.global _start
_start:
    ldr r0, =MyString
    ldr r1, =0x0000000
    bl hexstr
    b _start

.macro hex_to_char
    and r12, r1, #15
    ldrb r12, [r2, r12]
    strb r12, [r0, #-1]!
    lsr r1, r1, #4
.endm

hexstr:
    cmp r1, #0
    beq handle_zero
    clz r3, r1
    rsb r3, r3, #35
    lsr r3, r3, #2
    ldr r2, =lookup
    mov r12, #0
    strb r12, [r0, r3]
    add r0, r0, r3
    ldr r12, =nibbles
    ldr pc, [r12, r3, lsl #2]

.irp n, 8,7,6,5,4,3,2,1
\n:
    hex_to_char
.endr
    bx lr

handle_zero:
    strb r1, [r0, #1]
    mov r12, #'0'
    strb r12, [r0]
    bx lr

nibbles:
    .word 0x0000, 1b, 2b, 3b, 4b, 5b, 6b, 7b, 8b

lookup:
    .ascii "0123456789abcdef"
