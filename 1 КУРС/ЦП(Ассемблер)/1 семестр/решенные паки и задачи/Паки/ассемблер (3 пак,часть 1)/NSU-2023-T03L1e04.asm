asect  0x00
	ldi r0, n
	ld r0, r0
	ldi r2, content
loop:
	inc r1
	cmp r0, r1
	blo exit
	st r2, r1
	inc r2
	br loop
exit:
	halt

INPUTS>
n:       dc 12   
ENDINPUTS>

content: ds 15  
end

