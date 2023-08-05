package ch3_15.IsoscelesTriangle;

import java.util.Scanner;

public class IsoscelesTriangle {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("请输入等腰三角形的边长：");
        int length = scanner.nextInt();

        for (int i = 1; i <= length; i++) {
            for (int j = 1; j <= length - i; j++) {
                System.out.print(" ");
            }
            for (int k = 1; k <= 2 * i - 1; k++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}
