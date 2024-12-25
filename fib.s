.global _start
_start:
    mov r0, #1
    bl fib
    1: b 1b

.global fib
fib:
    push {lr}
    push {r4}

    cmp r0, #1
    movle r0, #1
    ble _end

    sub r0, r0, #1
    mov r4, r0
    bl fib

    push {r0}
    mov r0, r4
    sub r0, r0, #1
    bl fib

    pop {r4}
    add r0, r0, r4

_end:
    pop {r4}
    pop {pc}


