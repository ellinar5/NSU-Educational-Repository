asect  0x00

#Реализация функци
#C(k,n) = C(k,n-1) + C(k-1,n-1)
#k<n
#C(0,m) = C(m,m) = 1
#Рекурсивное вычисления бинимального коэффициента

	ldi r0, n
  	ld r0, r0
	ldi r1, k
	ld r1,r1
	
	jsr kof             #рекурсивная функция бинимального коэффициента
  	ldi r2,res
	st r2,#r0
  	halt 

kof:
	if
		cmp r0,r1
	is gt                 #если r0 больше чем 1
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
n:  dc 6
k:  dc 1

ENDINPUTS>
res: ds 1  
end