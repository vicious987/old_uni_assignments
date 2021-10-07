#include <math.h>
#include <stdio.h>

using namespace std;

double f1(double x){
	double arg = pow(x, 11);
	double r =  sqrt(arg + 1) - 1;
	return 4038.0 * r / arg;
}

double f2(double x){
	double arg = pow(x, 11);
	double r = sqrt(arg + 1) + 1;
	return 4038.0 / r;

	
}


int main() {
	printf("% .50f\n", f1(0.01));
	printf("% .50f\n", f2(0.01));
	return 0;
}

