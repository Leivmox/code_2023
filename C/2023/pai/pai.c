#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int main() {
    int N = 0;
    int n = 0;

    // 使用当前时间作为随机数生成器的种子
    srand(time(NULL));

    for (int i = 0; i < 1000000000; ++i) {
        // 生成随机数 x，0 <= x <= 5
        double x = (double)rand() / RAND_MAX * 5;

        // 生成随机角度 a，0° <= a <= 180°
        double a = (double)rand() / RAND_MAX * 180;

        // 将角度转换为弧度
        double a_rad = a * M_PI / 180;

        // 如果 x/sin(a) 小于 2.5，n 加 1
        if (x / sin(a_rad) < 2.5) {
            n++;
        }

        // 每次循环结束，N 加 1
        N++;
        printf("%lf\n", (double)N / n);
    }

    // 输出 N 除以 n 的值
    printf("last：N/n 的值: %lf\n", (double)N / n);
    getchar();
    return 0;

}
