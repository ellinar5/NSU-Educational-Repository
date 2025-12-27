//3
#include <stdio.h>
#include <stdlib.h>
int main()
{
	int n;
	int sum = 0;
	printf("Enter the length N of the array: ");
	scanf_s("%d", &n);
	
	int* massiv = malloc(n * sizeof(int)); //выделение памяти для массива: указатель,"выделяем память",расчитаваем обЪем памяти и получаем размер памяти
	if (massiv == NULL) //ошибка, не вывделеялась память
	{
		printf("Memory allocation failed:\n");
		return 1; 
	}

	if (n >= 1 && n <= 100)
	{
		printf("Enter array elements: ");
		for (int i = 0; i < n; i++)
		{
			scanf_s("%d", &massiv[i]);
			if (massiv[i] % 2 == 0)
			{
				if (massiv[i] < 100)
				{
					sum += abs(massiv[i]);
				}

			}
			
		}
	}
	printf("Sum of numbers: %d\n", sum);

	return 0;
}