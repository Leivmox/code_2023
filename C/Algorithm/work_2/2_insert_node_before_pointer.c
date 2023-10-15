#include <stdio.h>
#include <stdlib.h>

//2.在单链表中，编写仅利用P指针，在P指针所指结点前插入一个结点的算法。
struct Node
{
    int data;
    struct Node *next;
};

void insertNodeBeforeP(struct Node *P, int value)
{
    if (P == NULL)
    {
        return; // 无法在空指针之前插入节点
    }

    struct Node *new_node = (struct Node *)malloc(sizeof(struct Node));
    if (new_node == NULL)
    {
        fprintf(stderr, "Memory allocation failed\n");
        exit(1);
    }

    new_node->data = value;
    new_node->next = P->next;
    P->next = new_node;
}

int main()
{
    // 创建一个单链表: 1 -> 2 -> 3 -> 4 -> 5
    struct Node *head = (struct Node *)malloc(sizeof(struct Node));
    head->data = 1;

    struct Node *current = head;
    for (int i = 2; i <= 5; i++)
    {
        struct Node *new_node = (struct Node *)malloc(sizeof(struct Node));
        new_node->data = i;
        new_node->next = NULL;
        current->next = new_node;
        current = new_node;
    }

    // 打印原始链表
    current = head;
    while (current != NULL)
    {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");

    // 要在节点P之前插入一个新节点，例如在节点3之前插入节点6
    struct Node *P = head->next->next; // P指向节点3

    insertNodeBeforeP(P, 6);

    // 打印插入后的链表: 1 -> 2 -> 6 -> 3 -> 4 -> 5
    current = head;
    while (current != NULL)
    {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");

    // 释放链表节点的内存
    current = head;
    while (current != NULL)
    {
        struct Node *temp = current;
        current = current->next;
        free(temp);
    }
    getchar();
    return 0;
}
