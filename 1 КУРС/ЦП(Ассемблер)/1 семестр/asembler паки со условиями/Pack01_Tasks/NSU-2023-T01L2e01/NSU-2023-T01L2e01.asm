asect  0x00
	
	ldi r2,b
	ld r2,r2
	shla r2 #2*mem[b]
	shla r2 #4*mem[b]
	
	ldi r1,a
	ld r1,r1
	shla r1 #2*mem[a]
	shla r1 #4*mem[a]
	shla r1 #8*mem[a]
	
	ldi r3,a
	ld r3,r3
	add r3,r1 #8*mem[a] + mem[a] = 9*mem[a]
	
	sub r1,r2
	
	ldi r1,12
	add r2,r1
	
	ldi r0, res 
	st r0,r1
	 
    halt         

INPUTS>
a:  dc  1      
b:  dc  1       
ENDINPUTS>

res:	ds	1		
end

