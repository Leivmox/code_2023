#include <stdio.h>
#include <stdlib.h>
#include <time.h>

long double estimatePi(int num_samples) {
    int inside_circle = 0;
    int N = 0;

    for (int i = 0; i < num_samples; ++i) {
        long double x = (long double)drand48();  // 在区间[0, 1)内生成随机数x
        long double y = (long double)drand48();  // 在区间[0, 1)内生成随机数y

        // 检查点是否落在单位圆内
        if (x * x + y * y <= 1.0) {
            inside_circle++;
        }
        N++;
    }

    // 计算估算的圆周率值
    long double pi_estimate = (long double)inside_circle / num_samples * 4.0;

    // 输出每次迭代后的当前圆周率估算值
    printf("%.15Lf\n", pi_estimate);

    return pi_estimate;
}

int main() {
    srand48((long int)time(NULL));  // 用当前时间初始化伪随机数生成器

    int num_samples = 1000000;  // 根据需要调整采样点的数量
    long double pi_estimate = estimatePi(num_samples);

    printf("使用 %d 个采样点估算的圆周率值为：%.15Lf\n", num_samples, pi_estimate);
    getchar();  // 用于等待用户输入以查看输出结果
    return 0;
}
