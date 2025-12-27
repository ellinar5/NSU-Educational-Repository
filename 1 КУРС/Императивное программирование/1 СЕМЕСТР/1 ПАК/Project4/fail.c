//4
#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main(void)
{
	int n;
	printf("Enter the length N of the array: ");
	scanf("%d", &n);

	if (n <= 1 || n>5000)
	{
		printf("Wrong number n");
		return 0;

	}
	
    if (n <= 1) {
        return 0;  // Числа меньше или равные 1 не являются простыми
        printf("NO");
    }
    if (n <= 3) {
        return 1;  // 2 и 3 являются простыми числами
        printf("YES");
    }
    if (n % 2 == 0 || n % 3 == 0) {
        return 0;  // Делим на 2 или 3, если делится, то не простое
        printf("NO");
    }
    for (int i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0) {
            return 0;  // Проверка на делимость
            printf("NO");
        }
    }
    return 1;  // Если ни на что не делится, значит простое
    printf("YES");
}

