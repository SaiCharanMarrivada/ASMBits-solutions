.data
List:
    .string "M5S3G4"
    .align 1
    .hword 416
    .string "V6T1Z4"
    .align 1
    .hword 604
    .string "K7L3N6"
    .align 1
    .hword 613
.align 2
PCode: .string "N2L3G1"

.text
.global _start
_start:
    ldr r0, =List
    mov r1, #1
    ldr r2, =PCode
    ldr r3, =519

    bl set_data
1:  b 1b  // done

set_data:
    add r1, r1, r1, lsl #2
    add r0, r0, r1, lsl #1
    mov r1, r0
copy_string:
    ldrb r12, [r2], #1
    strb r12, [r0], #1
    cmp r12, #0
    bne copy_string
    sub r1, r0, r1
    rsb r1, r1, #8
    add r0, r1
    strh r3, [r0]
    bx lr

