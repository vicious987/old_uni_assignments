#include <iostream>
#include <math.h>
#include <stdio.h>
#include <list>

using namespace std;

double newton1(double x, double r,int n)
{
	for(int i=0; i < n; i++)
	{
		printf("%f\n", x);
		x = 2*x - x*x*r;
	}
	return x;
}

int main()
{
	/*
	double startowe[] = {0,1,4,8,10,17,20};
	for(auto x : startowe){
		printf("\n::: %10f :::", newton1(x, 17, 10));
	}
	printf("\n");
	*/
	printf("\n::: %10f :::", newton1(0.5, 17, 10));
	return 0;
}
