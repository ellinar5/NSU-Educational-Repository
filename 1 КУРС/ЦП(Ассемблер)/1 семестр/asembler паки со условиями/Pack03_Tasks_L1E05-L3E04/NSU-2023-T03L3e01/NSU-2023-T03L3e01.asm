asect 0x00
	ldi r0,s
	ld r0,r1
	ldi r2,"{"
	cmp r1,r2
	beq error
error:
	ldi r0,result
	ldi r1,3
	add r1,r0
	ldi r1,0x3F
	st r0,r1
	halt
	
	

inputs>
s: dc "{f,a,z,q}",0
	ds 40
endinputs>
result: ds 4
end
