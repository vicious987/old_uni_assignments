#include <iostream>
#include <math.h>
#include <utility>
#include <stdio.h>

using namespace std;
pair <float, float> pierwiastek(float a, float b, float c)
{
	float delta = sqrt(b*b - 4*a*c);
	float p1 = (-b + delta) / (2 * a);
	float p2 = (-b - delta) / (2 * a);
	pair <float, float> r (p1, p2);
	return r;
}

pair <float, float> viete(float a, float b, float c)
{
	float p1;
	float p2;
	float delta = sqrt(b*b - 4*a*c);
	if (b >= 0)
		p1 = (-b) - delta;
	else
		p1 = (-b) + delta;
	p1 = p1 / (2*a);
	p2 = c / a / p1;
	pair <float, float> r (p1, p2);
	return r;
}

int main()
{
	float tests[][3] ={	
		{1,-4,4},
		{0.99999999,-4,4.000000001},
		{1,-pow(10,6),1}, //
		{123.398,999.190239,5.000000123}
	};
	
	cout << "start\n";
	for(auto test : tests){
	       pair <float, float> test_result1 = pierwiastek(test[0], test[1], test[2]);
	       pair <float, float> test_result2 = viete(test[0], test[1], test[2]);
	       printf("test result 1 for: %+.20f : %+.20f\n", test_result1.first, test_result1.second);
	       printf("test result 2 for: %+.20f : %+.20f\n\n", test_result2.second, test_result2.first);
	}
}
/*
test result 1 for: +2.00000000000000000000 : +2.00000000000000000000
test result 2 for: +2.00000000000000000000 : +2.00000000000000000000

test result 1 for: +2.00000000000000000000 : +2.00000000000000000000
test result 2 for: +2.00000000000000000000 : +2.00000000000000000000

test result 1 for: +1000000.00000000000000000000 : +0.00000000000000000000
test result 2 for: +0.00000099999999747524 : +1000000.00000000000000000000

test result 1 for: -0.00500704115256667137 : -8.09228992462158203125
test result 2 for: -0.00500714778900146484 : -8.09228992462158203125
*/


