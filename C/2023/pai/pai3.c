#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    while (1) {
        int* x_coords; // 存放 x 坐标的数组
        int* y_coords; // 存放 y 坐标的数组
        int count = 0;  // 记录点落在圆内的数量
        int n;         // 洒下的点的总数量
        double pi, approx_pi, sum = 0.0;

        printf("输入洒下的点的个数 (输入0退出): ");
        scanf("%d", &n);

        if (n == 0) {
            break;  // 退出循环
        }

        x_coords = (int*)malloc(sizeof(int) * n);
        y_coords = (int*)malloc(sizeof(int) * n);

        // 对于每一轮模拟，重置计数器并生成一组新的点
        for (int round = 0; round < 100; round++) {
            count = 0;
            srand((unsigned)time(NULL));  // 更换随机数种子

            // 随机生成 n 个点的坐标，并计算落在圆内的点数
            for (int i = 0; i < n; i++) {
                x_coords[i] = -1000 + rand() % (2001);
                y_coords[i] = -1000 + rand() % (2001);
                if (x_coords[i] * x_coords[i] + y_coords[i] * y_coords[i] <= 1000000) {
                    count++;
                }
            }

            // 计算圆周率的近似值
            double g = (double)count / n;
            pi = 4 * g;
            sum += pi;
            approx_pi = sum / (round + 1);

            // 输出每一轮的圆周率估算值
            printf("Round %d: π = %lf\n", round + 1, approx_pi);
        }

        // 计算误差并输出结果
        double error;
        if (approx_pi > 3.141592) {
            error = approx_pi - 3.141592;
        } else {
            error = 3.141592 - approx_pi;
        }
        printf("洒下的点的个数为 %d 时，π = %lf，误差值为 %lf\n", n, approx_pi, error);

        // 释放动态分配的内存
        free(x_coords);
        free(y_coords);
    }

    getchar();
    return 0;
}
