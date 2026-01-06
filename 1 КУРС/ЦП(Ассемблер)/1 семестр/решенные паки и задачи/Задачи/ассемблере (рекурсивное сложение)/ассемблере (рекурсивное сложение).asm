asect  0x00

#Реализация функци#f(0) = 0
#f(n) = n + 1
#рекурсию сложения

	ldi r0, n
  	ld r0, r0
  	cmp r0,r1 #сравнение n и  0      
  	bgt ravnbolishe
  	halt #если n <= 0

ravnbolishe:
  	push r0     # Сохраняем текущее n на стеке
  	pop r1      # Извлекаем его в r1 для использования в рекурсии

recurse:
  	dec r0      # Уменьшаем n на 1 
  	add r0, r1
  	cmp r0, r2  # Сравниваем n с чем-то в r2
  	beq return  # Если n == 0, переходим к return
  	push r1     # Сохраняем результат на стеке
  	br recurse  # Рекурсивно вызываем функцию
  
return:
  	pop r0        # Берем n из стека
  	ldi r1,result
  	st r1,r0
  	halt

INPUTS>
n:  dc 3

ENDINPUTS>
result: ds 1  
end