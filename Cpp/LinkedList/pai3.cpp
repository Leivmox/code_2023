#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand(time(NULL));

    long long total_points = 100000LL;  // 使用 long long 表示较大的数量
    long long inside_circle = 0;

    for (long long i = 0; i < total_points; ++i) {
        // 在正方形内生成随机点
        long double x = (long double)rand() / RAND_MAX;
        long double y = (long double)rand() / RAND_MAX;

        // 计算到原点的距离
        long double distance = x * x + y * y;

        // 如果距离小于1，表示在圆内
        if (distance <= 1.0) {
            inside_circle++;
        }
    }

    // 使用蒙特卡洛方法估算圆周率
    long double estimated_pi = (long double)inside_circle / total_points * 4;

    printf("估算的圆周率：%Lf\n", estimated_pi);
getchar();
    return 0;
}
