#include <iostream>
#include <math.h>
#include <stdio.h>

using namespace std;


double f(double x){
	return x*x - 2.0*x - atan(7.0 * x - 2.0);
}

double bisekcja(double a, double b, double prec)
{
	//printf("argumenty: %f, %f\n", a, b);
	double s = (a + b)/2.0;
	double ex = 1.0 / pow(10.0,prec);
	double stop = abs(a - b);
	while (ex < stop)
	{
		//printf("przedzial: %f, %f :: dlugosc przedzialu %f\n", a, b, stop);
		stop = stop / 2;
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

	printf("hello\n");
	double PREC = 10;
	double a = 0;
	double b = 1;
	double c = 2;
	double d = 3;


	double r1 = bisekcja(a,b,PREC);
	double r2 = bisekcja(c,d,PREC);

	printf("Pierwsze miejsce zerowe: %.12f\n", r1);
	printf("Drugie miejsce zerowe: %.12f\n", r2);
	return 0;
}
