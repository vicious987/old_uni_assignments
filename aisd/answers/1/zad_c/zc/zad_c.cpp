#include <stdio.h>
#include <iostream>
#include <deque>
#include <array>


int main()
{
	std::deque <std::array<int, 3>> dq;
	std::array<int, 3> start = {0, 1, 2};
	dq.push_back(start);
/*
	for (auto it = dq.begin(); it != dq.end(); it++){
		printf("%d", it->at(1));

	}
	*/


	int n, destination, fuel;
	scanf("%d %d %d ", &n, &destination , &fuel);

	int position, price, path_cost;
	while(n > 0) {
		scanf("%d %d", &position, &price); 

		//znajdz min, usun zbyt dalekie
		//for(auto it = dq.end(); (it != dq.begin()) || (position - it->at(0) > fuel); i--)
		//jj

		int min = -1;
		bool reachable_flag = false;
		auto it = dq.end();
		while (it != dq.begin)
		{
			if(position - it->at(0) > fuel)
			{
				//usun kolejne
				//breakuj
			}

			if(it->[1] + it->[2] < min){
				min = it->[1] + it->[2];
			}
			i--;
		}
		if (min == -1){
			printf("NIE");
			return 0;
		}
		std::array<int, 3> current_station = {position, price, min}
		dq.pushback(current_station);
		n--;
	}

	return 0;
}

