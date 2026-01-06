asect  0x00
	ldi r1,a
	ld r1,r1
	neg r1
	ldi r2,b
	st r2,r1
    ldi r0, b    
    halt        

INPUTS>
a:
  dc 15    
ENDINPUTS>

b:
  ds 1     
end

