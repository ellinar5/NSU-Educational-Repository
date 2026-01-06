asect  0x00

  ldi r0,length
  ld r0,r0 #будет использзоваться как счётчик для цикла
  ldi r1,content #указатель на текущий элемент массива
loop:
  tst r0
  bz exit #проверка на конец массива
  ld r1,r2 #загрузка текущего элемента массива по указателю
  cmp r2,r3 #сравнение с 0
  blt otr #для отрицательных
  bgt pol #для положительных
  beq zero #для нулей
otr:
  ldi r2,neg
  ld r2,r2 #загрузить текущее состояние счётчика отрицательных
  inc r2 
  ldi r3,neg
  st r3,r2 #отправляем результат обратно по нужной метке
  clr r3 #очистка регистра т.к. он используется для сравнения с нулём
  br zaversh
pol:
  ldi r2,pos
  ld r2,r2
  inc r2
  ldi r3,pos
  st r3,r2
  clr r3
  br zaversh
zero:
  ldi r2,zer
  ld r2,r2
  inc r2
  ldi r3,zer
  st r3,r2
  clr r3
  br zaversh
zaversh:
  dec r0 #уменьшаем счётчик
  inc r1 #сдвигаем указатель на элемент массива
  br loop
exit:
  halt   

INPUTS>
length: dc 5
content: dc 2, 0, -3, 4, -9
ENDINPUTS>
pos: ds 1 
neg: ds 1
zer: ds 1
end

