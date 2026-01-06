asect  0x00
	
	ldi r0,x
	ld r0,r0
	ldi r1,y
	ld r1,r1
	
	shla r1 #2*mem[y]
	
	shla r0
	ldi r2,x
	add r0,r2 #2*mem[x] + mem[x] = 3*mem[x]
	neg r2 # -(3*mem[x])
	
	cmp r1,r2
	
	blt registr
	bgt registr1
	
registr:
ldi r0,x
ld r0,r0
ldi r1,y
ld r1,r1

add r0,r1

ldi r0,ans
st r0,r1
halt

registr1:
ldi r0,y
ld r0,r0
ldi r1,z
ld r1,r1

sub r0,r1 

ldi r0,ans
st r0,r1
halt        



INPUTS>
x:    dc 6    
y:    dc 5     
z:    dc 3
ENDINPUTS>

ans:  ds 1     
end

