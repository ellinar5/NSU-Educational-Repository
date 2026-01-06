asect  0x00
	ldi r3,0b00000001
	ldi r1,0b10000000
	
leep:
	rol r1 # переварачивает число и ставит выпавший бит в конец
	ldi r0,x
	ld r0,r0
	
	move r0,r2
	and r1,r2
	rol r1
	rol r2
	
	and r1,r0
	cmp r1,r3
	beq anser
	
	cmp r0,r2
	beq leep
	halt
	
anser:
	ldi r0,x
	ld r0,r0
	ldi r1,ans
	st r1,r0
	halt

INPUTS>
x:    dc 0b00000000
ENDINPUTS>

ans:  ds 1     
end

