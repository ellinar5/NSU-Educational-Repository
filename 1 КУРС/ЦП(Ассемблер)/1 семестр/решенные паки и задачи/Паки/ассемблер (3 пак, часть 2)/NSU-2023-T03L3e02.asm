asect 0x00
loop:
  ldi r1,8
  cmp r0,r1
  beq exit
  ldi r1,x
  ldi r2,y
  add r0,r1
  add r0,r2
  ld r1,r1
  ld r2,r2
  add r3,r1
  clr r3
  add r2,r1
  ldi r2,0
  addc r2,r3
  ldi r2,sum
  add r0,r2
  st r2,r1
  inc r0
  br loop

exit:
  halt

x: dc 0x07,0xab,0x07,0xab,0x07,0xab,0x07,0xab
y: dc 0x07,0xab,0x07,0xab,0x07,0xab,0x07,0xab
sum: ds 8
end
