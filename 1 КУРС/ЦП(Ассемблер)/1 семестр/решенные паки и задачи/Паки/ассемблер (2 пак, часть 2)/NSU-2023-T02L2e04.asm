asect  0x00

	ldi r0,x
	ld r0,r0
	
	# для первого сравнения
	ldi r1, 0b00000010 # занчание 2
	move r0,r2
	and r1,r2 # побитовое сравнение
	cmp r0,r2 # сравнение
	beq regravn # если r0 равен r2

regotmena:
	ldi r1, ans        
    st r1, r0          
    halt 
	
regravn:
	ldi r1, 0b00001000 
    and r1, r2         # AND с r2 для проверки 3-го бита
    cmp r0, r2         
    beq regotmena         # 3-й бит равен 0

    ldi r1, 0b00100010 
    xor r1, r0         # XOR с x
    ldi r1, ans        
    st r1, r0          
    halt   

INPUTS>
x:    dc 0b01101011
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end

