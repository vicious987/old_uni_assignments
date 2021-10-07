#include <iostream>
#include <math.h>
#include <stdio.h>

using namespace std;


double f(double x){
	return x*x - log(x+2);
}

double bisekcja(double a, double b, double prec)
{
	double s = (a + b)/2.0;
	double ex = 1.0 / pow(10.0,prec);
	while (abs(f(s)) > ex)
	{
		s = (a + b)/2.0;
		double fs = f(s);
		if (f(a)*f(s) < 0)
			b = s;
		else
			a = s;
	}
	return s;
}
int main()
{
	double PREC = 10;
	double a = -1;
	double b = 0;
	double c = 2;
	printf("\nPierwsze miejsce zerowe: %.12f\nDrugie miejsce zerowe: %.12f\n", bisekcja(a,b,PREC), bisekcja(b,c,PREC));
	return 0;
}
/*
Pierwsze miejsce zerowe: -0.587608827977
Drugie miejsce zerowe: 1.057103549945
*/
