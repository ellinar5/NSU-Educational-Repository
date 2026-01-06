asect  0x00

	ldi r1,x
	ld r1,r1
	
	shla r1
	shla r1
	shla r1
	shla r1
	shla r1
	shla r1
	shla r1
	
	ldi r2,0
	addc r1,r2 #Добавить r2 к r1 с учетом бита переноса
	
	ldi r3,1
	and r1,r3 #Оставить только младший бит в r1
	
    ldi r0, res
	st r0,r1
	 
    halt           




INPUTS>
x:     dc  128   
ENDINPUTS>

res:  ds  1    
end

