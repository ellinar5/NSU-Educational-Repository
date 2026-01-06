asect  0x00
	ldi r0, n
	ld r0, r0 #r0 is N
loop:
	cmp r1, r0 #r1 is num
	bhi exit
	add r1, r2 #r2 is total
	bcs overflow
	inc r1
	br loop
exit:
	ldi r0, res
	st r0, r2
	ldi r0, oflow
	ldi r1, -1
	st r0, r1
	halt

overflow:
	ldi r0, 1
	ldi r1, oflow
	st r1, r0
	ldi r0, 255
	ldi r1, res
	st r1, r0
	halt
INPUTS>
n:     dc 7    
ENDINPUTS>

res:   ds 1    
oflow: ds 1    
end

