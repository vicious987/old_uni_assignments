#include <cstdio>
#include <cstring>
#include <cmath>

#include <iostream>

using namespace std;


// polynomial coefficients are saved in increasing order of degree
// coefficient of x**i in polynomial p = p[i]

// multiply polynomials p and q, both of size sz,
// where sz is multiple of 2
void karatsuba(int *res, int *p, int *q, int sz){
    int t0[sz], t1[sz], r[sz<<1];


    memset(r, 0, (sz<<1) * sizeof(int));

    if ( sz <= 4 ){ // base case, no recursion, do basic school multiplication
        for ( int i = 0 ; i < sz ; i++ )
            for ( int j = 0 ; j < sz ; j++ ){
                r[i + j] += p[i] * q[j];
            }
    } else {
        // let p = a*x**nSz + b
        //     q = c*x**nSz + d
        //     r = ac*x**sz + ((a+b)*(c+d) - ac - bd)*x**nSz + bd
        int nSz = (sz >> 1);

        for ( int i = 0 ; i < nSz ; i++ ){
            t0[i] = p[i] + p[nSz + i];   // t0 = a + b
            t1[i] = q[i] + q[nSz + i];   // t1 = c + d
            t0[i + nSz] = t1[i + nSz] = 0;  // initialize
        }

        karatsuba(r + nSz, t0, t1, nSz);      // r[nSz...sz] = (a+b) (c+d)
        karatsuba(t0, p, q, nSz);             // t0 = bd
        karatsuba(t1, p + nSz, q + nSz, nSz); // t1 = ac

        for ( int i = 0 ; i < sz ; i++ ){
            r[i] += t0[i];                    // bd
            r[i + nSz] -= t0[i] + t1[i];      // ((a+b)(c+d) - ac - bd) * x**nSz
            r[i + sz] += t1[i];               // ac * x**sz
        }
    }

    memcpy(res, r, (sz<<1) * sizeof(int));
}

// multiply two polynomials p and q, both of size sz = degree + 1
// save the output in array r
// NOTE: the maximum capacity of p, q, r should be power of two
// NOTE: r should be at least double of p or q in size
void polyMult(int *r, int *p, int *q, int sz){
	if ( sz & (sz - 1) ){ // if size is not power of two
		int k = 1;
		while ( k < sz ) k <<= 1;
		while ( ++sz <= k ) p[sz - 1] = q[sz - 1] = 0;
		sz--;
	}

	karatsuba(r, p, q, sz);
}

void printp(int *p, int s){
	for (int i = 0; i < s; i++){
		printf("%d:%d\n",i, p[i]);
	}
	printf("----------------\n");
}


int i,t,n;
int *coins;
int *po;
int *rpo;
void printcoins(){
	for(i = 0; i<n; i++)
		printf("[%d]:%d\n", i, coins[i]);
	printf("----------------\n");
}
int main() {


//	int p[8] = {0,1,1,0,1,1,0,0};
	//			0,1,2,3,4,5,6,7
	int *p;
	p = new int[8];
	p[0] = 0;
	p[1] = 1;
	p[2] = 1;
	p[3] = 0;
	p[4] = 1;
	p[5] = 1;
	p[6] = 0;
	p[7] = 0;
	
	int rp[16];


	scanf("%d", &n);
	coins = new int[n];


	
	for (i = 0; i < n; i++){
		scanf("%d\n", &t);
		coins[i] = t;
		//if (dbg) printf("scanned %d, input into %dnth, coins[%d]=%d\n",t,i,i,coins[i]);
	}
	printcoins();

	int maxdeg = coins[n-1]+1;
	int arrsize = 1 << (int) ceil(log2(maxdeg));
	int rarrsize = 2 * arrsize;




	po = new int[arrsize];
	memset(po, 0, arrsize+1);

	for (i = 0; i < n; i++){
		po[coins[i]] = 1;
	} 
	printp(po, arrsize);

	//printf("%d %d\n", maxdeg, arrsize);

	memset(po, 0, rarrsize+1);
	rpo = new int[rarrsize];

	polyMult(rpo, po, po, arrsize);
	printp(rpo, rarrsize);

	return 0;
}
