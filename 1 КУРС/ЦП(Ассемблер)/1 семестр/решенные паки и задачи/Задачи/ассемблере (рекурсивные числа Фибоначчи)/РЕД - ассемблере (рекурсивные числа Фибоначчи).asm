asect  0x00

#Реализация функци
#f(0) = 0
#f(1) = 1
#f(n) = f(n-1) + f(n-2)
#рекурсивные числа Фибоначчи

	ldi r0, n
  	ld r0, r0
	jsr fib              #рекурсивная функция Фибоначчи
  	ldi r1,res
	st r1,r0
  	halt 

fib:
	if
		ldi r1,1
		cmp r0,r1
	is gt                #если r0 больше чем 1
	      dec r0
		  push r0
		  jsr fib        #Рекурсивно вызвать fib для n-1
		  move r0,r1
		  pop r0         #Восстановить предыдущее значение r0
		  dec r0         #Уменьшить r0 (подготовиться к fib(n-2))
		  push r1
		  jsr fib        #Рекурсивно вызвать fib для n-2
		  pop r1         #Восстановить r1 (значение fib(n-1))
		  add r1,r0      #Добавить результаты fib(n-1) и fib(n-2)
		fi
	rts
		  
		
	
INPUTS>
n:  dc 10

ENDINPUTS>
res: ds 1  
end