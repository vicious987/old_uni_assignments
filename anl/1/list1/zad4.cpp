#include <stdio.h>
#include <math.h>
#include <stdbool.h>

double seqsum(int n)
{
	double sum = 0;
	for(int i = 0; i<n; i++)
	{
		double seq_el = 1.0 / (2*i + 1);
		if(i%2 == 0)
			sum += seq_el;
		else
			sum -= seq_el;
	}
	return 4*sum;
}


int main()
{
	double pi = seqsum(50000);
	bool q = M_PI - pi < 1.0/ pow(10.0, 5);
	printf("   123456789\n");
	printf("% .50f\n", pi);
	printf("% .50f\n", M_PI);
	printf("% .50f\n", M_PI - pi);
	printf("Czy roznica jest miedzy tymi wartosciami jest mniejsza niz 10^-5? : %s\n", q ? "tak" : "nie"); 
}
/*
   123456789
 3.14157265358978143865442689275369048118591308593750
 3.14159265358979311599796346854418516159057617187500
 0.00002000000001167734353657579049468040466308593750
Czy roznica jest miedzy tymi wartosciami jest mniejsza niz 10^-5? : nie
 */
