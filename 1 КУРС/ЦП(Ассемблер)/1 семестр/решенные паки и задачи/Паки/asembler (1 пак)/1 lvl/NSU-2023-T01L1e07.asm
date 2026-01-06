asect  0x00
    
	ldi r1,a
	ld r1,r1
	
	ldi r2,a
	ld r2,r2
	
	shla r1    #2*mem[a]       
	shla r1    #4*mem[a]
	add r2,r1  #4*mem[a] + mem[a] = 5*mem[a]  
	
	ldi r3,a
	ld r3,r3
	ldi r2,a
	ld r2,r2
	
	shla r3    #2*mem[a]       
	shla r3    #4*mem[a]
	add r2,r3  #4*mem[a] + mem[a] = 5*mem[a]
	
	add r1,r3 #5*mem[a] + 5*mem[a] = 10*mem[a]
	
	ldi r0, res  
	st r0,r3
	  
	  
	halt         

INPUTS>
a:	dc	2	    	
ENDINPUTS>

res:	ds	1		
	end
