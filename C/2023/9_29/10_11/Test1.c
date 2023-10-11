#include <stdio.h>
#include <stdlib.h>

// 定义单链表节点结构
struct Node
{
    int data;
    struct Node *next;
};

// 定义单链表结构
struct LinkedList
{
    struct Node *head;
};

// 定义顺序表结构（数组实现）
struct SequentialList
{
    int data[100]; // 假设最多包含100个元素
    int size;
};

// 初始化单链表
void initLinkedList(struct LinkedList *list)
{
    list->head = NULL;
}

// 向单链表插入元素
void insertLinkedList(struct LinkedList *list, int data)
{
    struct Node *newNode = (struct Node *)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = NULL;

    if (list->head == NULL)
    {
        list->head = newNode;
    }
    else
    {
        struct Node *current = list->head;
        while (current->next != NULL)
        {
            current = current->next;
        }
        current->next = newNode;
    }
}

// 在单链表中查找元素
int searchLinkedList(struct LinkedList *list, int target)
{
    struct Node *current = list->head;
    while (current != NULL)
    {
        if (current->data == target)
        {
            return 1; // 元素找到
        }
        current = current->next;
    }
    return 0; // 元素未找到
}

// 从单链表中删除元素
void deleteLinkedList(struct LinkedList *list, int target)
{
    struct Node *current = list->head;
    struct Node *prev = NULL;

    while (current != NULL)
    {
        if (current->data == target)
        {
            if (prev == NULL)
            {
                list->head = current->next;
            }
            else
            {
                prev->next = current->next;
            }
            free(current);
            return;
        }
        prev = current;
        current = current->next;
    }
}

// 初始化顺序表
void initSequentialList(struct SequentialList *list)
{
    list->size = 0;
}

// 向顺序表中插入元素
void insertSequentialList(struct SequentialList *list, int data)
{
    if (list->size < 100)
    {
        list->data[list->size] = data;
        list->size++;
    }
}

// 在顺序表中查找元素
int searchSequentialList(struct SequentialList *list, int target)
{
    for (int i = 0; i < list->size; i++)
    {
        if (list->data[i] == target)
        {
            return 1; // 元素找到
        }
    }
    return 0; // 元素未找到
}

// 从顺序表中删除元素
void deleteSequentialList(struct SequentialList *list, int target)
{
    for (int i = 0; i < list->size; i++)
    {
        if (list->data[i] == target)
        {
            for (int j = i; j < list->size - 1; j++)
            {
                list->data[j] = list->data[j + 1];
            }
            list->size--;
            break;
        }
    }
}

// 合并两个有序顺序表
void mergeSequentialLists(struct SequentialList *list1, struct SequentialList *list2, struct SequentialList *result)
{
    int i = 0, j = 0;
    while (i < list1->size && j < list2->size)
    {
        if (list1->data[i] < list2->data[j])
        {
            insertSequentialList(result, list1->data[i]);
            i++;
        }
        else
        {
            insertSequentialList(result, list2->data[j]);
            j++;
        }
    }
    while (i < list1->size)
    {
        insertSequentialList(result, list1->data[i]);
        i++;
    }
    while (j < list2->size)
    {
        insertSequentialList(result, list2->data[j]);
        j++;
    }
}

// 反转单链表
void reverseLinkedList(struct LinkedList *list)
{
    struct Node *prev = NULL;
    struct Node *current = list->head;
    struct Node *next = NULL;

    while (current != NULL)
    {
        next = current->next;
        current->next = prev;
        prev = current;
        current = next;
    }

    list->head = prev;
}

int main()
{
    struct LinkedList linkedList;
    struct SequentialList sequentialList1, sequentialList2, mergedList;
    int choice, value;

    initLinkedList(&linkedList);
    initSequentialList(&sequentialList1);
    initSequentialList(&sequentialList2);
    initSequentialList(&mergedList);

    while (1)
    {
        printf("\n菜单：\n");
        printf("1. 在单链表中插入元素\n");
        printf("2. 在单链表中查找元素\n");
        printf("3. 从单链表中删除元素\n");
        printf("4. 在顺序表中插入元素\n");
        printf("5. 在顺序表中查找元素\n");
        printf("6. 从顺序表中删除元素\n");
        printf("7. 合并两个有序顺序表\n");
        printf("8. 反转单链表\n");
        printf("9. 退出\n");
        printf("请输入您的选择：");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("请输入要插入的值：");
            scanf("%d", &value);
            insertLinkedList(&linkedList, value);
            break;

        case 2:
            printf("请输入要查找的值：");
            scanf("%d", &value);
            if (searchLinkedList(&linkedList, value))
            {
                printf("值在单链表中找到。\n");
            }
            else
            {
                printf("值在单链表中未找到。\n");
            }
            break;

        case 3:
            printf("请输入要删除的值：");
            scanf("%d", &value);
            deleteLinkedList(&linkedList, value);
            break;

        case 4:
            printf("请输入要插入的值：");
            scanf("%d", &value);
            insertSequentialList(&sequentialList1, value);
            break;

        case 5:
            printf("请输入要查找的值：");
            scanf("%d", &value);
            if (searchSequentialList(&sequentialList1, value))
            {
                printf("值在顺序表中找到。\n");
            }
            else
            {
                printf("值在顺序表中未找到。\n");
            }
            break;

        case 6:
            printf("请输入要删除的值：");
            scanf("%d", &value);
            deleteSequentialList(&sequentialList1, value);
            break;

        case 7:
            // 合并两个有序顺序表
            printf("请输入第一个顺序表的值（以空格分隔，按Enter结束）：\n");
            while (1)
            {
                scanf("%d", &value);
                if (value == -1)
                {
                    break;
                }
                insertSequentialList(&sequentialList1, value);
            }
            printf("请输入第二个顺序表的值（以空格分隔，按Enter结束）：\n");
            while (1)
            {
                scanf("%d", &value);
                if (value == -1)
                {
                    break;
                }
                insertSequentialList(&sequentialList2, value);
            }
            mergeSequentialLists(&sequentialList1, &sequentialList2, &mergedList);
            printf("合并后的有序顺序表：\n");
            for (int i = 0; i < mergedList.size; i++)
            {
                printf("%d ", mergedList.data[i]);
            }
            printf("\n");
            break;

        case 8:
            // 反转单链表
            reverseLinkedList(&linkedList);
            printf("单链表已反转。\n");
            break;

        case 9:
            exit(0);

        default:
            printf("无效的选择。\n");
        }
    }

    return 0;
}
