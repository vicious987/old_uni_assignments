#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <stdlib.h>

//static void *array[] = {&&CASE_0, &&CASE_7, &&CASE_6, &&CASE_5,
//			&&CASE_4, &&CASE_3, &&CASE_2, &&CASE_1};

void secret_1(uint8_t *to, uint8_t *from, size_t count) //duff's device
{
	size_t n = (count + 7) / 8;
	switch (count % 8) {
	case 0: do { *to++ = *from++; //printf("%zu : %p %p\n", n, to, from);
	case 7:      *to++ = *from++; //printf("%zu : %p %p\n", n, to, from);
	case 6:      *to++ = *from++; //printf("%zu : %p %p\n", n, to, from);
	case 5:      *to++ = *from++; //printf("%zu : %p %p\n", n, to, from);
	case 4:      *to++ = *from++; //printf("%zu : %p %p\n", n, to, from);
	case 3:      *to++ = *from++; //printf("%zu : %p %p\n", n, to, from);
	case 2:      *to++ = *from++; //printf("%zu : %p %p\n", n, to, from);
	case 1:      *to++ = *from++; //printf("%zu : %p %p\n", n, to, from);

		} while (--n > 0);
	}
}	

void secret_2(uint8_t *to, uint8_t *from, size_t count)
{
	static void *array[8] = {&&CASE_0, &&CASE_1, &&CASE_2, &&CASE_3,
				 &&CASE_4, &&CASE_5, &&CASE_6, &&CASE_7};
	size_t n = (count + 7) / 8;
	goto *array[count % 8];
CASE_0:	*to++ = *from++;
CASE_7: *to++ = *from++;
CASE_6: *to++ = *from++;
CASE_5: *to++ = *from++;
CASE_4: *to++ = *from++;
CASE_3: *to++ = *from++;
CASE_2: *to++ = *from++;
CASE_1: *to++ = *from++;
	if (--n > 0) goto CASE_0;
}	

void secret_3(uint8_t *to, uint8_t *from, size_t count)
{
	size_t n = count;
	do {
		*to++ = *from++;
	}
	while (--n > 0);

}


int main()
{
	
	uint8_t out1[21] = {0};
	uint8_t out2[21] = {0};
	uint8_t out3[21] = {0};
	uint8_t in[21] = {1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,
				16,17,18,19,20,21}; // why {1} does not fill with ones?

	for (size_t i = 0; i < 21; ++i) {
		printf("%" PRIu8 ", ", in[i]);
	}
	printf("\n");

	secret_1(out1, in, 1);
	secret_2(out2, in, 1);
	secret_3(out3, in, 1);

	for (size_t i = 0; i < 21; ++i) {
		printf("%" PRIu8 ", ", out1[i]);
	}
	printf("\n");
	for (size_t i = 0; i < 21; ++i) {
		printf("%" PRIu8 ", ", out2[i]);

	}
	printf("\n");
	for (size_t i = 0; i < 21; ++i) {
		printf("%" PRIu8 ", ", out3[i]);
	}
	printf("\n");
	return 0;

}

