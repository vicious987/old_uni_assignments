#include <stdio.h>
#include <unordered_map>
#include <iostream>
#include <list>
#include <utility>
#include <algorithm>
#include <ctime>
#include <string>
#include <iostream>

using namespace std;

int n;
int * coins;
int current_coin = 0;
int dbg = 0;
pair<int, int> res;
int emptypair = 1;


void fun(int nextv){
	if(res.first == -1){ //pusto
		//if (dbg) printf("para byla pusta\n");
		res.first = nextv;
		res.second = 1;
		emptypair = 0;
	} else { // niepusto
		//if (dbg) printf("curr pair:%d.%d val: %d\n", res.first, res.second, nextv);
		if(res.first == nextv) { // nie wymieniasz
			//if (dbg) printf("inc\n");
			++res.second;
		} else { //wymieniasz 
			//if (dbg) printf("%d != %d , current_coin = %d(v:%d)\n", res.first, nextv, current_coin, coins[current_coin]);

			if (current_coin < n and coins[current_coin] == res.first){
				++res.second;
				++current_coin;
			}

			printf("%d %d\n", res.first, res.second);

			while(current_coin < n and coins[current_coin] < nextv){
				//printf("%d %d\n", coins[current_coin], 1);
				++current_coin;
			}

			res.first = nextv;
			res.second = 1;
		}

	}
	//if (dbg) printf("stan pary po fun: %d.%d\n", res.first, res.second);
	//if (dbg) printf("\n");
}

void iterdiag(){
	int val;
	int prev = -1;
	int j, k;
	int counter = 1;
	int sd1 = 0;
	int sd2 = 1;
	int ed1 = 0;
	int ed2 = 1;
	for(int i = 0; i < 2*n - 3; i++){
		//if (dbg) printf("%d/%d s:%d_%d-e:%d_%d\n",i, 2*n -3, sd1, sd2, ed1,ed2);
		for (j = sd1, k = sd2; j >= ed1 and k <= ed2; --j, ++k){
		//	if (dbg) printf("[%d][%d]  %d+%d=%d\n",j,k,coins[j], coins[k], coins[j]+coins[k]);
			fun(coins[j] + coins[k]);

		}
		//printf("\n");
		
		if(i%2) ++sd1; else ++sd2;
		if(i >= n - 2) ++ed1; else ++ed2;
		
/*
		auto test1 = i%2;
		auto test2 = (i >= n -2);
		sd1 += test1 ? 1 : 0;
		sd2 += test1 ? 0 : 1;
		ed1 += test2 ? 1 : 0;
		ed2 += test2 ? 0 : 1;
		*/
	}
}


int main() {
  	clock_t begin = clock();
	res = make_pair(-1,-1);

	int t;
	int i, j;
	scanf("%d", &n);
	coins = new int[n];


	
	for (i = 0; i < n; i++){
		scanf("%d\n", &t);
		coins[i] = t;
		//if (dbg) printf("scanned %d, input into %dnth, coins[%d]=%d\n",t,i,i,coins[i]);
	}

	
	int min;	
	if (n > 2)
		min = coins[0] + coins[1];
	else
		min = coins[n-1]+1;

	printf("0 1\n");
	for(int i = 0; coins[i] < min and i < n; ++i, ++current_coin){
		//printf("%d %d\n", coins[i], 1);
	}
	//current_coin++;

	iterdiag();
	//if (!emptypair) printf("%d %d\n", res.first, res.second);
	//if (dbg) printf("---\n");
	delete [] coins;

	clock_t end = clock();
	double tm = double(end - begin) / CLOCKS_PER_SEC;
	printf("%f\n",tm); 

	return 0;
}
