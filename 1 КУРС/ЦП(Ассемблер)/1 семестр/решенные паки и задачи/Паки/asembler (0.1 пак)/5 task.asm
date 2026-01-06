asect  0x00
	ldi r1,a
	ld r1,r1	
	ldi r2,b
	ld r2,r2
	move r3,r1
	move r1,r2
	move r2,r3	
    push r1
    push r2
    ldsa r0,0  
    halt       

INPUTS>
a: dc 15
b: dc 14

ENDINPUTS>

end



