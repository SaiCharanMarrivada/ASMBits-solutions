.data
// This direct-mapped cache has 4 sets/blocks. Their tags are 0, 0x100, 0xc0, and 0x40
// for set 0, 1, 2, and 3, respectively.
CacheTags:
.word 0
.word 0x100
.word 0xc0
.word 0x40

AddressList:
.word 0x110	// This is hit (set 1)
.word 0x120	// This is a miss (set 2)
.word -1

.text
.global _start
_start:
    ldr sp, =0x4000000	// This problem will probably use the stack
    ldr r0, =4	// Cache has 2^4 byte blocks
    ldr r1, =2	// Cache has 2^2 sets
    ldr r2, =CacheTags
    ldr r3, =AddressList
    bl cachehits

cachehits:
    push {r4-r8}
    mov r12, #1
    rsb r12, r12, r12, lsl r1
    lsl r12, r0
    add r5, r0, r1
    mov r8, #0
hits:   
    ldr r4, [r3], #4
    cmn r4, #1
    beq _end
    lsr r7, r4, r5
    and r4, r12
    lsr r4, r0
    ldr r6, [r2, r4, lsl #2]
    cmp r7, r6, lsr r5
    addeq r8, r8, #1
    b hits
_end:
    mov r0, r8
    pop {r4-r8}
    bx lr
    
    
	
