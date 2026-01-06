	asect 0 
	ldi r0, a
	ld r0, r0
	ldi r1, b
	ld r1, r1
	add r0, r1
	ldi r0, c 
	st r0, r1
	ldi r0, c 
	halt
	
a: dc 10
b: dc 45	
c: dc 9

	end