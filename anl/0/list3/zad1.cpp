//#include <cmath>
#include <stdio.h>
#include <math.h>
// pi/6 = 0.523598775598298873077107230546583814032861566562517636829
// 5^6 = 15625
double f1(double x){
	double r = 4.0 * cos(x) * cos(x);
	return r - 3.0;
}
double f2(double x){
	return cos(3.0 * x) / cos (x);
}
double log5(double x){
	return (log(x) / log(5));
}

double g1(double x){
	return log5(x) - 6.0;
}
double g2(double x){
	return log5(x / 15625.0);
}

int main(){
	double z = 0.523598775598298873077107230546583814032861566562517636829;
	double x = 15625.0 ;
	double a = 15625.1 ;
	double b = 15625 - 0.00000000001;
	printf("%+ .40f\n", f1(z));
	printf("%+ .40f\n", f2(z));
	printf("\n");
	printf("%+ .40f\n", g1(x));
	printf("%+ .40f\n", g2(x));
	printf("\n");
	printf("%+ .40f\n", g1(a));
	printf("%+ .40f\n", g2(a));
	printf("\n");
	printf("%+ .40f\n", g1(b));
	printf("%+ .40f\n", g2(b));
}
