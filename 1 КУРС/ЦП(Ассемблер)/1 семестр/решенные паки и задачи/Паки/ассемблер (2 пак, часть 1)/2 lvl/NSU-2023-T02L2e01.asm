asect  0x00
	
	ldi r0,x
	ld r0,r0
	ldi r1,0
	
    cmp r1,r0
	bz registr0 #если рано 0
	bpl registr1 #для плюсов
  	bmi registr2 #для минусов
	
	
	
registr0:
ldi r0,99
ldi r1,ans
st r1,r0
halt

registr1:
 ldi r1, 0b00000001
  and r1, r0
  tst r0
  bz pol_chet
  ldi r0, 1
  ldi r1, ans
  st r1, r0
  halt

pol_chet:
  ldi r0, 2
  ldi r1, ans
  st r1, r0
  halt

registr2:
neg r0
  ldi r1, 0b00000001
  and r1, r0
  tst r0
  bz otr_chet
  ldi r0, -1
  ldi r1, ans
  st r1, r0
  halt

otr_chet:
ldi r0, -2
  ldi r1, ans
  st r1, r0
  halt


INPUTS>
x:    dc 0 
ENDINPUTS>
ans:  ds 1     
end