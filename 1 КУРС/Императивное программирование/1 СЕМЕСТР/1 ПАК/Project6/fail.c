//6
#include <stdio.h>
#include <stdlib.h>


int main()
{
	int n;
	printf("Enter the length N of the array: ");
	scanf_s("%d", &n);

	if (n < 1 || n > 20)
	{
		printf("The number is entered incorrectly");
		return 0;
	}

	int massiv[20];
	printf("Enter %d integers: ", n);
	for (int i = 0; i < n; i++) 
	{
		scanf("%d", &massiv[i]);
	}

	int min = massiv[0];
	int max = massiv[0];
	int index_min = 1; //индекс начинается с 1
	int index_max = 1;

	for (int i = 1; i < n; i++)
	{

		if (massiv[i] < min) 
		{
			min = massiv[i];
			index_min = i + 1; // +1, так как индексы начинаются с 1
		}
		if (massiv[i] > max) 
		{
			max = massiv[i];
			index_max = i + 1; // +1, так как индексы начинаются с 1
		}
	}

	printf("Minimum element: %d\n", min);
	printf("Indexmin element: %d\n", index_min);
	printf("Maximum element: %d\n", max);
	printf("Indexmax element: %d\n", index_max);
	free(massiv);
	return 0;
}



