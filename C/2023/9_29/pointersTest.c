#include <stdio.h>

int main()
{
    int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    printf("%d\n", &arr[9]);
    printf("%d\n", &arr[0]);
    printf("======================\n");
    int* a = &arr[9];
    int* b = &arr[0];
    
    printf("%d\n", a);
    printf("%d\n", b);
    printf("======================\n");
    printf("%p\n",a-b);
    printf("%p\n", &arr[9] - &arr[0]);
    printf("======================\n");
int* p1 = 10000;
int* p2 = 10004;
int c = p2 - p1;
printf("%d\n",c);
        getchar();
    return 0;
}