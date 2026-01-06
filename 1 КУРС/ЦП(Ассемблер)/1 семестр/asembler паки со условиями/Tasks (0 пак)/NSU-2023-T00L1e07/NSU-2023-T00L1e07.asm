asect  0x00
	ldi r1,16
	ldi r2,a
	st r2,r1
	
	ldi r1,0x32
	ldi r2,b
	st r2,r1
	
	ldi r1,0b00000001
	ldi r2,c
	st r2,r1
	
    ldi r0, a    
    halt         


INPUTS>
ENDINPUTS>
a: ds 1	
b: ds 1	
c: ds 1

end



