asect  0x00

#Например, если мы разместим числа следующим образом: 
#A = 0x1234 (где `aLo = 0x34` и `aHi = 0x12`) 
#B = 0x5678 (где `bLo = 0x78` и `bHi = 0x56`)

	ldi r1,aLo
	ld r1,r1
	ldi r2,bLo
	ld r2,r2
	
	add 
	
	
    ldi r0, resLo  
    halt           

INPUTS>
aLo:	dc	 	
aHi:	dc	1 	
bLo:	dc	1 	
bHi:	dc	1 	
ENDINPUTS>

resLo:	ds	1
resHi:  ds  1		
end


