#include <stdio.h>

int main() {
	int a;
	scanf("%d", &a);
	int * tab;
	tab = new int [a]();

	printf("\n");
	for (int i = 0; i< a; i++)
		printf("%d - %d\n",i, tab[i]);
	return 0;
}
