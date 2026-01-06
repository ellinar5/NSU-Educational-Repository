asect  0x00
	
	ldi r1,a
	ld r1,r1
	tst r1
	
	if 
	is mi
	 	neg r1
	fi #окончание if
	
	ldi r0, ans 
	st r0,r1  
    halt         



INPUTS>
a:    dc  -18   
ENDINPUTS>

ans:  ds 1     
end