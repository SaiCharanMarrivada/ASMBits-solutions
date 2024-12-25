// A test case to test your function with
.data
Str: .string "1234"

.text
.global _start
_start:
    ldr r0, =Str
    bl decstr
    b _start        // End of testing code

// Parse a decimal string
decstr:
    ldrb r1, [r0]
    cmp r1, #45
    moveq r1, #1
    sub sp, sp, #4
    str r1, [sp, #4]
    addeq r0, #1
    mov r2, #0
    mov r12, #10
string_to_decimal:
    ldrb r1, [r0], #1
    subs r3, r1, #48
    mlage r2, r12, r2, r3
    cmp r1, #0
    bne string_to_decimal
    mov r0, r2
    ldr r1, [sp, #4]
    cmp r1, #1
    rsbeq r0, #0
    add sp, #4
    bx lr


