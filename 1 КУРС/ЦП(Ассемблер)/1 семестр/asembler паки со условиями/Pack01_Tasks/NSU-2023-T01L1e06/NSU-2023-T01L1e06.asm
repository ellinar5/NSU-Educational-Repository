asect  0x00

	ldi r2,b
	ld r2,r2
	shla r2 #2*mem[b]
	
	ldi r3,c
	ld r3,r3
	shla r3 #2*mem[c]
	ldi r1,c
	ld r1,r1
	add r1,r3 #r1 - св/3*mem[c]
	
	ldi r1,a
	ld r1,r1
	add r1,r2 #r1 - св/mem[a] + 2*mem[b]
	
	sub r2,r3  #r2 - св/mem[a] + 2*mem[b] - 3*mem[c]
	
	ldi r1,7
	sub r3,r1 #r3 - св/mem[a] + 2*mem[b] - 3*mem[c] - 7
	
	ldi r2,res
	st r2,r1
	
	
    ldi r0, res  
    halt         
	
INPUTS>
a:    dc  1    
b:    dc  1       
c:    dc  1      
ENDINPUTS>

res: ds 1        
	end
