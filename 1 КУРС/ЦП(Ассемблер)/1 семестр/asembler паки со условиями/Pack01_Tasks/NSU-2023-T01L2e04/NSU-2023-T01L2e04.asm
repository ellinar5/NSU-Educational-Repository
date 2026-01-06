asect  0x00
	ldi r1,a
	ld r1,r1
	ldi r2,b
	ld r2,r2
	and  r1,r2
    ldi r0, res  
	st	r0,r2  
    halt        



INPUTS>
a:		dc	0b01111111     
b:		dc	0b01111111       
ENDINPUTS>
res:	ds		1

end
