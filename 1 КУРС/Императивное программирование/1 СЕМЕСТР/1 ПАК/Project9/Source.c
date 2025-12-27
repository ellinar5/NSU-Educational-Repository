//9
#include <stdio.h>
#include <stdlib.h>

int main()
{
	int n;
	printf("Enter Volume of rectangular parallelepipeds with integer sides (n): ");
	scanf("%lld", &n);

	if (n < 0 && n > 100000000)
	{
		printf("Wrong number");
	}

	long long count = 0;
	for (long long a = 1; a * a * a <= n; ++a) 
	{
		for (long long b = a; a * b * b <= n; ++b) 
		{
			long long max_c = n / (a * b);
			
			if (max_c >= b) 
			{
				count += (max_c - b + 1);
			}
		}
	}

	printf("parallelepipeds: %lld", count);
	return 0;
}