#define MAX_SIZE 100 //定义栈的最大容量
#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    char data[MAX_SIZE];
    int top;
} SeqStack;

typedef struct Node
{
    char data;
    struct Node *next;
} StackNode;

typedef struct
{
    StackNode *top;
} LinkedStack;

void initSeqStack(SeqStack *stack)
{
    stack->top = -1;
}

int isSeqStackEmpty(SeqStack *stack)
{
    return stack->top == -1;
}

int isSeqStackFull(SeqStack *stack)
{
    return stack->top == MAX_SIZE - 1;
}

void push1(SeqStack *stack, char item)
{
    if (isSeqStackFull(stack))
    {
        printf("栈已经满了，无法入栈");
    }
    else
    {
        stack->data[++stack->top] = item;
    }
}

char pop1(SeqStack *stack)
{
    if (isSeqStackEmpty(stack))
    {
        printf("栈为空，无法出栈");
        return '\0';
    }
    else
    {
        return stack->data[stack->top--];
    }
}

void initLinkedStack(LinkedStack *stack)
{
    stack->top = NULL;
}

int isLinkedStackEmpty(LinkedStack *stack)
{
    return stack->top == NULL;
}

void push2(LinkedStack *stack, char item)
{
    StackNode *newNode = (StackNode *)malloc(sizeof(StackNode));
    if (newNode == NULL)
    {
        printf("内存分配失败");
        return;
    }
    newNode->data = item;
    newNode->next = stack->top;
    stack->top = newNode;
}

char pop2(LinkedStack *stack)
{
    if (isLinkedStackEmpty(stack))
    {
        printf("栈为空，无法出栈");
        return '\0';
    }
    else
    {
        StackNode *temp = stack->top;
        char item = temp->data;
        stack->top = stack->top->next;
        free(temp);
        return item;
    }
}
int main()
{

    SeqStack seqStack;
    initSeqStack(&seqStack);
    LinkedStack linkedStack;
    initLinkedStack(&linkedStack);

    char input[] = "abcdef";
    int choice;

    // 将输入字符串入栈
    for (int i = 0; input[i] != '\0'; ++i)
    {
        push1(&seqStack, input[i]);    // 使用顺序栈
        push2(&linkedStack, input[i]); // 使用链栈
    }

    do
    {
        printf("\n--- 菜单 ---\n");
        printf("1. 使用顺序栈输出 abcdeffedcba\n");
        printf("2. 使用链栈输出 abcdeffedcba\n");
        printf("0. 退出\n");
        printf("请输入你的选择：");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("顺序栈输出：");
            // 顺序栈出栈并输出
            while (!isSeqStackEmpty(&seqStack))
            {
                char item = pop1(&seqStack);
                printf("%c", item);
            }
            break;
        case 2:
            printf("链栈输出：");
            // 链栈出栈并输出
            while (!isLinkedStackEmpty(&linkedStack))
            {
                char item = pop2(&linkedStack);
                printf("%c", item);
            }
            break;
        case 0:
            printf("退出程序\n");
            break;
        default:
            printf("无效的选择\n");
            break;
        }

    } while (choice != 0);
    return 0;
}
