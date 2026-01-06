asect  0x00
  ldi r0,length # длина массива (счетчик)
  ld r0,r0
  ldi r1,content

loop:
  tst r0
  bz exit #проверка на конец массива
  ld r1,r2 # получение элемента массива
  cmp r2,r3 #сравнение с нулем
  bge skip #если больше или равно
  neg r2 
  st r1,r2
skip:
  inc r1 
  dec r0
  br loop
exit:
  halt

DATA>
length: dc 5
content: dc 2,0,-3,4,-9
ENDDATA>
end
