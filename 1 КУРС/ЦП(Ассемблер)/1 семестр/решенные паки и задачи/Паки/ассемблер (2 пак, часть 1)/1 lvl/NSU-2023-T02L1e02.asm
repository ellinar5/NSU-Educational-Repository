asect  0x00
	
	ldi r1,a
	ldi r0,b
	ld r1,r1
	ld r0,r0
	cmp r0, r1 #сравнение значений
	bgt registr # (ветка) переход по метке если r1 больше r2

registr1:

	ldi r0,c
	ld r0,r0
	cmp r0,r1
	bgt registr
	
	ldi r0,ans
	st r0,r1 
    halt  

registr:   
move r0,r1 #переекапировать значение из r2 в r1
br registr1 #возвращение
     


INPUTS>
a:    dc -18   
b:    dc 9     	
c:    dc 5
ENDINPUTS>

ans:  ds 1     
end

