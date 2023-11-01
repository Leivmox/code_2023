#include <stdio.h>

#define MAX_SIZE 5  // 循环队列的最大容量

// 定义循环队列的结构
struct Queue {
    int data[MAX_SIZE];  // 存储队列元素的数组
    int front;           // 队头指针
    int rear;            // 队尾指针
};

// 初始化循环队列
void initQueue(struct Queue *q) {
    q->front = -1;
    q->rear = -1;
}

// 判断队列是否为空
int isEmpty(struct Queue q) {
    return (q.front == -1);
}

// 判断队列是否已满
int isFull(struct Queue q) {
    return ((q.rear + 1) % MAX_SIZE == q.front);
}

// 取队头元素
int getFront(struct Queue q) {
    if (!isEmpty(q)) {
        return q.data[q.front];
    } else {
        printf("队列为空，无法取队头元素\n");
        return -1;
    }
}

// 入队操作
void enqueue(struct Queue *q, int element) {
    if (isFull(*q)) {
        printf("队列已满，无法入队\n");
    } else {
        if (isEmpty(*q)) {
            q->front = 0;
        }
        q->rear = (q->rear + 1) % MAX_SIZE;
        q->data[q->rear] = element;
        printf("入队成功：%d\n", element);
    }
}

// 出队操作
int dequeue(struct Queue *q) {
    if (isEmpty(*q)) {
        printf("队列为空，无法出队\n");
        return -1;
    } else {
        int element = q->data[q->front];
        if (q->front == q->rear) {
            // 队列中只有一个元素
            q->front = -1;
            q->rear = -1;
        } else {
            q->front = (q->front + 1) % MAX_SIZE;
        }
        printf("出队成功：%d\n", element);
        return element;
    }
}

int main() {
    struct Queue q;
    initQueue(&q);
    int choice, element;

    do {
        printf("循环队列操作菜单\n");
        printf("1. 入队\n");
        printf("2. 出队\n");
        printf("3. 取队头元素\n");
        printf("4. 判断队列是否为空\n");
        printf("5. 判断队列是否已满\n");
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
            case 5:
                if (isFull(q)) {
                    printf("队列已满\n");
                } else {
                    printf("队列未满\n");
                }
                break;
            case 0:
                printf("程序退出\n");
                break;
            default:
                printf("无效的选择，请重新输入\n");
        }
    } while (choice != 0);

    return 0;
}