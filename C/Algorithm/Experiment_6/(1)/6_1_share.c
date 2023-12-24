#include <stdio.h>
#include <stdlib.h>

#define MAX_SIZE 100

typedef struct {
    int data[MAX_SIZE]; 
    int length;         
} SeqList;

void initSeqList(SeqList *list) {
    list->length = 0;
}
void insert(SeqList *list, int element) {
    if (list->length >= MAX_SIZE) {
        printf("顺序表已满，无法插入新元素。\n");
        return;
    }
    list->data[list->length++] = element;
}

int sequentialSearch(SeqList *list, int target) {
    for (int i = 0; i < list->length; i++) {
        if (list->data[i] == target) {
            return i; 
        }
    }
    return -1; 
}

int binarySearch(SeqList *list, int target) {
    int low = 0;
    int high = list->length - 1;
    while (low <= high) {
        int mid = (low + high) / 2;
        if (list->data[mid] == target) {
            return mid; 
        } else if (list->data[mid] < target) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return -1;
}

typedef struct BSTNode {
    int data;
    struct BSTNode *left;
    struct BSTNode *right;
} BSTNode;

BSTNode *createNode(int value) {
    BSTNode *newNode = (BSTNode *)malloc(sizeof(BSTNode));
    newNode->data = value;
    newNode->left = newNode->right = NULL;
    return newNode;
}

BSTNode *insertNode(BSTNode *root, int value) {
    if (root == NULL) {
        return createNode(value);
    }
    if (value < root->data) {
        root->left = insertNode(root->left, value);
    } else if (value > root->data) {
        root->right = insertNode(root->right, value);
    }
    return root;
}

int searchBST(BSTNode *root, int target) {
    while (root != NULL && root->data != target) {
        if (target < root->data) {
            root = root->left;
        } else {
            root = root->right;
        }
    }
    if (root != NULL) {
        return root->data; 
    }
    return -1; 
}

void displayMenu() {
    printf("1. 顺序表查找\n");
    printf("2. 折半查找\n");
    printf("3. 二叉排序树查找\n");
    printf("4. 退出\n");
    printf("============================\n");
}

int main() {
    SeqList list;
    initSeqList(&list);
    insert(&list, 6);
    insert(&list, 3);
    insert(&list, 5);
    insert(&list, 4);
    insert(&list, 20);
    insert(&list, 13);
    insert(&list, 10);
    insert(&list, 19);
    insert(&list, 1);
    insert(&list, 17);

    int choice;
    do {
        displayMenu();
        printf("请选择操作：");
        scanf("%d", &choice);

        switch (choice) {
            case 1: {
                printf("请输入要在顺序表中查找的元素：");
                int targetSeq;
                scanf("%d", &targetSeq);
                int resultSequential = sequentialSearch(&list, targetSeq);
                if (resultSequential != -1) {
                    printf("在顺序表中找到目标元素 %d，索引位置为 %d。\n", targetSeq, resultSequential);
                } else {
                    printf("在顺序表中未找到目标元素 %d。\n", targetSeq);
                }
                break;
            }
            case 2: {
                printf("请输入要在折半查找中查找的元素：");
                int targetBinary;
                scanf("%d", &targetBinary);

                for (int i = 0; i < list.length - 1; i++) {
                    for (int j = 0; j < list.length - i - 1; j++) {
                        if (list.data[j] > list.data[j + 1]) {
                            int temp = list.data[j];
                            list.data[j] = list.data[j + 1];
                            list.data[j + 1] = temp;
                        }
                    }
                }
                int resultBinary = binarySearch(&list, targetBinary);
                if (resultBinary != -1) {
                    printf("在折半查找中找到目标元素 %d，索引位置为 %d。\n", targetBinary, resultBinary);
                } else {
                    printf("在折半查找中未找到目标元素 %d。\n", targetBinary);
                }
                break;
            }
            case 3: {
                printf("请输入要在二叉排序树中查找的元素：");
                int targetBST;
                scanf("%d", &targetBST);
                BSTNode *root = NULL;
                for (int i = 0; i < list.length; i++) {
                    root = insertNode(root, list.data[i]);
                }
                int resultBST = searchBST(root, targetBST);
                if (resultBST != -1) {
                    printf("在二叉排序树中找到目标元素 %d。\n", targetBST);
                } else {
                    printf("在二叉排序树中未找到目标元素 %d。\n", targetBST);
                }
                break;
            }
            case 4:
                printf("感谢使用查找算法程序！\n");
                break;
            default:
                printf("无效的选项，请重新选择。\n");
                break;
        }
    } while (choice != 4);

    return 0;
}
