asect  0x00
	
	ldi r0,a
	ld r0,r0
	ldi r1,b
	ld r1,r1
	cmp r1,r0
	bgt registr
	beq registr1
	blt registr2	
        

registr:
ldi r0,x
ld r0,r0
ldi r1, ans
st r1,r0  
halt

registr1:
ldi r0,y
ld r0,r0
ldi r1, ans
st r1,r0  
halt

registr2:
ldi r0,z
ld r0,r0
ldi r1, ans
st r1,r0  
halt
 


INPUTS>
a:    dc -1    
b:    dc 1     
x:    dc 5     
y:    dc 3
z:    dc 7
ENDINPUTS>

ans:  ds 1    
end

