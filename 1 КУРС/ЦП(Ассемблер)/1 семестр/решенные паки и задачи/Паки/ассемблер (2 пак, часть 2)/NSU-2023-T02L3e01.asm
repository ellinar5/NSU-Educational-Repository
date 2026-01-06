asect  0x00

	ldi r0,a+1  #для 16-битных значений (многобайтовых)
	ld r0,r0
	ldi r1,b+1
	ld r1,r1
	cmp r0,r1 #сравнение
	
	blo regplus #если меньше
	bhi regminus #если больше
	halt
	
	
regplus:
	ldi r0,a
	ld r0,r0
	ldi r1,b
	ld r1,r1
	add r0,r1
	ldi r0,ans
	st r0,r1
	ldi r0, a+1
	ld r0, r0
	ldi r1, b+1
	ld r1, r1
	addc r1, r0 #сложение с учетом переноса
	ldi r1, ans+1
	st r1, r0
	halt

regminus:
	ldi r0,a
	ld r0,r0
	ldi r1,b
	ld r1,r1
	sub r0,r1
	ldi r0,ans
	st r0,r1
	ldi r0, a+1
	ld r0, r0
	ldi r1, b+1
	ld r1, r1
	neg r1
	addc r0,r1
	ldi r0, ans+1
	st r0, r1
	halt
	






INPUTS>
a:    dc  0x23,0xa8   
b:    dc  0x23,0xa8  

ENDINPUTS>

ans:  ds 2      
end


