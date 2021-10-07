#include <stdio.h>
#include <stack>

class disjoint_sets {
	int *id, *size;
	public:
	disjoint_sets(int n)
	{
		id = new int[n];
		size = new int[n];
		for(int i = 0; i < n; i++){
			id[i] = i;
			size[i] = 1;
		}
	}
	~disjoint_sets(){
		delete [] id;
		delete [] size;
	}

	int find(int p)	{
		int root = p;
		while (root != id[root])
			root = id[root];
		while (p != root) {
			int newp = id[p];
			id[p] = root;
			p = newp;
		}
		return root;
	}

	void union_sets(int x, int y)	{
		int rx = find(x);
		int ry = find(y);
		if (rx == ry) 
			return;

		if   (size[rx] < size[ry])	{ 
			id[rx] = ry; 
			size[ry] += size[rx]; 
		} else	{ 
			id[ry] = rx; 
			size[rx] += size[ry]; 
		}
	}
};

bool is_above(int area, int water_level){
	return area > water_level;
}

unsigned up(int i, int w){
	return i - w;
}
unsigned right(int i){
	return i + 1;
}
				
unsigned down(int i,int w){
	return i + w;
}

unsigned left(int i){
	return i - 1;
}


bool is_onmap(int i, int n){
	return (0 <= i && i < n);
}

int main()
{
	int h, w;
	scanf("%d %d", &h, &w);
	int n = h*w;


	int * map = new int [n];
	bool* boolmap = new bool [n] {false};
	for (int i = 0; i < n; i++)
	{
		scanf("%d", &map[i]);
	}

	int n1, n2, n3, n4;
	int water_lvl;
	int days;
	scanf("%d", &days);
	for(int j = 0; j < days; j++){
		disjoint_sets *djs = new disjoint_sets(n);
		scanf("%d", &water_lvl);
		int island_count = 0;

		for (int i = 0; i < n; i++)
		{
			if (is_above(map[i], water_lvl)){
				n1 = up(i, w);
				n2 = right(i);
				n3 = down(i, w);
				n4 = left(i);
				if (is_onmap(n1, n))
					if (is_above(map[n1], water_lvl))
						djs->union_sets(i, n1);
				if (is_onmap(n2, n)) 
					if(is_above(map[n2], water_lvl))
						djs->union_sets(i, n2);
				if (is_onmap(n3, n)) 
					if(is_above(map[n3], water_lvl))
						djs->union_sets(i, n3);
				if (is_onmap(n4, n))
					if(is_above(map[n4], water_lvl))
						djs->union_sets(i, n4);
			}
		}
		for (int i = 0; i < n; i++)
		{
			if (is_above(map[i], water_lvl)){
				if(boolmap[djs->find(i)] == false)
				{
					boolmap[djs->find(i)] = true;
					island_count++;
				}
			}
		}
		printf("%d ", island_count);

		delete djs;
		std::fill(boolmap, boolmap + sizeof(boolmap), false);
	}

	delete [] boolmap;
	delete [] map;

	return 0;
}
