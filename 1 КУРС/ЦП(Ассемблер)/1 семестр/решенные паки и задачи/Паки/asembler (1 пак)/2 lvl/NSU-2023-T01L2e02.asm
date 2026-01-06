asect  0x003

#Например, если мы разместим числа следующим образом: 
#A = 0x1234 (где `aLo = 0x34` и `aHi = 0x12`) 
#B = 0x5678 (где `bLo = 0x78` и `bHi = 0x56`)

	ldi r1,aLo 
	ld r1,r1
	ldi r2,bLo
	ld r2,r2
	
	add r1,r2 #сложение младших байтов/ mem[aLo] + mem[bLo] /r1 - свободная 
	
	ldi r0,resLo
	st r0,r2 #  mem[resLo] = mem[aLo] + mem[bLo] /r0 - свободная
	
	ldi r0,aHi
	ld r0,r0
	ldi r1,bHi
	ld r1,r1
	
	addc r1,r0 # сложение старших байтов/ mem[aHi] + mem[bHi] /r1 - свободная 
	
	ldi r1,resHi
	st r1,r0 # присвоение заначения r1 к r0 для старших байтов

    ldi r0, resLo  
    halt           


INPUTS>
aLo:	dc	0b10000010 	
aHi:	dc	0b00000010 	
bLo:	dc	0b10011111 	
bHi:	dc	0b00000001 
ENDINPUTS>

resLo:	ds	1
resHi:  ds  1		
end