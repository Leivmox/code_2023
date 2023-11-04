#include <stdio.h>
#include <stdlib.h>

// 定义二叉树的结构
typedef struct TreeNode {
    char data;
    struct TreeNode* left;
    struct TreeNode* right;
} TreeNode;

// 全局变量，用于存储二叉树的根节点
TreeNode* root = NULL;

// 创建一个新的二叉树节点
TreeNode* createNode(char data) {
    TreeNode* newNode = (TreeNode*)malloc(sizeof(TreeNode));
    newNode->data = data;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// 插入节点到二叉树中
void insertNode(TreeNode** node, char data) {
    if (*node == NULL) {
        *node = createNode(data);
    } else {
        if (data < (*node)->data) {
            insertNode(&((*node)->left), data);
        } else {
            insertNode(&((*node)->right), data);
        }
    }
}

// 先序遍历
void preOrder(TreeNode* node) {
    if (node != NULL) {
        printf("%c ", node->data);
        preOrder(node->left);
        preOrder(node->right);
    }
}

// 中序遍历
void inOrder(TreeNode* node) {
    if (node != NULL) {
        inOrder(node->left);
        printf("%c ", node->data);
        inOrder(node->right);
    }
}

// 计算二叉树结点数
int countNodes(TreeNode* node) {
    if (node == NULL) {
        return 0;
    } else {
        return 1 + countNodes(node->left) + countNodes(node->right);
    }
}

// 主菜单函数
void mainMenu() {
    printf("二叉树操作菜单：\n");
    printf("1. 插入节点\n");
    printf("2. 先序遍历\n");
    printf("3. 中序遍历\n");
    printf("4. 计算结点数\n");
    printf("5. 退出\n");
}

int main() {
    int choice;
    char data;

    while (1) {
        mainMenu();
        printf("请输入选择：");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("请输入要插入的数据：");
                scanf(" %c", &data); // 加空格跳过换行符
                insertNode(&root, data);
                break;
            case 2:
                printf("先序遍历结果：");
                preOrder(root);
                printf("\n");
                break;
            case 3:
                printf("中序遍历结果：");
                inOrder(root);
                printf("\n");
                break;
            case 4:
                printf("二叉树结点数：%d\n", countNodes(root));
                break;
            case 5:
                exit(0);
            default:
                printf("无效选择，请重新输入。\n");
        }
    }

    return 0;
}
