asect  0x00
	ldi r1, a
	ld r1,r1
	ldi r2, b
	ld r2,r2
	
	add r1,r2 #mem[a]+mem[b]
	addc r3,r3 #бит переноса = 1 
	
	ldi r0, resHi  
	st r0,r3
	
	ldi r1,resLo
	st r1,r2 # выводит сумму a + b
    halt           


INPUTS>
a:	dc	200 	
b:	dc	57 	
ENDINPUTS>

resLo:  ds  1
resHi:  ds  1		
end


