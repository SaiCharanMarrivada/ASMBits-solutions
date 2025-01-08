.data
MyString: .string "Hello World!"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strlen
    1: b 1b

.global strlen
strlen:
// assumes string is word-aligned!
    push {r4}
    mov r1, r0
    add r0, r0, #1
    ldr r12, =0x10101010
    ldr r3, =0x80808080
    
length:
    ldr r2, [r1]
    bic r4, r3, r2
    sub r2, r2, r12
    ands r2, r4
    addeq r1, r1, #4
    beq length  
    
remaining_bytes:
    ldrb r2, [r1], #1
    cmp r2, #0
    bne remaining_bytes
    sub r0, r1, r0
    pop {r4}
    bx lr

