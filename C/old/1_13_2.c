#include<stdio.h>
#include<math.h>

int is_prime(int n)
{
	int i = 0;
	for(i = 2; i <= sqrt(n); i++)
	{
		if(n % i == 0)
			return 0;
	}
	return 1;
}

int Max_prime_factor(int n)
{
	if(n <= 3)
		return 0;
	int i = 0;
	for(i = 2;i < sqrt(n); i++)
	{
		if((n % i == 0) && is_prime(i) && is_prime(n/i))
		{
			return n/i;
			break;
		}
	}
	if(is_prime(n))
		return 0;
}	

int main()
{
	int n = 0;
	int p = 0;
	scanf("%d",&n);
	p = Max_prime_factor(n);
	printf("%d",p);

	return 0;
}
