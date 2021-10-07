#include <stdio.h>
#include <algorithm>

const int up = 0;
const int med = 1;
const int low = 2;

int w, k;

unsigned long long int tab7[10] = 
	{	1, 
		7, 
		49, 
		343, 
		2401, 
		16807, 
		117649, 
		823543, 
		5764801, 
		40353607 };

unsigned long long int val(char c){
	return tab7[c - '0'];
}

void readline(char ** in,unsigned long long int  ** res){
	auto t1 = in[up];
	auto t2 = res[up];
	in[up] = in[med];
	res[up] = res[med];
	in[med] = in[low];
	res[med] = res[low];
	in[low] = t1;
	res[low] = t2;

	fgets(in[low], k+2, stdin);
	for (int i = 0; i < k; i++)
		res[low][i] = val(in[low][i]);
}


void movedown(unsigned long long int ** res, char ** in){
	for (int i = 0; i < k; i++){
		int right = i + 1;
		int left = i - 1;
		if (right < k)
			res[low][right] = std::max(res[low][right], val(in[low][right]) + res[up][i]);
		if (left >= 0)
			res[low][left] = std::max(res[low][left], val(in[low][left]) + res[up][i]);
	}
}
void _movedown(unsigned long long int ** res, char ** in){
	for (int i = 0; i < k; i++){
		int right = i + 1;
		int left = i - 1;
		auto t = val(in[low][i]);
		if (i == 0)
			res[low][i] = t + res[up][right];
		else if (i == k - 1)
			res[low][i] = t + res[up][left];
		else
			res[low][i] = t + std::max(res[up][right], res[up][left]);
	}
}

void moveup(unsigned long long int ** res, char ** in){
	for (int i = 0; i < k; i++){
		int right = i + 2;
		int left = i - 2;
		if (right < k)
			res[med][right] = std::max(res[med][right], val(in[med][right]) + res[low][i]);
		if (left >= 0)
			res[med][left] = std::max(res[med][left], val(in[med][left]) + res[low][i]);
	}
}
 
void _moveup(unsigned long long int ** res, char ** in){
	for (int i = 0; i < k; i++){
		int right = i + 2;
		int left = i - 2;
		auto t = val(in[med][i]);
		if (i < 2 && i > k -3 )
			return;
		//else if (i <= 1)
		else if (i < 2 && i < k-2)
			res[med][i] = std::max(res[med][i], t + res[low][right]);
		else if (i > k - 3)
			res[med][i] = std::max(res[med][i], t + res[low][left]);
		else
			res[med][i] = std::max(res[med][i], t + std::max(res[low][left], res[low][right]));
	}
}
void print(unsigned long long int ** tab){
	printf("\n");
	for (int i = 0; i < 3; i++) {    
		for (int j = 0; j < k; j++)  
			printf("%d ", tab[i][j]);
		printf("\n");
	}
}


int main() {
	scanf("%d %d", &w, &k);
	getchar();
	char ** in_tab;
	unsigned long long int ** res_tab;
	in_tab = new char * [3];
	res_tab = new unsigned long long int * [3];
	for (int i = 0; i < 3; i++){
		in_tab[i] = new char[k];
		res_tab[i] = new unsigned long long int[k]();
	}

	for (int i = 0; i < 3; i++)
		fgets(in_tab[i], k+2, stdin);
	for (int j = 0; j < 3; j++)
		for (int i = 0; i < k; i++)
			res_tab[j][i] =  val(in_tab[j][i]);
	//print(res_tab);
	for(int i = 0; i < w - 3; i++){
	//	printf("----------------------\n");
	//	printf("iteracja nr %d\n", i);
		_movedown(res_tab, in_tab);
		_moveup(res_tab, in_tab);
	//	print(res_tab);
		readline(in_tab, res_tab);
	//	print(res_tab);
	//	printf("----------------------\n");
	}
	movedown(res_tab, in_tab);
	//print(res_tab);
	//printf("%lld\n", *(std::max_element(res_tab[low], res_tab[low] + k)));
	printf("%llu", *(std::max_element(res_tab[low], res_tab[low] + k)));

	return 0;
}
