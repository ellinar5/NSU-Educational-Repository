asect  0x00
	ldi r1,a
	ld r1,r1
	ldi r2,b
	ld r2,r2
	ldi r3,7
	sub r3,r1
	sub r1,r2
	ldi r1,res
	st r1,r2
    ldi r0, res  
    halt         

INPUTS>
a:  dc  1       
b:  dc  1      
ENDINPUTS>

res:	ds	1		
	end
