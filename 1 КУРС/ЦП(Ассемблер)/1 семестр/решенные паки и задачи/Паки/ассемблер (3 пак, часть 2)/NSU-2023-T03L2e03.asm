asect  0x00
	ldi r0,s
	ldi r3,res
	st r3,r0
	ldi r1,0x20 #символ пробела
loop:
	ld r0,r2
	tst r2
	bz exit
	cmp r2,r1
	beq probel
	inc r0
	br loop
probel:
	clr r2
	st r0,r2
	inc r0 #сдвиг указателя на элемент строки
	inc r3 #сдвиг указателя на ячейку результата
	st r3,r0
	br loop
exit:
	halt
	
res: ds 9
inputs>
s: dc "cats dont like milk",0
	ds 57
endinputs>
end
