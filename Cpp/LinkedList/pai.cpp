#include <iostream>
#include <iomanip>
#include <random>
#include <cmath>
#include <time.h>

int main() {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<long double> dist_x(0.0, 5.0);
    std::uniform_real_distribution<long double> dist_a(0.0, 180.0);

    long double N = 0;
    long double n = 0;

    clock_t start_time, end_time;
    start_time = clock();  // 记录开始时间


    for (int i = 0; i < 100000000; ++i) {
        // 生成随机数 x，0 <= x <= 5
        long double x = dist_x(gen);

        // 生成随机角度 a，0° <= a <= 180°
        long double a = dist_a(gen);

        // 将角度转换为弧度
        long double a_rad = a * M_PI / 180;

        // 如果 x/sin(a) 小于 2.5，n 加 1
        if (x / sin(a_rad) <= 2.5) {
            n++;
        }

        // 每次循环结束，N 加 1
        N++;
        std::cout << std::setprecision(15) << std::fixed << N / n << std::endl;
    }
end_time = clock();  // 记录结束时间

    // 输出 N 除以 n 的值
    std::cout << "last：N/n 的值: " << std::setprecision(15) << std::fixed << N / n << std::endl;
    double total_time = ((double)(end_time - start_time)) / CLOCKS_PER_SEC;
    printf("运行时间：%lf秒\n", total_time);
    getchar();
    return 0;
}

