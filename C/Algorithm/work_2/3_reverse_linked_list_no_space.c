#include <stdio.h>
#include <stdlib.h>

//3.在不增加任何一个结点空间的要求下，逆转一个有头结点的单链表。
struct Node
{
    int data;
    struct Node *next;
};

// 逆转有头结点的单链表
void reverseLinkedList(struct Node *head)
{
    if (head == NULL || head->next == NULL)
    {
        // 如果链表为空或只有一个节点，无需逆转
        return;
    }

    struct Node *prev = NULL;
    struct Node *current = head->next;
    struct Node *next_node;

    while (current != NULL)
    {
        next_node = current->next; // 保存下一个节点的指针
        current->next = prev;      // 当前节点的next指向前一个节点
        prev = current;            // 更新prev指向当前节点
        current = next_node;       // 继续遍历下一个节点
    }

    head->next = prev; // 更新头结点的next指针，指向新的头节点
}

int main()
{
    // 创建一个有头结点的单链表: 0 -> 1 -> 2 -> 3 -> 4
    struct Node *head = (struct Node *)malloc(sizeof(struct Node));
    head->data = 0;

    struct Node *current = head;
    for (int i = 1; i <= 4; i++)
    {
        struct Node *new_node = (struct Node *)malloc(sizeof(struct Node));
        new_node->data = i;
        new_node->next = NULL;
        current->next = new_node;
        current = new_node;
    }

    // 打印原始链表
    current = head->next;
    while (current != NULL)
    {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");

    // 逆转链表
    reverseLinkedList(head);

    // 打印逆转后的链表: 4 -> 3 -> 2 -> 1 -> 0
    current = head->next;
    while (current != NULL)
    {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");

    // 释放链表节点的内存
    current = head->next;
    while (current != NULL)
    {
        struct Node *temp = current;
        current = current->next;
        free(temp);
    }

    free(head);

    getchar();
    return 0;
}
