.data
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strlen
    1: b 1b

.global strlen
strlen:
    mov r1, r0
    add r0, r0, #1
length:
    ldrb r2, [r1], #1
    tst r2, r2
    bne length
    subs r0, r1, r0
    bx lr
