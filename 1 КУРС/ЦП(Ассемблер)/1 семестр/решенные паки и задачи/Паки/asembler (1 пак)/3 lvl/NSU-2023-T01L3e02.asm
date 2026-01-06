asect  0x00

	ldi  r1,aLo
	ld r1,r1
	ldi r2,bLo
	ld r2,r2
	
	shla r2
	sub r1,r2
	
	ldi r1,aHi
	ld r1,r1
	ldi r3,bHi
	ld r3,r3
	
	addc r1,r3
	
    ldi r0, resLo
	st r0,r2
	
	ldi r1,resHi
	st r1,r3  
    halt           



INPUTS>
aLo:	dc	1 	
aHi:	dc	0 	
bLo:	dc	0 	
bHi:	dc	0 	
ENDINPUTS>

resLo:	ds	1
resHi:  ds  1		
end


