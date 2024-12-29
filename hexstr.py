for i in range(8, 0, -1):
    print(
        f"{i}:",
        """
   ands r12, r1, #15
   ldrb r12, [r2, r12]
   strb r12, [r0], #-1
   lsr r1, r1, #4"""
        * i,
    )
    print("    bx lr")
