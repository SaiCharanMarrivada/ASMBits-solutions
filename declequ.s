// Insert declarations here

.global get_led
.equ LEDS, 0xff200000 // for declaring constants
// A function that returns the value of LEDS
get_led:
    ldr r0, =LEDS
    bx lr

