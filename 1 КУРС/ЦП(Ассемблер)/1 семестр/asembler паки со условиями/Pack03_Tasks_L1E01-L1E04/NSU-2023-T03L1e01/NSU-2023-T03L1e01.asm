asect  0x00

	ldi r0,x
	ld r0,r0
	ldi r1,y
	ld r1,r1 
	halt


INPUTS>
x:     dc 7    
y:     dc 3    
ENDINPUTS>

ans:   ds 1    

end

