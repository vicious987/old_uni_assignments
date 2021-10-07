#include <iostream>
#include <math.h>
#include <utility>
#include <stdio.h>

using namespace std;

double f(double x) {
	return x / (exp(x)) - 0.06064;
}

double bisekcja(double a, double b, int n)
{
	double s;
	double fa = f(a);
	double fb = f(b);
	while (0 <= n)
	{
		n = n - 1;
		s = (a + b)/2;
		double fs = f(s);
		if (fa*fs < 0)
			b = s;
		else
			a = s;
	}
	return s;
}
int main()
{
	double a = 0.0;
	double b = 1.0;
	double alpha = 0.0646926359947960;
	for(int i = 0; i <= 15; i++)
		printf("\ni = %d ::: wartosc bledu = %12f ::: oszacowanie = %12f", i, abs(alpha - bisekcja(a,b,i)), (b-a)/pow(2.0, i+1.0));
	return 0;
}
/*
i = 0 ::: wartosc bledu =     0.435307 ::: oszacowanie =     0.500000
i = 1 ::: wartosc bledu =     0.185307 ::: oszacowanie =     0.250000
i = 2 ::: wartosc bledu =     0.060307 ::: oszacowanie =     0.125000
i = 3 ::: wartosc bledu =     0.002193 ::: oszacowanie =     0.062500
i = 4 ::: wartosc bledu =     0.029057 ::: oszacowanie =     0.031250
i = 5 ::: wartosc bledu =     0.013432 ::: oszacowanie =     0.015625
i = 6 ::: wartosc bledu =     0.005620 ::: oszacowanie =     0.007812
i = 7 ::: wartosc bledu =     0.001714 ::: oszacowanie =     0.003906
i = 8 ::: wartosc bledu =     0.000240 ::: oszacowanie =     0.001953
i = 9 ::: wartosc bledu =     0.000737 ::: oszacowanie =     0.000977
i = 10 ::: wartosc bledu =     0.000249 ::: oszacowanie =     0.000488
i = 11 ::: wartosc bledu =     0.000005 ::: oszacowanie =     0.000244
i = 12 ::: wartosc bledu =     0.000117 ::: oszacowanie =     0.000122
i = 13 ::: wartosc bledu =     0.000056 ::: oszacowanie =     0.000061
i = 14 ::: wartosc bledu =     0.000026 ::: oszacowanie =     0.000031
i = 15 ::: wartosc bledu =     0.000011 ::: oszacowanie =     0.000015
*/

