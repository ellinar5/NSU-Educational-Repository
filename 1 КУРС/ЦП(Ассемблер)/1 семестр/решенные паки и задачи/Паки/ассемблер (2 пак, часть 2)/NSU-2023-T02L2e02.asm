asect  0x00

	ldi r0, a
	ld r0, r0
repeat:
	ldi r1, 0b00001111
	and r1, r0

	ldi r1, 10
	cmp r1, r0
	bhi cifra
	br bukva

obratno:
	cmp r2, r3
	bhi vtoroe
	
	ldi r1, res+1
	st r1, r0
	
	inc r2
	
	ldi r0, a
	ld r0, r0
	
	shr r0
	shr r0
	shr r0
	shr r0
	br repeat
	
vtoroe:
	ldi r1, res
	st r1, r0
	
	halt
	
cifra:
	ldi r1, 0x30
	add r1, r0	
	br obratno

bukva:
	ldi r1, 0x37
	add r1, r0
	br obratno

INPUTS>
a:    dc  0xC9
ENDINPUTS>

res:  ds 2             
end


