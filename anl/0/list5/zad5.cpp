#include<iostream>
#include<cmath>
using namespace std;

/*
double f(double x, double a){return x*x - a;}	//funkcja dla sqrt(a) (1)
double f1(double x){return 2*x;}				//1 pochodna
double f2(double x){return 2;}					//2 pochodna
*/
   double f(double x, double a){return x*x*x - a;}	//funkcja pierwiastka trzeciego stopnia z a (2)
   double f1(double x){return 3*x*x;}				//1 pochodna
   double f2(double x){return 6*x;}					//2 pochodna

/*
   double f(double x, double a){return (1/x) - a;}	//funkcja dla 1/a (3)
   double f1(double x){return -1/(x*x);}			//1 pochodna
   double f2(double x){return 2/(x*x*x);}			//2 pochodna
   */

/*
   double f(double x, double a){return (1/(x*x)) - a;}	//funkcja dla 1/sqrt(a) (4)
   double f1(double x){return -2/(x*x*x);}				//1 pochodna
   double f2(double x){return 6/(x*x*x*x);}				//2 pochodna
   */

/*
   double f(double x, double a){return (x-1)*(x+1239471239);}	//funkcja dla wielomianów (5)
   double f1(double x){return 2*x+1239471238;}					//1 pochodna
   double f2(double x){return 2;}								//2 pochodna
   */

void olver(double a, double x, int j = 12){
	double temp;
	double realSolution = sqrt(a); 		//(1)
	//double realSolution = pow(a,(1/3.0)); 	//(2)
	//double realSolution = 1/a; 			//(3)
	//double realSolution = 1/sqrt(a);		//(4)
	//double realSolution = 1;				//(5)
	double e = 0, e1 = 0, e2 = 0, e3 = 0;
	for(int i=0; i < j; i++){
		temp = f(x, a) / f1(x);
		x = x - temp - 0.5*(f2(x) / f1(x)) * temp*temp;	//nasza metoda
		e = e1;	//bledy
		e1 = e2;
		e2 = e3;
		e3 = abs(x - realSolution);
		cout << i << "\tWartosc:" << x << "\tBlad: "<< e3 << endl;	//wynik po i-krokach
		if(e3 == 0.0)
			break;
	}
	double p = log(e2 / e1) / log(e1 / e);
	cout << "\tWartosc dokladna:" <<  realSolution << endl;
	cout << "\tp:" << p << endl;		//dokladny
}

int main(){
	double a=5;
	double start = 100;
	cout.precision(20);
	cout << fixed;
	olver(5, start);
	//olver(10, start);
	//olver(15, start);
}

