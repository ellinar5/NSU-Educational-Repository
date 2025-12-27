//7
#include <stdio.h>
#include <stdlib.h>

int main()
{
	int n,m,p,k,l;
	printf("Enter apartment n: ");
	scanf_s("%d", &n);
	printf("Enter the apartment number(m): ");
	scanf_s("%d", &m);
	printf ("Enter the number of floors(p): ");
	scanf_s("%d", &p);
	printf ("Enter the entrance(k): ");
	scanf_s("%d", &k);
	printf("Enter the floor(l): ");
	scanf_s("%d", &l);

	if (n < 0 && n>500 && p<=1)
	{
		printf("Wrong number");
	}

	int flats_per_floor = m / ((p - 1) * l + k); //Количество квартир на одном этаже

	int flats_per_entrance = l * flats_per_floor; // Количество квартир в одном подъезде

	int *entrance = (n - 1) / flats_per_entrance; // Вычисление номера подъезда

	int *floor = ((n - 1) % flats_per_entrance) / flats_per_floor + 1; // Вычисление номера этажа в подъезде
	
	printf("Entrance: %d, Floor: %d\n", entrance, floor);

	
	return 0;
}