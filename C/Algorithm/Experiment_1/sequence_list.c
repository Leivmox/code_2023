#include <stdio.h>
#include <stdlib.h>

// 定义顺序表结构
struct SequentialList
{
    int data[100]; // 存储整数的数组，假设最多包含100个元素
    int size;      // 当前顺序表的大小
};

// 初始化顺序表
void initSequentialList(struct SequentialList *list)
{
    list->size = 0;
}

// 插入元素到顺序表
void insertSequentialList(struct SequentialList *list, int data)
{
    if (list->size < 100)
    {
        list->data[list->size] = data;
        list->size++;
    }
}

// 查找元素在顺序表中的位置，返回位置（从1开始），如果未找到返回0
int searchSequentialList(struct SequentialList *list, int target)
{
    for (int i = 0; i < list->size; i++)
    {
        if (list->data[i] == target)
        {
            return i + 1; // 返回元素的位置（从1开始）
        }
    }
    return 0; // 元素未找到，返回0表示未找到
}

// 删除元素从顺序表中
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

// 输出顺序表内容
void displaySequentialList(struct SequentialList *list)
{
    printf("顺序表：");
    for (int i = 0; i < list->size; i++)
    {
        printf("%d ", list->data[i]);
    }
    printf("\n");
}

int main()
{
    struct SequentialList sequentialList1, sequentialList2, mergedList;
    int choice, value;

    initSequentialList(&sequentialList1);
    initSequentialList(&sequentialList2);
    initSequentialList(&mergedList);

    while (1)
    {
        printf("\n顺序表菜单：\n");
        printf("1. 插入元素到顺序表1\n");
        printf("2. 插入元素到顺序表2\n");
        printf("3. 查找元素\n");
        printf("4. 删除元素\n");
        printf("5. 合并两个有序顺序表\n");
        printf("6. 输出顺序表1\n");
        printf("7. 输出顺序表2\n");
        printf("8. 输出合并后的顺序表\n");
        printf("9. 退出\n");
        printf("请输入您的选择：");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("请输入要插入到顺序表1的值：");
            scanf("%d", &value);
            insertSequentialList(&sequentialList1, value);
            break;

        case 2:
            printf("请输入要插入到顺序表2的值：");
            scanf("%d", &value);
            insertSequentialList(&sequentialList2, value);
            break;

        case 3:
            printf("请输入要查找的值：");
            scanf("%d", &value);
            int position = searchSequentialList(&sequentialList1, value);
            if (position > 0)
            {
                printf("值 %d 在顺序表1中的位置是：%d\n", value, position);
            }
            else
            {
                printf("值 %d 未在顺序表1中找到\n", value);
            }
            break;

        case 4:
            printf("请输入要删除的值：");
            scanf("%d", &value);
            deleteSequentialList(&sequentialList1, value);
            break;

        case 5:
            mergeSequentialLists(&sequentialList1, &sequentialList2, &mergedList);
            printf("合并后的有序顺序表：\n");
            displaySequentialList(&mergedList);
            break;

        case 6:
            displaySequentialList(&sequentialList1);
            break;

        case 7:
            displaySequentialList(&sequentialList2);
            break;

        case 8:
            displaySequentialList(&mergedList);
            break;

        case 9:
            exit(0);

        default:
            printf("无效的选择。\n");
        }
    }

    return 0;
}
