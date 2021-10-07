#include <stdio.h>
#include <map>
#include <vector>

int my_t = 0;
std::map<int, std::vector<int>> tree; 
std::map<int, bool> visited;
std::map<int, std::pair<int,int>> io_map;

void walk(int v)
{
	visited[v] = true;
	io_map[v].first = my_t;
	for (auto x: tree[v]){
		if(visited[x] == false){
			my_t++;
			walk(x);
		}
	}
	io_map[v].second = my_t;
}

bool answer_q(int v, int u)
{
	return ((io_map[u].first >= io_map[v].first) and (io_map[u].first <= io_map[v].second));
}


int main()
{
	int v_no, q_no;
	int a, b;
	int input;

	scanf("%d %d", &v_no, &q_no);

	for(int i = 1; i <= v_no; i++)
	{
		tree[i] = {};
		visited[i] = false;
		io_map[i] = {0,0};
	}

	for(int i = 2; i <= v_no; i++)
	{
		scanf("%d", &input);
		tree[input].push_back(i);
	}

	walk(1);
 	
	for(int i = 0; i < q_no; i++){
		scanf("%d %d", &a, &b);
		if (answer_q(a,b))
			printf("TAK\n");
		else
			printf("NIE\n");
	}
	return 0;
}
