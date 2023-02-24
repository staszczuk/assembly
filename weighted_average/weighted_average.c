#include <stdio.h>

#define N 8

float weighted_average(float* values, float* weights, int n);

int main()
{
	float values[N] = { 1.23, 2.34, 3.45, 4.56, 5.67, 6.78, 0, 0 };
	float weights[N] = { 0, 1.2, 2.3, 3.4, 4.5, 5.6, 6.7, 0 };
	printf("%f", weighted_average(values, weights, N));
	return 0;
}