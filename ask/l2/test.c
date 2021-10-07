#include <limits.h>
#include <stdint.h>
#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>

/*
int32_t modulo(int32_t x,y)
{
	c = 0;
	while x > 
}
*/

int main() 
{
	int32_t signed32max = INT32_MAX; 
	int32_t signed32min= INT32_MIN; 
	//printf("%" PRI32 "\n", signed32max); 
	//printf("%" PRI32 "\n", signed32min); 

	int32_t x = -100;
	int32_t y = -10;
	int32_t r = y & 3;

	//int r = (x * x) >= 0;
	//printf("%" PRIi32 "\n", x << 29); 
	printf("%" PRIi32 "\n", r); 
	//printf("%d\n", r);
	return 0;
}
