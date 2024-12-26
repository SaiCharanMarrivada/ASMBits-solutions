// Some input data and testing code
.data
ProdList: 
    .word 0x1000, 10
    .word 0x1001, 11	// 11 is the maximum profit. Product_id=0x1001
    .word 0x1002, 9

ProdInfo:
    .word 0x1000, 0x200
    .word 0x1001, 0x210	// Product_id 0x1001 has name 0x210. Return 0x210.
    .word 0x1002, 0x220

.equ PRODLIST_SIZE, 8
.equ PRODINFO_SIZE, 8

.text
.global _start
_start:
    ldr r0, =ProdList
    ldr r1, =3
    ldr r2, =ProdInfo
    ldr r3, =3	
    bl find
    1: b 1b  // done
// Your function starts here:
find:
    push {r5, r6, r7}
    ldr r5, [r0]
    ldr r6, [r0, #4]
    add r12, r0, #12
    mov r0, #0
    subs r1, r1, #1
    beq max_profit_end
    
max_profit:
    ldr r7, [r12], #PRODLIST_SIZE
    cmp r7, r6
    ldrgt r5, [r12, #-12]
    movgt r6, r7
    subs r1, r1, #1
    bne max_profit
   
max_profit_end:
    mov r12, r2
    cmp r3, #0
    beq _end
    
product_name:
    ldr r1, [r12], #PRODINFO_SIZE
    cmp r1, r5
    ldreq r0, [r12, #-4]
    beq _end
    subs r3, r3, #1
    bne product_name
 _end:
    pop {r5, r6, r7}
    bx lr

    
