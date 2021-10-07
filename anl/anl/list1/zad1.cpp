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

int main()
{
	float tests[][3] ={	
		{1,-4,4},                      // v
		{0.99999999,-4.0,4.000000001}, // dwa rozne rownania
		{1.0,-pow(10.0,6),1.0}, // v
		{}
	};
	
	for(auto test : tests){
	       pair <float, float> test_result = pierwiastek(test[0], test[1], test[2]);
	       printf("test result for: % .20f : % .20f\n", test_result.first, test_result.second);
	}
}

