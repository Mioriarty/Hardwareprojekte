	.text
        .align 4
        .type   copy_asm, %function
        .global copy_asm
copy_asm:

	ldr x5, [x0]
	str x5, [x1]
        
        add x0, x0, #8
        ldr x5, [x0]
        add x1, x1, #8
        str x5, [x1]
        
        add x0, x0, #8
        ldr x5, [x0]
        add x1, x1, #8
        str x5, [x1]
        
        add x0, x0, #8
        ldr x5, [x0]
        add x1, x1, #8
        str x5, [x1]
        
        add x0, x0, #8
        ldr x5, [x0]
        add x1, x1, #8
        str x5, [x1]
        
        add x0, x0, #8
        ldr x5, [x0]
        add x1, x1, #8
        str x5, [x1]
        
        add x0, x0, #8
        ldr x5, [x0]
        add x1, x1, #8
        str x5, [x1]
 
        ret
        .size   copy_asm, (. - copy_asm)
        
        
        
        .text
        .align 4
        .type   copy_asm_loop, %function
        .global copy_asm_loop
        
copy_asm_loop:

	ldr x3, =7

start_loop:
	
	ldr x4, [x0]
	str x4, [x1]
	
	add x0, x0, #8
	add x1, x1, #8
	
	subs x3, x3, #1
	cmp x3, xzr
	b.eq end_loop
	b start_loop

end_loop:
	

	ret
        .size   copy_asm_loop, (. - copy_asm_loop)
        
