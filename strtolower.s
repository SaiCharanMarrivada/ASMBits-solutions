.data
.byte 0    // Strings aren't word-aligned
MyString: .string "Test"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strtolower
    1: b 1b

.global strtolower
strtolower:
    ldrb r12, [r0]
    cmp r12, #0
    bxeq lr
to_lower:
    ldrb r12, [r0], #1
    cmp r12, #0
    bxeq lr
    cmp r12, #0x5a
    bgt to_lower
    cmp r12, #0x41
    blt to_lower
    add r12, r12, #32
    strb r12, [r0, #-1]
    b to_lower
