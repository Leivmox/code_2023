#include <stdio.h>
#include <stdlib.h>

void insertionSort(int arr[], int n) {
    int i, key, j;
    for (i = 1; i < n; i++) {
        key = arr[i];
        j = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}

void bubbleSort(int arr[], int n) {
    int i, j;
    for (i = 0; i < n - 1; i++) {
        int swapped = 0;
        for (j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                swapped = 1;
            }
        }
        if (swapped == 0)
            break;
    }
}

int partition(int arr[], int low, int high) {
    int pivot = arr[high];
    int i = (low - 1);
    for (int j = low; j <= high - 1; j++) {
        if (arr[j] < pivot) {
            i++;
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }
    int temp = arr[i + 1];
    arr[i + 1] = arr[high];
    arr[high] = temp;
    return (i + 1);
}

void quickSort(int arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

void heapify(int arr[], int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] > arr[largest])
        largest = left;

    if (right < n && arr[right] > arr[largest])
        largest = right;

    if (largest != i) {
        int temp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = temp;
        heapify(arr, n, largest);
    }
}

void heapSort(int arr[], int n) {
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(arr, n, i);

    for (int i = n - 1; i > 0; i--) {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        heapify(arr, i, 0);
    }
}

int main() {
    int choice, n;

    while (1) {
        printf("请输入要排序的元素个数（输入0退出程序）：");
        scanf("%d", &n);

        if (n == 0) {
            printf("程序已退出\n");
            break;
        }

        int *arr = (int *)malloc(n * sizeof(int));
        if (arr == NULL) {
            printf("内存分配失败\n");
            return 1;
        }

        printf("请输入要排序的元素：\n");
        for (int i = 0; i < n; i++) {
            scanf("%d", &arr[i]);
        }

        while (1) {
            printf("选择排序算法：\n");
            printf("1. 直接插入排序\n");
            printf("2. 冒泡排序\n");
            printf("3. 快速排序\n");
            printf("4. 堆排序\n");
            printf("0. 重新输入要排序的元素个数\n");
            printf("请选择数字：");
            scanf("%d", &choice);

            switch (choice) {
                case 1:
                    insertionSort(arr, n);
                    break;
                case 2:
                    bubbleSort(arr, n);
                    break;
                case 3:
                    quickSort(arr, 0, n - 1);
                    break;
                case 4:
                    heapSort(arr, n);
                    break;
                case 0:
                    free(arr);
                    break;
                default:
                    printf("无效的选择\n");
                    break;
            }

            if (choice == 0) {
                break;
            }

            printf("排序后的结果：\n");
            for (int i = 0; i < n; i++) {
                printf("%d ", arr[i]);
            }
            printf("\n");
        }
    }

    return 0;
}
