#include <stdio.h>

void sortuj(int tablica[], unsigned int n);

int main()
{
	int tablica[10] = { 1, 2, 3, 9, 8, 7, 4, 5, 6, 0 };
	for (int i = 0; i < 10; i++)
	{
		printf("%d ", tablica[i]);
	}
	printf("\n");
	sortuj(tablica, 10);
	for (int i = 0; i < 10; i++)
	{
		printf("%d ", tablica[i]);
	}
	return 0;
}