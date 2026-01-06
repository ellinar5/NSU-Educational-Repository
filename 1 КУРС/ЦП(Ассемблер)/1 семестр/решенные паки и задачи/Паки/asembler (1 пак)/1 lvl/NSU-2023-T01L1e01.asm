asect  0x00
	ldi r1,a
	ld r1,r1
	ldi r2,b
	ld r2,r2
	add r1,r2
	ldi r3,c
	ld r3,r3
	add r2,r3
	ldi r2,res
	st r2,r3
    ldi r0, res  
    halt         


INPUTS>
a:  dc  1    
b:  dc  1    
c:  dc  1    
ENDINPUTS>

res:	ds	1		
	end
