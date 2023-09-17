#define _CRT_SECURE_NO_WARNINGS 1

#include<stdio.h>
int main()
{
	int i = 0;
	int arr[10];
	int max = 0, min = 0, x=0, y=0;
	max = arr[0], min = 0;

	for(i = 0; i < 10; ++i)
	{
		scanf("%d", &arr[i]);
	}

	/*for (i = 0; i < 10; i++)
		printf("%d\t", arr[i]);*/

	for (i = 0; i < 10; ++i)
	{
		if(arr[i] > max)
		{
			max = arr[i];
			x = i;
		}
	}
	min = max;
	for (i = 0; i < 10; i++)
	{
		if (arr[i] < min)
		{
			min = arr[i];
			y = i;
		}
	}
	printf("%d %d\n", max, x);
	printf("%d %d\n", min, y);


	/*printf("%s", arr[1]);
	for(i = 0; i < 10; ++i)
	{
		if (arr[i] > max)
			max = arr[i];
		printf("%d", max);
	}
	printf("%d", max);*/

	getchar();
	return 0;
}