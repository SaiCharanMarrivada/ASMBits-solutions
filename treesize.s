.data
A: .word B, C
B: .word 0, 0
C: .word 0, 0

.text
.global _start

_start:
    ldr r0, =A
    bl size
    1: b 1b

.global size
size: 
    push {r2-r3,lr} 
    mov r3, #0
    cmp r0, #0
    beq _end
_size:
    mov r2, r0
    ldr r0, [r2]
    bl size
    add r3, r0, r3 
    add r3, r3, #1
    ldr r0, [r2, #4]
    cmp r0, #0
    bne _size
_end:
    mov r0, r3
    pop {r2-r3, pc}
 

	
	
