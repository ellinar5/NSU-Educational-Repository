asect  0x00
	ldi r0,a
	ld r0,r0
	cmp r0,r1
	beq registr0 #	здесь 0
	ldi r1,1
	cmp r0,r1
	beq registr1 # 1
	ldi r1,2
	cmp r0,r1
	beq registr2 # 2
	halt
	
	
        

registr2:
ldi r0,x
ld r0,r0
neg r0
ldi r1, ans
st r1,r0  
halt

registr1:
ldi r0,y
ld r0,r0
ldi r1,x
ld r1,r1
add r0,r1
ldi r0,ans
st r0,r1  
halt

registr0:
ldi r0,z
ld r0,r0
ldi r1, y
ld r1,r1
sub r1,r0
ldi r1,ans
st r1,r0  
halt

INPUTS>
a:    dc 3 
x:    dc 5     
y:    dc 3     
z:    dc 7
ENDINPUTS>

ans:  ds 1     
end

