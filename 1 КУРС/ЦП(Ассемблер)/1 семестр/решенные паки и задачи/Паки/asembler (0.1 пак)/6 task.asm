asect  0x00
	ldi r1,a #выделение памяти 
	ld r1,r1 #r1=mem[a]
	ldi r2,b
	ld r2,r2
    push r2
    push r1
    ldsa r0,0 
    halt      

INPUTS>
a: dc 15
b: dc 14

ENDINPUTS>

end



