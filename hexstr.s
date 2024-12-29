// A test case to test your function with
MyString: .skip 12    // Reserve some space to hold the output string

.global _start
_start:
    ldr r0, =MyString     // First parameter: Where to write
    ldr r1, =0x0000000   // Second parameter: The number to process
    bl hexstr
    b _start  // End of testing code

.macro hex_to_char
    ands r12, r1, #15
    ldrb r12, [r2, r12]
    strb r12, [r0], #-1
    lsr r1, r1, #4
.endm

// Convert number to string
hexstr:
    cmp r1, #0
    beq 0f // handle zero separately
    clz r2, r1
    rsb r2, r2, #32
    lsr r3, r2, #2
    cmp r2, r3, lsl #2
    addne r3, r3, #1
    ldr r2, =lookup
    mov r12, #0
    strb r12, [r0, r3] // null byte
    add r0, r0, r3
    subs r0, r0, #1
    ldr r12, =nhexdigits
    ldr pc, [r12, r3, lsl #2]

8:
    hex_to_char
7:
    hex_to_char
6:
    hex_to_char
5:
    hex_to_char
4:
    hex_to_char
3:
    hex_to_char
2:
    hex_to_char
1:
    hex_to_char
    bx lr

0:
    mov r12, #0
    strb r12, [r0, #1]
    mov r12, #48
    strb r12, [r0]
    bx lr

nhexdigits:
    .word 0x0000 /* dummy */, 1b, 2b, 3b, 4b, 5b, 6b, 7b, 8b

lookup:
    .byte '0', '1', '2', '3', '4', '5', '6'
    .byte '7', '8', '9', 'a', 'b', 'c', 'd'
    .byte 'e', 'f'


