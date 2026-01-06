asect	0x00
  ldi r0,n
  ld r0,r0 #загружаем индекс
  ldi r1,s #указатель на элемент строки
  add r0,r1 #проверка на выход за пределы строки
  ld r1,r1
  tst r1
  bz vopros #если вышли за конец строки
  ldi r0,res #если нет, то записываем полученный в результате смещения результат
  st r0,r1
  halt
vopros:
  ldi r1,"?"
  ldi r0,res
  st r0,r1
  halt

inputs>
n: dc 5
s: dc "Hello!",0
  ds 18
endinputs>
res: ds 1
end 	 
