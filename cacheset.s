.global _start
_start:
    ldr r0, =0
    ldr r1, =2
    bl cacheset
1:  b 1b    // Done

cacheset:
  eor r1, r1, r0
  mov r0, #0
  tst r1, #4080
  moveq r0, #1
  bx lr

