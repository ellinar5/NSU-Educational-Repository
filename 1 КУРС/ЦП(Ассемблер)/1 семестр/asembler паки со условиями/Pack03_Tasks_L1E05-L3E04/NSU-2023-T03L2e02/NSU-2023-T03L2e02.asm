asect 0x00
	ldi r0,s
	ldi r2,0xE0
loop:
	ld r0,r1
	tst r1
	bz exit
	add r2,r1
	st r0,r1
	inc r0
	br loop
exit:
	halt

inputs>
res:
s: dc "hello",0 	
	ds 17      
endinputs>
end
