#include <stdio.h>
#include <algorithm>

class UF    {
	int *id, *size;
	public:
	UF(int n)
	{
		id = new int[n];
		size = new int[n];
		for(int i = 0; i < n; i++){
			id[i] = i;
			size[i] = 1;
		}
	}
	~UF(){
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

int main()
{

	int n = 5;
	bool* boolmap = new bool [n] {false} ;
	boolmap[3] = true;
	std::fill(boolmap, boolmap + sizeof(boolmap), false);

	for (int i = 0; i < n; i++){
		int a = 0;
		//printf(boolmap[i] ? "true " : "false ");
		printf("%d ", a + i);
	}

	return 0;
}
