asect  0x00
	ldi r1,a
	ldi r2,b
	ldi r3,c
	ldi r4,d
	ld r1,r1
	ld r2,r2
	ld r3,r3
	ld r4,r4
	
	
	
    ldi r0, res  
    halt        



INPUTS>
a:  dc  0       
b:  dc  0       
c:  dc  0       
d:  dc  0      
ENDINPUTS>

res: ds 1       
	end
