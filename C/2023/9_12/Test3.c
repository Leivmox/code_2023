#include<stdio.h>
#include <stdlib.h>
#define N 100000

void quick_sort(int arr[],int l,int r){
    if(l>=r) return ;
    int i=l-1,j=r+1,x=arr[(l+r)/2];
    while(i<j){
        do i++;while(arr[i]<x);
        do j--;while(arr[j]>x);
        if(i<j){
            int temp=arr[i];
            arr[i]=arr[j];
            arr[j]=temp;
        }
    }
    quick_sort(arr,l,j);
    quick_sort(arr,j+1,r);
}
int main(){
    int n;
    scanf("%d",&n);
    int arr[N];
    for(int i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }
    quick_sort(arr,0,n-1);
    for(int i=0;i<n;i++){
        if(i!=0) printf(" ");
        printf("%d",arr[i]);
    }
 system("pause"); 
    
    return 0;
}
