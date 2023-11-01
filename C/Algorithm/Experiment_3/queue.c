#include <stdio.h>
#include <stdlib.h>

// 定义链队列的结点结构
struct QueueNode {
    int data;
    struct QueueNode* next;
};

// 定义链队列结构
struct Queue {
    struct QueueNode* front;  // 队头指针
    struct QueueNode* rear;   // 队尾指针
};

// 初始化链队列
void initQueue(struct Queue* q) {
    q->front = NULL;
    q->rear = NULL;
}

// 判断链队列是否为空
int isEmpty(struct Queue q) {
    return (q.front == NULL);
}

// 取队头元素
int getFront(struct Queue q) {
    if (!isEmpty(q)) {
        return q.front->data;
    } else {
        printf("队列为空，无法取队头元素\n");
        return -1;
    }
}

// 入队操作
void enqueue(struct Queue* q, int element) {
    struct QueueNode* newNode = (struct QueueNode*)malloc(sizeof(struct QueueNode));
    if (newNode == NULL) {
        printf("内存分配失败，无法入队\n");
        return;
    }
    newNode->data = element;
    newNode->next = NULL;

    if (isEmpty(*q)) {
        q->front = newNode;
        q->rear = newNode;
    } else {
        q->rear->next = newNode;
        q->rear = newNode;
    }
    printf("入队成功：%d\n", element);
}

// 出队操作
int dequeue(struct Queue* q) {
    if (isEmpty(*q)) {
        printf("队列为空，无法出队\n");
        return -1;
    } else {
        int element = q->front->data;
        struct QueueNode* temp = q->front;

        if (q->front == q->rear) {
            // 队列中只有一个元素
            q->front = NULL;
            q->rear = NULL;
        } else {
            q->front = q->front->next;
        }
        free(temp);
        printf("出队成功：%d\n", element);
        return element;
    }
}

// 释放链队列内存
void destroyQueue(struct Queue* q) {
    while (!isEmpty(*q)) {
        dequeue(q);
    }
}

int main() {
    struct Queue q;
    initQueue(&q);
    int choice, element;

    do {
        printf("链队列操作菜单\n");
        printf("1. 入队\n");
        printf("2. 出队\n");
        printf("3. 取队头元素\n");
        printf("4. 判断队列是否为空\n");
        printf("0. 退出\n");
        printf("请输入你的选择：");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("请输入要入队的元素：");
                scanf("%d", &element);
                enqueue(&q, element);
                break;
            case 2:
                dequeue(&q);
                break;
            case 3:
                element = getFront(q);
                if (element != -1) {
                    printf("队头元素是：%d\n", element);
                }
                break;
            case 4:
                if (isEmpty(q)) {
                    printf("队列为空\n");
                } else {
                    printf("队列不为空\n");
                }
                break;
            case 0:
                destroyQueue(&q);
                printf("程序退出\n");
                break;
            default:
                printf("无效的选择，请重新输入\n");
        }
    } while (choice != 0);

    return 0;
}
