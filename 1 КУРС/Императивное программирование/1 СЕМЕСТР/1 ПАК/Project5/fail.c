//5
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
	int a, b;
	printf("Enter a and b:\n");
	scanf_s("%d%d", &a, &b);
	if (abs(a) > 10000 || abs(b) > 10000 || b < 0)
	{
		printf("Numbers a and b entered incorrectly");
	}
	else 
	{
		if (b != 0)
		{
			if (a >= 0)
			{
				int result1 = floor(a / (double)b); //округление к меньшому числу
				int result2 = ceil(a / (double)b);  // округление к большому числу 
				int result3 = floor(a / (double)b); // округление ближе к нулю
				printf_s("Result of 1 division :%d\n", result1);
				printf_s("Result of 2 division :%d\n", result2);
				printf_s("Result of 3 division :%d\n", result3);

				int r = a % b; //сохраняем остаток от деления
				if (r >= 0 && r <= b)
				{
					printf_s("Result of 4 division :%d\n", r);
				}
			}
			else //для отрицательных
			{
				int result1 = floor((double)a / b); 
				int result2 = ceil((double)a / b); 
				int result3 = ceil((double)a / b);
				printf_s("Result of 1 division :%d\n", result1);				
				printf_s("Result of 2 division :%d\n", result2);
				printf_s("Result of 3 division :%d\n", result3);

				int r = a % b;
				if (r >= 0 && r <= b)
				{
					printf_s("Result of 4 division :%d\n", r);
				}
				else
				{
					printf_s("Result of 4 division :%d\n", r+b);
				}
			}
		}
	}
	return 0;
}


//функция ceil которая округляет число в большую сторону до ближайшего целого числа.Использует библеотеку math.h
//функция floor которая округляет число в меньшую сторону до ближайшего целого числа.Использует библеотеку math.h





















