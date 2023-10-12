#include<stdio.h>
#include<stdlib.h>

//4.编写一个单链表存储条件下，两个多项式相加的算法。  
typedef struct list{
	int c;//系数 
	int e;//指数 
	struct list *next; 
}list,*Linklist; 

//创建多项式 
Linklist creatPolyn(){
	Linklist  head,p,q;
	int m;
	head = (Linklist)malloc(sizeof(list));
	head->next= NULL;
	q = head;
	printf("请输入多项式的项数：");
	scanf("%d",&m);
	for(int i=0;i<m;i++){
		p = (Linklist)malloc(sizeof(list));
		printf("输入第%d项的系数：",i+1);
		scanf("%d",&p->c);
		printf("输入第%d项的指数：",i+1);
		scanf("%d",&p->e);
		p->next = q->next;
		q->next = p;
		q = q->next;
	}
	return head;
}
//多项式相加 
Linklist AddPolyn(Linklist pa,Linklist pb){
	Linklist a,b,pc,c;
	a = pa;//保存pa的头结点 
	//printf("pa->c = %d pa->e = %d\n",pa->c,pa->e);
	b = pb;//保存pb的头结点 
	//将pa，pb多项式相加的结果保存在c中
	c = (Linklist)malloc(sizeof(list)); //给 C 申请一个空间 
	c->next = NULL; // 生成头结点 
	pc = c;//把头结点 给pc  方便之后操作！如果没有pc这个变量，直接操作c的话，return c 的结果只有最后一项，因为在过程中，c的地址已经发生了变化 
	while(a&&b){
		int m,n,sum;
		m=a->e; n=b->e; // m,n分别保存 a,b的 指数 
		if(m>n){
			pc->next = b;
			pc = pc->next;
			b = b->next;
			//printf("b多项式指数小  %d*X^%d\n",pc->c,pc->e);
		}
		else if(m == n){
			sum = a->c + b->c;
			if(sum!=0){
				a->c = sum;
				pc->next = a;
				pc=pc->next;
				//printf("多项式指数一样大  %d*X^%d\n",pc->c,pc->e);
			}
			//在这里有个 小bug  我不会修改了！bug是： 当两个多项式的最有一项和为0时，计算结果却是，项数多的那个多项式的最后一项 
			//a,b 已经处理完毕，同时后移一位。 
			a = a->next;
			b = b->next;
		}
		else{
			pc->next = a;
			pc = pc->next;
			a = a->next;
			//printf("a多项式指数小  %d*X^%d\n",pc->c,pc->e);
		}
		
	}
	// 判断那个多项式没有走到 NULL  然后将pc->next 直接指向剩余的多项式 
	if(a!=NULL){
		pc->next = a;
	}
	if(b!=NULL){
		pc->next = b;
	}
	return c;
}
void printList(Linklist L){
	while(L != NULL){
		printf("%d*X^%d ",L->c,L->e);
		L = L->next;
	}
	printf("\n"); 
}
int main(){
	Linklist pa,pb,pc;
	printf("请输入第一个多项式的系数和指数\n");
	pa = creatPolyn();
	printf("请输入第二个多项式的系数和指数\n");
	pb = creatPolyn();
	printf("输入的第一个多项式是：\n");
	printList(pa->next);
	printf("输入的第二个多项式是:\n");
	printList(pb->next);
	pc = AddPolyn(pa->next,pb->next);
	printf("两个多项式的和为：");
	printList(pc->next);
    getchar();
    getchar();
	return 0;
}
