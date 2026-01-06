asect  0x00
	
	ldi r0,x
	ld r0,r0
	ldi r1,y
	ld r1,r1
	ldi r2,5
  	add r0,r2
	
	cmp r2,r1
	bge registr 
	blt registr1
        
   
registr:
ldi r0,ans
ldi r2,x
ld r2,r2
shla r2 #2*mem[x]
shla r2 #4*mem[x]
ldi r1,x
ld r1,r1
sub r2,r1 #4*mem[x] - mem[x] = 3*mem[x]

st r0,r1
halt

registr1:
ldi r0,y
ld r0,r0
ldi r1,z
ld r1,r1

shla r0 #2*mem[y]

ldi r2,7
add r2,r1 #7+mem[z]

sub r1,r0

ldi r1,ans
st r1,r0
halt




INPUTS>
x:    dc 1  
y:    dc 7 
z:    dc 3        
ENDINPUTS>

ans:  ds 1     
end

