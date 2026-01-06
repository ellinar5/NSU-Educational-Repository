asect 0x00
	ldi r0,res
	ldi r1,-1
	st r0,r1
	ldi r0,s
	ld r0,r0
	ldi r1,p
	ld r1,r1
	ld r1,r1
main_loop:
	ld r0,r2
	tst r2
	bz exit
	cmp r2,r1
	beq proverka
	inc r0
	br main_loop

proverka:
	push r0
	ldi r1,p
	ld r1,r1
proverka_loop:
	ld r0,r2
	ld r1,r3
	tst r3
	bz zapis
	cmp r2,r3
	bne return
	inc r0
	inc r1
	br proverka_loop

return:
	pop r0
	inc r0
	ldi r1,p
	ld r1,r1
	ld r1,r1
	br main_loop

zapis:
	pop r0
	ldi r1,res
	st r1,r0
exit:
	halt

s:	dc _s
p:	dc _p

_s:	dc "cats dont like milk!",0
_p:	dc " li",0
	ds 40
res: ds 1
end
