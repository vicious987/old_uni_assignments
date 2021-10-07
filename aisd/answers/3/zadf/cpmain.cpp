#include <stdio.h>
#include <unordered_map>
#include <iostream>
#include <list>
#include <utility>
#include <algorithm>
#include <ctime>

using namespace std;

int n;
int * coins;
list<pair<int,int>> vals; 
int dbg = 0;

/*
void print_ht(){
	printf("\n");
	for (const auto& n : ht)
		printf("k:%d v:%d\n", n.first, n.second);
}
void print_cht(){
	printf("\n");
	for (const auto& n : ht)
		printf("k:%d v:%d\n", n.first, ht.count(n.first));
}
*/

void addval(int v){
	if(vals.empty()){
		auto t = make_pair(v,1);
		vals.push_back(t);
	}
	else{

		if(vals.back().first == v)
			vals.back().second++;
		else {
			auto t = make_pair(v,1);
			vals.push_back(t);
		}
	}
}

void printlist(){
	if(dbg) printf("\nprinting the list\n");
	for(auto i : vals)
		printf("%d %d\n", i.first, i.second);
}

void iterdiag(){
	int j, k;
	int sd1 = 0;
	int sd2 = 1;
	int ed1 = 0;
	int ed2 = 1;
	for(int i = 0; i < 2*n - 3; i++){
		if (dbg) printf("%d/%d s:%d_%d-e:%d_%d\n",i, 2*n -3, sd1, sd2, ed1,ed2);
		for (j = sd1, k = sd2; j >= ed1 and k <= ed2; --j, ++k){
			if (dbg) printf(":[%d][%d]  %d+%d=%d\n",j,k,coins[j], coins[k], coins[j]+coins[k]);
			//printf("%d ", coins[j]+coins[k]);
			addval(coins[j] + coins[k]);
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

void ins(){
	if (!vals.empty()) {
		auto p = lower_bound(coins, coins+n, vals.front().first);
		auto iter = vals.begin();
		if (dbg) printf("starting from coin %d\n", *p);
		for(auto i = p; i != coins + n; ++i){
			if (dbg) printf("comparing coin and list item value  %d : %d\n", *i, iter->first);
			while (iter->first < *i) {
				if (dbg) printf("skipping list item %d\n", iter->first);
				++iter;
				if(iter == vals.end())
					return;
			}
			if (iter->first > *i) {
				if (dbg) printf("inserting list item %d before %d\n", *i, iter->first);
				vals.insert(iter, make_pair(*i, 1));
			} else {
				if (dbg) printf("incrementing list item %d\n", iter->first);
				iter->second++;
			}
		}

		if (dbg) printf("common section done\n");
		for(auto i = p - 1; i != coins - 1; --i){
			vals.push_front(make_pair(*i, 1));
		}
		if (dbg) printf("pre section done\n");
	} else {
		for(int j = 0; j < n; j++)
			vals.push_back(make_pair(coins[j], 1));
	}
	vals.push_front(make_pair(0, 1));
}

int t;
int main() {

	int i, j;
	scanf("%d", &n);
	coins = new int[n];


	
	for (i = 0; i < n; i++){
		scanf("%d\n", &t);
		coins[i] = t;
		if (dbg) printf("scanned %d, input into %dnth, coins[%d]=%d\n",t,i,i,coins[i]);
	}
	/*
	scanf("%d", &t);
	printf("\n%d\n",t);
	*/

	
	if (dbg) {
		printf("XXXXX %d XXXXX\n", coins[n]);
		printf("printing coins\n");
		for (i = 0; i < n; i++){
			printf("%d - %d\n",i, coins[i]);
		}
		printf("------------------------\n");
	}
	

	iterdiag();
	ins();
	if (dbg) printf("---\n");
	printlist();
	delete [] coins;

	return 0;
}
