//8
#include <stdio.h>
#include <stdlib.h>

int main()
{
	int h, m, s, k;
	printf("Enter it's hours, minutes, seconds now (h,m and s): ");
	scanf_s("%d %d %d", &h,&m,&s);
	printf("Enter the how many seconds to add (k): ");
	scanf_s("%d", &k);
	

	if (h < 0 && h>23 && m < 0 && m > 59 && s < 0 && s > 59 && k<1 && k>1000000)
	{
		printf("Wrong number");
	}

	//все полученные данные преобразуем в секунды
	int time = h * 3600 + m * 60 + s + k;

	// Переводлим секунды в часы,минуты и секунды = новое время
	int h_new = (time / 3600)%24;
	int m_new = (time / 60) % 60;
	int s_new = time % 60;

	printf("New time: %d %d %d \n", h_new, m_new, s_new);
	return 0;
}