#include <stdio.h>
#include <vector>
#include <iostream>
#include <algorithm>
  
 
int main()
{
	int m, k;
	scanf("%d %d", &m, &k);

	std::vector<std::vector<int>> table;

	int init_v = m * m + m;

	for(int i = 0; i < m; i++) {
		std::vector<int> row;
		init_v -= m;

		for (int j = 0; j <= i; j++) {
			row.push_back(init_v - j * (m-i));
		}
		table.push_back(row);
	}

	for(int i = 0; i < k; k++){
		std::vector<std::pair<int, int>> t;
		for ( std::vector<std::vector<int>>::size_type i = 0; i < table.size(); i++ ) {
			std::pair<int,int> tt = {table[i][0], i};
			t.push_back(tt);
		}
		
	}

	// printing
	
	// table
	
	/*
	for ( std::vector<std::vector<int>>::size_type i = 0; i < table.size(); i++ ) {
		printf("\n");
		for ( std::vector<int>::size_type j = 0; j < table[i].size(); j++ ) {
			printf("%d ", table[i][j]);
		}
	}
	printf("\n");
	*/
	
	//maxvec choosing
	/*
	printf("\n");
	for ( std::vector<std::vector<int>>::size_type i = 0; i < t.size(); i++ ) {
		printf("%d : %d\n", t[i].first, t[i].second);
	}
	printf("\n");
	*/
	return 0;
}

