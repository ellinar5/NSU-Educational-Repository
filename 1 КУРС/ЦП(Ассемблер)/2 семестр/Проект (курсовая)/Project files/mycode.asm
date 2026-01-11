asect 0x80
INPUTS>
player_data:    ds 6
#player_data: dc 5,"Me   "
ENDINPUTS>

#table:        ds 30
table: dc 1,"Sam  ",3,"Alex ",5,"Kate ",0xff,"     ",0xff,"     "
leaderboard:    ds 5
sorted_data:    ds 30

insert_index:   ds 1
leaderboard_counter: ds 1
table_counter: ds 1
curr_pos: ds 1

asect 0x00
# leaderboard[0] = table + 0
ldi r0, leaderboard
ldi r1, table
ldi r2, 0
add r2, r1
st  r0, r1

# leaderboard[1] = table + 6
inc r0
ldi r2, 6
add r2, r1
st  r0, r1

# leaderboard[2] = table + 12
inc r0
add r2, r1
st  r0, r1

# leaderboard[3] = table + 18
inc r0
add r2, r1
st  r0, r1

# leaderboard[4] = table + 24
inc r0
add r2, r1
st  r0, r1

# Найти позицию для вставки
ldi r0, player_data
ld  r0, r1               # r1 := счёт игрока

ldi r0, leaderboard
dec r0

ldi r3,5				# r3 - счётчик
while					# r0 - указатель^2 на счёт больше игрока, r1 - счёт игрока, r2 - счёт больше игрока
	inc r0
	ld r0,r2
	ld r2,r2
	dec r3
stays nz
	cmp r1,r2
	blo pointerShift:
wend
halt					# игрок не влез в таблицу - закрываем программу

pointerShift:			# r0 - указатель^2 на счёт больше игрока, r3 - обратный индекс указателя^2 на счёт больше игрока
ldi r1, 0
ldi r2, -6				# 6*(-1)

ldi r1, player_data
st r0, r1

while
	inc r0
	ld r0, r1
	add r2, r1
	st r0, r1
	dec r3
stays nz
wend
	
# Построение отсортированной копии
ldi r0, leaderboard
ldi r1, sorted_data
ldi r2, leaderboard_counter
ldi r3, 6			# 5+1
st r2, r3

while
	ldi r2, leaderboard_counter
	ld r2, r3
	dec r3
	st r2,r3
	tst r3
stays nz
	ld r0, r3
	ldi r2, curr_pos
	st r2, r3
	
	ldi r2, table_counter
	ldi r3, 7		# 6+1
	st r2, r3
	while
		ldi r2, table_counter
		ld r2, r3
		dec r3
		st r2,r3
		tst r3
	stays nz
		ldi r2, curr_pos
		ld r2, r3
		
		ld r3, r2
		st r1,r2
		
		inc r3
		ldi r2, curr_pos
		st r2, r3

		inc r1
	wend
	inc r0
wend

# Перенос данных
ldi r0, sorted_data
ldi r1, table
ldi r3, 31

while
	dec r3
stays nz
	ld r0, r2
	st r1, r2
	
	inc r0
	inc r1
wend

ldi r0, table
ld r0,r1

halt
end
