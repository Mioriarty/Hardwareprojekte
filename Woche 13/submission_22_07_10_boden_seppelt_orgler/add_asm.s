        .text
        .align 4
        .type   add_asm, %function
        .global add_asm
add_asm:
        // TODO: Implement add_asm
        
start_loop:
	
	ldr x4, [x1]
	ldr x5, [x2]
	
	add x6, x4, x5
	str x6, [x3]
	
	add x1, x1, #8
	add x2, x2, #8
	add x3, x3, #8
	
	subs x0, x0, #1
	cmp x0, xzr
	b.eq end_loop
	b start_loop


end_loop:
        
        ret
        .size   add_asm, (. - add_asm)
