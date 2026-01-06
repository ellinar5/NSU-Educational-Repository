asect  0x00
    
	ldi r1,a
	ld r1,r1
	
	shla r1
	shla r1
	ldi r3,a
	ld r3,r3
	add r1,r3

	
	ldi r2,res
	st r2,r1
	
	ldi r0, res      
	halt         

INPUTS>
a:	dc	1	    	
ENDINPUTS>

res:	ds	1		
	end
