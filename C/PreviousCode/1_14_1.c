#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

int multiply(int a, int b) {
    return a * b;
}

int divide(int a, int b) {
    if (b == 0) {
        printf("除数不能为0！\n");
        return 0;
    }
    return a / b;
}

typedef int (*MathOperation)(int, int);

int performOperation(MathOperation operation, int a, int b) {
    return operation(a, b);
}

int recursiveFactorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    }
    return n * recursiveFactorial(n - 1);
}

int main() {
    int a = 5, b = 3;

    MathOperation operations[] = {add, subtract, multiply, divide};
    char *operationNames[] = {"加", "减", "乘", "除"};

    for (int i = 0; i < sizeof(operations) / sizeof(operations[0]); i++) {
        int result = performOperation(operations[i], a, b);
        printf("%d %s %d = %d\n", a, operationNames[i], b, result);
    }

    int factorialInput = 5;
    int factorialResult = recursiveFactorial(factorialInput);
    printf("%d 的阶乘是 %d\n", factorialInput, factorialResult);

    return 0;
}
