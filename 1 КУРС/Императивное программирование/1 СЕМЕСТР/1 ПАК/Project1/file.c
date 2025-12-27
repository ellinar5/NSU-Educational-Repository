//#1
#include "stdio.h"

int main()
{
	int n, sum = 0;

	printf("Enter a number: ");
	scanf_s("%d", &n);

	for (int i = 1; i <= n; i++)
	{
		sum += i;
	}
	printf("The sum of integers in the range from 1 to N inclusive: %d\n", sum);

	return 0;
}