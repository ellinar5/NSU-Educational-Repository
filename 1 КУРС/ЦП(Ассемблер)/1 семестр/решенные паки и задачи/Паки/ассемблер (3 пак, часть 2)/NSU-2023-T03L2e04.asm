asect 0x00
	ldi r0,res
loop_otr:
	ldi r1,8
	cmp r2,r1
	beq exit1
	ldi r1,array
	add r2,r1
	ld r1,r1
	cmp r1,r3
	bgt skip
	jsr zapis
skip:
	inc r2
	br loop_otr

exit1:
	clr r2
loop_pol:
	ldi r1,8
	cmp r2,r1
	beq exit2
	ldi r1,array
	add r2,r1
	ld r1,r1
	cmp r1,r3
	blt skip1
	jsr zapis
skip1:
	inc r2
	br loop_pol

zapis:
	ldi r1,array
	add r2,r1
	ld r1,r1
	st r0,r1
	inc r0
	rts

exit2:
	halt

inputs>
array: dc 5,-1,-3,7,4,2,2,-8 
endinputs>
res: ds 8
end