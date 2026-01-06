asect  0x00
	ldi r0,x #кого делим
	ld r0,r0
	ldi r1,y #на что делем
	ld r1,r1

cikl:
	cmp r0, r1
	blt exit #Если r < y, выходим из цикла
	
	sub r3,r1 #r = r - y (вычитаем y из остатка)
	inc r2 # q = q + 1 (увеличиваем частное)
	
	br cikl
exit:
	ldi r1, quot
	st r2, r1
	ldi r1, remain
	st r3, r1
	halt


INPUTS>
x:      dc 10  
y:      dc 5   
ENDINPUTS>

quot:   ds 1    
remain: ds 1    
end

