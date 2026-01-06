asect  0x00
	ldi r1,a
	ld r1,r1
	dec r1
	ldi r2,b
	ld r2,r2	
    ldi r0, b    
    halt         

INPUTS>
a:
  dc "P"    
ENDINPUTS>

b:
  ds 1     
end

