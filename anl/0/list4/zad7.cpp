#include <iostream>
#include <math.h>
#include <stdio.h>
#include <list>

using namespace std;

double newton1(double x, double a,int n)
{
	for(int i=0; i < n; i++)
	{
		printf("%f\n", x);
		x = (x + a/x)/2;
	}
	return x;
}

int main()
{
	printf("\n::: %10f :::", newton1(2,7.75, 10));
	return 0;
}


