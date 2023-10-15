#include <stdio.h>
#include <stdlib.h>
//1.在单链表中，编写仅利用P指针，删除P指针所指结点的算法。

struct Node
{
    int data;
    struct Node *next;
};

void deleteNode(struct Node *P)
{
    if (P == NULL || P->next == NULL)
    {
        // 无法删除P指针为空或P指针指向最后一个节点
        return;
    }

    struct Node *temp = P->next;
    P->data = temp->data;
    P->next = temp->next;

    free(temp); // 释放临时节点的内存
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

    // 要删除的节点P指向节点2
    struct Node *P = head->next;

    // 删除P指向的节点
    deleteNode(P);

    // 打印删除后的链表: 1 -> 3 -> 4 -> 5
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
