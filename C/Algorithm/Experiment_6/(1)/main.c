#include <stdio.h>

// 顺序表的查找算法
int seq_search(int *a, int n, int x) {
  // 从表头开始查找
  for (int i = 0; i < n; i++) {
    if (a[i] == x) {
      // 找到元素，返回下标
      return i;
    }
  }
  // 没有找到元素，返回-1
  return -1;
}

// 折半查找算法
int binary_search(int *a, int n, int x) {
  // 表长小于等于1，直接返回
  if (n <= 1) {
    if (a[0] == x) {
      return 0;
    } else {
      return -1;
    }
  }

  // 中间元素下标
  int mid = n / 2;

  // 元素等于中间元素，返回下标
  if (a[mid] == x) {
    return mid;
  }

  // 元素小于中间元素，在前半部分查找
  if (x < a[mid]) {
    return binary_search(a, mid, x);
  }

  // 元素大于中间元素，在后半部分查找
  return binary_search(a + mid + 1, n - mid - 1, x);
}

// 二叉排序树查找算法
struct node {
  int data;
  struct node *left, *right;
};

int binary_search_tree_search(struct node *root, int x) {
  // 空树，返回-1
  if (root == NULL) {
    return -1;
  }

  // 元素等于根节点，返回下标
  if (root->data == x) {
    return 1;
  }

  // 元素小于根节点，在左子树查找
  if (x < root->data) {
    return binary_search_tree_search(root->left, x);
  }

  // 元素大于根节点，在右子树查找
  return binary_search_tree_search(root->right, x);
}

int main() {
  // 定义顺序表
  int a[] = {1, 3, 5, 7, 9};
  int n = sizeof(a) / sizeof(a[0]);

  // 定义元素
  int x;
  printf("请输入要查找的元素：");
  scanf("%d", &x);

  // 选择查找算法
  int choice = menu();

  switch (choice) {
  case 1:
    // 顺序表查找
    int index = seq_search(a, n, x);
    if (index != -1) {
      printf("找到元素，下标为：%d\n", index);
    } else {
      printf("没有找到元素\n");
    }
    break;
  case 2:
    // 折半查找
    int index = binary_search(a, n, x);
    if (index != -1) {
      printf("找到元素，下标为：%d\n", index);
    } else {
      printf("没有找到元素\n");
    }
    break;
  case 3:
    // 二叉排序树查找
    struct node *root = NULL;
    // 构建二叉排序树
    for (int i = 0; i < n; i++) {
      root = binary_search_tree_insert(root, a[i]);
    }

    int index = binary_search_tree_search(root, x);
    if (index != -1) {
      printf("找到元素，下标为：%d\n", index);
    } else {
      printf("没有找到元素\n");
    }
    break;
  default:
    printf("您输入的选择有误！\n");
    break;
  }
  return 0;
}
