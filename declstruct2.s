// Insert declarations here
node1:
    .word 0
    .word 0
    .word 20

node2:
    .word 0
    .word 0
    .word 21

node3:
    .word 0
    .word 0
    .word 10

node4:
    .word (node1)
    .word (node2)
    .word 11

Root:
    .word (node3)
    .word (node4)
    .word 0

