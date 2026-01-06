asect 0x00
	ldi r0,S
	ld r0,r1
	ldi r2,"{"
	cmp r1,r2
	bne error
	inc r0
loop:
	clr r3
	ld r0,r1
	tst r1
	bz exit
	ldi r2,"i"
	cmp r1,r2
	blo crypt1
	ldi r2,"q"
	cmp r1,r2
	blo crypt2
	ldi r2,"y"
	cmp r1,r2
	blo crypt3
	br crypt4

crypt1:
	ldi r2,"a"
	cmp r1,r2
	beq skip1
	sub r1,r2
	move r2,r3
skip1:
	ldi r1,0x80
	jsr delenie
	ldi r2,result
	ld r2,r2
	or r2,r1
	ldi r2,result
	st r2,r1
	inc r0
	inc r0
	br loop

crypt2:
	ldi r2,"i"
	cmp r1,r2
	beq skip2
	sub r1,r2
	move r2,r3
skip2:
	ldi r1,0x80
	jsr delenie
	ldi r2,result
	inc r2
	ld r2,r2
	or r2,r1
	ldi r2,result
	inc r2
	st r2,r1
	inc r0
	inc r0
	br loop

crypt3:
	ldi r2,"q"
	cmp r1,r2
	beq skip3
	sub r1,r2
	move r2,r3
skip3:
	ldi r1,0x80
	jsr delenie
	ldi r2,result
	ldi r3,2
	add r3,r2
	ld r2,r2
	or r2,r1
	ldi r2,result
	ldi r3,2
	add r3,r2
	st r2,r1
	inc r0
	inc r0
	br loop

crypt4:
	ldi r2,"y"
	cmp r1,r2
	beq skip4
	sub r1,r2
	move r2,r3
skip4:
	ldi r1,0x80
	jsr delenie
	ldi r2,result
	ldi r3,3
	add r3,r2
	ld r2,r2
	or r2,r1
	ldi r2,result
	ldi r3,3
	add r3,r2
	st r2,r1
	inc r0
	inc r0
	br loop

delenie:
	tst r3
	bz return
	shr r1
	dec r3
	br delenie

exit:
	halt

return:
	rts

error:
	ldi r0, result
	ldi r1,3
	add r1,r0
	ldi r1,0x3F
	st r0,r1
	halt

S: dc "{d,a,q,r,e,f}",0
	ds 40
result: ds 4
end
