#include <stdio.h>
#include <stack>


unsigned s(unsigned a,unsigned  b, unsigned* pa, unsigned* pb)
	{
		return pb[a] - pb[b + 1] - (b - a + 1) * pa[b + 1];
	}

int main()
{
	unsigned int no_keys, no_letters;
	scanf("%d %d", &no_keys, &no_letters);

	unsigned int *letters = new unsigned int[no_letters];
	
	for(unsigned int i = 0; i < no_letters; i++)
		scanf("%d", &letters[i]);

	unsigned int *a = new unsigned int [no_letters + 1]();
	unsigned int *b = new unsigned int [no_letters + 1]();

	for (int i = no_letters - 1; i >= 0; i--)
	{
		a[i] = letters[i] + a[i + 1];
		b[i] = a[i] + b[i + 1];
	}

/*	
	for (unsigned int i = 0; i < no_letters + 1; i++)
		printf(": %d :", b[i]);
	printf("\n");
	*/
	

	std::pair<unsigned, std::stack<unsigned>> *col_1 = new std::pair<unsigned, std::stack<unsigned>> [no_letters];
	std::pair<unsigned, std::stack<unsigned>> *col_2 = new std::pair<unsigned, std::stack<unsigned>> [no_letters];


	for (unsigned i = 0; i < no_letters; i++){
		col_2[i].first = b[i];
		col_2[i].second.push(no_letters);
	}
/*
        for(unsigned i = 0; i < no_letters; i++){
                 printf("%d - %d\n", col_2[i].first, col_2[i].second.top());
                 }
	printf("\n");
	*/


	
	for (unsigned k = 1; k < no_keys; k++)
	{
		auto temp = col_1; // zamiana kolumn
		col_1 = col_2;
		col_2 = temp;

		for (unsigned j = 0; j < no_letters - k; j++) // uzupelnij nowa kolumne
		{
			// uzupelniasz komorke j
			// wyszukaj min w przedziale <j, no_letters - k >
			auto min = col_1[j+1].first + s(j,j,a,b);
			auto st  = col_1[j+1].second;
			unsigned p = j+1;

			for (unsigned i = j+1; i <= no_letters - k + 1; i++) // wyszukaj min
			{
				if (col_1[i].first + s(j,i-1,a,b) < min){
					min = col_1[i].first + s(j,i-1,a,b);
					st  = col_1[i].second;
					p = i;
				}
			}
			col_2[j].first = min;
			col_2[j].second = st;
			col_2[j].second.push(p);
		}

	/*	
        	for(unsigned i = 0; i < no_letters - k; i++){
			printf("%d - %d\n", col_2[i].first, col_2[i].second.top());
		}
		printf("\n");
		*/
		
	}
	//printf("\n\n\n");

	//ANSWER
	auto stck = col_2[0].second;
	stck.push(0);
	printf("%d\n", col_2[0].first);
	unsigned begin;
	unsigned end;
	/*
	for(unsigned i = 0; i < stck.size()+1; i++)
	{
		begin = stck.top();
		stck.pop();
		end = stck.top();
		printf("%d ", end - begin); 
	}
	*/
	while(stck.size() > 1)
	{
		begin = stck.top();
		stck.pop();
		end = stck.top();
		printf("%d ", end - begin); 
	}



	// DELETE DYN ARR
	delete [] col_1;
	delete [] col_2;
	delete [] a;
	delete [] b;
	delete [] letters;
	return 0;
}
