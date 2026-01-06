asect  0x00
	ldi r1,a
	ld r1,r1
	ldi r2,b
	ld r2,r2
	sub r1,r2
	ldi r3,c
	st r3,r2
    ldi r0, c    
    halt         

INPUTS>
a:
  dc 7    
b:
  dc 9    
ENDINPUTS>

c:
  ds 1     
end

