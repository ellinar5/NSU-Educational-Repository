asect  0x00

	ldi r0,x
	ld r0,r0
	move r0, r1
	ldi r2,y
	ld r2,r2
	dec r2
	br loop
	
return:
	ldi r1, ans
	st r1, r0
	halt

loop:
	cmp r2, r3
	beq return
	add r1, r0
	dec r2
	br loop 



INPUTS>
x:     dc 7    
y:     dc 3    
ENDINPUTS>

ans:   ds 1    

end

