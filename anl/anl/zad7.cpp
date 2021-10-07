#include<iostream>
#include<cmath>
using namespace std;

double f(double x, double a){return x*x-a;}//funkcja dla sqrt(a) (1)
double f1(double x){return 2*x;}//1 pochodna
double f2(double x){return 2;}//2 pochodna
/*
double f(double x, double a){return x*x*x-a;}//funkcja pierwiastka trzeciego stopnia z a (2)
double f1(double x){return 3*x*x;}//1 pochodna
double f2(double x){return 6*x;}//2 pochodna
*/

/*double f(double x, double a){return (1/x)-a;}//funkcja dla 1/a (3)
double f1(double x){return -1/(x*x);}//1 pochodna
double f2(double x){return 2/(x*x*x);}//2 pochodna*/

/*
double f(double x, double a){return (1/(x*x))-a;}//funkcja dla 1/sqrt(a) (4)
double f1(double x){return -2/(x*x*x);}//1 pochodna
double f2(double x){return 6/(x*x*x*x);}//2 pochodna
*/

/*
double f(double x, double a){return (x-1)*(x+1239471239);}//funkcja dla wielomianów (5)
double f1(double x){return 2*x+1239471238;}//1 pochodna
double f2(double x){return 2;}//2 pochodna
*/

double olver(double a){
    double x=9284;
    double tmp, tmp2;
    double d=sqrt(a); //(1)
    //double d=pow(a,(1/3.0)); //(2)
    //double d=1/a; //(3)
    //double d=1/sqrt(a);//(4)
    //double d=1;//(5)
    int j=100;
    double ej=0, ej1=0, ej2=0, ej3=0;
    for(int i=0; i<j; i++){
        tmp=f(x,a)/f1(x);
        tmp2=tmp*tmp;
        x=x-tmp-0.5*(f2(x)/f1(x))*tmp2;//nasza metoda
        ej=ej1;//bledy
        ej1=ej2;
        ej2=ej3;
        ej3=x-d;
        cout<<i<<"\tWartosc:"<<x<<"\tBlad: "<<ej3<<endl;//wynik po i-krokach
        if(ej3==0.0)
            break;
    }
double p=log(ej2/ej1)/log(ej1/ej);
cout<<"\tWartosc dokladna:"<<d<<"\tp:"<<p<<endl;//dokladny
}

int main(){
    double x=5;
    cout.precision(20);
    cout<<fixed;
    olver(x);
}

