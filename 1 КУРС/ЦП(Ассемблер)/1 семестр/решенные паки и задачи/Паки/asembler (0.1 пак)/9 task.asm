asect  0x00
	ldi r1,a
	ld r1,r1
	inc r1
	ldi r2,b
	st r2,r1
    ldi r0, b    
    halt        

INPUTS>
a:
  dc 0b01100110    
ENDINPUTS>

b:
  ds 1     
end

