asect 0x00
	ldi r2,b
	ld r2,r2
	shla r2 #смещение; 2*mem[b]

	ldi r1,a
	ld r1,r1
	add r1,r2 #mem[a]+(2*mem[b])/свободна r1

	ldi r3,c
	ld r3,r3
	sub r2,r3#mem[a]+(2*mem[b]) - mem[c]/свободна r2

	ldi r1,d
	ld r1,r1
	sub r3,r1 #mem[a]+(2*mem[b]) - mem[c] - mem[d]

	ldi r3,res
	st r3,r1

	ldi r0, res
	halt

INPUTS>
a: dc 1
b: dc 2
c: dc 3
d: dc 4
ENDINPUTS>

res: ds 1
end