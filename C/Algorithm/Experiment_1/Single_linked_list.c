#include <stdio.h>
#include <stdlib.h>

// 定义单链表节点结构
struct Node
{
    int data;
    struct Node *next;
};

// 初始化单链表，返回头指针
struct Node *initLinkedList()
{
    return NULL;
}

// 插入元素到单链表，返回新的头指针
struct Node *insertLinkedList(struct Node *head, int data)
{
    struct Node *newNode = (struct Node *)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = head;
    return newNode;
}

// 查找元素在单链表中的位置，返回位置（从1开始），如果未找到返回0
int searchLinkedList(struct Node *head, int target)
{
    int position = 1;
    struct Node *current = head;
    while (current != NULL)
    {
        if (current->data == target)
        {
            return position;
        }
        current = current->next;
        position++;
    }
    return 0;
}

// 删除元素从单链表中，返回新的头指针
struct Node *deleteLinkedList(struct Node *head, int target)
{
    if (head == NULL)
    {
        return NULL; // 单链表为空
    }

    if (head->data == target)
    {
        struct Node *temp = head;
        head = head->next;
        free(temp);
        return head;
    }

    struct Node *current = head;
    while (current->next != NULL)
    {
        if (current->next->data == target)
        {
            struct Node *temp = current->next;
            current->next = temp->next;
            free(temp);
            return head;
        }
        current = current->next;
    }

    return head; // 元素未找到
}

// 倒置单链表，返回新的头指针
struct Node *reverseLinkedList(struct Node *head)
{
    struct Node *prev = NULL;
    struct Node *current = head;
    struct Node *next;
    while (current != NULL)
    {
        next = current->next;
        current->next = prev;
        prev = current;
        current = next;
    }
    return prev;
}

// 输出单链表内容
void displayLinkedList(struct Node *head)
{
    struct Node *current = head;
    while (current != NULL)
    {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");
}

int main()
{
    struct Node *head = initLinkedList();
    int choice, value;

    while (1)
    {
        printf("\n单链表菜单：\n");
        printf("1. 插入元素\n");
        printf("2. 查找元素\n");
        printf("3. 删除元素\n");
        printf("4. 倒置单链表\n");
        printf("5. 输出单链表\n");
        printf("6. 退出\n");
        printf("请输入您的选择：");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("请输入要插入的值：");
            scanf("%d", &value);
            head = insertLinkedList(head, value);
            break;

        case 2:
            printf("请输入要查找的值：");
            scanf("%d", &value);
            int position = searchLinkedList(head, value);
            if (position > 0)
            {
                printf("值 %d 在单链表中的位置是：%d\n", value, position);
            }
            else
            {
                printf("值 %d 未在单链表中找到\n", value);
            }
            break;

        case 3:
            printf("请输入要删除的值：");
            scanf("%d", &value);
            head = deleteLinkedList(head, value);
            break;

        case 4:
            head = reverseLinkedList(head);
            printf("单链表已倒置\n");
            break;

        case 5:
            displayLinkedList(head);
            break;

        case 6:
            exit(0);

        default:
            printf("无效的选择。\n");
        }
    }

    return 0;
}
